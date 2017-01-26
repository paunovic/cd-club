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

begin
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
