object CDBackWindow: TCDBackWindow
  Left = 306
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Razduzivanje CD-ova'
  ClientHeight = 408
  ClientWidth = 661
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
    Left = 6
    Top = 8
    Width = 110
    Height = 13
    Caption = 'Iznajmljeni CD-ovi :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 350
    Top = 8
    Width = 139
    Height = 13
    Caption = 'CD-ovi za razduzivanje :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 386
    Top = 344
    Width = 132
    Height = 13
    Caption = 'Razduzi CD-ove clana broj :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 317
    Top = 24
    Width = 27
    Height = 25
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 317
    Top = 48
    Width = 27
    Height = 25
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 317
    Top = 304
    Width = 27
    Height = 25
    Caption = '<<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 626
    Top = 338
    Width = 30
    Height = 29
    Hint = 'Prikazi detaljne informacije o korisniku'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C070000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5BAB5C2B5
      B0C4B5B0C4B5B1C9BBB8E1D8D6FFFFFFFFFFFFBBBBBB00000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFD4B2
      A8CFAA9FC18472B2624DB66552B96655BB6858B36350B37665CDB2ABE2D7D3BB
      BBBB000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFCD8878B43718C2350DD33D1ADC4629DF4D33E1543CE5533CD5
      4C2ABE481BC75434D3745DECD8D3FFFFFF333333000000000000777777FFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFC65033CD2100F65D3CFF6752FF
      6F5CFF7764FF816FFC755FEF8059E79B67F0815BFF8D79FBAB9FFAF4F2444444
      000000000000888888FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFC9
      6A4DD63A18FE6450FF6E5CFF7762FE826DF57B61E1744EE3A473F1D6A1E7A27A
      F59986FFB8B1FFF6F6444444000000000000888888FFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFD1B1A9CE5C4AF95F4EFF7864FE846CFD8D71E97A51
      E2955DF6DBA0FBEEB9EBB88BED9E84FBB9B0FFF6F64444440000000000008888
      88FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFCDA19FD75C4E
      FF7E69FF9174FD8A60F18D57F7BB7EFFEEB1FFECB0F4BF8CEFA789FDD2CBFFF6
      F5444444000000000000888888FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFDAD5D6C68378F77D62FF8A68E8744EDC8B68DAA98DE0B99AEEC5
      99F4B888F9BFA5CCCCCC444444111111000000000000888888FFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC5BED3795BCD5C3A8A40
      4665456F5847805D487C896980CB8D7AF6B9A3BBBBBB00000000000000000000
      0000888888FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC3BDBD654638531B081F0D380312760014890113821B2281624572AE8283EE
      EEEEBBBBBB888888666666111111888888FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFBBC0C53C484F08090902000600114D0327900731A308
      319E042C9D14278A576190FFFFFFFFFFFFFFFFFFCCCCCCCCCCCCFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFA5A9AC21252700040700010807
      1B4A113B931948B11A4AAF1A4AAD1B4DB41444B23A5CA2D0D8DFFFFFFF777777
      000000000000777777FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFC2CFD83D
      41440000000E0C080B13241845A21E58C3205CC2215BBD2058BD245DC02460C8
      2B5AB097A9C2FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFF7C909F2D34360F0D0A1D1B1910203E215DC42162CD2164CB
      2266CD2265CE2567CC286CD22660BF5F7EAAECF0F37777770000000000007777
      77FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF636A703034341F1D1A24201C
      18263D256BD12873DD2874DA2777DD2777DF2A77DE297AE0276CCC4A72A9CCD6
      E1FFFFFFCCCCCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      6A6867393A392A2A29312C24222C391F67C62E8AF73394FA3495F63394F63290
      F52F8BF42A7BDB4672ABC1CDDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFF949594454645282828403E3A32383E1747842178
      DC2C91FF369CFF3BA2FF3AA5FF37A3FF288AED3F72ACBBC8D5FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFD4D4D45D5D5D2323
      234D4D4B464545262F3C1D48841D5BBD2467D32977DE338EF13095F31B72CC62
      87B1D5DCE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFD4D4D46261614D4D4E4E4F4C565550525357383D4E1925540C
      26791841A7113D9F263869BFC5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFBDBDBE3D3E4056585A67
      6565817F7B948F8C8683875F606E393F5213172A35353CCACACCFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFAEAFAF52535373737290908EA4A3A2A8A6A28C8A8547433D2D2923
      BCBBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0CFB9B9B98483827F7E7F
      7F80808C8D8DB0AFAFC8C9C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAAAAAA979696949494C1C1C1FEFEFEFEFEFEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 24
    Width = 306
    Height = 305
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEnter = DBGrid1Enter
    OnExit = DBGrid1Exit
    Columns = <
      item
        Expanded = False
        FieldName = 'CDID'
        Title.Caption = 'Broj'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RentDate'
        Title.Caption = 'Datum Uzimanja'
        Width = 215
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 520
    Top = 342
    Width = 102
    Height = 21
    MaxLength = 5
    TabOrder = 1
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn2: TBitBtn
    Left = 564
    Top = 375
    Width = 93
    Height = 29
    Caption = 'Potvrdi'
    Enabled = False
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 467
    Top = 375
    Width = 93
    Height = 29
    Caption = 'Odustani'
    TabOrder = 3
    Kind = bkCancel
  end
  object StringGrid1: TStringGrid
    Left = 350
    Top = 24
    Width = 306
    Height = 305
    ColCount = 2
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 4
    OnEnter = StringGrid1Enter
    OnExit = StringGrid1Exit
  end
  object Table1: TTable
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\Membercard.DB'
    Left = 252
    Top = 331
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 284
    Top = 331
  end
  object Table2: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\CDBase.DB'
    Left = 252
    Top = 362
  end
  object Table3: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 284
    Top = 362
  end
  object Table4: TTable
    Active = True
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SessionName = 'Default'
    TableName = 'bases\Membercard.DB'
    Left = 316
    Top = 362
  end
end
