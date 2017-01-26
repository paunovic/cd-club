unit MemberCardsWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, DBCtrls, StdCtrls, Buttons;

type
  TMemberCardsWindow = class(TForm)
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Table1: TTable;
    DataSource2: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure MakeQuery;
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberCardsWindow: TMemberCardsWindow;

implementation

uses CDBackWin;

{$R *.dfm}

procedure TMemberCardsWindow.MakeQuery;
begin
  Query1.Filter := 'MemberID = ' + QuotedStr(DBLookupComboBox1.Text);
end;

procedure TMemberCardsWindow.DBLookupComboBox1Click(Sender: TObject);
begin
  MakeQuery;
end;

procedure TMemberCardsWindow.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  MakeQuery;
end;

procedure TMemberCardsWindow.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TCDBackWindow, CDBackWindow);
  CDBackWindow.Edit1.Text := DBLookupComboBox1.Text;
  CDBackWindow.ShowModal;
  Table1.Refresh;
  Query1.Close;
  Query1.Open;
end;

procedure TMemberCardsWindow.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TMemberCardsWindow.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

procedure TMemberCardsWindow.DBGrid1Enter(Sender: TObject);
var
  C1 : Integer;
begin
  For C1 := 0 To DBGrid1.Columns.Count - 1 Do
    DBGrid1.Columns[C1].Title.Color := clSkyBlue;

  DBGrid1.Columns[0].Color := clSkyBlue;
end;

procedure TMemberCardsWindow.DBGrid1Exit(Sender: TObject);
var
  C1 : Integer;
begin
  For C1 := 0 To DBGrid1.Columns.Count - 1 Do
    DBGrid1.Columns[C1].Title.Color := clBtnFace;

  DBGrid1.Columns[0].Color := clSilver;
end;

procedure TMemberCardsWindow.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : ModalResult := mrCANCEL;
  End;
end;

procedure TMemberCardsWindow.FormCreate(Sender: TObject);
begin
  Try
    BitBtn1.Glyph.LoadFromFile('images\CD.Back.bmp');
  Except
  End;

  Table1.Open;
  Query1.Open;
end;

procedure TMemberCardsWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  Query1.Close;

  Action := caFREE;
end;

end.
