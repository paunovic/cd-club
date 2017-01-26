object OptionsWindow: TOptionsWindow
  Left = 319
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Opcije'
  ClientHeight = 176
  ClientWidth = 355
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 1
    Width = 162
    Height = 62
    Caption = ' Minimizovanje programa  u '
    TabOrder = 0
    TabStop = True
    object RadioButton1: TRadioButton
      Left = 8
      Top = 18
      Width = 81
      Height = 17
      Hint = 'Minimizovanje programa u System Tray (pored sata)'
      Caption = 'System Tray'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
      OnKeyDown = FormKeyDown
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 36
      Width = 65
      Height = 17
      Hint = 
        'Minimizovanje programa u TaskBar (normalno, kao i vecina program' +
        'a)'
      Caption = 'TaskBar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      OnKeyDown = FormKeyDown
    end
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Potvrdi'
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 275
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 5
    Kind = bkCancel
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 63
    Width = 162
    Height = 79
    Caption = ' Bekap '
    TabOrder = 2
    TabStop = True
    object Label1: TLabel
      Left = 6
      Top = 22
      Width = 117
      Height = 13
      Hint = 
        'Stepen kompresije bekap fajla. 0 = Nema kompresije, 9 = Maksimal' +
        'na kompresija'
      Caption = 'Stepen kompresije (0-9) :'
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 6
      Top = 51
      Width = 43
      Height = 13
      Hint = 'Sticenje bekapa lozinkom. Prazno polje = nema sticenja'
      Caption = 'Lozinka :'
      ParentShowHint = False
      ShowHint = True
    end
    object SpinEdit1: TSpinEdit
      Left = 125
      Top = 19
      Width = 31
      Height = 22
      Hint = 
        'Stepen kompresije bekap fajla. 0 = Nema kompresije, 9 = Maksimal' +
        'na kompresija'
      MaxLength = 1
      MaxValue = 9
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 7
      OnEnter = SpinEdit1Enter
      OnExit = SpinEdit1Exit
      OnKeyDown = FormKeyDown
    end
    object Edit1: TEdit
      Left = 51
      Top = 48
      Width = 105
      Height = 21
      Hint = 'Sticenje bekapa lozinkom. Prazno polje = nema sticenja'
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 1
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
    end
  end
  object GroupBox3: TGroupBox
    Left = 170
    Top = 40
    Width = 181
    Height = 44
    Caption = ' Ostale opcije '
    TabOrder = 3
    TabStop = True
    object CheckBox1: TCheckBox
      Left = 8
      Top = 19
      Width = 114
      Height = 17
      Caption = 'Prikazi uvodni ekran'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
  end
  object GroupBox4: TGroupBox
    Left = 170
    Top = 1
    Width = 181
    Height = 39
    Hint = 'Dani kada se CD-ovi koji je neki clan iznajmio ne naplacuju'
    Caption = ' "Besplatni" dani '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object Label3: TLabel
      Tag = 2
      Left = 8
      Top = 16
      Width = 9
      Height = 16
      Caption = 'P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
    object Label4: TLabel
      Tag = 3
      Left = 19
      Top = 16
      Width = 10
      Height = 16
      Caption = 'U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
    object Label6: TLabel
      Tag = 5
      Left = 42
      Top = 16
      Width = 9
      Height = 16
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
    object Label5: TLabel
      Tag = 4
      Left = 31
      Top = 16
      Width = 9
      Height = 16
      Caption = 'S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
    object Label9: TLabel
      Tag = 1
      Left = 76
      Top = 16
      Width = 10
      Height = 16
      Caption = 'N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
    object Label8: TLabel
      Tag = 7
      Left = 65
      Top = 16
      Width = 9
      Height = 16
      Caption = 'S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
    object Label7: TLabel
      Tag = 6
      Left = 54
      Top = 16
      Width = 9
      Height = 16
      Caption = 'P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label9Click
    end
  end
end
