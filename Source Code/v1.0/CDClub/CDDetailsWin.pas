unit CDDetailsWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls, Buttons, Mask;

type
  TCDDetailsWindow = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    Table1: TTable;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDDetailsWindow: TCDDetailsWindow;

implementation

{$R *.dfm}

procedure TCDDetailsWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TCDDetailsWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;

  Action := caFREE;
end;

procedure TCDDetailsWindow.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : CDDetailsWindow.Close;
  End;  
end;

procedure TCDDetailsWindow.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TCDDetailsWindow.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

end.
