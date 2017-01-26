object MemberNewWindow: TMemberNewWindow
  Left = 228
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Upisivanje Novog Clana'
  ClientHeight = 239
  ClientWidth = 349
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
    Left = 60
    Top = 12
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 61
    Top = 44
    Width = 23
    Height = 13
    Caption = 'Ime :'
  end
  object Label3: TLabel
    Left = 41
    Top = 68
    Width = 43
    Height = 13
    Caption = 'Prezime :'
  end
  object Label4: TLabel
    Left = 45
    Top = 92
    Width = 39
    Height = 13
    Caption = 'Adresa :'
  end
  object Label5: TLabel
    Left = 4
    Top = 116
    Width = 80
    Height = 13
    Caption = 'Mesto Rodjenja :'
  end
  object Label6: TLabel
    Left = 2
    Top = 140
    Width = 82
    Height = 13
    Caption = 'Datum Rodjenja :'
  end
  object Label8: TLabel
    Left = 15
    Top = 164
    Width = 69
    Height = 13
    Caption = 'Broj Telefona :'
  end
  object Label7: TLabel
    Left = 3
    Top = 188
    Width = 81
    Height = 13
    Caption = 'Broj Licne Karte :'
  end
  object Edit1: TEdit
    Left = 86
    Top = 9
    Width = 70
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    MaxLength = 5
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 86
    Top = 41
    Width = 257
    Height = 21
    MaxLength = 20
    TabOrder = 1
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 86
    Top = 65
    Width = 257
    Height = 21
    MaxLength = 20
    TabOrder = 2
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Edit4: TEdit
    Left = 86
    Top = 89
    Width = 257
    Height = 21
    MaxLength = 40
    TabOrder = 3
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Edit5: TEdit
    Left = 86
    Top = 113
    Width = 257
    Height = 21
    MaxLength = 20
    TabOrder = 4
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Edit7: TEdit
    Left = 86
    Top = 161
    Width = 257
    Height = 21
    MaxLength = 30
    TabOrder = 6
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object BitBtn1: TBitBtn
    Left = 189
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Potvrdi'
    TabOrder = 8
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 270
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 9
    Kind = bkCancel
  end
  object Edit8: TEdit
    Left = 86
    Top = 185
    Width = 257
    Height = 21
    MaxLength = 10
    TabOrder = 7
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
    OnKeyPress = Edit8KeyPress
  end
  object Edit6: TDateTimePicker
    Left = 86
    Top = 137
    Width = 258
    Height = 21
    Date = 32715.846990555550000000
    Time = 32715.846990555550000000
    ShowCheckbox = True
    Checked = False
    TabOrder = 5
    OnEnter = Edit6Enter
    OnExit = Edit6Exit
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 310
    Top = 6
  end
end
