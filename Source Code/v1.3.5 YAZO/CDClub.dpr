{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}

program CDClub;

uses
  Forms,
  Windows,
  SysUtils,
  DB,
  DBTables,
  ExtCtrls,
  Messages,
  HDInfo,
  DCPblowfish, DCPsha1,
  AboutWin in 'AboutWin.pas' {AboutWindow},
  OperatorChooseWin in 'OperatorChooseWin.pas' {OperatorChooseWindow},
  MainWin in 'MainWin.pas' {MainWindow},
  CryptRoutines in 'CryptRoutines.pas',
  OperatorDetailWin in 'OperatorDetailWin.pas' {OperatorDetailWindow},
  OptionsWin in 'OptionsWin.pas' {OptionsWindow},
  BaseBackupWin in 'BaseBackupWin.pas' {BaseBackupWindow},
  BackupProgressWin in 'BackupProgressWin.pas' {BackupProgressWindow},
  CDBaseWin in 'CDBaseWin.pas' {CDBaseWindow},
  CDRentWin in 'CDRentWin.pas' {CDRentWindow},
  NewCDWin in 'NewCDWin.pas' {NewCDWindow},
  CDDetailsWin in 'CDDetailsWin.pas' {CDDetailsWindow},
  CDDetailsChangeWin in 'CDDetailsChangeWin.pas' {CDDetailsChangeWindow},
  CDBackWin in 'CDBackWin.pas' {CDBackWindow},
  ListPrintWin in 'ListPrintWin.pas' {ListPrintWindow},
  CDListExportWin in 'CDListExportWin.pas' {CDListExportWindow},
  MemberBaseWin in 'MemberBaseWin.pas' {MemberBaseWindow},
  AdminWin in 'AdminWin.pas' {AdminWindow},
  MemberNewWin in 'MemberNewWin.pas' {MemberNewWindow},
  MemberDetailsChangeWin in 'MemberDetailsChangeWin.pas' {MemberDetailsChangeWindow},
  MembersListExportWin in 'MembersListExportWin.pas' {MembersListExportWindow},
  MemberDetailsWin in 'MemberDetailsWin.pas' {MemberDetailsWindow},
  MemberCardsWin in 'MemberCardsWin.pas' {MemberCardsWindow},
  EEggWin in 'EEggWin.pas' {EEggWindow},
  ReportWin in 'ReportWin.pas' {ReportWindow},
  Top10CDWin in 'Top10CDWin.pas' {Top10CDWindow};

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

{$R *.res}

function DoTheAlphaBlend : Boolean;
var
  OSVersionInfo : TOSVersionInfo;
begin
  result := FALSE;

  OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
  If (GetVersionEx(OSVersionInfo)) and
     (OSVersionInfo.dwPlatformId = 2) Then
    result := TRUE;
end;

procedure ShowIntro;
var
  Timer : TTimer;
begin
  If MainWindow.Settings.IntroWindowShow Then
  Begin
    Application.CreateForm(TAboutWindow, AboutWindow);
  If DoTheAlphaBlend Then
    Begin
      AboutWindow.AlphaBlend := TRUE;
      AboutWindow.AlphaBlendValue := 0;
      AboutWindow.Show;
      Timer := TTimer.Create(Application);
      Timer.Interval := 15;
      Timer.Tag := 9;
      Timer.OnTimer := MainWindow.OnTimer;
      Timer.Enabled := TRUE;
      While AboutWindow.AlphaBlendValue < 255 - Timer.Tag Do
        Application.ProcessMessages;
      Timer.Free;  

      AboutWindow.AlphaBlend := FALSE;
      AboutWindow.AlphaBlendValue := 255;
    End
    Else
    Begin
      AboutWindow.Show;
      AboutWindow.Refresh;
      Sleep(150);
    End;

    Sleep(450);
    AboutWindow.Close;
  End;

  Application.CreateForm(TOperatorChooseWindow, OperatorChooseWindow);
  OperatorChooseWindow.ShowModal;
end;

procedure CreateTables;
var
  Table : TTable;
begin
  If not DirectoryExists('bases') Then
    CreateDir('bases');

  Table := TTable.Create(Application);

{ Opers.DB }
  With Table Do
  Begin
    Active := FALSE;
    TableName := 'bases\Opers.DB';
    If not Table.Exists Then
    Begin
      With FieldDefs Do
      Begin
        Clear;
        With AddFieldDef Do
        Begin
          Name := 'IDNum';
          DataType := ftSmallInt;
        End;
        With AddFieldDef Do
        Begin
          Name := 'FirstName';
          DataType := ftString;
          Size := 20;
        End;
        With AddFieldDef Do
        Begin
          Name := 'LastName';
          DataType := ftString;
          Size := 20;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BirthPlace';
          DataType := ftString;
          Size := 20;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Address';
          DataType := ftString;
          Size := 40;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BirthDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'PhoneNumber';
          DataType := ftString;
          Size := 30;
        End;
        With AddFieldDef Do
        Begin
          Name := 'MotherNumber';
          DataType := ftString;
          Size := 13;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Password';
          DataType := ftString;
          Size := 30;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Status';
          DataType := ftString;
          Size := 10;
        End;
        With AddFieldDef Do
        Begin
          Name := 'AccessGranted';
          DataType := ftSmallInt;
        End;
      End;
      With IndexDefs Do
      Begin
        Clear;
        With AddIndexDef Do
        Begin
          Name := '';
          Fields := 'IDNum';
          Options := [ixPrimary];
        End;
      End;
      CreateTable;
    End;
  End;

