object AdminWindow: TAdminWindow
  Left = -4
  Top = -4
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Administratorski Meni'
  ClientHeight = 712
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1024
    Height = 712
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'CD-ovi'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 684
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Clanovi'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 684
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Operateri'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 684
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DataSource3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Clanske Karte'
      ImageIndex = 3
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 684
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DataSource4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Crypter'
      ImageIndex = 4
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 33
        Height = 13
        Caption = 'Tekst :'
      end
      object Edit2: TEdit
        Left = 46
        Top = 71
        Width = 961
        Height = 21
        TabOrder = 3
      end
      object CheckBox1: TCheckBox
        Left = 46
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Prikazi tekst'
        TabOrder = 4
        OnEnter = CheckBox1Enter
        OnExit = CheckBox1Enter
      end
      object Edit1: TEdit
        Left = 46
        Top = 13
        Width = 961
        Height = 21
        PasswordChar = '*'
        TabOrder = 0
      end
      object Button1: TButton
        Left = 852
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Dekriptuj'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button2: TButton
        Left = 932
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Enkriptuj'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 962
    Top = 672
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 930
    Top = 672
  end
  object Table2: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 930
    Top = 640
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 962
    Top = 640
  end
  object Table3: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Opers.DB'
    Left = 930
    Top = 608
  end
  object DataSource3: TDataSource
    DataSet = Table3
    Left = 962
    Top = 608
  end
  object Table4: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Membercard.DB'
    Left = 930
    Top = 576
  end
  object DataSource4: TDataSource
    DataSet = Table4
    Left = 962
    Top = 576
  end
end
