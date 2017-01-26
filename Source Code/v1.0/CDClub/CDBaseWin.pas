unit CDBaseWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, OleServer,
  Excel2000;

type
  TCDBaseWindow = class(TForm)
    DataSource1: TDataSource;
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
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    ComboBox2: TComboBox;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MakeSearch;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure BitBtn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure QueryRefresh;
    function EmptyTable : Boolean;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDBaseWindow: TCDBaseWindow;

implementation

uses CDRentWin, NewCDWin, CDDetailsWin, CDDetailsChangeWin, CDBackWin,
  ListPrintWin, CDListExportWin;

const
  KindA   : Array[0..14] of String = ('',
                                      'Akcija',
                                      'Sport',
                                      'Avantura',
                                      'Strategija',
                                      'Logicka',
                                      'Decija',
                                      'Platforma',
                                      'Voznja',
                                      'Simulacija',
                                      'Kompilacija',
                                      'Film',
                                      'Muzika',
                                      'Software',
                                      'Ostalo');

  StatusA : Array[0..2] of String = ('',
                                    'Prisutan',
                                    'Izdat');

{$R *.dfm}

procedure TCDBaseWindow.FormCreate(Sender: TObject);
begin
  Query1.Open;
end;

procedure TCDBaseWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;

  Action := caFREE;
end;

