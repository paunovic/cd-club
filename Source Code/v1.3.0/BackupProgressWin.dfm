object BackupProgressWindow: TBackupProgressWindow
  Left = 335
  Top = 370
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'BackupProgressWindow'
  ClientHeight = 84
  ClientWidth = 262
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
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 8
    Top = 66
    Width = 250
    Height = 14
    BackColor = clCream
    Color = clBlack
    ForeColor = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Progress = 0
  end
  object Label1: TLabel
    Left = 72
    Top = 8
    Width = 125
    Height = 13
    Caption = 'Vrsim bekapovanje baze...'
  end
  object Label3: TLabel
    Left = 8
    Top = 50
    Width = 56
    Height = 13
    Caption = 'Bekapujem '
  end
  object Label4: TLabel
    Left = 8
    Top = 26
    Width = 58
    Height = 13
    Caption = 'Destinacija :'
  end
  object Label5: TLabel
    Left = 70
    Top = 24
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 183
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 0
    OnClick = Button1Click
  end
end
