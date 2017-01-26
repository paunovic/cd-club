object CDListExportWindow: TCDListExportWindow
  Left = 643
  Top = 68
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Snimanje Liste'
  ClientHeight = 269
  ClientWidth = 333
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
    Left = 8
    Top = 15
    Width = 78
    Height = 13
    Caption = 'Putanja do liste :'
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 235
    Width = 88
    Height = 28
    Caption = 'Potvrdi'
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 238
    Top = 235
    Width = 88
    Height = 28
    Caption = 'Odustani'
    TabOrder = 4
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 78
    Width = 185
    Height = 151
    Caption = ' Lista ce sadrzati sledece podatke : '
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 66
      Height = 17
      Caption = 'Broj'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 35
      Width = 97
      Height = 17
      Caption = 'Naziv'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 54
      Width = 97
      Height = 17
      Caption = 'Tip'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 73
      Width = 97
      Height = 17
      Caption = 'Opis'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 92
      Width = 97
      Height = 17
      Caption = 'Kolicinu'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBox7: TCheckBox
      Left = 8
      Top = 130
      Width = 97
      Height = 17
      Caption = 'Status'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 111
      Width = 97
      Height = 17
      Caption = 'Cenu'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object Edit1: TEdit
    Left = 90
    Top = 13
    Width = 233
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    ReadOnly = True
    TabOrder = 5
    Text = 'C:\Lista CDova.xls'
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
  end
  object Button1: TButton
    Left = 239
    Top = 40
    Width = 85
    Height = 27
    Caption = 'Izaberi putanju'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 195
    Top = 78
    Width = 132
    Height = 151
    Caption = ' Sortiraj listu po : '
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 7
      Top = 17
      Width = 113
      Height = 17
      Caption = 'Broju'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 7
      Top = 36
      Width = 113
      Height = 17
      Caption = 'Nazivu'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 7
      Top = 55
      Width = 113
      Height = 17
      Caption = 'Tipu'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 7
      Top = 74
      Width = 113
      Height = 17
      Caption = 'Opisu'
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 7
      Top = 93
      Width = 113
      Height = 17
      Caption = 'Kolicini'
      TabOrder = 4
    end
    object RadioButton7: TRadioButton
      Left = 7
      Top = 129
      Width = 113
      Height = 17
      Caption = 'Statusu'
      TabOrder = 6
    end
    object RadioButton6: TRadioButton
      Left = 7
      Top = 111
      Width = 113
      Height = 17
      Caption = 'Ceni'
      TabOrder = 5
    end
  end
  object OpExcel1: TOpExcel
    Version = '1.64'
    Visible = False
    WindowState = xlwsMaximized
    ServerLeft = 0
    ServerTop = 0
    ServerHeight = 480
    ServerWidth = 640
    LargeButtons = False
    EnableAnimations = False
    EnableAutoComplete = False
    EnableCancelKey = xlckDisabled
    Workbooks = <
      item
        Worksheets = <
          item
            Ranges = <
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end
              item
                Address = 'A1'
                ClearOnMove = False
                FontColor = clWindowText
                FontSize = 12
                FontAttributes = []
                IndentLevel = 0
                Orientation = xlcoHorizontal
                ShrinkToFit = False
                RotateDegrees = 0
                HorizontalAlignment = xlchaLeft
                VerticalAlignment = xlcvaBottom
                ColumnWidth = 20
                RowHeight = 12
                Color = clWindow
                Pattern = xlipPatternNone
                PatternColor = clWhite
                BorderStyle = xlblsLineStyleNone
                Borders = []
                BorderLineWeight = xlbwHairline
                WrapText = False
              end>
            Hyperlinks = <>
            Charts = <>
          end>
      end>
    Left = 40
    Top = 46
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel Workbook (*.xls)|*.xls'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 8
    Top = 46
  end
  object OpDataSetModel1: TOpDataSetModel
    Version = '1.64'
    Dataset = Query1
    WantFullMemos = False
    Left = 80
    Top = 46
  end
  object Query1: TQuery
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT * FROM bases\CDBase.db ORDER BY IDNum')
    Left = 112
    Top = 46
  end
end
