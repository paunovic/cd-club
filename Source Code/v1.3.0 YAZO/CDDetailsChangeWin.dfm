object CDDetailsChangeWindow: TCDDetailsChangeWindow
  Left = 475
  Top = 389
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Menjanje Podataka CD-a'
  ClientHeight = 189
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 122
    Top = 10
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 16
    Top = 42
    Width = 33
    Height = 13
    Caption = 'Naziv :'
  end
  object Label3: TLabel
    Left = 28
    Top = 66
    Width = 21
    Height = 13
    Caption = 'Tip :'
  end
  object Label4: TLabel
    Left = 22
    Top = 90
    Width = 27
    Height = 13
    Caption = 'Opis :'
  end
  object Label5: TLabel
    Left = 6
    Top = 114
    Width = 43
    Height = 13
    Caption = 'Kolicina :'
  end
  object Label6: TLabel
    Left = 18
    Top = 138
    Width = 31
    Height = 13
    Caption = 'Cena :'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 150
    Top = 7
    Width = 125
    Height = 21
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource1
    TabOrder = 7
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
  end
  object DBEdit1: TDBEdit
    Left = 53
    Top = 39
    Width = 333
    Height = 21
    DataField = 'Title'
    DataSource = DataSource1
    TabOrder = 0
    OnEnter = DBEdit4Enter
    OnExit = DBEdit4Exit
  end
  object DBEdit3: TDBEdit
    Left = 53
    Top = 87
    Width = 333
    Height = 21
    DataField = 'Description'
    DataSource = DataSource1
    TabOrder = 2
    OnEnter = DBEdit4Enter
    OnExit = DBEdit4Exit
  end
  object DBEdit4: TDBEdit
    Left = 53
    Top = 111
    Width = 333
    Height = 21
    DataField = 'CDAmount'
    DataSource = DataSource1
    MaxLength = 5
    TabOrder = 3
    OnEnter = DBEdit4Enter
    OnExit = DBEdit4Exit
    OnKeyPress = DBEdit4KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 231
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Potvrdi'
    TabOrder = 5
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 311
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 6
    Kind = bkCancel
  end
  object DBComboBox1: TDBComboBox
    Left = 53
    Top = 63
    Width = 333
    Height = 21
    Style = csDropDownList
    DataField = 'Kind'
    DataSource = DataSource1
    DropDownCount = 14
    ItemHeight = 13
    Items.Strings = (
      'Akcija'
      'Sport'
      'Avantura'
      'Strategija'
      'Logicka'
      'Decija'
      'Platforma'
      'Voznja'
      'Simulacija'
      'Kompilacija'
      'Film'
      'Muzika'
      'Software'
      'Ostalo')
    TabOrder = 1
    OnEnter = DBComboBox1Enter
    OnExit = DBComboBox1Exit
  end
  object DBEdit5: TDBEdit
    Left = 53
    Top = 135
    Width = 333
    Height = 21
    DataField = 'Price'
    DataSource = DataSource1
    MaxLength = 5
    TabOrder = 4
    OnEnter = DBEdit4Enter
    OnExit = DBEdit4Exit
    OnKeyPress = DBEdit4KeyPress
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 4
    Top = 160
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 36
    Top = 160
  end
end
