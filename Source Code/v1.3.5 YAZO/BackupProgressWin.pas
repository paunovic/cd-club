unit BackupProgressWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ZipForge;

type
  TBackupProgressWindow = class(TForm)
    Gauge1: TGauge;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  
var
  BackupProgressWindow: TBackupProgressWindow;

implementation

uses BaseBackupWin;

{$R *.dfm}

procedure TBackupProgressWindow.FormCreate(Sender: TObject);
begin
   SetWindowLong(Handle,
                 GWL_STYLE,
                 GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
   ClientHeight := Height;

   Label5.Caption := BaseBackupWindow.Edit1.Text;
end;

procedure TBackupProgressWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFREE;
end;

procedure TBackupProgressWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
    mrOK     : Application.MessageBox('Bekapovanje zavrseno !', 'Information', mb_OK + mb_ICONASTERISK);
    mrCANCEL : Begin
                 DeleteFile(BaseBackupWindow.Edit1.Text);
                 Application.MessageBox('Bekapovanje prekinuto !', 'Information', mb_OK + mb_ICONASTERISK);
               End;  
  End;
end;

procedure TBackupProgressWindow.Button1Click(Sender: TObject);
begin
  Button1.Cancel := TRUE;
end;

procedure TBackupProgressWindow.FormDeactivate(Sender: TObject);
begin
  SetFocus;
end;

end.
