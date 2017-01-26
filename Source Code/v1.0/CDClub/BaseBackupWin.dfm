object BaseBackupWindow: TBaseBackupWindow
  Left = 232
  Top = 229
  Width = 539
  Height = 157
  Caption = 'Bekapovanje Baze'
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
  object GroupBox1: TGroupBox
    Left = 426
    Top = 2
    Width = 103
    Height = 85
    Caption = ' Uradi bekap : '
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 8
      Top = 18
      Width = 57
      Height = 17
      Caption = 'CD-ova'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 39
      Width = 57
      Height = 17
      Caption = 'Clanova'
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 60
      Width = 67
      Height = 17
      Caption = 'Operatera'
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 2
    Width = 420
    Height = 84
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 112
      Height = 13
      Caption = 'Putanja do bekap fajla :'
    end
    object Edit1: TEdit
      Left = 126
      Top = 14
      Width = 286
      Height = 21
      Color = clInactiveCaptionText
      ReadOnly = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 331
      Top = 41
      Width = 82
      Height = 27
      Caption = 'Izaberi putanju'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 453
    Top = 93
    Width = 75
    Height = 27
    Caption = 'Potvrdi'
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 371
    Top = 93
    Width = 75
    Height = 27
    Caption = 'Odustani'
    TabOrder = 3
    Kind = bkCancel
  end
  object Button2: TButton
    Left = 4
    Top = 93
    Width = 75
    Height = 27
    Hint = 'Podesavanje stepena kompresije itd...'
    Caption = 'Opcije'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button2Click
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'zip'
    Filter = 'ZIP Arhiva (*.zip)|*.ZIP'
    Options = [ofEnableSizing]
    Left = 8
    Top = 48
  end
  object Archiver: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clMax
    CompressionMode = 7
    CurrentVersion = '2.52 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = True
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.Recurse = False
    Options.StorePath = spNoPath
    Options.CreateDirs = False
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    OnFileProgress = ArchiverFileProgress
    Zip64Mode = zmAuto
    Left = 336
    Top = 92
  end
end
