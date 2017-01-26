unit MainWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Buttons, Menus, ComCtrls, DB, DBTables, CoolTrayIcon,
  XPMan, StdCtrls, ImgList, Registry;

type
  TCurrOper = Record
                IDNum         : ShortInt;
                FirstName     : String[20];
                LastName      : String[20];
                BirthPlace    : String[20];
                Address       : String[40];
                BirthDate     : String[10];
                PhoneNumber   : String[30];
                MotherNumber  : String[13];
                Password      : String[30];
                Status        : String[10];
                AccessGranted : ShortInt;
              End;

  TRegSettings = Record
                   MinimizeToSysTray : Boolean;
                   BackupCompLevel   : Integer;
                   BackupPassword    : String;
                   IntroWindowShow   : Boolean;
                   NoMnyDays         : String;
                 End;

  TMainWindow = class(TForm)
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    PromeniOperatera1: TMenuItem;
    LicniPodaciOperatera1: TMenuItem;
    N1: TMenuItem;
    UradiBekapBaze1: TMenuItem;
    Opcije1: TMenuItem;
    N2: TMenuItem;
    OProgramu1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Table1: TTable;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu2: TPopupMenu;
    renutnoStanje1: TMenuItem;
    ListaClanova1: TMenuItem;
    N3: TMenuItem;
    PromeniOperatera2: TMenuItem;
    N4: TMenuItem;
    ZatvoriProgram1: TMenuItem;
    AdministratorMenu1: TMenuItem;
    XPManifest1: TXPManifest;
    Image2: TImage;
    Image3: TImage;
    N5: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure PromeniOperatera1Click(Sender: TObject);
    function OperatorData(const OpID : ShortInt) : TCurrOper;
    procedure FormCreate(Sender: TObject);
    procedure OProgramu1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MakeInterface;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LicniPodaciOperatera1Click(Sender: TObject);
    procedure Opcije1Click(Sender: TObject);
    procedure ReadOptions;
    function Settings : TRegSettings;
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure renutnoStanje1Click(Sender: TObject);
    procedure ListaClanova1Click(Sender: TObject);
    procedure PromeniOperatera2Click(Sender: TObject);
    procedure ZatvoriProgram1Click(Sender: TObject);
    procedure UradiBekapBaze1Click(Sender: TObject);
    function LZero(const data : String; const LD : Integer) : String;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdministratorMenu1Click(Sender: TObject);
    function Version : String;
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StatusBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    SelButton : Byte;
  public
    OperID      : ShortInt;
    NoMoneyDays : String[7]; 
  end;

var
  MainWindow : TMainWindow;

implementation

uses OperatorChooseWin, AboutWin, OperatorDetailWin, OptionsWin,
  BaseBackupWin, CDBaseWin, CryptRoutines, MemberBaseWin,
  AdminWin, EEggWin, BackupProgressWin, CDBackWin, CDDetailsChangeWin,
  CDDetailsWin, CDListExportWin, CDRentWin, MemberCardsWin,
  MemberDetailsChangeWin, MemberDetailsWin, MemberNewWin,
  MembersListExportWin, NewCDWin;

{$R *.dfm}

function TMainWindow.Version : String;
begin
  result := '1.2.0';
end;

function TMainWindow.LZero(const data : String; const LD : Integer) : String;
begin
  result := data;

  While Length(result) < LD Do
    result := '0' + result;
end;

function TMainWindow.OperatorData(const OpID : ShortInt): TCurrOper;
begin
  Table1.First;
  Table1.FindKey([OpID]);

  With result Do
  Begin
    FirstName := Table1.FieldByName('FirstName').AsString;
    LastName := Table1.FieldByName('LastName').AsString;
    BirthPlace := Table1.FieldByName('BirthPlace').AsString;
    Address := Table1.FieldByName('Address').AsString;
    BirthDate := Table1.FieldByName('BirthDate').AsString;
    PhoneNumber := Table1.FieldByName('PhoneNumber').AsString;
    MotherNumber := Table1.FieldByName('MotherNumber').AsString;
    Password := Table1.FieldByName('Password').AsString;
    Status := Table1.FieldByName('Status').AsString;
    AccessGranted := Table1.FieldByName('AccessGranted').AsInteger;
  End;
end;

