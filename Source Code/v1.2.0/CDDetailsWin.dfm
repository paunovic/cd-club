object CDDetailsWindow: TCDDetailsWindow
  Left = 232
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Detaljne Informacije o CD-ovima'
  ClientHeight = 286
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 10
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 56
    Top = 44
    Width = 33
    Height = 13
    Caption = 'Naziv :'
  end
  object Label3: TLabel
    Left = 68
    Top = 66
    Width = 21
    Height = 13
    Caption = 'Tip :'
  end
  object Label4: TLabel
    Left = 62
    Top = 91
    Width = 27
    Height = 13
    Caption = 'Opis :'
  end
  object Label5: TLabel
    Left = 46
    Top = 115
    Width = 43
    Height = 13
    Caption = 'Kolicina :'
  end
  object Label6: TLabel
    Left = 53
    Top = 139
    Width = 36
    Height = 13
    Caption = 'Status :'
  end
  object Label7: TLabel
    Left = 7
    Top = 163
    Width = 82
    Height = 13
    Caption = 'Datum dobijanja :'
  end
  object Label8: TLabel
    Left = 4
    Top = 210
    Width = 165
    Height = 13
    Caption = 'Zadnji put iznajmljen od clana broj :'
  end
  object Label9: TLabel
    Left = 28
    Top = 234
    Width = 141
    Height = 13
    Caption = 'Datum zadnjeg iznajmljivanja :'
  end
  object Label10: TLabel
    Left = 58
    Top = 186
    Width = 31
    Height = 13
    Caption = 'Cena :'
    FocusControl = BitBtn1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 180
    Top = 7
    Width = 125
    Height = 21
    DropDownRows = 15
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource1
    TabOrder = 0
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit1: TDBEdit
    Left = 93
    Top = 39
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Title'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit2: TDBEdit
    Left = 93
    Top = 63
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Kind'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 93
    Top = 87
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Description'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 93
    Top = 111
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'CDAmount'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 93
    Top = 135
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Status'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit6: TDBEdit
    Left = 93
    Top = 159
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'BuyDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit7: TDBEdit
    Left = 173
    Top = 207
    Width = 252
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'LastRentUser'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DBEdit8: TDBEdit
    Left = 173
    Top = 231
    Width = 252
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'LastRentDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 9
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 349
    Top = 256
    Width = 75
    Height = 25
    TabOrder = 10
    OnKeyDown = DBLookupComboBox1KeyDown
    Kind = bkOK
  end
  object DBEdit9: TDBEdit
    Left = 93
    Top = 183
    Width = 333
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Price'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 4
    Top = 4
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 36
    Top = 4
  end
end
