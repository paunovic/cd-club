unit HDInfo;


interface

uses Windows, SysUtils;

const
  // Max number of drives assuming primary/secondary, master/slave topology
  MAX_IDE_DRIVES                 = 4;

  SET_DIGIT = ['0' .. '9']; // Set of digits
  SET_ALPHA = ['A' .. 'Z']; // Set of letters

  // Controller identification
  CTL_PRIMARY    = 0;
  CTL_SECONDARY  = 2;
  CTL_TERTIARY   = 4;
  CTL_QUATERNARY = 6;

  // MoS identification
  DP_MASTER      = 0;
  DP_SLAVE       = 1;

type
  TDRIVE_TYPE    = (dtFIXED, dtREMOVABLE, dtUNKNOWN);

  // Structure used to communicate with component or console apps.
  THD_INFO_DATA  = Record
                     DriveExists                : BOOLEAN;
                     DriveType                  : TDRIVE_TYPE;
                     Controller                 : BYTE; // CTL ID
                     Position                   : BYTE; // MoS ID
                     ModelNumber                : String[255];
                     SerialNumber               : String[255];
                     CTLRevisionNumber          : String[255];
                     CTLBufferSize              : LongWord; // CTL buffer size on Drive
                     DriveSize                  : Int64; // Drive size (in bytes)
                     DriveID                    : Int64; // Unique ID computed
                                                         // from SerialNumber :
                                                         // converted to base 10
                   End;

var
  // Global variable for retriving info data
  HD_INFO_DATA : THD_INFO_DATA;

// Function called to read drive info :: returns DriveExists
// Valid values for drivenum are 0..7
function ReadDriveInfo (drivenum : BYTE) : BOOLEAN;


implementation

const

  IDENTIFY_BUFFER_SIZE           = 512;

  // IOCTL commands
  DFP_GET_VERSION                = $00074080;
  DFP_SEND_DRIVE_COMMAND         = $0007c084;
  DFP_RECEIVE_DRIVE_DATA         = $0007c088;

  FILE_DEVICE_SCSI               = $0000001b;
  IOCTL_SCSI_MINIPORT_IDENTIFY   = ((FILE_DEVICE_SCSI shl 16) + $0501);

  IOCTL_SCSI_MINIPORT            = $0004D008; //  see NTDDSCSI.H for definition

  // Bits returned in the fCapabilities member of GETVERSIONOUTPARAMS
  CAP_IDE_ID_FUNCTION            = 1;
  CAP_IDE_ATAPI_ID               = 2; // ATAPI ID command supported
  CAP_IDE_EXECUTE_SMART_FUNCTION = 4; // SMART commannds supported

  // Valid values for the bCommandReg member of IDEREGS.
  IDE_ATAPI_IDENTIFY             = $A1; // Returns ID sector for ATAPI.
  IDE_ATA_IDENTIFY               = $EC; // Returns ID sector for ATA.

  m_cVxDFunctionIdesDInfo        = 1;

