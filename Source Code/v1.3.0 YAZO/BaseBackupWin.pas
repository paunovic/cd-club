unit BaseBackupWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, Buttons, Spin, ZipForge;

type
  TBaseBackupWindow = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    Archiver: TZipForge;
    BitBtn3: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ArchiverFileProgress(Sender: TObject; FileName: String;
      Progress: Double; Operation: TZFProcessOperation;
      ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
    procedure Backup(const Destination : String);
    procedure ReadOptions;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseBackupWindow: TBaseBackupWindow;

implementation

uses MainWin, BackupProgressWin, OptionsWin;

{$R *.dfm}

procedure TBaseBackupWindow.Button1Click(Sender: TObject);
begin
  SaveDialog1.FileName := Edit1.Text;
  If SaveDialog1.Execute Then
    Edit1.Text := SaveDialog1.FileName;
end;

procedure TBaseBackupWindow.Backup(const Destination : String);
begin
  BackupProgressWindow.Show;

  With Archiver Do
  Begin
    FileName := BaseBackupWindow.Edit1.Text;
    OpenArchive(fmCreate);
    If BaseBackupWindow.CheckBox1.Checked Then
    Begin
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\CDBase.DB');
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\CDBase.PX');
    End;
    If BaseBackupWindow.CheckBox2.Checked Then
    Begin
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\Members.DB');
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\Members.PX');
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\MemberCard.DB');
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\MemberCard.PX');
    End;
    If BaseBackupWindow.CheckBox3.Checked Then
    Begin
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\Opers.DB');
      AddFiles(ExtractFilePath(ParamStr(0)) + 'bases\Opers.PX');
    End;

    CloseArchive;
  End;
  
  If BackupProgressWindow.Button1.Cancel Then
    BackupProgressWindow.ModalResult := mrCANCEL
  else
    BackupProgressWindow.ModalResult := mrOK;
  BackupProgressWindow.Close;
end;

procedure TBaseBackupWindow.ReadOptions;
begin
  Archiver.CompressionMode := MainWindow.Settings.BackupCompLevel;
  Archiver.Password := MainWindow.Settings.BackupPassword;
end;

procedure TBaseBackupWindow.FormCreate(Sender: TObject);
var
  LocTime : TSystemTime;
begin
  ReadOptions;

  GetLocalTime(LocTime);

  Edit1.Text := 'C:\Backup' + MainWindow.LZero(IntToStr(LocTime.wDay), 2) +
                MainWindow.LZero(IntToStr(LocTime.wMonth), 2) +
                MainWindow.LZero(IntToStr(LocTime.wYear), 2) + '.ZIP';

  Application.CreateForm(TBackupProgressWindow, BackupProgressWindow);
end;

procedure TBaseBackupWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
    mrOK : Begin
             If (not CheckBox1.Checked) and
                (not CheckBox2.Checked) and
                (not CheckBox3.Checked) Then
             Begin
               Application.MessageBox('Nista nije selektovano !', 'Information', mb_OK + mb_ICONASTERISK);
               CanClose := FALSE;
               CheckBox1.SetFocus;
               Exit;
             End;

             If (FileExists(Edit1.Text)) and
                (Application.MessageBox('Fajl vec postoji ! Da li zelite da nastavite ?',
                                         'Question',
                                         mb_YESNO + mb_ICONQUESTION) = mrNO) Then
             Begin
               CanClose := FALSE;
               Exit;
             End;

             Backup(Edit1.Text);
           End;
  end;
end;

procedure TBaseBackupWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFREE;
end;

procedure TBaseBackupWindow.ArchiverFileProgress(Sender: TObject;
  FileName: String; Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
  BackupProgressWindow.Label3.Caption := ExtractFileName(FileName);
  BackupProgressWindow.Gauge1.Progress := Trunc(Progress);
  Cancel := BackupProgressWindow.Button1.Cancel;
  Application.ProcessMessages;
end;

procedure TBaseBackupWindow.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(TOptionsWindow, OptionsWindow);
  With OptionsWindow Do
  Begin
    Show;
    SpinEdit1.SetFocus;
    Hide;
    ShowModal;
  End;
  ReadOptions;
end;

end.
