unit AboutWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, XPMan;

type
  TAboutWindow = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutWindow: TAboutWindow;

implementation

uses MainWin;

{$R *.dfm}

procedure TAboutWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFREE;
end;

procedure TAboutWindow.FormClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Close;
end;

procedure TAboutWindow.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutWindow.Label1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutWindow.FormCreate(Sender: TObject);
begin
  Label2.Caption := 'v' + MainWindow.Version;
end;

end.
