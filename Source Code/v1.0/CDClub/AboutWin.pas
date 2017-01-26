unit AboutWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TAboutWindow = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutWindow: TAboutWindow;

implementation

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

end.