procedure TCDBaseWindow.Edit1Enter(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clSkyBlue;
end;

procedure TCDBaseWindow.Edit1Exit(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clWindow;
end;

procedure TCDBaseWindow.ComboBox1Enter(Sender: TObject);
begin
  With Sender as TComboBox Do
    Color := clSkyBlue;
end;

procedure TCDBaseWindow.ComboBox1Exit(Sender: TObject);
begin
  With Sender as TComboBox Do
    Color := clWindow;
end;

procedure TCDBaseWindow.MakeSearch;
var
  FString : String;
begin
  If Edit1.Text <> '' Then
    FString := 'IDNum = ' + Edit1.Text + ' AND ';
  If Edit2.Text <> '' Then
    FString := FString + 'Title = ' + '''' + Edit2.Text + '*'' AND ';
  If ComboBox2.Text <> 'Svi' Then
    FString := FString + 'Kind = ' + '''' + KindA[ComboBox2.ItemIndex] + ''' AND ';
  If Edit4.Text <> '' Then
    FString := FString + 'Description = ' + '''' + Edit4.Text + '*'' AND ';
  If Edit5.Text <> '' Then
    FString := FString + 'CDAmount = ' + Edit5.Text + ' AND ';
  If ComboBox1.Text <> 'Svi' Then
    FString := FString + 'Status = ' + '''' + StatusA[ComboBox1.ItemIndex] + ''' AND ';

  Query1.Filter := Copy(FString, 1, Length(FString) - 5);
end;

procedure TCDBaseWindow.Edit1Change(Sender: TObject);
begin
  MakeSearch;
end;

procedure TCDBaseWindow.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_RETURN : Edit4.SetFocus;
    vk_F1     : BitBtn5.Click;
    vk_F2     : BitBtn8.Click;
    vk_F5     : BitBtn3.Click;
    vk_F6     : BitBtn6.Click;
    vk_F8     : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_SPACE : ComboBox1.DroppedDown := TRUE;
    vk_F1    : BitBtn5.Click;
    vk_F2    : BitBtn8.Click;
    vk_F5    : BitBtn3.Click;
    vk_F6    : BitBtn6.Click;
    vk_F8    : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Case Key of
    vk_SPACE : ComboBox2.DroppedDown := TRUE;
    vk_F1    : BitBtn5.Click;
    vk_F2    : BitBtn8.Click;
    vk_F5    : BitBtn3.Click;
    vk_F6    : BitBtn6.Click;
    vk_F8    : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.DBGrid1Enter(Sender: TObject);
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

procedure TCDBaseWindow.DBGrid1Exit(Sender: TObject);
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

procedure TCDBaseWindow.BitBtn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.Button1Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  ComboBox2.ItemIndex := 0;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := 0;
  Edit1.SetFocus;
  MakeSearch;
end;

procedure TCDBaseWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.BitBtn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_F1 : BitBtn5.Click;
    vk_F2 : BitBtn8.Click;
    vk_F5 : BitBtn3.Click;
    vk_F6 : BitBtn6.Click;
    vk_F8 : BitBtn4.Click;
  End;
end;

procedure TCDBaseWindow.BitBtn5Click(Sender: TObject);
begin
  Application.CreateForm(TCDRentWindow, CDRentWindow);
  CDRentWindow.ShowModal;
end;

procedure TCDBaseWindow.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TNewCDWindow, NewCDWindow);
  NewCDWindow.ShowModal;
end;

function TCDBaseWindow.EmptyTable : Boolean;
begin
  result := FALSE;

  If Query1.FieldByName('IDNum').AsString = '' Then
    result := TRUE;
end;

procedure TCDBaseWindow.BitBtn2Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela CD-ova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  
  Application.CreateForm(TCDDetailsChangeWindow, CDDetailsChangeWindow);
  CDDetailsChangeWindow.DBLookupComboBox1.KeyValue := Query1.FieldByName('IDNum').AsInteger;
  CDDetailsChangeWindow.ShowModal;
end;

procedure TCDBaseWindow.FormActivate(Sender: TObject);
begin
  QueryRefresh;
end;

procedure TCDBaseWindow.BitBtn8Click(Sender: TObject);
begin
  Application.CreateForm(TCDBackWindow, CDBackWindow);
  CDBackWindow.ShowModal;
  QueryRefresh;
end;

procedure TCDBaseWindow.BitBtn3Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela CD-ova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  
  Application.CreateForm(TListPrintWindow, ListPrintWindow);
  With ListPrintWindow Do
  Begin
    Table1.TableName := 'bases\CDBase.DB';
    Table1.Filter := Query1.Filter;
    Table1.Active := TRUE;
    Table1.Open;
    QRLabel11.Caption := 'Lista CD-ova';
    QRLabel12.Free;
    QRDBText6.Free;
    QRLabel13.Free;
    QRLabel14.Free;
    QRDBText7.Free;
    QRLabel15.Free;
    QRDBText8.Free;
    QRLabel16.Free;
    QRDBText9.Free;
    QRDBText2.DataField := 'Title';
    QuickRep1.Preview;
  End;
end;

procedure TCDBaseWindow.BitBtn1Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela CD-ova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;

  If Query1.FieldByName('Status').AsString = 'Izdat' Then
  Begin
    Application.MessageBox('CD je izdat ! Morate prvo razduziti CD !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;                         

  If Application.MessageBox(PChar('Da li ste sigurni da zelite da izbrisete CD broj ' + Query1.FieldByName('IDNum').AsString + ' ?'),
                                  'Question',
                                  mb_YESNO + mb_ICONQUESTION) = mrNO Then
    Exit;

  Table1.Open;
  Table1.First;
  Table1.FindKey([Query1.FieldByName('IDNum').AsInteger]);
  Table1.Edit;
  Table1.Delete;
  Table1.Close;
  QueryRefresh;
  DBGrid1.SetFocus;
end;

procedure TCDBaseWindow.DBGrid1TitleClick(Column: TColumn);
var
  C1 : Byte;
begin
  For C1 := 0 to DBGrid1.Columns.Count - 1 Do
    DBGrid1.Columns[C1].Title.Color := clSkyBlue;
  Column.Title.Color := clMoneyGreen;

  DataSource1.DataSet := Query1;
  QueryRefresh;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT * FROM bases\CDBase.db ORDER BY ' + DBGrid1.Columns[Column.Index].FieldName);
  Query1.Open;
end;

procedure TCDBaseWindow.QueryRefresh;
begin
  Query1.Close;
  Query1.Prepare;
  Query1.Open;
end;

procedure TCDBaseWindow.BitBtn6Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela CD-ova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  
  If Query1.FieldByName('IDNum').AsString = '' Then
  Begin
    Application.MessageBox('Tabela CD-ova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  Application.CreateForm(TCDListExportWindow, CDListExportWindow);
  CDListExportWindow.ShowModal;
end;

procedure TCDBaseWindow.BitBtn7Click(Sender: TObject);
begin
  If EmptyTable Then
  Begin
    Application.MessageBox('Tabela CD-ova je prazna !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    Exit;
  End;
  
  Application.CreateForm(TCDDetailsWindow, CDDetailsWindow);
  CDDetailsWindow.DBLookupComboBox1.KeyValue := Query1.FieldByName('IDNum').AsInteger;
  CDDetailsWindow.ShowModal;
end;

procedure TCDBaseWindow.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If (not (Key in ['0'..'9'])) and
     (Key <> Chr(vk_BACK)) Then
    Key := Chr(vk_CLEAR);
end;

end.
