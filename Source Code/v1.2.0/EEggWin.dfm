object EEggWindow: TEEggWindow
  Left = 361
  Top = 273
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = ':-)'
  ClientHeight = 92
  ClientWidth = 192
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = Label1Click
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = -9
    Width = 187
    Height = 111
    Caption = 'E+A'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -96
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label1Click
  end
end
