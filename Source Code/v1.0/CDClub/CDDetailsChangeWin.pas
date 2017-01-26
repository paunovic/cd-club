unit CDDetailsChangeWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TCDDetailsChangeWindow = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    Table1: TTable;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBComboBox1: TDBComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDDetailsChangeWindow: TCDDetailsChangeWindow;

implementation

uses CDBaseWin;

{$R *.dfm}

procedure TCDDetailsChangeWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
   mrOK : Begin
            If (DBEdit1.Text = '') or
               (DBEdit4.Text = '') Then
            Begin
              CanClose := FALSE;
              Application.MessageBox('Polje ''Naziv'' ili ''Kolicina'' ne sme da bude prazno !',
                                     'Information',
                                     mb_OK + mb_ICONINFORMATION);
              If DBEdit4.Text = '' Then
                DBEdit4.SetFocus;
              If DBEdit1.Text = '' Then
                DBEdit1.SetFocus;
              Exit;
            End;

            Table1.Edit;
            Table1.Post;
            Table1.Refresh;
            CDBaseWindow.QueryRefresh;
          End;
  End;
end;

procedure TCDDetailsChangeWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TCDDetailsChangeWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;

  Action := caFREE;
end;

procedure TCDDetailsChangeWindow.DBEdit4KeyPress(Sender: TObject;
  var Key: Char);
begin
  If (not (Key in ['0'..'9'])) and
     (Key <> Chr(vk_BACK)) Then
    Key := Chr(vk_CLEAR);
end;

procedure TCDDetailsChangeWindow.DBEdit4Enter(Sender: TObject);
begin
  With Sender as TDBEdit Do
    Color := clSkyBlue;
end;

procedure TCDDetailsChangeWindow.DBEdit4Exit(Sender: TObject);
begin
  With Sender as TDBEdit Do
    Color := clWindow;
end;

procedure TCDDetailsChangeWindow.DBComboBox1Enter(Sender: TObject);
begin
  DBComboBox1.Color := clSkyBlue;
end;

procedure TCDDetailsChangeWindow.DBComboBox1Exit(Sender: TObject);
begin
  DBComboBox1.Color := clWindow;
end;

procedure TCDDetailsChangeWindow.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TCDDetailsChangeWindow.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

end.
