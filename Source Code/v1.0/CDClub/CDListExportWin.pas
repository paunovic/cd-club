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
    CheckBox6: TCheckBox;
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
begin
  Cursor := CT;
  GroupBox1.Cursor := CT;
  GroupBox2.Cursor := CT;
  Button1.Cursor := CT;
  Edit1.Cursor := CT;
  Label1.Cursor := CT;
  BitBtn2.Cursor := CT;
  BitBtn1.Cursor := CT;
  CheckBox1.Cursor := CT;
  CheckBox2.Cursor := CT;
  CheckBox3.Cursor := CT;
  CheckBox4.Cursor := CT;
  CheckBox5.Cursor := CT;
  CheckBox6.Cursor := CT;
  RadioButton1.Cursor := CT;
  RadioButton2.Cursor := CT;
  RadioButton3.Cursor := CT;
  RadioButton4.Cursor := CT;
  RadioButton5.Cursor := CT;
  RadioButton6.Cursor := CT;
end;

function TCDListExportWindow.SaveList(const Path : String) : String;
var
  CTNum     : Byte;
  SelString : String;
  SortErr   : Boolean;
begin
  result := 'Lista uspesno snimljena !';
  CTNum := 65;
  SortErr := FALSE;

  SelString := 'SELECT ';

  If CheckBox1.Checked Then
    SelString := SelString + 'IDNum,';
  If CheckBox2.Checked Then
    SelString := SelString + 'Title,';
  If CheckBox3.Checked Then
    SelString := SelString + 'Kind,';
  If CheckBox4.Checked Then
    SelString := SelString + 'Description,';
  If CheckBox5.Checked Then
    SelString := SelString + 'CDAmount,';
  If CheckBox6.Checked Then
    SelString := SelString + 'Status,';
  If SelString = 'SELECT ' Then
  Begin
    result := 'Morate selektovati bar jedan podatak koji ce se nalaziti u listi !';
    Exit;
  End;
  SelString := Copy(SelString, 1, Length(SelString) - 1) + ' FROM bases\CDBase.db ORDER BY ';
  If RadioButton1.Checked Then
    If CheckBox1.Checked Then
      SelString := SelString + 'IDNum'
    else
      SortErr := TRUE;
  If RadioButton2.Checked Then
    If CheckBox2.Checked Then
      SelString := SelString + 'Title'
    else
      SortErr := TRUE;
  If RadioButton3.Checked Then
    If CheckBox3.Checked Then
      SelString := SelString + 'Kind'
    else
      SortErr := TRUE;
  If RadioButton4.Checked Then
    If CheckBox4.Checked Then
      SelString := SelString + 'Description'
    else
      SortErr := TRUE;
  If RadioButton5.Checked Then
    If CheckBox5.Checked Then
      SelString := SelString + 'CDAmount'
    else
      SortErr := TRUE;
  If RadioButton6.Checked Then
    If CheckBox6.Checked Then
      SelString := SelString + 'Status'
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

  If CheckBox1.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[0] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Broj';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 8;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;

  If CheckBox2.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[1] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Naziv';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 35;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;

  If CheckBox3.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[2] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Tip';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 12;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;

  If CheckBox4.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[3] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Opis';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 35;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;

  If CheckBox5.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[4] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Kolicina';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 8;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;

  If CheckBox6.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[5] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Status';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 12;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
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
  Query1.Filter := CDBaseWindow.Query1.Filter;
end;

end.
