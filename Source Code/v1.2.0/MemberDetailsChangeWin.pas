unit MemberDetailsChangeWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Mask, Buttons;

type
  TMemberDetailsChangeWindow = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit6: TMaskEdit;
    Table2: TTable;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure MakeInterface;
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberDetailsChangeWindow: TMemberDetailsChangeWindow;

implementation

uses MemberBaseWin;

{$R *.dfm}

procedure TMemberDetailsChangeWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
  Table2.Open;
end;

procedure TMemberDetailsChangeWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  Table2.Close;

  Action := caFREE;
end;

procedure TMemberDetailsChangeWindow.DBEdit1Enter(Sender: TObject);
begin
  With Sender as TDBEdit Do
    Color := clSkyBlue;
end;

procedure TMemberDetailsChangeWindow.DBEdit1Exit(Sender: TObject);
begin
  With Sender as TDBEdit Do
    Color := clWindow;
end;

procedure TMemberDetailsChangeWindow.DBLookupComboBox1Enter(
  Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TMemberDetailsChangeWindow.DBLookupComboBox1Exit(
  Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

procedure TMemberDetailsChangeWindow.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.Color := clSkyBlue;
end;

procedure TMemberDetailsChangeWindow.ComboBox1Exit(Sender: TObject);
begin
  ComboBox1.Color := clWindow;
end;

procedure TMemberDetailsChangeWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
    mrOK : Begin
            If (DBEdit1.Text = '') or
               (DBEdit2.Text = '') Then
            Begin
              CanClose := FALSE;
              Application.MessageBox('Polje ''Ime'' ili ''Prezime'' ne sme da bude prazno !',
                                     'Information',
                                     mb_OK + mb_ICONINFORMATION);
              If DBEdit2.Text = '' Then
                DBEdit2.SetFocus;
              If DBEdit1.Text = '' Then
                DBEdit1.SetFocus;
              Exit;
            End;

            Try
              StrToDate(Edit6.Text);
            Except
              Application.MessageBox('Unesite ispravan datum !' + #13#10 +
                                     'Datum mora biti u formatu' + #13#10 +
                                     'DAN/MESEC/GODINA.',
                                     'Information',
                                     mb_OK + mb_ICONINFORMATION);
              Edit6.SetFocus;
              Exit;
            End;

            Table1.Edit;
            Table1.FieldByName('BirthDate').AsDateTime := StrToDate(Edit6.Text);
            Table1.Post;
            Table1.Refresh;
            MemberBaseWindow.QueryRefresh;
           End;
  End;
end;

procedure TMemberDetailsChangeWindow.ComboBox1Change(Sender: TObject);
begin
  Table2.First;
  If Table2.FieldByName('MemberID').AsString <> '' Then
  Begin
    Application.MessageBox('Clan nije razduzio sve CD-ove !',
                           'Information',
                           mb_OK + mb_ICONINFORMATION);
    ComboBox1.ItemIndex := 0;                       
    Exit;
  End;

  Table1.Edit;
  Table1.FieldByName('Status').AsString := ComboBox1.Text;
end;

procedure TMemberDetailsChangeWindow.MakeInterface;
begin
  If Table1.FieldByName('Status').AsString = 'Aktivan' Then
    ComboBox1.ItemIndex := 0
  else
    ComboBox1.ItemIndex := 1;
  Edit6.Text := Table1.FieldByName('BirthDate').AsString;

  Table2.Filter := 'MemberID = ' + QuotedStr(DBLookupComboBox1.Text) + ' AND Backed = 0';
end;

procedure TMemberDetailsChangeWindow.DBLookupComboBox1Click(
  Sender: TObject);
begin
  MakeInterface;
end;

procedure TMemberDetailsChangeWindow.DBLookupComboBox1KeyPress(
  Sender: TObject; var Key: Char);
begin
  MakeInterface;
end;

procedure TMemberDetailsChangeWindow.FormActivate(Sender: TObject);
begin
  MakeInterface;
end;

end.