type
  // GETVERSIONOUTPARAMS contains the data returned from the
  // Get Driver Version function.
  _GETVERSIONOUTPARAMS = Packed Record
                           bVersion      : BYTE; // Binary driver version.
                           bRevision     : BYTE; // Binary driver revision.
                           bReserved     : BYTE; // Not used.
                           bIDEDeviceMap : BYTE; // Bit map of IDE devices.
                           fCapabilities : DWORD; // Bit mask of driver capabilities.
                           dwReserved    : array [0..3] of DWORD; // For future use.
                         End;
  PGETVERSIONOUTPARAMS = ^_GETVERSIONOUTPARAMS;

  // IDE registers
  _IDEREGS = Packed Record
               bFeaturesReg     : BYTE; // Used for specifying SMART "commands".
               bSectorCountReg  : BYTE; // IDE sector count register
               bSectorNumberReg : BYTE; // IDE sector number register
               bCylLowReg       : BYTE; // IDE low order cylinder value
               bCylHighReg      : BYTE; // IDE high order cylinder value
               bDriveHeadReg    : BYTE; // IDE drive/head register
               bCommandReg      : BYTE; // Actual IDE command.
               bReserved        : BYTE; // reserved for future use.  Must be zero.
             End;

  // SENDCMDINPARAMS contains the input parameters for the
  // Send Command to Drive function.
  _SENDCMDINPARAMS = Packed Record
                       cBufferSize  : DWORD;    // Buffer size in bytes
                       irDriveRegs  : _IDEREGS; // Structure with drive register values.
                       bDriveNumber : BYTE;     // Physical drive number to send
					        //  command to (0,1,2,3).
                       bReserved    : array [0..2] of BYTE;  // Reserved for future expansion.
                       dwReserved   : array [0..3] of DWORD; // For future use.
                       bBuffer      : array [0..IDENTIFY_BUFFER_SIZE-1] of BYTE; // Input buffer.
                     End;
  PSENDCMDINPARAMS = ^_SENDCMDINPARAMS;

  // Status returned from driver
  _DRIVERSTATUS = Packed Record
                    bDriverError : BYTE; // Error code from driver, or 0 if no error.
                    bIDEStatus   : BYTE; // Contents of IDE Error register.
                                         //  Only valid when bDriverError is SMART_IDE_ERROR.
                    bReserved    : array [0..1] of BYTE;  // Reserved for future expansion.
                    dwReserved   : array [0..1] of DWORD; // Reserved for future expansion.
                  End;

  // Structure returned by PhysicalDrive IOCTL for several commands
  _SENDCMDOUTPARAMS = Packed Record
                        cBufferSize  : DWORD;         // Size of bBuffer in bytes
                        DriverStatus : _DRIVERSTATUS; // Driver status structure.
                        bBuffer      : array [0..IDENTIFY_BUFFER_SIZE-1] of BYTE;
                                       // Buffer of arbitrary length
                                       // in which to store the data read from the drive.
                      End;
  PSENDCMDOUTPARAMS = ^_SENDCMDOUTPARAMS;

  _SRB_IO_CONTROL = Packed Record
                      HeaderLength : ULONG;
                      Signature    : array [0..7] of CHAR;
                      Timeout      : ULONG;
                      ControlCode  : ULONG;
                      ReturnCode   : ULONG;
                      Length       : ULONG;
                    End;
  PSRB_IO_CONTROL = ^_SRB_IO_CONTROL;

  // Output Bbuffer for the VxD (rt_IdeDinfo record)
  _rt_IdeDInfo = Packed Record
                   IDEExists : array [0..3] of BYTE;
                   DiskExists : array [0..7] of BYTE;
                   DisksRawInfo : array [0..8*256-1] of WORD;
                 End;
  pt_IdeDInfo  = ^_rt_IdeDInfo;

  // Drive data buffer for internal communication between functions
  DWORD_A256 = array [0..255] of DWORD;

  // I had to create following structures in order to avoid complications
  // in C to Pascal pointer conversation. There are used by function
  // ReadIdeDriveAsScsiDriveInNT.
  _SRB_IN_BUFFER = Packed Record
                     SrbIoControl : _SRB_IO_CONTROL;
                     InParams     : _SENDCMDINPARAMS;
                   End;
  PSRB_IN_BUFFER = ^_SRB_IN_BUFFER;

  _SRB_OUT_BUFFER = Packed Record
                     SrbIoControl : _SRB_IO_CONTROL;
                     OutParams    : _SENDCMDOUTPARAMS;
                   End;
  PSRB_OUT_BUFFER = ^_SRB_OUT_BUFFER;

const
  SENDIDLENGTH = SizeOf(_SENDCMDOUTPARAMS);

  
function ConvertToString (diskdata : DWORD_A256;
                          firstIndex, lastIndex : Integer) : String;
var st1             : String;
    index, position : Integer;
begin
   position := 0;
   SetLength(st1, (lastIndex - firstIndex + 1) * 2);

   // each integer has two characters stored in it backwards
   for index := firstIndex to lastIndex do begin
     // get high byte for 1st character
     Inc(position); // Increment First, because of Pascal-type String
     st1 [position] := Chr(diskdata [index] div 256);

     // get low byte for 2nd character
     Inc(position);
     st1 [position] := Chr(diskdata [index] mod 256);
   end;

   //  cut off the trailing blanks
   while (position > 1) and (st1 [position] = ' ') do
     Dec (position);
   st1:=Copy(st1, 1, position);

   Result := st1;
end;

// This procedure stores info data to HD_INFO_DATA
procedure PrintIdeInfo (drive : Integer; diskdata : DWORD_A256);
var sectors, bytes : Int64;
    hdsn           : String;
    i              : Integer;
    id             : Int64;
