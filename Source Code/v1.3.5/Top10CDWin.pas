unit Top10CDWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, Spin;

type
  TTop10CDWindow = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1Enter(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure MakeTop10CDInterface;
    procedure MakeTop10MembersInterface;
    procedure StringGrid1DblClick(Sender: TObject);
  private
    CDClass : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Top10CDWindow: TTop10CDWindow;

implementation

uses CDDetailsWin, MemberDetailsWin;

{$R *.dfm}

procedure TTop10CDWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;

  Action := caFREE;
end;

procedure TTop10CDWindow.DBGrid1Enter(Sender: TObject);
begin
  TDBGrid(Sender).FixedColor := clSkyBlue;
end;

procedure TTop10CDWindow.DBGrid1Exit(Sender: TObject);
begin
  TDBGrid(Sender).FixedColor := clBtnFace;
end;

procedure TTop10CDWindow.DBGrid1DblClick(Sender: TObject);
begin
  If Query1.FieldByName('IDNum').AsString = '' Then
    Exit;

  Application.CreateForm(TCDDetailsWindow, CDDetailsWindow);
  CDDetailsWindow.DBLookupComboBox1.KeyValue := Query1.FieldByName('IDNum').AsInteger;
  CDDetailsWindow.ShowModal;
end;

procedure TTop10CDWindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_ESCAPE : Close;
  End;
end;

procedure TTop10CDWindow.StringGrid1Enter(Sender: TObject);
begin
  StringGrid1.FixedColor := clSkyBlue;
end;

procedure TTop10CDWindow.StringGrid1Exit(Sender: TObject);
begin
  StringGrid1.FixedColor := clBtnFace;
end;

procedure TTop10CDWindow.MakeTop10CDInterface;
var
  C1 : Integer;
begin
  Query1.Active := TRUE;

  StringGrid1.Cells[0, 0] := 'Broj CD-a';
  StringGrid1.Cells[1, 0] := 'Naziv CD-a';
  StringGrid1.Cells[2, 0] := 'Iznajmljivan Puta';

  Query1.First;
  For C1 := 1 to 10 Do
  Begin
    StringGrid1.Cells[0, C1] := Query1.FieldByName('IDNum').AsString;
    StringGrid1.Cells[1, C1] := Query1.FieldByName('Title').AsString;
    StringGrid1.Cells[2, C1] := Query1.FieldByName('TimesRented').AsString;
    Query1.Next;
    If Query1.Eof Then
      Break;
  End;

  CDClass := TRUE;
end;

procedure TTop10CDWindow.MakeTop10MembersInterface;
var
  C1, C2 : Integer;
  NoAdd  : Boolean;
  Table1 : TTable;
begin
  Caption := 'Top 10 Clanova';
  Label1.Caption := 'Dupli klik na nekog clana za vise informacija.';

  With Query1 Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM bases\MemberCard.DB ORDER BY RentNum DESC');
    Filter := 'RentNum > 0';
    Open;
    Active := TRUE;
  End;

  StringGrid1.Cells[0, 0] := 'Broj Clana';
  StringGrid1.Cells[1, 0] := 'Ime Clana';
  StringGrid1.Cells[2, 0] := 'Iznajmljivao Puta';

  Table1 := TTable.Create(Self);
  Table1.SessionName := 'Default';
  Table1.TableName := 'bases\Members.DB';
  Table1.Open;

  Query1.First;
  C1 := 1;
  While C1 <= 10 Do
  Begin
    NoAdd := FALSE;
    For C2 := 1 to 10 Do
      If StringGrid1.Cells[0, C2] = Query1.FieldByName('MemberID').AsString Then
        NoAdd := TRUE;
    If not NoAdd Then
    Begin
      StringGrid1.Cells[0, C1] := Query1.FieldByName('MemberID').AsString;
      Table1.FindKey([Query1.FieldByName('MemberID').AsInteger]);
      StringGrid1.Cells[1, C1] := Table1.FieldByName('FirstName').AsString + ' ' + Table1.FieldByName('LastName').AsString;
      StringGrid1.Cells[2, C1] := Query1.FieldByName('RentNum').AsString;
      Inc(C1);
    End;
    Query1.Next;
    If Query1.Eof Then
      Break;
  End;

  Table1.Close;

  CDClass := FALSE;
end;

procedure TTop10CDWindow.StringGrid1DblClick(Sender: TObject);
begin
  Case CDClass of
    TRUE  : If StringGrid1.Cells[0, StringGrid1.Row] <> '' Then
            Begin
              Application.CreateForm(TCDDetailsWindow, CDDetailsWindow);
              CDDetailsWindow.DBLookupComboBox1.KeyValue := StringGrid1.Cells[0, StringGrid1.Row];
              CDDetailsWindow.ShowModal;
            End;
    FALSE : If StringGrid1.Cells[0, StringGrid1.Row] <> '' Then
            Begin
              Application.CreateForm(TMemberDetailsWindow, MemberDetailsWindow);
              MemberDetailsWindow.DBLookupComboBox1.KeyValue := StringGrid1.Cells[0, StringGrid1.Row];
              MemberDetailsWindow.ShowModal;
            End;
  End;
end;

end.
