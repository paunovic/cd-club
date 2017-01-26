object CDBaseWindow: TCDBaseWindow
  Left = -4
  Top = -4
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Trenutno Stanje'
  ClientHeight = 712
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 789
    Height = 712
    Align = alLeft
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
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEnter = DBGrid1Enter
    OnExit = DBGrid1Exit
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'IDNum'
        Title.Caption = 'Broj'
        Title.Color = clGray
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Title.Caption = 'Naziv'
        Width = 288
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kind'
        Title.Caption = 'Tip'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Title.Caption = 'Opis'
        Width = 246
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CDAmount'
        Title.Caption = 'Kolicina'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 792
    Top = 1
    Width = 222
    Height = 202
    Caption = ' Pretraga '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 24
      Width = 24
      Height = 13
      Caption = 'Broj :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 28
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Naziv :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 72
      Width = 21
      Height = 13
      Caption = 'Tip :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 34
      Top = 96
      Width = 27
      Height = 13
      Caption = 'Opis :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 18
      Top = 120
      Width = 43
      Height = 13
      Caption = 'Kolicina :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 25
      Top = 144
      Width = 36
      Height = 13
      Caption = 'Status :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 65
      Top = 21
      Width = 149
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 65
      Top = 45
      Width = 149
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      TabOrder = 1
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
    object Edit4: TEdit
      Left = 65
      Top = 93
      Width = 149
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 3
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
    object Edit5: TEdit
      Left = 65
      Top = 117
      Width = 149
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 4
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object ComboBox1: TComboBox
      Left = 65
      Top = 141
      Width = 149
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 5
      Text = 'Svi'
      OnChange = Edit1Change
      OnEnter = ComboBox1Enter
      OnExit = ComboBox1Exit
      OnKeyDown = ComboBox1KeyDown
      Items.Strings = (
        'Svi'
        'Prisutan'
        'Izdat')
    end
    object ComboBox2: TComboBox
      Left = 65
      Top = 69
      Width = 149
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Svi'
      OnChange = Edit1Change
      OnEnter = ComboBox1Enter
      OnExit = ComboBox1Exit
      OnKeyDown = ComboBox2KeyDown
      Items.Strings = (
        'Svi'
        'Akcije'
        'Sport'
        'Avanture'
        'Strategije'
        'Logicke'
        'Decije'
        'Platforme'
        'Voznje'
        'Simulacije'
        'Kompilacije'
        'Filmovi'
        'Muzika'
        'Software'
        'Ostalo')
    end
    object Button1: TButton
      Left = 136
      Top = 168
      Width = 78
      Height = 25
      Caption = 'Nova pretraga'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Button1Click
      OnKeyDown = FormKeyDown
    end
  end
  object BitBtn2: TBitBtn
    Left = 905
    Top = 212
    Width = 108
    Height = 32
    Hint = 'Menjanje podataka vec postojecih CD-ova'
    Caption = 'Izmeni Podatke'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn2Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn3: TBitBtn
    Left = 792
    Top = 383
    Width = 221
    Height = 36
    Hint = 
      'Stampanje liste CD-ova. Pretraga utice na sadrzaj liste koja ce ' +
      'se stampati.'
    Caption = 'Odstampaj Listu (F5)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    TabStop = False
    OnClick = BitBtn3Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn4: TBitBtn
    Left = 792
    Top = 212
    Width = 108
    Height = 32
    Hint = 'Unos podataka za novi CD'
    Caption = 'Novi CD (F8)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn4Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn5: TBitBtn
    Left = 792
    Top = 258
    Width = 221
    Height = 50
    Hint = 'Izdavanje CD(ova)'
    Caption = 'Izdaj CD (F1)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = BitBtn5Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn6: TBitBtn
    Left = 792
    Top = 422
    Width = 221
    Height = 36
    Hint = 
      'Snimanje liste CD-ova u Excel formatu. Pretraga utice na sadrzaj' +
      ' liste koja ce se snimiti.'
    Caption = 'Snimi Listu (F6)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn6Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn8: TBitBtn
    Left = 792
    Top = 311
    Width = 221
    Height = 50
    Hint = 'Razduzivanje CD(ova)'
    Caption = 'Razduzi CD (F2)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = False
    OnClick = BitBtn8Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn7: TBitBtn
    Left = 792
    Top = 483
    Width = 221
    Height = 36
    Hint = 'Detaljne informacije o oznacenom CD-u'
    Caption = 'Detaljne Informacije'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TabStop = False
    OnClick = BitBtn7Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 792
    Top = 530
    Width = 221
    Height = 36
    Hint = 'Brisanje oznacenog CD-a'
    Caption = 'Izbrisi CD'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    TabStop = False
    OnClick = BitBtn1Click
    OnKeyDown = FormKeyDown
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 740
    Top = 680
  end
  object Query1: TQuery
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT * FROM bases\CDBase.db ORDER BY IDNum')
    Left = 708
    Top = 680
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 740
    Top = 649
  end
end