begin
  id := 0;

  HD_INFO_DATA.Controller := (drive div 2) * 2;
  HD_INFO_DATA.Position := drive mod 2;

  if ((diskdata [0] div 128) mod 2 = 1) then
    HD_INFO_DATA.DriveType := dtREMOVABLE
  else if ((diskdata [0] div 64) mod 2 = 1) then
    HD_INFO_DATA.DriveType := dtFIXED
  else HD_INFO_DATA.DriveType := dtUNKNOWN;

  HD_INFO_DATA.ModelNumber := ConvertToString (diskdata, 27, 46);
  HD_INFO_DATA.SerialNumber := ConvertToString (diskdata, 10, 19);
  HD_INFO_DATA.CTLRevisionNumber := ConvertToString (diskdata, 23, 26);
  HD_INFO_DATA.CTLBufferSize := diskdata [21] * 512;

  // calculate size based on 28 bit or 48 bit addressing
  // 48 bit addressing is reflected by bit 10 of word 83
  if ((diskdata [83] div 4) mod 2 = 1) then
     sectors := Int64(diskdata [103] * 65536 * 65536 * 65536 +
                      diskdata [102] * 65536 * 65536 +
                      diskdata [101] * 65536 +
                      diskdata [100])
  else
    sectors := diskdata [61] * 65536 + diskdata [60];
  // there are 512 bytes in a sector
  bytes := sectors * 512;
  HD_INFO_DATA.DriveSize := bytes;

  hdsn := UpperCase (HD_INFO_DATA.SerialNumber);
  //  ignore first 5 characters from western digital hard drives if
  //  the first four characters are WD-W
  if (Copy(hdsn, 1, 4) = 'WD-W') then
    Delete (hdsn, 1, 5);

  for i:=1 to Length (hdsn) do begin
    if (hdsn [i] in ['-', ' ']) then Continue;
    id := id * 36;

    if hdsn [i] in SET_DIGIT then
      id := id + Ord(hdsn[i]) - Ord('0')
    else id := id + 10 + Ord(hdsn[i]) - Ord('A');
  end;
  HD_INFO_DATA.DriveID := id;
end;

// DoIDENTIFY
// FUNCTION: Send an IDENTIFY command to the drive
// bDriveNum = 0-3
// bIDCmd = IDE_ATA_IDENTIFY or IDE_ATAPI_IDENTIFY
function DoIDENTIFY (hPhysicalDriveIOCTL : Cardinal;
                     var pSCIP : PSENDCMDINPARAMS;
		     var pSCOP : PSENDCMDOUTPARAMS;
                     bIDCmd, bDriveNum : BYTE;
                     var lpcbBytesReturned : DWORD) : Boolean;
begin
   // Set up data structures for IDENTIFY command.
   pSCIP^.cBufferSize := IDENTIFY_BUFFER_SIZE;
   pSCIP^.irDriveRegs.bFeaturesReg := 0;
   pSCIP^.irDriveRegs.bSectorCountReg := 1;
   pSCIP^.irDriveRegs.bSectorNumberReg := 1;
   pSCIP^.irDriveRegs.bCylLowReg := 0;
   pSCIP^.irDriveRegs.bCylHighReg := 0;

   // Compute the drive number.
   pSCIP^.irDriveRegs.bDriveHeadReg := $A0 or ((bDriveNum and 1) shl 4);

   // The command can either be IDE identify or ATAPI identify.
   pSCIP^.irDriveRegs.bCommandReg := bIDCmd;
   pSCIP^.bDriveNumber := bDriveNum;
   pSCIP^.cBufferSize := IDENTIFY_BUFFER_SIZE;

   Result := DeviceIoControl (hPhysicalDriveIOCTL,
                              DFP_RECEIVE_DRIVE_DATA,
			      pSCIP,
			      SizeOf(_SENDCMDINPARAMS) - 1,
			      pSCOP,
			      SENDIDLENGTH,
			      lpcbBytesReturned, nil);
end;

// Following function reads info using PhysicalDrive IOCTL under
// NT/2K. In orderd to get access, admin privileges are required.
function ReadPhysicalDriveInNT (drive : BYTE) : Boolean;
var done                : Boolean;
    i                   : Integer;
    hPhysicalDriveIOCTL : Cardinal;
    driveName           : array [0..255] of Char;
    pVersionParams      : PGETVERSIONOUTPARAMS;
    cbBytesReturned     : DWORD;
    bIDCmd              : BYTE; // IDE or ATAPI IDENTIFY cmd
    scip                : PSENDCMDINPARAMS;
    diskdata            : DWORD_A256;
    scop                : PSENDCMDOUTPARAMS;
