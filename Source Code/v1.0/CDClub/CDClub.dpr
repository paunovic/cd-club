{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

program CDClub;

uses
  Forms,
  Windows,
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
  ProgramUpdateWin in 'ProgramUpdateWin.pas' {ProgramUpdateWindow},
  MemberBaseWin in 'MemberBaseWin.pas' {MemberBaseWindow},
  AdminWin in 'AdminWin.pas' {AdminWindow},
  MemberNewWin in 'MemberNewWin.pas' {MemberNewWindow},
  MemberDetailsChangeWin in 'MemberDetailsChangeWin.pas' {MemberDetailsChangeWindow},
  MembersListExportWin in 'MembersListExportWin.pas' {MembersListExportWindow},
  MemberDetailsWin in 'MemberDetailsWin.pas' {MemberDetailsWindow},
  MemberCardsWin in 'MemberCardsWin.pas' {MemberCardsWindow};

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
  C1 : Integer;
begin
  If MainWindow.Settings.IntroWindowShow Then
  Begin
    Application.CreateForm(TAboutWindow, AboutWindow);
    AboutWindow.Label1.Visible := FALSE;
    If DoTheAlphaBlend Then
    Begin
      AboutWindow.AlphaBlend := TRUE;
      AboutWindow.AlphaBlendValue := 0;
      AboutWindow.Show;
      For C1 := 0 to 255 Do
      Begin
        If C1 mod 5 = 0 Then
        Begin
          AboutWindow.AlphaBlendValue := C1;
          AboutWindow.Refresh;
        End;
      End;
      AboutWindow.AlphaBlend := FALSE;
      AboutWindow.AlphaBlendValue := 255;
    End
    Else
    Begin
      AboutWindow.Show;
      AboutWindow.Refresh;
      Sleep(150);
    End;

    Sleep(500);
    AboutWindow.Label1.Visible := TRUE;
    AboutWindow.Close;
  End;

  Application.CreateForm(TOperatorChooseWindow, OperatorChooseWindow);
  OperatorChooseWindow.ShowModal;
end;

begin
  With Application Do
  Begin
    Initialize;
    CreateForm(TMainWindow, MainWindow);
    Title := 'CDClub v' + MainWindow.Version;
    ShowIntro;
    Run;
  End;
end.
