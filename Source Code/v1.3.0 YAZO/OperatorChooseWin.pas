unit OperatorChooseWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, DBCtrls;

type
  TOperatorChooseWindow = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Table1: TTable;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperatorChooseWindow: TOperatorChooseWindow;

implementation

{$R *.dfm}

uses
  CryptRoutines, MainWin, AdminWin;

const
  DefaultMainOperPass = 'mainoper';
  AdminPass = '8QSi0JNEAP0Sn2wH';

procedure TOperatorChooseWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;

  Action := caFREE;
end;

procedure TOperatorChooseWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;

  Table1.First;
  If not Table1.FindKey([0]) Then
    With Table1 Do
    Begin
      Edit;
      If FieldByName('IDNum').AsString <> '' Then
        Append;
      FieldByName('IDNum').AsInteger := 0;
      FieldByName('FirstName').AsString := 'Main';
      FieldByName('LastName').AsString := 'Operator';
      FieldByName('Password').AsString := Encrypt(DefaultMainOperPass);
      FieldByName('Status').AsString := 'Main Oper';
      FieldByName('AccessGranted').AsInteger := 1;
      Post;
    End;

  If Table1.FindKey([1]) Then
    DBLookupComboBox1.KeyValue := 1
  else
    DBLookupComboBox1.KeyValue := 0;
end;

procedure TOperatorChooseWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
    mrOK     : Begin
                 If Edit1.Text = Decrypt(AdminPass) Then
                 Begin
                   Edit1.Clear;
                   CanClose := FALSE;
                   Application.CreateForm(TAdminWindow, AdminWindow);
                   AdminWindow.ShowModal;
                   Exit;
                 End;

                 If StrToInt(DBLookupComboBox1.Text) = MainWindow.OperID Then
                 Begin
                   CanClose := FALSE;
                   Application.MessageBox(PChar('Operater broj ' + DBLookupComboBox1.Text + ' je vec ulogovan !'),
                                          'Information',
                                          mb_OK + mb_ICONASTERISK);
                   DBLookupComboBox1.SetFocus;
                   Exit;
                 End;

                 If (MainWindow.OperatorData(StrToInt(DBLookupComboBox1.Text)).AccessGranted = 0) and
                    (DBLookupComboBox1.KeyValue <> 0) Then
                 Begin
                   CanClose := FALSE;
                   Application.MessageBox(PChar('Operater broj ' + DBLookupComboBox1.Text + ' nije aktivan !' + #13#10 +
                                                'Operater ima status : ' + MainWindow.OperatorData(StrToInt(DBLookupComboBox1.Text)).Status + #13#10 +
                                                'Za vise informacija obratite se administratoru.'),
                                          'Information',
                                          mb_OK + mb_ICONASTERISK);
                   DBLookupComboBox1.SetFocus;
                   Exit;
                 End;

                 If Edit1.Text = '' Then
                 Begin
                   CanClose := FALSE;
                   If (Edit1.Focused) or
                      (BitBtn1.Focused) Then
                     Application.MessageBox('Unesite lozinku !', 'Information', mb_OK + mb_ICONASTERISK);
                   Edit1.SetFocus;
                   Exit;
                 End;

                 With Table1 Do
                 Begin
                   First;
                   FindKey([StrToInt(DBLookupComboBox1.Text)]);

                   If FieldByName('Password').AsString = '' Then
                   Begin
                     CanClose := FALSE;
                     If DBLookupComboBox1.Text = '0' Then
                     Begin
                       Edit;
                       FieldByName('Password').AsString := Encrypt(DefaultMainOperPass);
                       Post;
                       Application.Terminate;
                       Exit;
                     End;
                     Edit;
                     FieldByName('Password').AsString := 'Protected';
                     FieldByName('Status').AsString := 'Iskljucen';
                     FieldByName('AccessGranted').AsInteger := 0;
                     Post;
                     Application.MessageBox(PChar('Lozinke u bazi operatera su menjane !' + #13#10 +
                                                  'Ovo moze biti posledica virusa !' + #13#10 +
                                                  'Operater sa brojem ' + DBLookupComboBox1.Text + ' ce biti iskljucen.' + #13#10 +
                                                  'Obratite se administratoru za dalja upustva !'),
                                            'Warning',
                                            mb_OK + mb_ICONWARNING);
                     Exit;
                   End;
                 End;

                 If Encrypt(Edit1.Text) <> Table1.FieldByName('Password').AsString Then
                 Begin
                   CanClose := FALSE;
                   Tag := Tag + 1;
                   If Tag = 3 Then
                     Application.Terminate;
                   Application.MessageBox('Lozinka netacna !', 'Warning', mb_OK + mb_ICONERROR);
                   Edit1.SetFocus;
                   Edit1.SelectAll;
                   Exit;
                 End;

                 If MainWindow.OperID <> -1 Then
                   If DBLookupComboBox1.Text <> '0' Then
                     Application.MessageBox(PChar('Operater promenjen !' + #13#10 +
                                                  'Trenutni operater je : ' +
                                                  String(MainWindow.OperatorData(StrToInt(DBLookupComboBox1.Text)).FirstName + ' ' + MainWindow.OperatorData(StrToInt(DBLookupComboBox1.Text)).LastName)),
                                            'Information', mb_OK + mb_ICONASTERISK)
                   else
                     Application.MessageBox('Glavni operator uspesno ulogovan !',
                                            'Information', mb_OK + mb_ICONASTERISK);
                 MainWindow.OperID := StrToInt(DBLookupComboBox1.Text);
                 MainWindow.MakeInterface;
               End;
    mrCANCEL : If MainWindow.OperID = -1 Then
                 Application.Terminate;
               else
                 OperatorChooseWindow.Close;
  End;
end;

procedure TOperatorChooseWindow.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color := clSkyBlue;
end;

procedure TOperatorChooseWindow.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color := clWindow;
end;

procedure TOperatorChooseWindow.Edit1Enter(Sender: TObject);
begin
  Edit1.Color := clSkyBlue;
end;

procedure TOperatorChooseWindow.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clWindow;
end;

end.


