unit OptionsWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, Buttons, Spin;

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
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SaveSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure SpinEdit1Enter(Sender: TObject);
    procedure SpinEdit1Exit(Sender: TObject);
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

procedure TOptionsWindow.SaveSettings;
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;

  With Reg Do
  Begin
    RootKey := HKEY_CURRENT_USER;

    If OpenKey('\SOFTWARE\MarkoSoft\CDClub\Settings', TRUE) Then
    Begin
      WriteBool('MinimizeToSysTray', RadioButton1.Checked);
      WriteBool('ShowIntroWindow', CheckBox1.Checked);
      WriteString('NoMoneyDays', MainWindow.NoMoneyDays);
      WriteInteger('CompressionLevel', SpinEdit1.Value);
      WriteString('Password', Encrypt(Edit1.Text));
    End;

    Free;
  End;

  MainWindow.ReadOptions;
end;

procedure TOptionsWindow.FormCreate(Sender: TObject);
var
  C1 : Integer;
begin
  Try
    RadioButton1.Checked := MainWindow.Settings.MinimizeToSysTray;
    RadioButton2.Checked := not RadioButton1.Checked;
    SpinEdit1.Value := MainWindow.Settings.BackupCompLevel;
    Edit1.Text := MainWindow.Settings.BackupPassword;
    CheckBox1.Checked := MainWindow.Settings.IntroWindowShow;
    For C1 := 3 to 9 Do
      If Pos(IntToStr(TLabel(FindComponent('Label' + IntToStr(C1))).Tag), MainWindow.Settings.NoMnyDays) > 0 Then
        TLabel(FindComponent('Label' + IntToStr(C1))).OnClick(FindComponent('Label' + IntToStr(C1)));
  Except
  End;      
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

procedure TOptionsWindow.Edit1Enter(Sender: TObject);
begin
  Edit1.Color := clSkyBlue;
end;

procedure TOptionsWindow.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clWindow;
end;

procedure TOptionsWindow.SpinEdit1Enter(Sender: TObject);
begin
  With Sender as TSpinEdit Do
    Color := clSkyBlue;
end;

procedure TOptionsWindow.SpinEdit1Exit(Sender: TObject);
begin
  With Sender as TSpinEdit Do
    Color := clWindow;
end;

procedure TOptionsWindow.Label9Click(Sender: TObject);
var
  C1 : Integer;
begin
  If TLabel(Sender).Font.Color = clWindowText Then
  Begin
    TLabel(Sender).Font.Color := clRed;
    TLabel(Sender).Font.Style := [fsBold];
  End
  else
  Begin
    TLabel(Sender).Font.Color := clWindowText;
    TLabel(Sender).Font.Style := [];
  End;

  MainWindow.NoMoneyDays := '';
  For C1 := 3 to 9 Do
    If TLabel(FindComponent('Label' + IntToStr(C1))).Font.Color = clRed Then
      MainWindow.NoMoneyDays := MainWindow.NoMoneyDays + IntToStr(TLabel(FindComponent('Label' + IntToStr(C1))).Tag);
end;

end.
