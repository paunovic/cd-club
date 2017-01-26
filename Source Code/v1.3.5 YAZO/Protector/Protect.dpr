{$APPTYPE CONSOLE}

uses
  Windows, HDInfo,
  DCPblowfish, DCPsha1, SysUtils;

type
  TCPUInfo = record
               VendorID           : String[255];
               SteppingID         : Integer;
               ModelNumber        : Integer;
               FamilyCode         : Integer;
               ProcessorType      : Integer;
               ExtendedModel      : Integer;
               ExtendedFamily     : Integer;
               BrandID            : Integer;
               Chunks             : Integer;
               Count              : Integer;
               APICID             : Integer;
               SerialNumEnabled   : Boolean;
               SerialNum          : String[255];
               MMXSupport         : Boolean;
               FXSaveFXRStop      : Boolean;
               SSE                : Boolean;
               SSE2               : Boolean;
               ExtendedCPUID      : Boolean;
               LargestFuncSupport : Integer;
               BrandString        : String[255];
             end;

var
  CPUInfo : TCPUInfo;
  HDDInfo : THD_INFO_DATA;

  TCFile  : File of TCPUInfo;
  THFile  : File of THD_INFO_DATA;


procedure GetCPUInfo(var CI : TCPUInfo);
var
  _eax, _ebx, _ecx, _edx : LongWord;
  C1                     : Integer;
  b                      : Byte;
  s, s1, s2, s3, s_all   : String;
begin
  With CI Do
  Begin
    VendorID := '';
    SteppingID := 0;
    ModelNumber := 0;
    FamilyCode := 0;
    ProcessorType := 0;
    ExtendedModel := 0;
    ExtendedFamily := 0;
    BrandID := 0;
    Chunks := 0;
    Count := 0;
    APICID := 0;
    SerialNumEnabled := FALSE;
    SerialNum := '';
    MMXSupport := FALSE;
    FXSaveFXRStop := FALSE;
    SSE := FALSE;
    SSE2 := FALSE;
    ExtendedCPUID := FALSE;
    LargestFuncSupport := 0;
    BrandString := '';
  end;

  asm
    mov eax,0
    db $0F,$A2
    mov _ebx,ebx 
    mov _ecx,ecx 
    mov _edx,edx
  end;

  For C1 := 0 to 3 Do
  Begin
    b := lo(_ebx);
    s := s + chr(b);
    b := lo(_ecx);
    s1:= s1 + chr(b);
    b := lo(_edx);
    s2:= s2 + chr(b);
    _ebx := _ebx shr 8;
    _ecx := _ecx shr 8;
    _edx := _edx shr 8;
  end;
  CI.VendorID := s + s2 + s1;

  asm
    mov eax,1
    db $0F,$A2
    mov _eax,eax
    mov _ebx,ebx
    mov _ecx,ecx
    mov _edx,edx
  end;

  CI.SteppingID := lo(_eax) and 15;
  CI.ModelNumber := lo(_eax) shr 4;
  CI.FamilyCode := hi(_eax) and 15;
  CI.ProcessorType := hi(_eax) shr 4;
  CI.ExtendedModel := lo((_eax shr 16)) and 15;
  CI.ExtendedFamily := lo((_eax shr 20));
  CI.BrandID := lo(_ebx);
  CI.Chunks := hi(_ebx);
  CI.Count := lo(_ebx shr 16);
  CI.APICID := hi(_ebx shr 16);
  CI.SerialNumEnabled := (_edx and $40000) = $40000;

  asm
    mov eax,3
    db $0F,$A2
    mov _ecx,ecx
    mov _edx,edx
  end;
  CI.SerialNum := IntToHex(_eax, 8) + IntToHex(_edx, 8) + IntToHex(_ecx, 8);

  asm
    mov eax,1
    db $0F,$A2
    mov _edx,edx
  end;

  CI.MMXSupport := (_edx and $800000) = $800000;
  CI.FXSaveFXRStop := (_edx and $01000000) = $01000000;
  CI.SSE := (_edx and $02000000) = $02000000;
  CI.SSE2 := (_edx and $04000000) = $04000000;

  asm
    mov eax,$80000000
    db $0F,$A2
    mov _eax,eax
  end;

  If _eax > $80000000 Then
  Begin
    CI.ExtendedCPUID := TRUE;
    CI.LargestFuncSupport := _eax - $80000000;

    asm
      mov eax,$80000002
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
    end;

    s  := '';
    s1 := '';
    s2 := '';
    s3 := '';
    For C1 := 0 to 3 Do
    Begin
      b := lo(_eax);
      s3:= s3 + chr(b);
      b := lo(_ebx);
      s := s + chr(b);
      b := lo(_ecx);
      s1 := s1 + chr(b);
      b := lo(_edx);
      s2 := s2 + chr(b);
      _eax := _eax shr 8;
      _ebx := _ebx shr 8;
      _ecx := _ecx shr 8;
      _edx := _edx shr 8;
    end;

    s_all := s3 + s + s1 + s2;

    asm
      mov eax,$80000003
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
    mov _edx,edx
    end;

    s  := '';
    s1 := '';
    s2 := '';
    s3 := '';
    For C1 := 0 to 3 Do
    Begin
      b := lo(_eax);
      s3 := s3 + chr(b);
      b := lo(_ebx);
      s := s + chr(b);
      b := lo(_ecx);
      s1 := s1 + chr(b);
      b := lo(_edx);
      s2 := s2 + chr(b);
      _eax := _eax shr 8;
      _ebx := _ebx shr 8;
      _ecx := _ecx shr 8;
      _edx := _edx shr 8;
    end;
    s_all := s_all + s3 + s + s1 + s2;

    asm
      mov eax,$80000004
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
    end;

    s  := '';
    s1 := '';
    s2 := '';
    s3 := '';
    For C1 := 0 to 3 Do
    Begin
      b  := lo(_eax);
      s3 := s3 + chr(b);
      b := lo(_ebx);
      s := s + chr(b);
      b := lo(_ecx);
      s1 := s1 + chr(b);
      b  := lo(_edx);
      s2 := s2 + chr(b);
      _eax := _eax shr 8;
      _ebx := _ebx shr 8;
      _ecx := _ecx shr 8;
      _edx := _edx shr 8;
    end;
    CI.BrandString := TrimLeft(s_all) + s3 + s + s1 + TrimRight(s2);
  end
  else
    CI.ExtendedCPUID := FALSE;
