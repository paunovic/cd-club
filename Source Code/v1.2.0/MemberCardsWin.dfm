object MemberCardsWindow: TMemberCardsWindow
  Left = 338
  Top = 69
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Clanske Karte'
  ClientHeight = 499
  ClientWidth = 307
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
    Left = 36
    Top = 15
    Width = 120
    Height = 13
    Caption = 'Clanska karta clana broj :'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 306
    Height = 413
    TabStop = False
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEnter = DBGrid1Enter
    OnExit = DBGrid1Exit
    OnKeyDown = DBLookupComboBox1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CDID'
        Title.Caption = 'Broj CD-a'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RentDate'
        Title.Caption = 'Datum Uzimanja'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BackDate'
        Title.Caption = 'Datum Vracanja'
        Width = 96
        Visible = True
      end>
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 158
    Top = 11
    Width = 101
    Height = 21
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource2
    TabOrder = 0
    OnClick = DBLookupComboBox1Click
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
    OnKeyDown = DBLookupComboBox1KeyDown
    OnKeyPress = DBLookupComboBox1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 4
    Top = 461
    Width = 123
    Height = 33
    Caption = 'Razduzi CD(ove)'
    TabOrder = 1
    OnClick = BitBtn1Click
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object BitBtn3: TBitBtn
    Left = 220
    Top = 467
    Width = 83
    Height = 27
    TabOrder = 2
    OnKeyDown = DBLookupComboBox1KeyDown
    Kind = bkOK
  end
  object Query1: TQuery
    Active = True
    Filtered = True
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT * FROM bases\Membercard.db ORDER BY RentNum')
    Left = 251
    Top = 419
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 219
    Top = 419
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 251
    Top = 386
  end
  object DataSource2: TDataSource
    DataSet = Table1
    Left = 219
    Top = 386
  end
end
