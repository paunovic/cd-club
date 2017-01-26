object MemberDetailsWindow: TMemberDetailsWindow
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Detaljne Informacije o Clanovima'
  ClientHeight = 294
  ClientWidth = 415
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
    Left = 132
    Top = 10
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 68
    Top = 47
    Width = 23
    Height = 13
    Caption = 'Ime :'
  end
  object Label3: TLabel
    Left = 48
    Top = 71
    Width = 43
    Height = 13
    Caption = 'Prezime :'
  end
  object Label4: TLabel
    Left = 52
    Top = 95
    Width = 39
    Height = 13
    Caption = 'Adresa :'
  end
  object Label5: TLabel
    Left = 11
    Top = 119
    Width = 80
    Height = 13
    Caption = 'Mesto Rodjenja :'
  end
  object Label6: TLabel
    Left = 9
    Top = 143
    Width = 82
    Height = 13
    Caption = 'Datum Rodjenja :'
  end
  object Label7: TLabel
    Left = 1
    Top = 215
    Width = 90
    Height = 13
    Caption = 'Datum Uclanjenja :'
  end
  object Label8: TLabel
    Left = 22
    Top = 167
    Width = 69
    Height = 13
    Caption = 'Broj Telefona :'
  end
  object Label9: TLabel
    Left = 55
    Top = 239
    Width = 36
    Height = 13
    Caption = 'Status :'
  end
  object Label10: TLabel
    Left = 10
    Top = 191
    Width = 81
    Height = 13
    Caption = 'Broj Licne Karte :'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 160
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
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit1: TDBEdit
    Left = 94
    Top = 44
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'FirstName'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit2: TDBEdit
    Left = 94
    Top = 68
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'LastName'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 94
    Top = 92
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'Address'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 94
    Top = 116
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'BirthPlace'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 94
    Top = 140
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'BirthDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit6: TDBEdit
    Left = 94
    Top = 164
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'PhoneNumber'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit7: TDBEdit
    Left = 94
    Top = 212
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'JoinDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit8: TDBEdit
    Left = 94
    Top = 236
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'Status'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 9
    OnKeyDown = DBEdit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 265
    Width = 75
    Height = 25
    TabOrder = 10
    OnKeyDown = DBEdit1KeyDown
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 4
    Top = 261
    Width = 109
    Height = 29
    Caption = 'Clanska Karta'
    Default = True
    TabOrder = 11
    OnClick = BitBtn2Click
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit9: TDBEdit
    Left = 94
    Top = 188
    Width = 318
    Height = 21
    Color = clInactiveCaptionText
    DataField = 'PaperNum'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
    OnKeyDown = DBEdit1KeyDown
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 4
    Top = 4
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 36
    Top = 4
  end
end
