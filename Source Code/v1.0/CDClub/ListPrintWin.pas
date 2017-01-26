unit ListPrintWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, StdCtrls, Spin, DB, DBTables, QRCtrls;

type
  TListPrintWindow = class(TForm)
    QuickRep1: TQuickRep;
    Table1: TTable;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListPrintWindow: TListPrintWindow;

implementation

uses MainWin, CDBaseWin;

{$R *.dfm}

procedure TListPrintWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;

  Action := caFREE;
end;

procedure TListPrintWindow.Edit1Enter(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clSkyBlue;
end;

procedure TListPrintWindow.Edit1Exit(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clWindow;
end;

procedure TListPrintWindow.FormCreate(Sender: TObject);
begin
  ShortDateFormat := 'DD/MM/YYYY';
  QRLabel10.Caption := MainWindow.OperatorData(MainWindow.OperID).FirstName + ' ' +
                       MainWindow.OperatorData(MainWindow.OperID).LastName + ' (Broj ' +
                       IntToStr(MainWindow.OperID) + ')';
end;

end.