function TMainWindow.Settings : TRegSettings;
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Try
    If Reg.OpenKey('\SOFTWARE\MarkoSoft\CDClub\Settings', TRUE) Then
      With result Do
      Begin
        MinimizeToSysTray := Reg.ReadBool('MinimizeToSysTray');
        BackupCompLevel := Reg.ReadInteger('CompressionLevel');
        BackupPassword := Decrypt(Reg.ReadString('Password'));
        IntroWindowShow := Reg.ReadBool('ShowIntroWindow');
        NoMnyDays := Reg.ReadString('NoMoneyDays');
        Reg.CloseKey;
      End;
  Except
  End;
    Reg.Free;
end;

procedure TMainWindow.Timer1Timer(Sender: TObject);
var
  LocTime : TSystemTime;
begin
  GetLocalTime(LocTime);
  StatusBar1.Panels[1].Text := LZero(IntToStr(LocTime.wHour), 2) + ':' +
                               LZero(IntToStr(LocTime.wMinute), 2) + ':' +
                               LZero(IntToStr(LocTime.wSecond), 2) + '   ' +
                               LZero(IntToStr(LocTime.wDay), 2) + '/' +
                               LZero(IntToStr(LocTime.wMonth), 2) + '/' +
                               LZero(IntToStr(LocTime.wYear), 2);
end;

procedure TMainWindow.PromeniOperatera1Click(Sender: TObject);
begin
  Application.CreateForm(TOperatorChooseWindow, OperatorChooseWindow);
  OperatorChooseWindow.ShowModal;
end;

procedure TMainWindow.ReadOptions;
begin
  CoolTrayIcon1.MinimizeToTray := Settings.MinimizeToSysTray;
  NoMoneyDays := Settings.NoMnyDays;
end;


procedure TMainWindow.FormCreate(Sender: TObject);
var
  Reg : TRegistry;
begin
  Image2.Picture.LoadFromFile('images\Main.TS.Def.jpg');
  Image3.Picture.LoadFromFile('images\Main.LC.Def.jpg');
  With PopupMenu1 Do
  Begin
    Items[0].Bitmap.LoadFromFile('images\Oper.Change.bmp');
    Items[1].Bitmap.LoadFromFile('images\Oper.Info.bmp');
    Items[3].Bitmap.LoadFromFile('images\Base.Backup.bmp');
    Items[4].Bitmap.LoadFromFile('images\Options.PM.bmp');
    Items[6].Bitmap.LoadFromFile('images\About.bmp');
    Items[8].Bitmap.LoadFromFile('images\Admin.Menu.bmp');
  End;
  With PopupMenu2 Do
  Begin
    Items[0].Bitmap.LoadFromFile('images\TS.PM.bmp');
    Items[1].Bitmap.LoadFromFile('images\LC.PM.bmp');
    Items[3].Bitmap.LoadFromFile('images\Oper.Change.bmp');
    Items[5].Bitmap.LoadFromFile('images\Close.PM.bmp');
  End;

  Caption := 'CDClub v' + Version + ' by MarkoSoft';
  ShortDateFormat := 'DD/MM/YYYY';
  ShortTimeFormat := 'HH:MM:SS';

  Reg := TRegistry.Create;

  With Reg Do
  Begin
    RootKey := HKEY_CURRENT_USER;

    If OpenKey('\SOFTWARE\MarkoSoft\CDClub\Settings', TRUE) Then
    Begin
      If not ValueExists('MinimizeToSysTray') Then
        WriteBool('MinimizeToSysTray', TRUE);
      If not ValueExists('ShowIntroWindow') Then
        WriteBool('ShowIntroWindow', TRUE);
      If not ValueExists('NoMoneyDays') Then
        WriteString('NoMoneyDays', '1');
      If not ValueExists('CompressionLevel') Then
        WriteInteger('CompressionLevel', 7);
      If not ValueExists('aAssword') Then
        WriteString('Password', '');
      CloseKey;
    End;
    Free;
  End;

  ReadOptions;

  Table1.Open;

  OperID := -1;
  SelButton := 1;
end;

procedure TMainWindow.OProgramu1Click(Sender: TObject);
begin
  Hide;
  Application.CreateForm(TAboutWindow, AboutWindow);
  AboutWindow.ShowModal;
  Show;
end;

procedure TMainWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_LEFT   : Begin
                  Dec(SelButton);
                  If SelButton < 1 Then
                    SelButton := 1
                  else
                    MakeInterface;
                End;
    vk_RIGHT  : Begin
                  Inc(SelButton);
                  If SelButton > 2 Then
                    SelButton := 2
                  else
                    MakeInterface;
                End;
    vk_RETURN : Begin
                  Case SelButton of
                    1 : Image2.OnClick(Self);
                    2 : Image3.OnClick(Self);
                  End;
                End;
    vk_ESCAPE : MainWindow.Close;
  End;
