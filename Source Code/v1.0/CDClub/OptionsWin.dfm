object OptionsWindow: TOptionsWindow
  Left = 319
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Opcije'
  ClientHeight = 188
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
    Height = 71
    Caption = ' Minimizovanje programa  u '
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 8
      Top = 21
      Width = 81
      Height = 17
      Hint = 'Minimizovanje programa u System Tray (pored sata)'
      Caption = 'System Tray'
      Color = clBtnFace
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 41
      Width = 65
      Height = 17
      Hint = 
        'Minimizovanje programa u TaskBar (normalno, kao i vecina program' +
        'a)'
      Caption = 'TaskBar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
  end
  object BitBtn1: TBitBtn
    Left = 276
    Top = 159
    Width = 75
    Height = 25
    Caption = 'Potvrdi'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 196
    Top = 159
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 2
    Kind = bkCancel
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 73
    Width = 162
    Height = 79
    Caption = ' Bekap '
    TabOrder = 3
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
      MaxValue = 9
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0
      OnEnter = SpinEdit1Enter
      OnExit = SpinEdit1Exit
      OnKeyDown = FormKeyDown
    end
    object Edit1: TEdit
      Left = 51
      Top = 49
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
    Top = 1
    Width = 181
    Height = 56
    Caption = ' Ostale opcije '
    TabOrder = 4
    object CheckBox1: TCheckBox
      Left = 8
      Top = 19
      Width = 114
      Height = 17
      Caption = 'Prikazi uvodni ekran'
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
  end
end
