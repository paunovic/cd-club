object Top10CDWindow: TTop10CDWindow
  Left = 217
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Top 10 CD-ova'
  ClientHeight = 276
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 252
    Width = 234
    Height = 13
    Caption = 'Dupli klik na neki CD za vise informacija.'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 300
    Top = 247
    Width = 75
    Height = 25
    Caption = 'Nazad'
    TabOrder = 0
    OnKeyDown = FormKeyDown
    Kind = bkOK
  end
  object StringGrid1: TStringGrid
    Left = 7
    Top = 8
    Width = 368
    Height = 234
    ColCount = 3
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 1
    OnDblClick = StringGrid1DblClick
    OnEnter = StringGrid1Enter
    OnExit = StringGrid1Exit
    ColWidths = (
      64
      208
      90)
  end
  object Query1: TQuery
    Filter = 'TimesRented > 0'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT * FROM bases\CDBase.DB ORDER BY TimesRented DESC')
    Left = 37
    Top = 1
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 5
    Top = 1
  end
end