end;

procedure TMainWindow.MakeInterface;
begin
  If OperID <> 0 Then
  Begin
    PopupMenu1.Items[7].Visible := FALSE;
    PopupMenu1.Items[8].Visible := FALSE;
    StatusBar1.Panels[0].Text := 'Operater : ' +
                                 OperatorData(OperID).FirstName + ' ' +
                                 OperatorData(OperID).LastName + ' (Broj ' +
                                 IntToStr(OperID) + ')'
  End
  else
  Begin
    PopupMenu1.Items[7].Visible := TRUE;
    PopupMenu1.Items[8].Visible := TRUE;
    StatusBar1.Panels[0].Text := 'Administrator';
  End;

  Image2.Picture.Bitmap.FreeImage;
  Image3.Picture.Bitmap.FreeImage;

  Case SelButton of
    1 : Begin
          Image2.Picture.LoadFromFile('images\Main.TS.Sel.jpg');
          Image3.Picture.LoadFromFile('images\Main.LC.Def.jpg');
        End;
    2 : Begin
          Image2.Picture.LoadFromFile('images\Main.TS.Def.jpg');
          Image3.Picture.LoadFromFile('images\Main.LC.Sel.jpg');
        End;
  End;

  Image2.Refresh;
  Image3.Refresh;
end;

procedure TMainWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If Application.MessageBox('Zelite da izadjete iz programa ?',
                            'Question',
                            mb_YESNO + mb_ICONQUESTION) = mrNO Then
  Begin
    CanClose := FALSE;
    Exit;
  End;  
end;

procedure TMainWindow.LicniPodaciOperatera1Click(Sender: TObject);
begin
  Application.CreateForm(TOperatorDetailWindow, OperatorDetailWindow);
  OperatorDetailWindow.ShowModal;
end;

procedure TMainWindow.Opcije1Click(Sender: TObject);
begin
  Application.CreateForm(TOptionsWindow, OptionsWindow);
  OptionsWindow.ShowModal;
end;

procedure TMainWindow.CoolTrayIcon1Click(Sender: TObject);
begin
  CoolTrayIcon1.IconVisible := FALSE;
  CoolTrayIcon1.ShowMainForm;
end;

procedure TMainWindow.renutnoStanje1Click(Sender: TObject);
begin
  Image2.OnClick(Self);
end;

procedure TMainWindow.ListaClanova1Click(Sender: TObject);
begin
  Image3.OnClick(Self);
end;

procedure TMainWindow.PromeniOperatera2Click(Sender: TObject);
begin
  PopupMenu1.Items.Find('Promeni Operatera').Click;
end;

procedure TMainWindow.ZatvoriProgram1Click(Sender: TObject);
begin
  MainWindow.Close;
end;

procedure TMainWindow.UradiBekapBaze1Click(Sender: TObject);
begin
  Application.CreateForm(TBaseBackupWindow, BaseBackupWindow);
  BaseBackupWindow.ShowModal;
end;

procedure TMainWindow.FormActivate(Sender: TObject);
begin
  ReadOptions;
  MakeInterface;
end;

procedure TMainWindow.SpeedButton2Click(Sender: TObject);
begin
  SelButton := 2;
  MakeInterface;

  Application.CreateForm(TMemberBaseWindow, MemberBaseWindow);
  MemberBaseWindow.ShowModal;
end;

procedure TMainWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
end;

procedure TMainWindow.AdministratorMenu1Click(Sender: TObject);
begin
  Application.CreateForm(TAdminWindow, AdminWindow);
  AdminWindow.ShowModal;
end;

procedure TMainWindow.Image2Click(Sender: TObject);
begin
  Application.CreateForm(TCDBaseWindow, CDBaseWindow);
  CDBaseWindow.ShowModal;
end;

procedure TMainWindow.Image3Click(Sender: TObject);
begin
  Application.CreateForm(TMemberBaseWindow, MemberBaseWindow);
  MemberBaseWindow.ShowModal;
end;

procedure TMainWindow.Image3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SelButton := 2;
  MakeInterface;
end;

procedure TMainWindow.Image2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SelButton := 1;
  MakeInterface;
end;

procedure TMainWindow.StatusBar1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If (ssCtrl in Shift) and
     (ssAlt in Shift) and
     (ssShift in Shift) and
     (Button = mbLeft) Then
  Begin
    Hide;
    Application.CreateForm(TEEggWindow, EEggWindow);
    EEggWindow.ShowModal;
    Show;
  End;
end;

end.

