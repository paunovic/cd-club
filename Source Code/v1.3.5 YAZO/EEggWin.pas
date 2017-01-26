unit EEggWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TEEggWindow = class(TForm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
  private
  public
  end;

var
  EEggWindow: TEEggWindow;

implementation

uses AdminWin;

{$R *.dfm}

procedure TEEggWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFREE;
end;

procedure TEEggWindow.Image1Click(Sender: TObject);
begin
  Close;
end;

end.
