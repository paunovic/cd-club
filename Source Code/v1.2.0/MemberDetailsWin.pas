unit MemberDetailsWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Mask, Buttons;

type
  TMemberDetailsWindow = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    Table1: TTable;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberDetailsWindow: TMemberDetailsWindow;

implementation

uses MemberCardsWin;

{$R *.dfm}

procedure TMemberDetailsWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  
  Action := caFREE;
end;

procedure TMemberDetailsWindow.FormCreate(Sender: TObject);
begin
  Try
    BitBtn2.Glyph.LoadFromFile('images\Member.Card.bmp');
  Except
  End;

  Table1.Open;
end;

procedure TMemberDetailsWindow.DBEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : ModalResult := mrCANCEL;
  End;  
end;

procedure TMemberDetailsWindow.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TMemberDetailsWindow.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

procedure TMemberDetailsWindow.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TMemberCardsWindow, MemberCardsWindow);
  MemberCardsWindow.DBLookupComboBox1.KeyValue := Table1.FieldByName('IDNum').AsInteger;
  MemberCardsWindow.MakeQuery;
  MemberCardsWindow.ShowModal;
end;

end.
