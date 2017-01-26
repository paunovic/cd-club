unit MemberBaseWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons;

type
  TMemberBaseWindow = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure QueryRefresh;
    procedure Button1Click(Sender: TObject);
    procedure MakeSearch;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    function EmptyTable : Boolean;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberBaseWindow: TMemberBaseWindow;

implementation

uses MemberNewWin, MemberDetailsChangeWin, ListPrintWin,
  MembersListExportWin, MemberDetailsWin, MemberCardsWin;

const
  StatusA : Array[0..2] of String = ('',
                                    'Aktivan',
                                    'Neaktivan');

{$R *.dfm}

procedure TMemberBaseWindow.QueryRefresh;
begin
  Query1.Close;
  Query1.Prepare;
  Query1.Open;
end;

procedure TMemberBaseWindow.DBGrid1TitleClick(Column: TColumn);
var
  C1 : Integer;
begin
  For C1 := 0 to DBGrid1.Columns.Count - 1 Do
    DBGrid1.Columns[C1].Title.Color := clSkyBlue;
  Column.Title.Color := clMoneyGreen;

  DataSource1.DataSet := Query1;
  QueryRefresh;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT * FROM bases\Members.db ORDER BY ' + DBGrid1.Columns[Column.Index].FieldName);
  Query1.Open;
end;

procedure TMemberBaseWindow.MakeSearch;
var
  FString : String;
begin
  If Edit1.Text <> '' Then
    FString := 'IDNum = ' + Edit1.Text + ' AND ';
  If Edit2.Text <> '' Then
    FString := FString + 'FirstName = ' + '''' + Edit2.Text + '*'' AND ';
  If Edit3.Text <> '' Then
    FString := FString + 'LastName = ' + '''' + Edit3.Text + '*'' AND ';
  If Edit4.Text <> '' Then
    FString := FString + 'Address = ' + '''' + Edit4.Text + '*'' AND ';
  If Edit5.Text <> '' Then
    FString := FString + 'PhoneNumber = ' + '''' + Edit5.Text + '*'' AND ';
  If ComboBox1.Text <> 'Svi' Then
    FString := FString + 'Status = ' + '''' + StatusA[ComboBox1.ItemIndex] + ''' AND ';

  Query1.Filter := Copy(FString, 1, Length(FString) - 5);
end;

procedure TMemberBaseWindow.Button1Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := 0;

  MakeSearch;
  Edit1.SetFocus;
end;

procedure TMemberBaseWindow.Edit1Change(Sender: TObject);
begin
  MakeSearch;
end;

procedure TMemberBaseWindow.DBGrid1Enter(Sender: TObject);
var
  C1 : Integer;
begin
  For C1 := 0 To DBGrid1.Columns.Count - 1 Do
    If DBGrid1.Columns[C1].Title.Color <> clGray Then
      DBGrid1.Columns[C1].Title.Color := clSkyBlue
    else
      DBGrid1.Columns[C1].Title.Color := clMoneyGreen;
  DBGrid1.Columns[0].Color := clSkyBlue;
end;

procedure TMemberBaseWindow.DBGrid1Exit(Sender: TObject);
var
  C1 : Integer;
begin
  For C1 := 0 To DBGrid1.Columns.Count - 1 Do
    If DBGrid1.Columns[C1].Title.Color <> clMoneyGreen Then
      DBGrid1.Columns[C1].Title.Color := clBtnFace
    else
      DBGrid1.Columns[C1].Title.Color := clGray;
  DBGrid1.Columns[0].Color := clSilver;
end;

procedure TMemberBaseWindow.Edit1Enter(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clSkyBlue;
end;

procedure TMemberBaseWindow.Edit1Exit(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clWindow;
end;

procedure TMemberBaseWindow.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.Color := clSkyBlue;
end;

procedure TMemberBaseWindow.ComboBox1Exit(Sender: TObject);
begin
  ComboBox1.Color := clWindow;
end;

procedure TMemberBaseWindow.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If (not (Key in ['0'..'9'])) and
     (Key <> Chr(vk_BACK)) Then
    Key := Chr(vk_CLEAR);
end;

procedure TMemberBaseWindow.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TMemberNewWindow, MemberNewWindow);
  MemberNewWindow.ShowModal;
end;

procedure TMemberBaseWindow.BitBtn2Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela clanova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  
  Application.CreateForm(TMemberDetailsChangeWindow, MemberDetailsChangeWindow);
  MemberDetailsChangeWindow.DBLookupComboBox1.KeyValue := Query1.FieldByName('IDNum').AsInteger;
  MemberDetailsChangeWindow.MakeInterface;
  MemberDetailsChangeWindow.ShowModal;
end;

procedure TMemberBaseWindow.BitBtn3Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela clanova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;

  Application.CreateForm(TListPrintWindow, ListPrintWindow);
  With ListPrintWindow Do
  Begin
    Table1.TableName := 'bases\Members.DB';
    Table1.Filter := Query1.Filter;
    Table1.Active := TRUE;
    Table1.Open;
    QRLabel11.Caption := 'Lista Clanova';
    QRLabel5.Free;
    QRLabel6.Free;
    QRDBText3.Free;
    QRLabel7.Free;
    QRDBText4.Free;
    QRLabel8.Free;
    QRDBText5.Free;
    QRDBText2.DataField := 'FirstName';
    QuickRep1.Preview;
  End;
end;

function TMemberBaseWindow.EmptyTable : Boolean;
begin
  result := FALSE;

  If Query1.FieldByName('IDNum').AsString = '' Then
    result := TRUE;
end;

procedure TMemberBaseWindow.BitBtn4Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela clanova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;

  Application.CreateForm(TMembersListExportWindow, MembersListExportWindow);
  MembersListExportWindow.ShowModal;
end;

procedure TMemberBaseWindow.BitBtn5Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela clanova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  
  Application.CreateForm(TMemberDetailsWindow, MemberDetailsWindow);
  MemberDetailsWindow.DBLookupComboBox1.KeyValue := Query1.FieldByName('IDNum').AsInteger;
  MemberDetailsWindow.ShowModal;
end;

procedure TMemberBaseWindow.ComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
    vk_F8 : BitBtn1.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn4.Click;
    vk_F3 : BitBtn6.Click;
  End;
end;

procedure TMemberBaseWindow.BitBtn6Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela clanova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;

  Application.CreateForm(TMemberCardsWindow, MemberCardsWindow);
  MemberCardsWindow.DBLookupComboBox1.KeyValue := Query1.FieldByName('IDNum').AsInteger;
  MemberCardsWindow.MakeQuery;
  MemberCardsWindow.ShowModal;
end;

end.
