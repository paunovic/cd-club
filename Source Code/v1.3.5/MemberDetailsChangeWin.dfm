object MemberDetailsChangeWindow: TMemberDetailsChangeWindow
  Left = 308
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Menjanje Podataka Clana'
  ClientHeight = 264
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 124
    Top = 10
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 58
    Top = 43
    Width = 23
    Height = 13
    Caption = 'Ime :'
  end
  object Label3: TLabel
    Left = 38
    Top = 67
    Width = 43
    Height = 13
    Caption = 'Prezime :'
  end
  object Label4: TLabel
    Left = 42
    Top = 91
    Width = 39
    Height = 13
    Caption = 'Adresa :'
  end
  object Label5: TLabel
    Left = 6
    Top = 115
    Width = 75
    Height = 13
    Caption = 'Mesto rodjenja :'
  end
  object Label6: TLabel
    Left = 4
    Top = 139
    Width = 77
    Height = 13
    Caption = 'Datum rodjenja :'
  end
  object Label7: TLabel
    Left = 16
    Top = 163
    Width = 65
    Height = 13
    Caption = 'Broj telefona :'
  end
  object Label8: TLabel
    Left = 45
    Top = 211
    Width = 36
    Height = 13
    Caption = 'Status :'
  end
  object Label9: TLabel
    Left = 0
    Top = 187
    Width = 81
    Height = 13
    Caption = 'Broj Licne Karte :'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 152
    Top = 7
    Width = 125
    Height = 21
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource1
    TabOrder = 10
    OnClick = DBLookupComboBox1Click
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
    OnKeyPress = DBLookupComboBox1KeyPress
  end
  object DBEdit1: TDBEdit
    Left = 83
    Top = 40
    Width = 307
    Height = 21
    DataField = 'FirstName'
    DataSource = DataSource1
    TabOrder = 0
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 83
    Top = 64
    Width = 307
    Height = 21
    DataField = 'LastName'
    DataSource = DataSource1
    TabOrder = 1
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit3: TDBEdit
    Left = 83
    Top = 88
    Width = 307
    Height = 21
    DataField = 'Address'
    DataSource = DataSource1
    TabOrder = 2
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit4: TDBEdit
    Left = 83
    Top = 112
    Width = 307
    Height = 21
    DataField = 'BirthPlace'
    DataSource = DataSource1
    TabOrder = 3
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit5: TDBEdit
    Left = 83
    Top = 160
    Width = 307
    Height = 21
    DataField = 'PhoneNumber'
    DataSource = DataSource1
    TabOrder = 5
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object ComboBox1: TComboBox
    Left = 83
    Top = 208
    Width = 307
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 7
    Text = 'Aktivan'
    OnChange = ComboBox1Change
    OnEnter = ComboBox1Enter
    OnExit = ComboBox1Exit
    Items.Strings = (
      'Aktivan'
      'Neaktivan')
  end
  object BitBtn1: TBitBtn
    Left = 233
    Top = 236
    Width = 75
    Height = 25
    Caption = 'Potvrdi'
    TabOrder = 8
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 315
    Top = 236
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 9
    Kind = bkCancel
  end
  object DBEdit6: TDBEdit
    Left = 83
    Top = 184
    Width = 307
    Height = 21
    DataField = 'PaperNum'
    DataSource = DataSource1
    MaxLength = 10
    TabOrder = 6
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DateTimePicker1: TDateTimePicker
    Left = 83
    Top = 136
    Width = 307
    Height = 21
    Date = 32715.844458726850000000
    Time = 32715.844458726850000000
    ShowCheckbox = True
    Checked = False
    TabOrder = 4
    OnEnter = DateTimePicker1Enter
    OnExit = DateTimePicker1Exit
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 329
    Top = 4
  end
  object Table1: TTable
    SessionName = 'Default'
    Exclusive = True
    TableName = 'bases\Members.DB'
    Left = 361
    Top = 4
  end
  object Table2: TTable
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\Membercard.DB'
    Left = 297
    Top = 4
  end
end
