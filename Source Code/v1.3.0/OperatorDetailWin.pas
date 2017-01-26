unit OperatorDetailWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Mask, Buttons;

type
  TOperatorDetailWindow = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Table1: TTable;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    Edit1: TEdit;
    DBEdit6: TDBEdit;
    Table1IDNum: TSmallintField;
    Table1FirstName: TStringField;
    Table1LastName: TStringField;
    Table1BirthPlace: TStringField;
    Table1Address: TStringField;
    Table1BirthDate: TDateField;
    Table1PhoneNumber: TStringField;
    Table1MotherNumber: TStringField;
    Table1Password: TStringField;
    Table1Status: TStringField;
    Table1AccessGranted: TSmallintField;
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperatorDetailWindow: TOperatorDetailWindow;

implementation

uses MainWin;

{$R *.dfm}

procedure TOperatorDetailWindow.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TOperatorDetailWindow.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

procedure TOperatorDetailWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;

  DBLookupComboBox1.KeyValue := MainWindow.OperID;
  DBLookupComboBox1.OnClick(Self);
end;

procedure TOperatorDetailWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : Close;
  End;  
end;

procedure TOperatorDetailWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  
  Action := caFREE;
end;


procedure TOperatorDetailWindow.DBLookupComboBox1Click(Sender: TObject);
const
  YesNo : Array[0..1] of String[2] = ('NE',
                                      'DA');
begin
  Edit1.Text := YesNo[Table1.FieldByName('AccessGranted').AsInteger];
end;

procedure TOperatorDetailWindow.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
const
  YesNo : Array[0..1] of String[2] = ('NE',
                                      'DA');
begin
  Edit1.Text := YesNo[Table1.FieldByName('AccessGranted').AsInteger];
end;

end.
