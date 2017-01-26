unit NewCDWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables;

type
  TNewCDWindow = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Table1: TTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure PrepareForNewCD;
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewCDWindow: TNewCDWindow;

implementation

uses CDBaseWin;

const
  Months : Array[1..12] of String = ('Januar',
                                     'Februar',
                                     'Mart',
                                     'April',
                                     'Maj',
                                     'Jun',
                                     'Jul',
                                     'Avgust',
                                     'Septembar',
                                     'Oktobar',
                                     'Novembar',
                                     'Decembar');

{$R *.dfm}

procedure TNewCDWindow.PrepareForNewCD;
begin
  Table1.Last;
  If Table1.FieldByName('IDNum').AsString <> '' Then
    Edit1.Text := IntToStr(StrToInt(Table1.FieldByName('IDNum').Text) + 1)
  else
    Edit1.Text := '1';
end;

procedure TNewCDWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
  PrepareForNewCD;
end;

procedure TNewCDWindow.Edit2Enter(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clSkyBlue;
end;

procedure TNewCDWindow.Edit2Exit(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clWindow;
end;

procedure TNewCDWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case ModalResult of
    mrOK : Begin
             CanClose := FALSE;
             
             If Edit1.Focused Then
             Begin
               Edit2.SetFocus;
               Exit;
             End;
             If Edit2.Focused Then
             Begin
               ComboBox1.SetFocus;
               Exit;
             End;
             If ComboBox1.Focused Then
             Begin
               Edit4.SetFocus;
               Exit;
             End;
             If Edit4.Focused Then
             Begin
               Edit5.SetFocus;
               Exit;
             End;
             If Edit5.Focused Then
             Begin
               BitBtn1.SetFocus;
               Exit;
             End;

             If (Edit2.Text = '') or
                (Edit5.Text = '') Then
             Begin
               Application.MessageBox('Unesite sve podatke !', 'Information', mb_OK + mb_ICONINFORMATION);
               If Edit5.Text = '' Then
                 Edit5.SetFocus;
               If Edit2.Text = ''Then
                 Edit2.SetFocus;
               Exit;
             End;

             Edit2.SetFocus;
             Table1.First;

             While not Table1.Eof Do
               If LowerCase(Table1.FieldByName('Title').AsString) = LowerCase(Edit2.Text) Then
                 If Application.MessageBox('CD sa istim nazivom vec postoji !' + #13#10 +
                                           'Da li ipak zelite da dodate novi CD ?',
                                           'Question',
                                           mb_YESNO + mb_ICONQUESTION) = mrNO Then
                   Exit
                 else
                   Break
               else
                 Table1.Next;

             If not CDBaseWindow.EmptyTable Then
               Table1.Append;

             With Table1 Do
             Begin
               Edit;
               FieldByName('IDNum').AsInteger := StrToInt(Edit1.Text);
               FieldByName('Title').AsString := Edit2.Text;
               FieldByName('Kind').AsString := ComboBox1.Text;
               FieldByName('CDAmount').AsInteger := StrToInt(Edit5.Text);
               FieldByName('Description').AsString := Edit4.Text;
               FieldByName('Status').AsString := 'Prisutan';
               FieldByName('BuyDate').AsDateTime := Date;
               FieldByName('LastRentUser').AsInteger := 0;
               Post;
             End;
             CDBaseWindow.QueryRefresh;
             PrepareForNewCD;

             If Application.MessageBox('CD uspesno dodat !' + #13#10 +
                                       'Da li zelite da dodate jos CD-ova ?',
                                       'Question',
                                       mb_YESNO + mb_ICONQUESTION) = mrNO Then
               CanClose := TRUE;
           End;
  End;
end;

procedure TNewCDWindow.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  If (not (Key in ['0'..'9'])) and
     (Key <> Chr(vk_BACK)) Then
    Key := Chr(vk_CLEAR);
end;

procedure TNewCDWindow.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.DroppedDown := TRUE;
  ComboBox1.Color := clSkyBlue;
end;

procedure TNewCDWindow.ComboBox1Exit(Sender: TObject);
begin
  ComboBox1.Color := clWindow;
end;

procedure TNewCDWindow.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_RETURN : Edit4.SetFocus;
  End;  
end;

procedure TNewCDWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;
  
  Action := caFREE;
end;

end.
