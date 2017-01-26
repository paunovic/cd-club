object ProgramUpdateWindow: TProgramUpdateWindow
  Left = 330
  Top = 198
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Azuriranje Programa'
  ClientHeight = 234
  ClientWidth = 214
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
  object Label2: TLabel
    Left = 8
    Top = 116
    Width = 142
    Height = 13
    Caption = 'Zadnji put program je azuriran '
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 199
    Height = 104
    Cursor = crArrow
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Ova opcija Vam omogucava da azurirate'
      'program. Nova verzija programa ce se'
      'automatski skinuti od interneta i instalirati'
      'na Vas racunar. Ukoliko koristite neki'
      'firewall, morate dopusiti programu pristup'
      'internetu kako bi on mogao da skine novu'
      'verziju. Takodje, morate biti konektovani'
      'na internet.')
    ReadOnly = True
    TabOrder = 0
    OnEnter = Memo1Enter
  end
  object BitBtn1: TBitBtn
    Left = 135
    Top = 206
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 53
    Top = 206
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 136
    Width = 203
    Height = 59
    Caption = ' Program se azurira  '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Gauge1: TGauge
      Left = 7
      Top = 35
      Width = 189
      Height = 16
      BackColor = clSilver
      Color = clSilver
      ForeColor = clSkyBlue
      ParentColor = False
      Progress = 0
    end
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 3
      Height = 13
    end
  end
end
