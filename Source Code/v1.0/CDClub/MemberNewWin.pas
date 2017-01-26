unit MemberNewWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Mask;

type
  TMemberNewWindow = class(TForm)
    Table1: TTable;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit6: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PrepareForNewMember;
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberNewWindow: TMemberNewWindow;

implementation

uses MemberBaseWin;

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

procedure TMemberNewWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.Close;

  Action := caFREE;
end;

procedure TMemberNewWindow.PrepareForNewMember;
begin
  Table1.Last;
  If Table1.FieldByName('IDNum').AsString <> '' Then
    Edit1.Text := IntToStr(StrToInt(Table1.FieldByName('IDNum').Text) + 1)
  else
    Edit1.Text := '1';  
end;

procedure TMemberNewWindow.FormCreate(Sender: TObject);
begin
  Table1.Open;
  PrepareForNewMember;
end;

procedure TMemberNewWindow.Edit2Enter(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clSkyBlue;
end;

procedure TMemberNewWindow.Edit2Exit(Sender: TObject);
begin
  With Sender as TEdit Do
    Color := clWindow;
end;

procedure TMemberNewWindow.FormCloseQuery(Sender: TObject;
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
               Edit3.SetFocus;
               Exit;
             End;
             If Edit3.Focused Then
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
               Edit6.SetFocus;
               Exit;
             End;
             If Edit6.Focused Then
             Begin
               Edit7.SetFocus;
               Exit;
             End;
             If Edit7.Focused Then
             Begin
               BitBtn1.SetFocus;
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

             If (Edit2.Text = '') or
                (Edit3.Text = '') Then
             Begin
               Application.MessageBox('Unesite sve podatke !',
                                      'Information',
                                      mb_OK + mb_ICONINFORMATION);
               If Edit3.Text = '' Then
                 Edit3.SetFocus;
               If Edit2.Text = '' Then
                 Edit2.SetFocus;
               Exit;
             End;

             Edit2.SetFocus;
             Table1.First;

             While not Table1.Eof Do
               If (LowerCase(Table1.FieldByName('FirstName').AsString) = LowerCase(Edit2.Text)) and
                  (LowerCase(Table1.FieldByName('LastName').AsString) = LowerCase(Edit3.Text)) and
                  (LowerCase(Table1.FieldByName('BirthDate').AsString) = LowerCase(Edit6.Text)) Then
                 If Application.MessageBox('Clan sa istim imenom, prezimenom i datumom rodjenja vec postoji !' + #13#10 +
                                           'Da li ipak zelite da dodate novog clana ?',
                                           'Question',
                                           mb_YESNO + mb_ICONQUESTION) = mrNO Then
                   Exit
                 else
                   Break
               else
                 Table1.Next;

             If not MemberBaseWindow.EmptyTable Then
               Table1.Append;

             With Table1 Do
             Begin
               Edit;
               FieldByName('IDNum').AsInteger := StrToInt(Edit1.Text);
               FieldByName('FirstName').AsString := Edit2.Text;
               FieldByName('LastName').AsString := Edit3.Text;
               FieldByName('Address').AsString := Edit4.Text;
               FieldByName('BirthPlace').AsString := Edit5.Text;
               FieldByName('BirthDate').AsDateTime := StrToDate(Edit6.Text);
               FieldByName('PhoneNumber').AsString := Edit7.Text;
               FieldByName('JoinDate').AsDateTime := Date;
               FieldByName('Status').AsString := 'Aktivan';
               Post;
             End;

             MemberBaseWindow.QueryRefresh;
             PrepareForNewMember;

             If Application.MessageBox('Clan uspesno dodat !' + #13#10 +
                                       'Da li zelite da dodate jos clanova ?', 'Question',
                                       mb_YESNO + mb_ICONQUESTION) = mrNO Then
               CanClose := TRUE;
           End;
  End;
end;

end.