begin
  done := FALSE;

  // Try to get a handle to PhysicalDrive IOCTL, report failure
  // and exit if can't.
  StrPCopy (driveName, '\\.\PhysicalDrive' + IntToStr(drive));

  // Windows NT, Windows 2000, must have admin rights
  hPhysicalDriveIOCTL := CreateFile (driveName,
                                     GENERIC_READ or GENERIC_WRITE,
                                     FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                     OPEN_EXISTING, 0, 0);

  if (hPhysicalDriveIOCTL <> INVALID_HANDLE_VALUE) then begin

    cbBytesReturned := 0;

    // Get the version, etc of PhysicalDrive IOCTL
    New(pVersionParams);
    FillChar(pVersionParams^,
             SizeOf(_GETVERSIONOUTPARAMS), 0);

    DeviceIoControl (hPhysicalDriveIOCTL, DFP_GET_VERSION,
                     nil, 0, pVersionParams,
                     SizeOf(_GETVERSIONOUTPARAMS),
                     cbBytesReturned, nil);

    // If there is a IDE device issue commands to the device
    if (pVersionParams^.bIDEDeviceMap > 0) then begin
      New(scip);
      New(scop);

      // Now, get the ID sector for all IDE devices in the system.
      // If the device is ATAPI use the IDE_ATAPI_IDENTIFY command,
      // otherwise use the IDE_ATA_IDENTIFY command
      if (((PVersionParams^.bIDEDeviceMap shr drive) and $10) = 1) then
        bIDCmd := IDE_ATAPI_IDENTIFY
      else bIDCmd := IDE_ATA_IDENTIFY;

      FillChar (scip^, SizeOf(_SENDCMDINPARAMS), 0);
      FillChar (scop^, SizeOf(_SENDCMDOUTPARAMS), 0);

      if DoIDENTIFY (hPhysicalDriveIOCTL,
                     scip, scop, bIDCmd,
                     drive, cbBytesReturned) then begin

        for i := 0 to 255 do
          diskdata [i] := scop^.bBuffer [i * 2] +
                          scop^.bBuffer [i * 2 + 1] * 256;

        // Write drive info
        PrintIdeInfo (drive, diskdata);

        done := TRUE;
      end;
      Dispose(scip);
      Dispose(scop);
    end;
    Dispose(PVersionParams);
  end;
  CloseHandle (hPhysicalDriveIOCTL);

  Result := done;
end;

// For Win9X :: data retrived using IDE21201.VXD
function ReadDrivePortsInWin9X (drive : BYTE) : Boolean;
var done            : Boolean;
    VxDHandle       : Cardinal;
    pOutBufVxD      : pt_IdeDInfo;
    lpBytesReturned : DWORD;
    i               : Integer;
    diskinfo        : DWORD_A256;
begin
  done := FALSE;
  lpBytesReturned := 0;

  // set the thread priority high so that we get exclusive access to the disk
  // 1. Make an output buffer for the VxD
  New(pOutBufVxD);

  // *****************
  // KLUDGE WARNING!!!
  // HAVE to zero out the buffer space for the IDE information!
  // If this is NOT done then garbage could be in the memory
  // locations indicating if a disk exists or not.
  ZeroMemory (pOutBufVxd, SizeOf(_rt_IdeDInfo));

  // 2. Try to load the VxD
  VxDHandle := CreateFile ('\\.\IDE21201.VXD', 0, 0, nil,
			   0, FILE_FLAG_DELETE_ON_CLOSE, 0);

  if (VxDHandle <> INVALID_HANDLE_VALUE) then begin
    // 3. Run VxD function
    DeviceIoControl (VxDHandle, m_cVxDFunctionIdesDInfo,
                     nil, 0, pOutBufVxD, SizeOf(_rt_IdeDInfo),
                     lpBytesReturned, nil);

    // 4. Unload VxD
    CloseHandle (VxDHandle);
  end else begin
    // ERROR : IDE21201.VXD not found
    Dispose (pOutBufVxd);
    Result := done;
    Exit;
  end;
  // 5. Translate and store data
  if((pOutBufVxD^.DiskExists[drive]<>0) and
     (pOutBufVxD^.IDEExists[drive div 2]<>0)) then begin

    for i := 0 to 255 do
      diskinfo [i] := pOutBufVxD^.DisksRawInfo [drive * 256 + i];

    // process the information for this buffer
    PrintIdeInfo (drive, diskinfo);
    done := TRUE;
  end;

  // reset the thread priority back to normal
  // SetThreadPriority (GetCurrentThread(), THREAD_PRIORITY_NORMAL);
  SetPriorityClass (GetCurrentProcess, NORMAL_PRIORITY_CLASS);

  Dispose (pOutBufVxD);  // Don't left garbage
  Result := done;
