object OperatorDetailWindow: TOperatorDetailWindow
  Left = 276
  Top = 284
  BorderStyle = bsDialog
  Caption = 'Licni Podaci Operatera'
  ClientHeight = 294
  ClientWidth = 430
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 139
    Top = 14
    Width = 72
    Height = 13
    Caption = 'Broj operatera :'
  end
  object Label2: TLabel
    Left = 68
    Top = 41
    Width = 23
    Height = 13
    Caption = 'Ime :'
  end
  object Label3: TLabel
    Left = 48
    Top = 67
    Width = 43
    Height = 13
    Caption = 'Prezime :'
  end
  object Label4: TLabel
    Left = 16
    Top = 92
    Width = 75
    Height = 13
    Caption = 'Mesto rodjenja :'
  end
  object Label5: TLabel
    Left = 52
    Top = 118
    Width = 39
    Height = 13
    Caption = 'Adresa :'
  end
  object Label6: TLabel
    Left = 14
    Top = 143
    Width = 77
    Height = 13
    Caption = 'Datum rodjenja :'
  end
  object Label7: TLabel
    Left = 26
    Top = 167
    Width = 65
    Height = 13
    Caption = 'Broj telefona :'
  end
  object Label8: TLabel
    Left = 31
    Top = 192
    Width = 60
    Height = 13
    Caption = 'Maticni broj :'
  end
  object Label9: TLabel
    Left = 55
    Top = 215
    Width = 36
    Height = 13
    Caption = 'Status :'
  end
  object Label10: TLabel
    Left = 4
    Top = 239
    Width = 87
    Height = 13
    Caption = 'Dozvoljen pristup :'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 217
    Top = 11
    Width = 80
    Height = 21
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource1
    TabOrder = 0
    OnClick = DBLookupComboBox1Click
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
    OnKeyDown = FormKeyDown
    OnKeyPress = DBLookupComboBox1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 97
    Top = 39
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'FirstName'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DBEdit3: TDBEdit
    Left = 97
    Top = 64
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'LastName'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    OnKeyDown = FormKeyDown
  end
  object DBEdit4: TDBEdit
    Left = 97
    Top = 89
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'BirthPlace'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyDown = FormKeyDown
  end
  object DBEdit5: TDBEdit
    Left = 97
    Top = 114
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Address'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyDown = FormKeyDown
  end
  object DBEdit7: TDBEdit
    Left = 97
    Top = 164
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'PhoneNumber'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
    OnKeyDown = FormKeyDown
  end
  object DBEdit8: TDBEdit
    Left = 97
    Top = 189
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'MotherNumber'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
    OnKeyDown = FormKeyDown
  end
  object DBEdit9: TDBEdit
    Left = 97
    Top = 213
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Status'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
    OnKeyDown = FormKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 351
    Top = 265
    Width = 75
    Height = 25
    TabOrder = 10
    OnKeyDown = FormKeyDown
    Kind = bkOK
  end
  object Edit1: TEdit
    Left = 97
    Top = 237
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit6: TDBEdit
    Left = 97
    Top = 138
    Width = 330
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'BirthDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyDown = FormKeyDown
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Opers.DB'
    Left = 40
    Top = 264
    object Table1IDNum: TSmallintField
      FieldName = 'IDNum'
    end
    object Table1FirstName: TStringField
      FieldName = 'FirstName'
    end
    object Table1LastName: TStringField
      FieldName = 'LastName'
    end
    object Table1BirthPlace: TStringField
      FieldName = 'BirthPlace'
    end
    object Table1Address: TStringField
      FieldName = 'Address'
      Size = 40
    end
    object Table1BirthDate: TDateField
      FieldName = 'BirthDate'
    end
    object Table1PhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 30
    end
    object Table1MotherNumber: TStringField
      FieldName = 'MotherNumber'
      Size = 13
    end
    object Table1Password: TStringField
      FieldName = 'Password'
      Size = 30
    end
    object Table1Status: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object Table1AccessGranted: TSmallintField
      FieldName = 'AccessGranted'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 8
    Top = 264
  end
end