{ CDBase.DB }
  With Table Do
  Begin
    Active := FALSE;
    TableName := 'bases\CDBase.DB';
    If not Table.Exists Then
    Begin
      With FieldDefs Do
      Begin
        Clear;
        With AddFieldDef Do
        Begin
          Name := 'IDNum';
          DataType := ftInteger;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Title';
          DataType := ftString;
          Size := 60;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Kind';
          DataType := ftString;
          Size := 15;
        End;
        With AddFieldDef Do
        Begin
          Name := 'CDAmount';
          DataType := ftSmallInt;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Description';
          DataType := ftString;
          Size := 50;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Status';
          DataType := ftString;
          Size := 10;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BuyDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'LastRentDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'LastRentUser';
          DataType := ftInteger;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Price';
          DataType := ftInteger;
        End;
        With AddFieldDef Do
        Begin
          Name := 'TimesRented';
          DataType := ftInteger;
        End;
      End;
      With IndexDefs Do
      Begin
        Clear;
        With AddIndexDef Do
        Begin
          Name := '';
          Fields := 'IDNum';
          Options := [ixPrimary];
        End;
      End;
      CreateTable;
    End;
  End;

{ Members.DB }
  With Table Do
  Begin
    Active := FALSE;
    TableName := 'bases\Members.DB';
    If not Table.Exists Then
    Begin
      With FieldDefs Do
      Begin
        Clear;
        With AddFieldDef Do
        Begin
          Name := 'IDNum';
          DataType := ftInteger;
        End;
        With AddFieldDef Do
        Begin
          Name := 'FirstName';
          DataType := ftString;
          Size := 20;
        End;
        With AddFieldDef Do
        Begin
          Name := 'LastName';
          DataType := ftString;
          Size := 20;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Address';
          DataType := ftString;
          Size := 40;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BirthPlace';
          DataType := ftString;
          Size := 20;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BirthDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'PhoneNumber';
          DataType := ftString;
          Size := 30;
        End;
        With AddFieldDef Do
        Begin
          Name := 'JoinDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Status';
          DataType := ftString;
          Size := 10;
        End;
        With AddFieldDef Do
        Begin
          Name := 'PaperNum';
          DataType := ftString;
          Size := 10;
        End;
      End;
      With IndexDefs Do
      Begin
        Clear;
        With AddIndexDef Do
        Begin
          Name := '';
          Fields := 'IDNum';
          Options := [ixPrimary];
        End;
      End;
      CreateTable;
    End;
  End;

{ MemberCard.DB }
  With Table Do
  Begin
    Active := FALSE;
    TableName := 'bases\MemberCard.DB';
    If not Table.Exists Then
    Begin
      With FieldDefs Do
      Begin
        Clear;
        With AddFieldDef Do
        Begin
          Name := 'MemberID';
          DataType := ftInteger;
        End;
        With AddFieldDef Do
        Begin
          Name := 'RentNum';
          DataType := ftInteger;
        End;
        With AddFieldDef Do
        Begin
          Name := 'RentDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BackDate';
          DataType := ftDate;
        End;
        With AddFieldDef Do
        Begin
          Name := 'RentTime';
          DataType := ftTime;
        End;
        With AddFieldDef Do
        Begin
          Name := 'BackTime';
          DataType := ftTime;
        End;
        With AddFieldDef Do
        Begin
          Name := 'Backed';
          DataType := ftBoolean;
        End;
        With AddFieldDef Do
        Begin
          Name := 'CDID';
          DataType := ftInteger;
        End;
      End;
      With IndexDefs Do
      Begin
        Clear;
        With AddIndexDef Do
        Begin
          Name := '';
          Fields := 'MemberID; RentNum';
          Options := [ixPrimary];
        End;
      End;
      CreateTable;
    End;
  End;

  Table.Free;
end;

function DecryptString(data : String) : String;
const
  pass = 'mw!@3sdk@5sdfln32$82384hsa,32jb123,1287@(&^2134mn @7635';
var
  Cipher1 : TDCP_blowfish;
begin
  Cipher1 := TDCP_blowfish.Create(nil);
  Cipher1.InitStr(pass, TDCP_sha1);
  result := Cipher1.DecryptString(data);
  Cipher1.Burn;
  Cipher1.Free;
end;

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

function CheckCPU(const rec : Integer) : Boolean;
var
  TCFile   : File of TCPUInfo;
  CPUInfo,
  CPUInfoC : TCPUInfo;
