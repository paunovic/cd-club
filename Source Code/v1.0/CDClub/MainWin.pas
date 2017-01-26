unit MainWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Buttons, Menus, ComCtrls, DB, DBTables, IniFiles,
  CoolTrayIcon;

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

  TIniFileSettings = Record
                       MinimizeToSysTray : Integer;
                       MinimizeToTaskBar : Integer;
                       BackupCompLevel   : Integer;
                       BackupPassword    : String;
                       IntroWindowShow   : Boolean;
                       LastUpdateDate    : String;
                     End;

  TMainWindow = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    AzuriranjePrograma1: TMenuItem;
    N5: TMenuItem;
    AdministratorMenu1: TMenuItem;
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
    function Settings : TIniFileSettings;
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure renutnoStanje1Click(Sender: TObject);
    procedure ListaClanova1Click(Sender: TObject);
    procedure PromeniOperatera2Click(Sender: TObject);
    procedure ZatvoriProgram1Click(Sender: TObject);
    procedure UradiBekapBaze1Click(Sender: TObject);
    function LZero(const data : String; const LD : Integer) : String;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AzuriranjePrograma1Click(Sender: TObject);
    procedure SaveUpdateDate;
    procedure AdministratorMenu1Click(Sender: TObject);
    function Version : String;
  private
    SelButton : Byte;
  public
    OperID : ShortInt;
  end;

var
  MainWindow : TMainWindow;

implementation

uses OperatorChooseWin, AboutWin, OperatorDetailWin, OptionsWin,
  BaseBackupWin, CDBaseWin, CryptRoutines, ProgramUpdateWin, MemberBaseWin,
  AdminWin;

{$R *.dfm}

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

function TMainWindow.Version : String;
begin
  result := '1.00';
end;

procedure TMainWindow.SaveUpdateDate;
var
  INI     : TIniFile;
  LocTime : TSystemTime;
begin
  GetLocalTime(LocTime);

  INI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.ini');

  INI.WriteString('update', 'LastUpdateDate', LZero(IntToStr(LocTime.wDay), 2) + '/' +
                                              LZero(IntToStr(LocTime.wMonth), 2) + '/' +
                                              LZero(IntToStr(LocTime.wYear), 2));
end;

function TMainWindow.Settings : TIniFileSettings;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.ini');

  With result Do
  Begin
    MinimizeToSysTray := INI.ReadInteger('options', 'MinimizeToSysTray', 1);
    MinimizeToTaskBar := not MinimizeToSysTray;
    BackupCompLevel := INI.ReadInteger('backup', 'CompressionLevel', 7);
    BackupPassword := Decrypt(INI.ReadString('backup', 'Password', ''));
    IntroWindowShow := INI.ReadBool('options', 'ShowIntroWindow', TRUE);
    LastUpdateDate := INI.ReadString('update', 'LastUpdateDate', '- nikad.');
  End;

  INI.Free;
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
  CoolTrayIcon1.MinimizeToTray := 1 = Settings.MinimizeToSysTray;
end;


procedure TMainWindow.FormCreate(Sender: TObject);
begin
  ShortDateFormat := 'DD/MM/YYYY';
  ShortTimeFormat := 'HH:MM:SS';
  
  Table1.Open;

  OperID := -1;
  SelButton := 1;
end;

procedure TMainWindow.OProgramu1Click(Sender: TObject);
begin
  Application.CreateForm(TAboutWindow, AboutWindow);
  MainWindow.Hide;
  AboutWindow.ShowModal;
  MainWindow.Show;
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
                    1 : SpeedButton1.Click;
                    2 : SpeedButton2.Click;
                  End;
                End;
    vk_ESCAPE : MainWindow.Close;
  End;
end;

procedure TMainWindow.MakeInterface;
begin
  If OperID <> 0 Then
  Begin
    PopupMenu1.Items[8].Visible := FALSE;
    PopupMenu1.Items[9].Visible := FALSE;
    StatusBar1.Panels[0].Text := 'Operater : ' +
                                 OperatorData(OperID).FirstName + ' ' +
                                 OperatorData(OperID).LastName + ' (Broj ' +
                                 IntToStr(OperID) + ')'
  End                               
  else
  Begin
    PopupMenu1.Items[8].Visible := TRUE;
    PopupMenu1.Items[9].Visible := TRUE;
    StatusBar1.Panels[0].Text := 'Administrator';
  End;

  Case SelButton of
    1 : Begin
          SpeedButton1.Font.Color := clRED;
          SpeedButton2.Font.Color := clBLACK;
        End;
    2 : Begin
          SpeedButton2.Font.Color := clRED;
          SpeedButton1.Font.Color := clBLACK;
        End;
  End;
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
  SpeedButton1.Click;
end;

procedure TMainWindow.ListaClanova1Click(Sender: TObject);
begin
  SpeedButton2.Click;
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

procedure TMainWindow.SpeedButton1Click(Sender: TObject);
begin
  SelButton := 1;
  MakeInterface;

  Application.CreateForm(TCDBaseWindow, CDBaseWindow);
  CDBaseWindow.ShowModal;
end;

procedure TMainWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
end;

procedure TMainWindow.AzuriranjePrograma1Click(Sender: TObject);
begin
  Application.CreateForm(TProgramUpdateWindow, ProgramUpdateWindow);
  ProgramUpdateWindow.ShowModal;
end;

procedure TMainWindow.AdministratorMenu1Click(Sender: TObject);
begin
  Application.CreateForm(TAdminWindow, AdminWindow);
  AdminWindow.ShowModal;
end;

end.

