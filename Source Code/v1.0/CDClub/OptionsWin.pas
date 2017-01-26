unit OptionsWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, Buttons, Spin;

type
  TOptionsWindow = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SaveSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpinEdit1Enter(Sender: TObject);
    procedure SpinEdit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpinEdit2Enter(Sender: TObject);
    procedure SpinEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsWindow: TOptionsWindow;

implementation

uses MainWin, CryptRoutines;

{$R *.dfm}

function BoolToInt(const bool : Boolean; const valTRUE, valFALSE : Integer) : Integer;
begin
  result := valFALSE;
  If bool Then
    result := valTRUE;
end;

procedure TOptionsWindow.SaveSettings;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.ini');

  INI.WriteInteger('options', 'MinimizeToSysTray', BoolToInt(RadioButton1.Checked, 1, 0));
  INI.WriteBool('options', 'ShowIntroWindow', CheckBox1.Checked);
  INI.WriteInteger('backup', 'CompressionLevel', SpinEdit1.Value);
  INI.WriteString('backup', 'Password', Encrypt(Edit1.Text));

  INI.Free;

  MainWindow.ReadOptions;
end;

procedure TOptionsWindow.FormCreate(Sender: TObject);
begin
  RadioButton1.Checked := 1 = MainWindow.Settings.MinimizeToSysTray;
  RadioButton2.Checked := not RadioButton1.Checked;
  SpinEdit1.Value := MainWindow.Settings.BackupCompLevel;
  Edit1.Text := MainWindow.Settings.BackupPassword;
  CheckBox1.Checked := MainWindow.Settings.IntroWindowShow;
end;

procedure TOptionsWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFREE;
end;

procedure TOptionsWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : ModalResult := mrCANCEL;
  End;  
end;

procedure TOptionsWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
    mrOK : SaveSettings;
  End;
end;

procedure TOptionsWindow.SpinEdit1Enter(Sender: TObject);
begin
  SpinEdit1.Color := clSkyBlue;
end;

procedure TOptionsWindow.SpinEdit1Exit(Sender: TObject);
begin
  SpinEdit1.Color := clWindow;
end;

procedure TOptionsWindow.Edit1Enter(Sender: TObject);
begin
  Edit1.Color := clSkyBlue;
end;

procedure TOptionsWindow.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clWindow;
end;

procedure TOptionsWindow.SpinEdit2Enter(Sender: TObject);
begin
  With Sender as TSpinEdit Do
    Color := clSkyBlue;
end;

procedure TOptionsWindow.SpinEdit2Exit(Sender: TObject);
begin
  With Sender as TSpinEdit Do
    Color := clWindow;
end;

end.