begin
  If rec > 5 Then
  Begin
    result := FALSE;
    Exit;
  End;

  Sleep(rec * 10);

  result := TRUE;

  If not FileExists(ExtractFilePath(ParamStr(0)) + 'cinfo.dat') Then
  Begin
    result := FALSE;
    Exit;
  End;

  Assign(TCFile, ExtractFilePath(ParamStr(0)) + 'cinfo.dat');
  Reset(TCFile);
    Read(TCFile, CPUInfo);
  CloseFile(TCFile);

  CPUInfo.VendorID := DecryptString(CPUInfo.VendorID);
  CPUInfo.SerialNum := DecryptString(CPUInfo.SerialNum);
  CPUInfo.BrandString := DecryptString(CPUInfo.BrandString);

  GetCPUInfo(CPUInfoC);

  If (CPUInfo.VendorID <> CPUInfoC.VendorID) or
     (CPUInfo.SteppingID <> CPUInfoC.SteppingID) or
     (CPUInfo.ModelNumber <> CPUInfoC.ModelNumber) or
     (CPUInfo.FamilyCode <> CPUInfoC.FamilyCode) or
     (CPUInfo.ProcessorType <> CPUInfoC.ProcessorType) or
     (CPUInfo.ExtendedModel <> CPUInfoC.ExtendedModel) or
     (CPUInfo.ExtendedFamily <> CPUInfoC.ExtendedFamily) or
     (CPUInfo.BrandID <> CPUInfoC.BrandID) or
     (CPUInfo.Chunks <> CPUInfoC.Chunks) or
     (CPUInfo.Count <> CPUInfoC.Count) or
     (CPUInfo.APICID <> CPUInfoC.APICID) or
     (CPUInfo.SerialNumEnabled <> CPUInfoC.SerialNumEnabled) or
     (CPUInfo.SerialNum <> CPUInfoC.SerialNum) or
     (CPUInfo.MMXSupport <> CPUInfoC.MMXSupport) or
     (CPUInfo.FXSaveFXRStop <> CPUInfoC.FXSaveFXRStop) or
     (CPUInfo.SSE <> CPUInfoC.SSE) or
     (CPUInfo.SSE2 <> CPUInfoC.SSE2) or
     (CPUInfo.ExtendedCPUID <> CPUInfoC.ExtendedCPUID) or
     (CPUInfo.LargestFuncSupport <> CPUInfoC.LargestFuncSupport) or
     (CPUInfo.BrandString <> CPUInfoC.BrandString) Then
    result := CheckCPU(rec + 1);
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

function CheckHDD : Boolean;
var
  THFile   : File of THD_INFO_DATA;
  HDDInfo,
  HDDInfoC : THD_INFO_DATA;
begin
  result := TRUE;

  If not FileExists(ExtractFilePath(ParamStr(0)) + 'hinfo.dat') Then
  Begin
    result := FALSE;
    Exit;
  End;

  Assign(THFile, ExtractFilePath(ParamStr(0)) + 'hinfo.dat');
  Reset(THFile);
    Read(THFile, HDDInfo);
  CloseFile(THFile);

  HDDInfo.ModelNumber := DecryptString(HDDInfo.ModelNumber);
  HDDInfo.SerialNumber := DecryptString(HDDInfo.SerialNumber);
  HDDInfo.CTLRevisionNumber := DecryptString(HDDInfo.CTLRevisionNumber);

  GetHDDInfo(HDDInfoC);

  If (HDDInfo.DriveExists <> HDDInfoC.DriveExists) or
     (HDDInfo.DriveType <> HDDInfoC.DriveType) or
     (HDDInfo.Controller <> HDDInfoC.Controller) or
     (HDDInfo.Position <> HDDInfoC.Position) or
     (HDDInfo.ModelNumber <> HDDInfoC.ModelNumber) or
     (HDDInfo.SerialNumber <> HDDInfoC.SerialNumber) or
     (HDDInfo.CTLRevisionNumber <> HDDInfoC.CTLRevisionNumber) or
     (HDDInfo.CTLBufferSize <> HDDInfoC.CTLBufferSize) or
     (HDDInfo.DriveSize <> HDDInfoC.DriveSize) or
     (HDDInfo.DriveID <> HDDInfoC.DriveID) Then
    result := FALSE
end;

begin
  If not CheckCPU(0) Then
    Exit;
  If not CheckHDD Then
    Exit;

  If WaitForSingleObject(CreateMutex(nil, FALSE, PChar('CDClub v' + MainWindow.Version + ' M00T3X by Ex3cut0r')), 0) = wait_TimeOut Then
  Begin
    Application.MessageBox('Program je vec startovan !', 'Information', mb_OK + mb_ICONINFORMATION);
    MainWindow.Caption := MainWindow.Caption + ' Dont Find Me !';
    SetForegroundWindow(FindWindow(nil, PChar('CDClub v' + MainWindow.Version + ' by MarkoSoft')));
    Exit;
  End;

  With Application Do
  Begin
    Initialize;
    CreateTables;
    CreateForm(TMainWindow, MainWindow);
    Title := 'CDClub v' + MainWindow.Version;
    ShowIntro;
    Run;
  End;
end.
