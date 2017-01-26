unit EEggWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TEEggWindow = class(TForm)
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label1Click(Sender: TObject);
  private
  public
  end;

var
  EEggWindow: TEEggWindow;

implementation

{$R *.dfm}

procedure TEEggWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFREE;
end;

procedure TEEggWindow.Label1Click(Sender: TObject);
begin
  Close;
end;

end.