end;

// For Win NT/2K : If PhysicalDrive doesn't work (e.g. no admin rights)
// then try through SCSI backdoor
function ReadIdeDriveAsScsiDriveInNT (drive : BYTE) : Boolean;
var done            : Boolean;
    controller      : Integer;
    hScsiDriveIOCTL : Cardinal;
    driveName       : array [0..255] of CHAR;
    pdriveName      : PChar;
    s               : String;
    driveNumber, i  : Integer;
    pin             : PSRB_IN_BUFFER;
    pout            : PSRB_OUT_BUFFER;
    dummy           : DWORD;
    diskdata        : DWORD_A256;
begin
  done := FALSE;

  if not (drive in [0, 3]) then begin
    Result := FALSE;
    Exit;
  end;

  controller := drive div 2;
  driveNumber := drive mod 2;

  New(pin);
  New(pout);

  // Try to get a handle to PhysicalDrive IOCTL, report failure
  // and exit if can't.
  s := '\\.\Scsi' + IntToStr(controller) + ':';
  pdriveName := StrPCopy (driveName, s);

  //  Windows NT, Windows 2000, any rights should do
  hScsiDriveIOCTL := CreateFile (pdriveName,
                                GENERIC_READ or GENERIC_WRITE,
                                FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                OPEN_EXISTING, 0, 0);

  if (hScsiDriveIOCTL <> INVALID_HANDLE_VALUE) then begin

    FillChar (pin^, SizeOf (_SRB_IN_BUFFER), 0);
    FillChar (pout^, SizeOf (_SRB_OUT_BUFFER), 0);

    pin^.SrbIoControl.HeaderLength := SizeOf (_SRB_IO_CONTROL);
    pin^.SrbIoControl.Timeout := 10000;
    pin^.SrbIoControl.Length := SENDIDLENGTH;
    pin^.SrbIoControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
    StrPCopy(pin^.SrbIoControl.Signature, 'SCSIDISK');

    pin^.InParams.irDriveRegs.bCommandReg := IDE_ATA_IDENTIFY;
    pin^.InParams.bDriveNumber := driveNumber;

    pout^.SrbIoControl:=pin^.SrbIoControl;

    if (DeviceIoControl (hScsiDriveIOCTL, IOCTL_SCSI_MINIPORT,
                         pin, SizeOf (_SRB_IN_BUFFER),
                         pout,
                         SizeOf (_SRB_OUT_BUFFER),
                         dummy, nil)) then begin

      if pout^.OutParams.bBuffer[54]<>0 then // First Byte of ModelNumber
        begin

          for i := 0 to 255 do
            diskdata [i] := pout^.OutParams.bBuffer [i * 2] +
                            pout^.OutParams.bBuffer [i * 2 + 1] * 256;

          PrintIdeInfo (drive, diskdata);
          done := TRUE;
        end;

    end;
    CloseHandle (hScsiDriveIOCTL);
  end;

  Dispose (pin);
  Dispose (pout);
  Result := done;
end;

function ReadDriveInfo (drivenum : BYTE) : BOOLEAN;
var done    : Boolean;
    version : OSVERSIONINFO;
    attempt : Integer;
begin

  FillChar (HD_INFO_DATA, SizeOf (HD_INFO_DATA), 0);
  FillChar (version, SizeOf (version), 0);

  version.dwOSVersionInfoSize := SizeOf (OSVERSIONINFO);
  GetVersionEx (version);

  if (version.dwPlatformId = VER_PLATFORM_WIN32_NT) then begin

    // this works under WinNT4 or Win2K if you have admin rights
    done := ReadPhysicalDriveInNT (drivenum);

    // this should work in WinNT or Win2K if previous did not work
    // this is kind of a backdoor via the SCSI mini port driver into
    // the IDE drives
    if not done then done := ReadIdeDriveAsScsiDriveInNT (drivenum);
  end else begin

    // this works under Win9X and calls a VXD

    // try this up to 10 times to get a hard drive serial number
    attempt := 0;
    repeat
      Inc(attempt);
      done := ReadDrivePortsInWin9X (drivenum);
    until (done) or (attempt >= 10);
  end;

  HD_INFO_DATA.DriveExists := done;

  Result := done;
end;

end.

