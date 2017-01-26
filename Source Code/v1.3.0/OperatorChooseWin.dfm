object OperatorChooseWindow: TOperatorChooseWindow
  Left = 443
  Top = 447
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Izaberite Operatera'
  ClientHeight = 94
  ClientWidth = 228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 67
    Height = 13
    Caption = 'Operater broj :'
  end
  object Label2: TLabel
    Left = 31
    Top = 37
    Width = 43
    Height = 13
    Caption = 'Lozinka :'
  end
  object BitBtn1: TBitBtn
    Left = 65
    Top = 62
    Width = 75
    Height = 27
    Caption = 'Potvrdi'
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 147
    Top = 62
    Width = 75
    Height = 27
    Caption = 'Odustani'
    TabOrder = 3
    Kind = bkCancel
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 80
    Top = 8
    Width = 142
    Height = 21
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource1
    TabOrder = 0
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
  end
  object Edit1: TEdit
    Left = 80
    Top = 34
    Width = 142
    Height = 21
    MaxLength = 12
    PasswordChar = '*'
    TabOrder = 1
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Top = 64
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Opers.db'
    Left = 32
    Top = 64
  end
end
