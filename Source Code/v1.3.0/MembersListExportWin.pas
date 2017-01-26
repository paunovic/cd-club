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
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    RadioButton7: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    OpExcel1: TOpExcel;
    CheckBox8: TCheckBox;
    RadioButton8: TRadioButton;
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
  Query1.Open;
  Query1.Filter := MemberBaseWindow.Query1.Filter;
end;

procedure TMembersListExportWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  
  Action := caFREE;
end;

function TMembersListExportWindow.SaveList(const Path : String) : String;
const
  TNam      : Array[1..10] of String = ('IDNum',
                                        'FirstName',
                                        'LastName',
                                        'Address',
                                        'BirthPlace',
                                        'BirthDate',
                                        'PhoneNumber',
                                        'PaperNum',
                                        'JoinDate',
                                        'Status');
  TNamTr    : Array[1..10] of String = ('Broj',
                                        'Ime',
                                        'Prezime',
                                        'Adresa',
                                        'Mesto Rodjenja',
                                        'Datum Rodjenja',
                                        'Broj Telefona',
                                        'Broj Licne Karte',
                                        'Datum Uclanjenja',
                                        'Status');
  ColWidths : Array[1..10] of Integer = (8, 22, 25, 30, 22, 21, 25, 22, 15, 15);
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

  For C1 := 1 to 10 Do
    If TCheckBox(FindComponent('CheckBox' + IntToStr(C1))).Checked Then
      SelString := SelString + TNam[C1] + ',';

  If SelString = 'SELECT ' Then
  Begin
    result := 'Morate selektovati bar jedan podatak koji ce se nalaziti u listi !';
    Exit;
  End;

  SelString := Copy(SelString, 1, Length(SelString) - 1) + ' FROM bases\Members.db ORDER BY ';

  For C1 := 1 to 10 Do
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

  For C1 := 1 to 10 Do
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

procedure TMembersListExportWindow.SetCursorType(CT : TCursor);
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
  For C1 := 1 to 10 Do
  Begin
    TCheckBox(FindComponent('CheckBox' + IntToStr(C1))).Cursor := CT;
    TRadioButton(FindComponent('RadioButton' + IntToStr(C1))).Cursor := CT;
  End;
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
