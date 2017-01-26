unit ReportWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, DB, DBTables, ComCtrls;

type
  TReportWindow = class(TForm)
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Query2: TQuery;
    Query1: TQuery;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Table1: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DateTimePicker1Enter(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportWindow: TReportWindow;

implementation

{$R *.dfm}

procedure TReportWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  Query2.Close;

  Action := caFREE;
end;

procedure TReportWindow.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
  DateTimePicker3.Time := 0;
  DateTimePicker4.Time := 0;

  Query1.Open;
  Query2.Open;
end;

procedure TReportWindow.DateTimePicker1Change(Sender: TObject);
var
  C1   : Integer;
  cNum : Integer;
  cZar : LongInt;
begin
  For C1 := 1 to 2 Do
    With TQuery(FindComponent('Query' + IntToStr(C1))) Do
    Begin
      Close;
      Params[0].AsDate := DateTimePicker1.Date;
      Params[1].AsDate := DateTimePicker2.Date;
      Params[2].AsTime := DateTimePicker3.Time;
      Params[3].AsTime := DateTimePicker4.Time;
      Prepare;
      Open;

      cNum := 0;
      cZar := 0;
      First;
      While not Eof Do
      Begin
        Inc(cNum);
        If C1 = 2 Then
        Begin
          Table1.First;
          Table1.FindKey([FieldByName('CDID').AsInteger]);
          Inc(cZar, Table1.FieldByName('Price').AsInteger);
        End;
        Next;
      End;
      TLabel(ReportWindow.FindComponent('Label' + IntToStr(C1 + 1))).Caption := IntToStr(cNum);
      If C1 = 2 Then
        Label10.Caption := IntToStr(cZar);
    End;
end;

procedure TReportWindow.DBGrid1Enter(Sender: TObject);
begin
  TDBGrid(Sender).FixedColor := clSkyBlue;
end;

procedure TReportWindow.DBGrid1Exit(Sender: TObject);
begin
  TDBGrid(Sender).FixedColor := clBtnFace;
end;

procedure TReportWindow.DateTimePicker1Enter(Sender: TObject);
begin
  TDateTimePicker(Sender).Color := clSkyBlue;
end;

procedure TReportWindow.DateTimePicker1Exit(Sender: TObject);
begin
  TDateTimePicker(Sender).Color := clWindow;
end;

procedure TReportWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : Close;
  End;
end;

end.
