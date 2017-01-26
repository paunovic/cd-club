unit CDListExportWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OpShared, OpXLXP, OpExcel, DB, DBTables,
  OpModels, OpDbOfc;

type
  TCDListExportWindow = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    OpExcel1: TOpExcel;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    OpDataSetModel1: TOpDataSetModel;
    Query1: TQuery;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton7: TRadioButton;
    CheckBox6: TCheckBox;
    RadioButton6: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function SaveList(const Path : String) : String;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetCursorType(CT : TCursor);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDListExportWindow: TCDListExportWindow;

implementation

uses CDBaseWin;

{$R *.dfm}

procedure TCDListExportWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;

  Action := caFREE;
end;

procedure TCDListExportWindow.SetCursorType(CT : TCursor);
var
  C1 : Integer;
begin
  Cursor := CT;
  GroupBox1.Cursor := CT;
  GroupBox2.Cursor := CT;
  Button1.Cursor := CT;
  Edit1.Cursor := CT;
  Label1.Cursor := CT;
  BitBtn2.Cursor := CT;
  BitBtn1.Cursor := CT;
  For C1 := 1 to 6 Do
  Begin
    TCheckBox(FindComponent('CheckBox' + IntToStr(C1))).Cursor := CT;
    TRadioButton(FindComponent('RadioButton' + IntToStr(C1))).Cursor := CT;
  End;  
end;

function TCDListExportWindow.SaveList(const Path : String) : String;
const
  TNam      : Array[1..7] of String = ('IDNum',
                                       'Title',
                                       'Kind',
                                       'Description',
                                       'CDAmount',
                                       'Price',
                                       'Status');
  TNamTr    : Array[1..7] of String = ('Broj',
                                       'Naziv',
                                       'Tip',
                                       'Opis',
                                       'Kolicina',
                                       'Cena',
                                       'Status');
  ColWidths : Array[1..7] of Integer = (8, 35, 12, 35, 8, 12, 12);
var
  CTNum     : Byte;
  SelString : String;
  SortErr   : Boolean;
  C1        : Integer;
begin
  result := 'Lista uspesno snimljena !';
  CTNum := 65;
  SortErr := FALSE;

  SelString := 'SELECT ';

  For C1 := 1 to 7 Do
    If TCheckBox(FindComponent('CheckBox' + IntToStr(C1))).Checked Then
      SelString := SelString + TNam[C1] + ',';

  If SelString = 'SELECT ' Then
  Begin
    result := 'Morate selektovati bar jedan podatak koji ce se nalaziti u listi !';
    Exit;
  End;

  SelString := Copy(SelString, 1, Length(SelString) - 1) + ' FROM bases\CDBase.db ORDER BY ';

  For C1 := 1 to 7 Do
    If TRadioButton(FindComponent('RadioButton' + IntToStr(C1))).Checked Then
      If TCheckBox(FindComponent('CheckBox' + IntToStr(C1))).Checked Then
        SelString := SelString + TNam[C1]
      else
        SortErr := TRUE;

  If SortErr Then
  Begin
    result := 'Lista mora da bude sortirana po polju koje ce se nalaziti u listi !';
    Exit;
  End;

  OpExcel1.Connected := TRUE;
  OpExcel1.Workbooks[0].Worksheets[0].Name := 'Lista CD-ova';

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add(SelString);
  Query1.Open;

  With OpExcel1.Workbooks[0].Worksheets[0].Ranges[6] Do
  Begin
    Address := 'A1';
    OfficeModel := OpDataSetModel1;
    Populate;
  End;

  For C1 := 1 to 7 Do
    If TCheckBox(FindComponent('CheckBox' + IntToStr(C1))).Checked Then
      With OpExcel1.Workbooks[0].Worksheets[0].Ranges[C1 - 1] Do
      Begin
        Address := Chr(CTNum) + '1';
        SimpleText := TNamTr[C1];
        Color := clSkyBlue;
        Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
        BorderLineWeight := xlbwThin;
        ColumnWidth := ColWidths[C1];
        FontAttributes := [xlfaBold];
        HorizontalAlignment := xlchaCenter;
        RowHeight := 23;
        VerticalAlignment := xlcvaCenter;
        Inc(CTNum);
      End;

  OpExcel1.Workbooks[0].SaveAs(Path);
  OpExcel1.Connected := FALSE;
end;

procedure TCDListExportWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  res : String;
begin
  Case ModalResult of
    mrOK : Begin
             SetCursorType(crHourglass);
             res := SaveList(Edit1.Text);
             SetCursorType(crDefault);
             Application.MessageBox(PChar(res), 'Information', mb_OK + mb_ICONINFORMATION);
             If res <> 'Lista uspesno snimljena !' Then
               CanClose := FALSE;
           End;
  End;
end;

procedure TCDListExportWindow.Button1Click(Sender: TObject);
begin
  SaveDialog1.FileName := Edit1.Text;
  If SaveDialog1.Execute Then
    Edit1.Text := SaveDialog1.FileName;
end;

procedure TCDListExportWindow.Edit1Enter(Sender: TObject);
begin
  Edit1.Color := clSkyBlue;
end;

procedure TCDListExportWindow.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clWindow;
end;

procedure TCDListExportWindow.FormCreate(Sender: TObject);
begin
  Query1.Open;
  Query1.Filter := CDBaseWindow.Query1.Filter;
end;

end.
