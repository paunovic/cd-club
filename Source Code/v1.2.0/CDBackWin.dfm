object CDBackWindow: TCDBackWindow
  Left = 306
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Razduzivanje CD-ova'
  ClientHeight = 425
  ClientWidth = 661
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
    Left = 6
    Top = 8
    Width = 110
    Height = 13
    Caption = 'Iznajmljeni CD-ovi :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 350
    Top = 8
    Width = 139
    Height = 13
    Caption = 'CD-ovi za razduzivanje :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 386
    Top = 344
    Width = 132
    Height = 13
    Caption = 'Razduzi CD-ove clana broj :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 317
    Top = 24
    Width = 27
    Height = 25
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 317
    Top = 48
    Width = 27
    Height = 25
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton4: TSpeedButton
    Left = 626
    Top = 338
    Width = 30
    Height = 29
    Hint = 'Prikazi detaljne informacije o korisniku'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 317
    Top = 280
    Width = 27
    Height = 25
    Caption = '>>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton5Click
  end
  object SpeedButton3: TSpeedButton
    Left = 317
    Top = 304
    Width = 27
    Height = 25
    Caption = '<<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object Label4: TLabel
    Left = 456
    Top = 368
    Width = 71
    Height = 13
    Caption = 'Za placanje : 0'
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 24
    Width = 306
    Height = 305
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
    Columns = <
      item
        Expanded = False
        FieldName = 'CDID'
        Title.Caption = 'Broj'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RentDate'
        Title.Caption = 'Datum Uzimanja'
        Width = 215
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 520
    Top = 342
    Width = 102
    Height = 21
    MaxLength = 5
    TabOrder = 0
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn2: TBitBtn
    Left = 463
    Top = 391
    Width = 93
    Height = 29
    Caption = 'Potvrdi'
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 563
    Top = 391
    Width = 93
    Height = 29
    Caption = 'Odustani'
    TabOrder = 2
    Kind = bkCancel
  end
  object StringGrid1: TStringGrid
    Left = 350
    Top = 24
    Width = 306
    Height = 305
    ColCount = 2
    Ctl3D = True
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    TabOrder = 4
    OnEnter = StringGrid1Enter
    OnExit = StringGrid1Exit
  end
  object Table1: TTable
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\Membercard.DB'
    Left = 252
    Top = 331
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 284
    Top = 331
  end
  object Table2: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 252
    Top = 362
  end
  object Table3: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 284
    Top = 362
  end
  object Table4: TTable
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\Membercard.DB'
    Left = 316
    Top = 362
  end
end
