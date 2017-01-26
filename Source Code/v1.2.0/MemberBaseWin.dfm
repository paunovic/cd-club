object MemberBaseWindow: TMemberBaseWindow
  Left = -2
  Top = -3
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Lista Clanova'
  ClientHeight = 721
  ClientWidth = 1024
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 789
    Height = 721
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
    TabOrder = 7
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Title.Caption = 'Ime'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        Title.Caption = 'Prezime'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Title.Caption = 'Adresa Stanovanja'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PhoneNumber'
        Title.Caption = 'Broj Telefona'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 82
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 792
    Top = 1
    Width = 222
    Height = 200
    Caption = ' Pretraga '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 27
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
      Width = 23
      Height = 13
      Caption = 'Ime :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 43
      Height = 13
      Caption = 'Prezime :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 12
      Top = 96
      Width = 39
      Height = 13
      Caption = 'Adresa :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 9
      Top = 120
      Width = 42
      Height = 13
      Caption = 'Telefon :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
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
      Left = 55
      Top = 21
      Width = 161
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
      Left = 55
      Top = 45
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 1
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
    object Edit4: TEdit
      Left = 55
      Top = 93
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 3
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
    object Edit5: TEdit
      Left = 55
      Top = 117
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 4
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
    object ComboBox1: TComboBox
      Left = 55
      Top = 141
      Width = 161
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
        'Aktivan'
        'Neaktivan')
    end
    object Button1: TButton
      Left = 137
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
      TabOrder = 6
      OnClick = Button1Click
      OnKeyDown = FormKeyDown
    end
    object Edit3: TEdit
      Left = 55
      Top = 69
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 2
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
  end
  object BitBtn1: TBitBtn
    Left = 793
    Top = 215
    Width = 108
    Height = 32
    Hint = 'Unos podataka za novog clana'
    Caption = 'Novi Clan (F8)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn1Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn2: TBitBtn
    Left = 906
    Top = 215
    Width = 108
    Height = 32
    Hint = 'Menjanje podataka vec postojecih clanova'
    Caption = 'Izmeni Podatke'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn2Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn3: TBitBtn
    Left = 793
    Top = 351
    Width = 221
    Height = 36
    Hint = 
      'Stampanje liste clanova. Pretraga utice na sadrzaj liste koja ce' +
      ' se stampati.'
    Caption = 'Odstampaj Listu (F5)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = False
    OnClick = BitBtn3Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn4: TBitBtn
    Left = 793
    Top = 391
    Width = 221
    Height = 36
    Hint = 
      'Snimanje liste clanova u Excel formatu. Pretraga utice na sadrza' +
      'j liste koja ce se snimiti.'
    Caption = 'Snimi Listu (F6)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    TabStop = False
    OnClick = BitBtn4Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn5: TBitBtn
    Left = 793
    Top = 463
    Width = 221
    Height = 36
    Hint = 'Detaljne informacije o oznacenom clanu'
    Caption = 'Detaljne Informacije'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn5Click
    OnKeyDown = FormKeyDown
  end
  object BitBtn6: TBitBtn
    Left = 793
    Top = 275
    Width = 221
    Height = 48
    Hint = 'Clanska karta oznacenog clana'
    Caption = 'Clanska Karta (F3)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = BitBtn6Click
    OnKeyDown = FormKeyDown
  end
  object Query1: TQuery
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT * FROM bases\Members.db ORDER BY IDNum')
    Left = 736
    Top = 680
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 704
    Top = 680
  end
end
