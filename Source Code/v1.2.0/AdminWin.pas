unit AdminWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, Grids, DBGrids, StdCtrls;

type
  TAdminWindow = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Table2: TTable;
    DataSource2: TDataSource;
    Table3: TTable;
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Table4: TTable;
    DataSource4: TDataSource;
    DBGrid4: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminWindow: TAdminWindow;

implementation

uses
  CryptRoutines;

{$R *.dfm}

procedure TAdminWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
  Table2.Open;
  Table3.Open;
  Table4.Open;
end;

procedure TAdminWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  C1 : Integer;
begin
  For C1 := 1 to 4 Do
    With TTable(FindComponent('Table' + IntToStr(C1))) Do
    Begin
      Edit;
      Post;
      Close;
    End;

  Action := caFREE;
end;

procedure TAdminWindow.Button1Click(Sender: TObject);
begin
  Edit2.Text := Encrypt(Edit1.Text);
end;

procedure TAdminWindow.Button2Click(Sender: TObject);
begin
  Edit2.Text := Decrypt(Edit1.Text);
end;

procedure TAdminWindow.CheckBox1Enter(Sender: TObject);
begin
  If CheckBox1.Checked Then
    Edit1.PasswordChar := #0
  else
    Edit1.PasswordChar := '*';
end;

end.