end;

procedure GetHDDInfo(var HI : THD_INFO_DATA);
var
  C1 : Integer;
begin
  With HI Do
  Begin
    DriveExists := FALSE;
    DriveType := dtUNKNOWN;
    Controller := 0;
    Position := 0;
    ModelNumber := '';
    SerialNumber := '';
    CTLRevisionNumber := '';
    CTLBufferSize := 0;
    DriveSize := 0;
    DriveID := 0;
  End;

  For C1 := 0 to 10 Do
    If ReadDriveInfo(0) Then
    Begin
      HI := HD_INFO_DATA;
      Exit;
    End;
end;

function EncryptString(data : String) : String;
const
  pass = 'mw!@3sdk@5sdfln32$82384hsa,32jb123,1287@(&^2134mn @7635';
var
  Cipher1 : TDCP_blowfish;
begin
  Cipher1 := TDCP_blowfish.Create(nil);
  Cipher1.InitStr(pass, TDCP_sha1);
  result := Cipher1.EncryptString(data);
  Cipher1.Burn;
  Cipher1.Free;
end;

begin
  Write('Retreiving information...');
  GetCPUInfo(CPUInfo);
  WriteLn('OK');
  Write('Retreiving information...');
  GetHDDInfo(HDDInfo);
  WriteLn('OK'#13#10);

  Write('Encrypting...');
  CPUInfo.VendorID := EncryptString(CPUInfo.VendorID);
  CPUInfo.SerialNum := EncryptString(CPUInfo.SerialNum);
  CPUInfo.BrandString := EncryptString(CPUInfo.BrandString);

  HDDInfo.ModelNumber := EncryptString(HDDInfo.ModelNumber);
  HDDInfo.SerialNumber := EncryptString(HDDInfo.SerialNumber);
  HDDInfo.CTLRevisionNumber := EncryptString(HDDInfo.CTLRevisionNumber);
  WriteLn('OK'#13#10);

  Write('Writind data...');
  Assign(TCFile, ExtractFilePath(ParamStr(0)) + 'cinfo.dat');
  Rewrite(TCFile);
    Write(TCFile, CPUInfo);
  CloseFile(TCFile);

  Assign(THFile, ExtractFilePath(ParamStr(0)) + 'hinfo.dat');
  Rewrite(THFile);
    Write(THFile, HDDInfo);
  CloseFile(THFile);
  WriteLn('OK');
end.
