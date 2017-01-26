unit CDRentWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, Mask;

type
  TCDRentWindow = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    SpeedButton4: TSpeedButton;
    StringGrid1: TStringGrid;
    Table3: TTable;
    Table2: TTable;
    Table4: TTable;
    Table1: TTable;
    Label6: TLabel;
    Edit4: TMaskEdit;
    Query1: TQuery;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure MakeInterface;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AddCDToBasket(const CDNum : Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RemoveCDFromBasket(const CDNum, SPos : Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RentCD(const CDNum, MemberNum : Integer);
    procedure SpeedButton4Click(Sender: TObject);
    function MemberExist(const MNum : Integer) : Boolean;
    function MemberActive(const MNum : Integer) : Boolean;
    procedure StringGrid1Enter(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDRentWindow: TCDRentWindow;

implementation

uses CDBaseWin, MainWin, MemberDetailsWin;

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

procedure TCDRentWindow.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  If (not (Key in ['0'..'9'])) and
     (Key <> Chr(vk_BACK)) Then
    Key := Chr(vk_CLEAR);
end;

procedure TCDRentWindow.Edit2Enter(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clSkyBlue;
end;

procedure TCDRentWindow.Edit2Exit(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clWindow;
end;

procedure TCDRentWindow.DBGrid1Enter(Sender: TObject);
begin
  With Sender as TDBGrid Do
  Begin
    FixedColor := clSkyBlue;
    Columns[0].Color := clSkyBlue;
  End;
end;

procedure TCDRentWindow.DBGrid1Exit(Sender: TObject);
begin
  With Sender as TDBGrid Do
  Begin
    FixedColor := clBtnFace;
    Columns[0].Color := clSilver;
  End;
end;

procedure TCDRentWindow.MakeInterface;
var
  FString : String;
begin
  FString := 'Status = ''Prisutan''';

  If Edit2.Text <> '' Then
    FString := FString + ' AND IDNum = ' + Edit2.Text;

  If Edit3.Text <> '' Then
    FString := FString + ' AND Title = ''' + Edit3.Text + '*''';  

  Table1.Filter := FString;

  If StringGrid1.Cells[0, 1] <> '' Then
    BitBtn2.Enabled := TRUE
  else
    BitBtn2.Enabled := FALSE;  
end;

procedure TCDRentWindow.Edit2Change(Sender: TObject);
begin
  MakeInterface;
end;

procedure TCDRentWindow.Edit3Change(Sender: TObject);
begin
  MakeInterface;
end;

procedure TCDRentWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
  Table2.Open;
  Table3.Open;
  Table4.Open;

  StringGrid1.ColWidths[0] := 61;
  StringGrid1.ColWidths[1] := 223;
  StringGrid1.Cells[0, 0] := 'Broj';
  StringGrid1.Cells[1, 0] := 'Naziv';

  Edit4.Text := DateToStr(Date);

  MakeInterface;
end;

procedure TCDRentWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  Table2.Close;
  Table3.Close;
  Table4.Close;

  Action := caFREE;
end;

procedure TCDRentWindow.AddCDToBasket(const CDNum : Integer);
begin
  If StringGrid1.Cells[0, StringGrid1.RowCount - 1] <> '' Then
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
  StringGrid1.Cells[0, StringGrid1.RowCount - 1] := IntToStr(CDNum);

  Table2.First;
  Table2.FindKey([CDNum]);
  StringGrid1.Cells[1, StringGrid1.RowCount - 1] := Table2.FieldByName('Title').AsString;
  Table2.Edit;
  Table2.FieldByName('Status').AsString := 'Izdat';
  Table2.Post;
  Table1.Refresh;
  CDBaseWindow.QueryRefresh;
end;

procedure TCDRentWindow.SpeedButton1Click(Sender: TObject);
var
  C1 : Integer;
begin
  If not DBGrid1.Focused Then
    Exit;
  For C1 := 0 to DBGrid1.SelectedRows.Count - 1 Do
  Begin
    Table1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[C1]));
    AddCDToBasket(DBGrid1.DataSource.DataSet.FieldByName('IDNum').AsInteger);
  End;
  StringGrid1.SetFocus;

  MakeInterface;
end;

procedure TCDRentWindow.SpeedButton2Click(Sender: TObject);
begin
  If (not StringGrid1.Focused) or
     (StringGrid1.Cells[0, StringGrid1.Row] = '') Then
    Exit;
    
  RemoveCDFromBasket(StrToInt(StringGrid1.Cells[0, StringGrid1.Row]), StringGrid1.Row);
  DBGrid1.SetFocus;

  MakeInterface;
end;

procedure TCDRentWindow.RemoveCDFromBasket(const CDNum, SPos : Integer);
var
  C1   : Integer;
begin
  For C1 := SPos to StringGrid1.RowCount - 1 Do
    StringGrid1.Rows[C1].Assign(StringGrid1.Rows[C1 + 1]);
  If StringGrid1.RowCount > 2 Then
    StringGrid1.RowCount := StringGrid1.RowCount - 1;

  Table2.First;
  Table2.FindKey([CDNum]);
  Table2.Edit;
  Table2.FieldByName('Status').AsString := 'Prisutan';
  Table2.Post;
  Table1.Refresh;
  CDBaseWindow.QueryRefresh;
end;

procedure TCDRentWindow.SpeedButton3Click(Sender: TObject);
begin
  While StringGrid1.RowCount > 2 Do
    If StringGrid1.Cells[0, 1] <> '' Then
      RemoveCDFromBasket(StrToInt(StringGrid1.Cells[0, 1]), 1);
  If StringGrid1.Cells[0, 1] <> '' Then
    RemoveCDFromBasket(StrToInt(StringGrid1.Cells[0, 1]), 1);
    
  MakeInterface;
end;

procedure TCDRentWindow.RentCD(const CDNum, MemberNum : Integer);
begin
  Table2.First;
  Table2.FindKey([CDNum]);
  Table2.Edit;
  Table2.FieldByName('LastRentDate').AsDateTime := StrToDate(Edit4.Text);
  Table2.FieldByName('LastRentUser').AsInteger := MemberNum;
  Table2.Post;
  Table2.Refresh;

  If Table4.FieldByName('MemberID').AsString <> '' Then
    Table4.Append;
  With Table4 Do
  Begin
    Edit;
    FieldByName('MemberID').AsInteger := MemberNum;
    FieldByName('CDID').AsInteger := CDNum;
    FieldByName('RentDate').AsDateTime := StrToDate(Edit4.Text);
    FieldByName('Backed').AsBoolean := FALSE;
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM bases\Membercard.db WHERE MemberID=' + Edit1.Text + ' ORDER BY RentNum');
    Query1.Open;
    Query1.Last;
    FieldByName('RentNum').AsInteger := Query1.FieldByName('RentNum').AsInteger + 1;
    Query1.Close;

    Post;
  End;

  CDBaseWindow.QueryRefresh;
end;

procedure TCDRentWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  C1 : Integer;
begin
  Edit1.SelectAll;
  Edit1.SetFocus;
  
  Case ModalResult of
    mrCANCEL : SpeedButton3.Click;
    mrOK     : Begin
                 CanClose := FALSE;

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

                 If not MemberActive(StrToInt(Edit1.Text)) Then
                 Begin
                   Application.MessageBox(PChar('Clan broj ' + Edit1.Text + ' nije aktivan !'),
                                          'Information',
                                          mb_OK + mb_ICONINFORMATION);
                   Table3.Close;
                   Exit;
                 End;

                 Try
                   StrToDate(Edit4.Text);
                 Except
                   Application.MessageBox('Unesite ispravan datum !' + #13#10 +
                                          'Datum mora biti u formatu' + #13#10 +
                                          'DAN/MESEC/GODINA.',
                                          'Information',
                                          mb_OK + mb_ICONINFORMATION);
                   Edit4.SetFocus;
                   Exit;
                 End;

                 
                 If Application.MessageBox(PChar('Da li ste sigurni da zelite da izdate CD(ove) clanu broj ' + Edit1.Text + ' ?'),
                                           'Question',
                                           mb_YESNO + mb_ICONQUESTION) = mrNO Then
                   Exit;

                 For C1 := 1 to StringGrid1.RowCount - 1 Do
                   RentCD(StrToInt(StringGrid1.Cells[0, C1]), StrToInt(Edit1.Text));
                 CanClose := TRUE;
               End;
  End;
end;

function TCDRentWindow.MemberExist(const MNum : Integer) : Boolean;
begin
  result := FALSE;

  Table3.Open;
  Table3.First;
  If Table3.FindKey([MNum]) Then
    result := TRUE;
  Table3.Close;
end;

function TCDRentWindow.MemberActive(const MNum : Integer) : Boolean;
begin
  result := FALSE;

  Table3.Open;
  Table3.First;
  If (Table3.FindKey([MNum])) and
     (Table3.FieldByName('Status').AsString = 'Aktivan') Then
    result := TRUE;
  Table3.Close;
end;

procedure TCDRentWindow.SpeedButton4Click(Sender: TObject);
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

procedure TCDRentWindow.StringGrid1Enter(Sender: TObject);
begin
  StringGrid1.FixedColor := clSkyBlue;
end;

procedure TCDRentWindow.StringGrid1Exit(Sender: TObject);
begin
  StringGrid1.FixedColor := clBtnFace;
end;

procedure TCDRentWindow.Edit4Enter(Sender: TObject);
begin
  Edit4.Color := clSkyBlue;
end;

procedure TCDRentWindow.Edit4Exit(Sender: TObject);
begin
  Edit4.Color := clWindow;
end;

end.

