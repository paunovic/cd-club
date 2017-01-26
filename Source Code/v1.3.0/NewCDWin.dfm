object NewCDWindow: TNewCDWindow
  Left = 305
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Unos Podataka za Novi CD'
  ClientHeight = 193
  ClientWidth = 360
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
    Left = 25
    Top = 12
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 33
    Height = 13
    Caption = 'Naziv :'
  end
  object Label3: TLabel
    Left = 28
    Top = 64
    Width = 21
    Height = 13
    Caption = 'Tip :'
  end
  object Label5: TLabel
    Left = 6
    Top = 112
    Width = 43
    Height = 13
    Caption = 'Kolicina :'
  end
  object Label4: TLabel
    Left = 22
    Top = 88
    Width = 27
    Height = 13
    Caption = 'Opis :'
  end
  object Label6: TLabel
    Left = 18
    Top = 136
    Width = 31
    Height = 13
    Caption = 'Cena :'
  end
  object BitBtn1: TBitBtn
    Left = 196
    Top = 162
    Width = 75
    Height = 25
    Caption = 'Potvrdi'
    TabOrder = 5
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 278
    Top = 162
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 6
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 51
    Top = 9
    Width = 70
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    MaxLength = 5
    ReadOnly = True
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 51
    Top = 37
    Width = 302
    Height = 21
    MaxLength = 60
    TabOrder = 0
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Edit4: TEdit
    Left = 51
    Top = 85
    Width = 302
    Height = 21
    MaxLength = 50
    TabOrder = 2
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Edit5: TEdit
    Left = 51
    Top = 109
    Width = 302
    Height = 21
    MaxLength = 5
    TabOrder = 3
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
    OnKeyPress = Edit5KeyPress
  end
  object ComboBox1: TComboBox
    Left = 51
    Top = 61
    Width = 302
    Height = 21
    Style = csDropDownList
    DropDownCount = 15
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Akcija'
    OnEnter = ComboBox1Enter
    OnExit = ComboBox1Exit
    OnKeyDown = ComboBox1KeyDown
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
  end
  object Edit6: TEdit
    Left = 51
    Top = 133
    Width = 302
    Height = 21
    MaxLength = 5
    TabOrder = 4
    Text = '0'
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
    OnKeyPress = Edit5KeyPress
  end
  object Table1: TTable
    Active = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 37
    Top = 161
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 5
    Top = 161
  end
end
