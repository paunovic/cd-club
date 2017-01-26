unit MembersListExportWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, OpModels, OpDbOfc, OpShared, OpXLXP, OpExcel,
  StdCtrls, Buttons;

type
  TMembersListExportWindow = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    SaveDialog1: TSaveDialog;
    OpDataSetModel1: TOpDataSetModel;
    Query1: TQuery;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    OpExcel1: TOpExcel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function SaveList(const Path : String) : String;
    procedure Button1Click(Sender: TObject);
    procedure SetCursorType(CT : TCursor);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MembersListExportWindow: TMembersListExportWindow;

implementation

uses MemberBaseWin;

{$R *.dfm}

procedure TMembersListExportWindow.FormCreate(Sender: TObject);
begin
  Query1.Filter := MemberBaseWindow.Query1.Filter;
end;

procedure TMembersListExportWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  
  Action := caFREE;
end;

function TMembersListExportWindow.SaveList(const Path : String) : String;
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
    SelString := SelString + 'FirstName,';
  If CheckBox3.Checked Then
    SelString := SelString + 'LastName,';
  If CheckBox4.Checked Then
    SelString := SelString + 'Address,';
  If CheckBox5.Checked Then
    SelString := SelString + 'BirthPlace,';
  If CheckBox6.Checked Then
    SelString := SelString + 'BirthDate,';
  If CheckBox7.Checked Then
    SelString := SelString + 'PhoneNumber,';
  If CheckBox8.Checked Then
    SelString := SelString + 'JoinDate,';
  If CheckBox9.Checked Then
    SelString := SelString + 'Status,';

  If SelString = 'SELECT ' Then
  Begin
    result := 'Morate selektovati bar jedan podatak koji ce se nalaziti u listi !';
    Exit;
  End;
  SelString := Copy(SelString, 1, Length(SelString) - 1) + ' FROM bases\Members.db ORDER BY ';
  If RadioButton1.Checked Then
    If CheckBox1.Checked Then
      SelString := SelString + 'IDNum'
    else
      SortErr := TRUE;
  If RadioButton2.Checked Then
    If CheckBox2.Checked Then
      SelString := SelString + 'FirstName'
    else
      SortErr := TRUE;
  If RadioButton3.Checked Then
    If CheckBox3.Checked Then
      SelString := SelString + 'LastName'
    else
      SortErr := TRUE;
  If RadioButton4.Checked Then
    If CheckBox4.Checked Then
      SelString := SelString + 'Address'
    else
      SortErr := TRUE;
  If RadioButton5.Checked Then
    If CheckBox5.Checked Then
      SelString := SelString + 'BirthPlace'
    else
      SortErr := TRUE;
  If RadioButton6.Checked Then
    If CheckBox6.Checked Then
      SelString := SelString + 'BirthDate'
    else
      SortErr := TRUE;
  If RadioButton7.Checked Then
    If CheckBox7.Checked Then
      SelString := SelString + 'PhoneNumber'
    else
      SortErr := TRUE;
  If RadioButton8.Checked Then
    If CheckBox8.Checked Then
      SelString := SelString + 'JoinDate'
    else
      SortErr := TRUE;
  If RadioButton9.Checked Then
    If CheckBox9.Checked Then
      SelString := SelString + 'Status'
    else
      SortErr := TRUE;

  If SortErr Then
  Begin
    result := 'Lista mora da bude sortirana po polju koje ce se nalaziti u listi !';
    Exit;
  End;

  OpExcel1.Connected := TRUE;
  OpExcel1.Workbooks[0].Worksheets[0].Name := 'Lista Clanova';

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add(SelString);
  Query1.Open;

  With OpExcel1.Workbooks[0].Worksheets[0].Ranges[0] Do
  Begin
    Address := 'A1';
    OfficeModel := OpDataSetModel1;
    Populate;
  End;

  If CheckBox1.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[1] Do
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
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[2] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Ime';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 22;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox3.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[3] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Prezime';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 25;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox4.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[4] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Adresa';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 30;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox5.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[5] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Mesto Rodjenja';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 22;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox6.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[6] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Datum Rodjenja';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 21;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox7.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[7] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Broj Telefona';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 25;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox8.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[8] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Datum Uclanjenja';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 22;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 23;
      VerticalAlignment := xlcvaCenter;
      Inc(CTNum);
    End;
  If CheckBox9.Checked Then
    With OpExcel1.Workbooks[0].Worksheets[0].Ranges[9] Do
    Begin
      Address := Chr(CTNum) + '1';
      SimpleText := 'Status';
      Color := clSkyBlue;
      Borders := [xlbLeft,xlbRight,xlbTop,xlbBottom];
      BorderLineWeight := xlbwThin;
      ColumnWidth := 15;
      FontAttributes := [xlfaBold];
      HorizontalAlignment := xlchaCenter;
      RowHeight := 22;
      VerticalAlignment := xlcvaCenter;
    End;

  OpExcel1.Workbooks[0].SaveAs(Path);
  OpExcel1.Connected := FALSE;
end;

procedure TMembersListExportWindow.SetCursorType(CT : TCursor);
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
  CheckBox7.Cursor := CT;
  CheckBox8.Cursor := CT;
  CheckBox9.Cursor := CT;
  RadioButton1.Cursor := CT;
  RadioButton2.Cursor := CT;
  RadioButton3.Cursor := CT;
  RadioButton4.Cursor := CT;
  RadioButton5.Cursor := CT;
  RadioButton6.Cursor := CT;
  RadioButton7.Cursor := CT;
  RadioButton8.Cursor := CT;
  RadioButton9.Cursor := CT;
end;

procedure TMembersListExportWindow.FormCloseQuery(Sender: TObject;
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

procedure TMembersListExportWindow.Button1Click(Sender: TObject);
begin
  SaveDialog1.FileName := Edit1.Text;
  If SaveDialog1.Execute Then
    Edit1.Text := SaveDialog1.FileName;
end;

end.
