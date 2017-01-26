object ReportWindow: TReportWindow
  Left = -4
  Top = -4
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Izvestaj'
  ClientHeight = 712
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 6
    Top = 1
    Width = 505
    Height = 569
    Caption = ' Izdati CD-ovi '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 550
      Width = 117
      Height = 13
      Caption = 'Ukupno Izdatih CD-ova :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 127
      Top = 550
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 7
      Top = 17
      Width = 490
      Height = 530
      Align = alCustom
      Ctl3D = False
      DataSource = DataSource1
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
      OnKeyDown = FormKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CDID'
          Title.Caption = 'Broj CD-a'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MemberID'
          Title.Caption = 'Broj Clana'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RentDate'
          Title.Caption = 'Datum Izdavanja'
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RentTime'
          Title.Caption = 'Vreme Izdavanja'
          Width = 166
          Visible = True
        end>
    end
  end
  object GroupBox4: TGroupBox
    Left = 515
    Top = 1
    Width = 505
    Height = 569
    Caption = ' Razduzeni CD-ovi '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 152
      Top = 550
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 550
      Width = 142
      Height = 13
      Caption = 'Ukupno Razduzenih CD-ova :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 206
      Top = 550
      Width = 81
      Height = 13
      Caption = 'Ukupna Zarada :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 290
      Top = 550
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 17
      Width = 490
      Height = 530
      Align = alCustom
      Ctl3D = False
      DataSource = DataSource2
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
      OnKeyDown = FormKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CDID'
          Title.Caption = 'Br. CD-a'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MemberID'
          Title.Caption = 'Br. Clana'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RentDate'
          Title.Caption = 'Dat. Izdavanja'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RentTime'
          Title.Caption = 'Vr. Izdavanja'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BackDate'
          Title.Caption = 'Dat. Razduz.'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BackTime'
          Title.Caption = 'Vr. Razduz.'
          Width = 77
          Visible = True
        end>
    end
  end
  object GroupBox5: TGroupBox
    Left = 378
    Top = 574
    Width = 297
    Height = 128
    Caption = ' Vremenski Period '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object GroupBox6: TGroupBox
      Left = 12
      Top = 68
      Width = 273
      Height = 49
      Caption = ' Vreme (HH:MM)'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 22
        Width = 22
        Height = 13
        Caption = 'OD :'
      end
      object Label6: TLabel
        Left = 143
        Top = 22
        Width = 22
        Height = 13
        Caption = 'DO :'
      end
      object DateTimePicker3: TDateTimePicker
        Left = 33
        Top = 19
        Width = 101
        Height = 21
        Date = 38178.000000000000000000
        Format = 'HH:mm'
        Time = 38178.000000000000000000
        Kind = dtkTime
        TabOrder = 0
        OnChange = DateTimePicker1Change
        OnEnter = DateTimePicker1Enter
        OnExit = DateTimePicker1Exit
        OnKeyDown = FormKeyDown
      end
      object DateTimePicker4: TDateTimePicker
        Left = 168
        Top = 19
        Width = 101
        Height = 21
        Date = 38178.000000000000000000
        Format = 'HH:mm'
        Time = 38178.000000000000000000
        Kind = dtkTime
        TabOrder = 1
        OnChange = DateTimePicker1Change
        OnEnter = DateTimePicker1Enter
        OnExit = DateTimePicker1Exit
        OnKeyDown = FormKeyDown
      end
    end
    object GroupBox7: TGroupBox
      Left = 12
      Top = 19
      Width = 273
      Height = 48
      Caption = ' Datum (DD/MM/YYYY) '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object Label7: TLabel
        Left = 8
        Top = 22
        Width = 22
        Height = 13
        Caption = 'OD :'
      end
      object Label8: TLabel
        Left = 143
        Top = 22
        Width = 22
        Height = 13
        Caption = 'DO :'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 33
        Top = 19
        Width = 101
        Height = 21
        Date = 38178.000000000000000000
        Format = 'dd/MM/yyyy'
        Time = 38178.000000000000000000
        TabOrder = 0
        OnChange = DateTimePicker1Change
        OnEnter = DateTimePicker1Enter
        OnExit = DateTimePicker1Exit
        OnKeyDown = FormKeyDown
      end
      object DateTimePicker2: TDateTimePicker
        Left = 168
        Top = 19
        Width = 101
        Height = 21
        Date = 38178.000000000000000000
        Format = 'dd/MM/yyyy'
        Time = 38178.000000000000000000
        TabOrder = 1
        OnChange = DateTimePicker1Change
        OnEnter = DateTimePicker1Enter
        OnExit = DateTimePicker1Exit
        OnKeyDown = FormKeyDown
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 444
    Top = 536
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 954
    Top = 537
  end
  object Query2: TQuery
    Active = True
    Filter = 'Backed = TRUE'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT * FROM bases\MemberCard.db WHERE BackDate BETWEEN :BeginD' +
        'ate AND :EndDate AND BackTime BETWEEN :BeginTime AND :EndTime OR' +
        'DER BY CDID')
    Left = 987
    Top = 537
    ParamData = <
      item
        DataType = ftDate
        Name = 'BeginDate'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'EndDate'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftTime
        Name = 'BeginTime'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftTime
        Name = 'EndTime'
        ParamType = ptUnknown
        Value = 0d
      end>
  end
  object Query1: TQuery
    Active = True
    Filter = 'Backed = FALSE'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT * FROM bases\MemberCard.db WHERE RentDate BETWEEN :BeginD' +
        'ate AND :EndDate AND RentTime BETWEEN :BeginTime AND :EndTime OR' +
        'DER BY CDID')
    Left = 475
    Top = 536
    ParamData = <
      item
        DataType = ftDate
        Name = 'BeginDate'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'EndDate'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftTime
        Name = 'BeginTime'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftTime
        Name = 'EndTime'
        ParamType = ptUnknown
        Value = 0d
      end>
  end
end
