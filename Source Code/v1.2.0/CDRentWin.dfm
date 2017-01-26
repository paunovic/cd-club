object CDRentWindow: TCDRentWindow
  Left = 174
  Top = 147
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Izdavanje CD-ova'
  ClientHeight = 450
  ClientWidth = 667
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
    Width = 93
    Height = 13
    Caption = 'Prisutni CD-ovi :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 352
    Top = 8
    Width = 122
    Height = 13
    Caption = 'CD-ovi za izdavanje :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 444
    Top = 344
    Width = 77
    Height = 13
    Caption = 'Izdaj clanu broj :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 318
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
    Left = 318
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
  object SpeedButton3: TSpeedButton
    Left = 318
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
  object SpeedButton4: TSpeedButton
    Left = 628
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
  object Label6: TLabel
    Left = 484
    Top = 369
    Width = 37
    Height = 13
    Caption = 'Datum :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
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
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEnter = DBGrid1Enter
    OnExit = DBGrid1Exit
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'IDNum'
        Title.Caption = 'Broj'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Title.Caption = 'Naziv'
        Width = 225
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 524
    Top = 342
    Width = 100
    Height = 21
    MaxLength = 5
    TabOrder = 0
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
    OnKeyPress = Edit2KeyPress
  end
  object BitBtn2: TBitBtn
    Left = 464
    Top = 415
    Width = 93
    Height = 29
    Caption = 'Potvrdi'
    Enabled = False
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 565
    Top = 415
    Width = 93
    Height = 29
    Caption = 'Odustani'
    TabOrder = 5
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 331
    Width = 244
    Height = 75
    Caption = ' Pretraga '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Label4: TLabel
      Left = 15
      Top = 23
      Width = 24
      Height = 13
      Caption = 'Broj :'
    end
    object Label5: TLabel
      Left = 6
      Top = 47
      Width = 33
      Height = 13
      Caption = 'Naziv :'
    end
    object Edit2: TEdit
      Left = 42
      Top = 20
      Width = 194
      Height = 21
      MaxLength = 5
      TabOrder = 0
      OnChange = Edit2Change
      OnEnter = Edit2Enter
      OnExit = Edit2Exit
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 42
      Top = 44
      Width = 194
      Height = 21
      MaxLength = 60
      TabOrder = 1
      OnChange = Edit3Change
      OnEnter = Edit2Enter
      OnExit = Edit2Exit
    end
  end
  object StringGrid1: TStringGrid
    Left = 352
    Top = 24
    Width = 306
    Height = 305
    ColCount = 2
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 2
    OnEnter = StringGrid1Enter
    OnExit = StringGrid1Exit
  end
  object Edit4: TMaskEdit
    Left = 524
    Top = 366
    Width = 100
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
    OnEnter = Edit4Enter
    OnExit = Edit4Exit
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 285
    Top = 331
  end
  object Table3: TTable
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 285
    Top = 362
  end
  object Table2: TTable
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 253
    Top = 362
  end
  object Table4: TTable
    SessionName = 'Default'
    TableName = 'bases\Membercard.db'
    Left = 320
    Top = 362
  end
  object Table1: TTable
    Filter = 'Status = '#39'Prisutan'#39
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 253
    Top = 331
  end
  object Query1: TQuery
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      
        'SELECT * FROM bases\Membercard.db WHERE MemberID=1 ORDER BY Rent' +
        'Num')
    Left = 320
    Top = 331
  end
end
