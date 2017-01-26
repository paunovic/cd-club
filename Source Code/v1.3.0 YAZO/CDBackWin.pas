unit CDBackWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, StdCtrls, Buttons, DBGrids;

type
  TCDBackWindow = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StringGrid1: TStringGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    Table3: TTable;
    Table4: TTable;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AddCDToBasket(const CDNum : Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    function MemberExist(const MNum : Integer) : Boolean;
    procedure BackCD(const CDNum : Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RemoveCDFromBasket(const CDNum, SPos : Integer);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MakeInterface;
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure StringGrid1Enter(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    ToPay : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDBackWindow: TCDBackWindow;

implementation

uses MainWin, MemberDetailsWin;

const
  Months : Array[1..12] of String = ('Januar',
                                     'Februar',
                                     'Mart',
                                     'April',
                                     'Maj',
                                     'Jun',
                                     'Jul',
                                     'Avgust',
                                     'Septembar',
                                     'Oktobar',
                                     'Novembar',
                                     'Decembar');

{$R *.dfm}

procedure TCDBackWindow.Edit1Change(Sender: TObject);
begin
  MakeInterface;
end;

procedure TCDBackWindow.AddCDToBasket(const CDNum : Integer);
var
  DayR : Integer;
  C1   : Integer;
begin
  If StringGrid1.Cells[0, StringGrid1.RowCount - 1] <> '' Then
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
  StringGrid1.Cells[0, StringGrid1.RowCount - 1] := IntToStr(CDNum);

  Table2.First;
  Table2.FindKey([CDNum]);
  StringGrid1.Cells[1, StringGrid1.RowCount - 1] := Table2.FieldByName('Title').AsString;
  Table2.Edit;
  Table2.FieldByName('Status').AsString := 'Prisutan';
  DayR := -Trunc(Table2.FieldByName('LastRentDate').AsDateTime - Date);
  For C1 := 1 to DayR Do
    If Pos(IntToStr(DayOfWeek(Date - C1)), MainWindow.NoMoneyDays) = 0 Then
      Inc(ToPay, Table2.FieldByName('Price').AsInteger);
  Inc(ToPay, Table2.FieldByName('Price').AsInteger);
  
  Table2.Post;

  Label4.Caption := 'Za placanje : ' + IntToStr(ToPay);
  Label4.Update;

  With Table4 Do
  Begin
    First;
    While (not Eof) and
          ((FieldByName('CDID').AsInteger <> CDNum) or
           (FieldByName('BackDate').AsString <> '')) Do
      Table4.Next;
    Edit;
    FieldByName('Backed').AsBoolean := TRUE;
    Post;
  End;
end;

procedure TCDBackWindow.BackCD(const CDNum : Integer);
begin
  With Table4 Do
  Begin
    First;

    While (not Eof) and
          ((FieldByName('CDID').AsInteger <> CDNum) or
           (FieldByName('BackDate').AsString <> '')) Do
      Next;

    Edit;
    FieldByName('BackDate').AsDateTime := Date;
    FieldByName('BackTime').AsDateTime := Time;
    Post;
  End;
end;

procedure TCDBackWindow.SpeedButton1Click(Sender: TObject);
var
  C1 : Integer;
begin
  If not DBGrid1.Focused Then
    Exit;

  For C1 := 0 to DBGrid1.SelectedRows.Count - 1 Do
  Begin
    Table1.GotoBookmark(TBookmark(DBGrid1.SelectedRows.Items[C1]));
    AddCDToBasket(Table1.FieldByName('CDID').AsInteger);
  End;
  StringGrid1.SetFocus;

  Table1.Refresh;

  MakeInterface;
end;

function TCDBackWindow.MemberExist(const MNum : Integer) : Boolean;
begin
  result := FALSE;

  Table3.Open;
  Table3.First;
  If Table3.FindKey([MNum]) Then
    result := TRUE;
  Table3.Close;
end;

procedure TCDBackWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  C1   : Integer;
  Mess : PAnsiChar;
begin
  Case ModalResult of
    mrCancel : SpeedButton3.Click;
    mrOK     : Begin
                 CanClose := FALSE;

                 If not MemberExist(StrToInt(Edit1.Text)) Then
                 Begin
                   Edit1.SetFocus;
                   Edit1.SelectAll;
                   Application.MessageBox(PChar('Clan broj ' + Edit1.Text + ' ne postoji !'),
                                          'Information',
                                          mb_OK + mb_ICONINFORMATION);
                   Exit;
                 End;

                 For C1 := 1 to StringGrid1.RowCount - 1 Do
                   BackCD(StrToInt(StringGrid1.Cells[0, C1]));
                 CanClose := TRUE;
                 Mess := 'CD-ovi uspesno razduzeni !';
                 If ToPay <> 0 Then
                   Mess := PChar(Mess + #13#10 + 'Uzmite od clana ' + IntToStr(ToPay) + ' dinara.');
                 Application.MessageBox(Mess,
                                        'Information',
                                        mb_OK + mb_ICONINFORMATION);
               End;
  End;
end;

procedure TCDBackWindow.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If (not (Key in ['0'..'9'])) and
     (Key <> Chr(vk_BACK)) Then
    Key := Chr(vk_CLEAR);
end;

procedure TCDBackWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
  Table2.Open;
  Table3.Open;
  Table4.Open;

  StringGrid1.ColWidths[0] := 61;
  StringGrid1.ColWidths[1] := 223;
  StringGrid1.Cells[0, 0] := 'Broj';
  StringGrid1.Cells[1, 0] := 'Naziv';

  MakeInterface;
end;

procedure TCDBackWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  Table2.Close;
  Table3.Close;
  Table4.Close;

  Action := caFREE;
end;

procedure TCDBackWindow.RemoveCDFromBasket(const CDNum, SPos : Integer);
var
  C1   : Integer;
  DayR : Integer;
begin
  For C1 := SPos to StringGrid1.RowCount - 1 Do
    StringGrid1.Rows[C1].Assign(StringGrid1.Rows[C1 + 1]);
  If StringGrid1.RowCount > 2 Then
    StringGrid1.RowCount := StringGrid1.RowCount - 1;

  Table2.First;
  Table2.FindKey([CDNum]);
  Table2.Edit;
  Table2.FieldByName('Status').AsString := 'Izdat';
  DayR := -Trunc(Table2.FieldByName('LastRentDate').AsDateTime - Date);
  For C1 := 0 to DayR Do
    If Pos(IntToStr(DayOfWeek(Date - C1)), MainWindow.NoMoneyDays) = 0 Then
      Dec(ToPay, Table2.FieldByName('Price').AsInteger);
  Table2.Post;

  Label4.Caption := 'Za placanje : ' + IntToStr(ToPay);
  Label4.Update;

  With Table4 Do
  Begin
    First;
    While (not Eof) and
          ((Table4.FieldByName('CDID').AsInteger <> CDNum) or
           (Table4.FieldByName('BackDate').AsString <> '')) Do
      Table4.Next;
    Edit;
    FieldByName('Backed').AsBoolean := FALSE;
    Post;
  End;
end;

procedure TCDBackWindow.SpeedButton2Click(Sender: TObject);
begin
  If (not StringGrid1.Focused) or
     (StringGrid1.Cells[0, StringGrid1.Row] = '') Then
    Exit;

  RemoveCDFromBasket(StrToInt(StringGrid1.Cells[0, StringGrid1.Row]), StringGrid1.Row);
  DBGrid1.SetFocus;

  MakeInterface;
end;

procedure TCDBackWindow.MakeInterface;
begin
  If Edit1.Text <> '' Then
    Table1.Filter := 'MemberID = ' + QuotedStr(Edit1.Text) + ' AND Backed = FALSE'
  else
    Table1.Filter := 'MemberID = 0 AND Backed = FALSE';

  If (StringGrid1.RowCount = 2) and
     (StringGrid1.Cells[0, 1] = '') Then
    BitBtn2.Enabled := FALSE
  else
    BitBtn2.Enabled := TRUE;
end;

procedure TCDBackWindow.SpeedButton4Click(Sender: TObject);
begin
  Edit1.SelectAll;
  Edit1.SetFocus;

  If Edit1.Text = '' Then
  Begin
    Application.MessageBox('Unesite broj clana !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;

  If not MemberExist(StrToInt(Edit1.Text)) Then
  Begin
    Application.MessageBox(PChar('Clan broj ' + Edit1.Text + ' ne postoji !'),
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;

  Application.CreateForm(TMemberDetailsWindow, MemberDetailsWindow);
  MemberDetailsWindow.DBLookupComboBox1.KeyValue := Edit1.Text;
  MemberDetailsWindow.ShowModal;
end;

procedure TCDBackWindow.SpeedButton3Click(Sender: TObject);
begin
  While StringGrid1.RowCount > 2 Do
    If StringGrid1.Cells[0, 1] <> '' Then
      RemoveCDFromBasket(StrToInt(StringGrid1.Cells[0, 1]), 1);
  If StringGrid1.Cells[0, 1] <> '' Then
    RemoveCDFromBasket(StrToInt(StringGrid1.Cells[0, 1]), 1);

  MakeInterface;
end;

procedure TCDBackWindow.DBGrid1Enter(Sender: TObject);
begin
  TDBGrid(Sender).FixedColor := clSkyBlue;
end;

procedure TCDBackWindow.DBGrid1Exit(Sender: TObject);
begin
  TDBGrid(Sender).FixedColor := clBtnFace;
end;

procedure TCDBackWindow.StringGrid1Enter(Sender: TObject);
begin
  StringGrid1.FixedColor := clSkyBlue;
end;

procedure TCDBackWindow.StringGrid1Exit(Sender: TObject);
begin
  StringGrid1.FixedColor := clBtnFace;
end;

procedure TCDBackWindow.Edit1Enter(Sender: TObject);
begin
  Edit1.Color := clSkyBlue;
end;

procedure TCDBackWindow.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clWindow;
end;

procedure TCDBackWindow.SpeedButton5Click(Sender: TObject);
begin
  Table1.First;

  While Not Table1.Eof Do
  Begin
    AddCDToBasket(Table1.FieldByName('CDID').AsInteger);
    Table1.Next;
  End;

  StringGrid1.SetFocus;
  Table1.Refresh;

  MakeInterface;
end;

end.
