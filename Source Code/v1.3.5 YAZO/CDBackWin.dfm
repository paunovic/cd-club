object CDBackWindow: TCDBackWindow
  Left = 306
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Razduzivanje CD-ova'
  ClientHeight = 425
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
      EE060000424DEE06000000000000320400002800000019000000190000000100
      080000000000BC020000120B0000120B0000FF000000FF00000000000000FFFF
      FF0058478000020006001F0D38005D487C006245720065456F00858385007F7E
      7F0089698000DAD5D6008A404600AE828300FFF6F600C3BDBD00676565004645
      45006261610097969600F95F4E00FDB9B100FFF6F500FF665100FF6F5C00D35C
      4C00FF776300FF786400FBAB9F00DF4D3300E3543C00FC755F00FF7E6900FF82
      6E00C6837800CEA69F00FDD2CB00CD210000D63A1800D9492A00F65D3C00F67C
      6200FE846C00FE8D7500B9665500BB685800C9BBB800D33D1A00B4371800C650
      3300B3635000B6655200ECD8D300E1D8D600C2350D00C7543400FF8A6800B262
      4D00FF917400F19C8500B3766500CC8B7900D3B2A900CDB2AB00DDC5BE00C4B5
      B100CD5C3A00C96A4D00D3775C00C1847200531B0800E5744E00E97A5100F081
      5A00FD8A6000E2D7D300FAF4F200BE481B00EFA78900F8BCA400C2B5B000DC8B
      680065463800C5BAB5006A686700F18D5700DAA98D00948F8C00E79B6700E5A3
      7700E2955D00E0B99A00F4BC8A00EBB88B00F7BB7E0024201C001D1B1900A4A3
      A200EEC599000F0D0A002D2923001F1D1A0047433D00312C24000E0C0800403E
      3A00817F7B00A8A6A200F4D9A1008C8A8500BCBBB800FFEDB100FBEEB9005655
      50004D4D4B002A2A290090908E0073737200D0D0CF004E4F4C00393A39004546
      4500C8C9C800949594000809090030343400525353008C8D8D007F8080002D34
      3600212527003C484F00000407007C909F003D414400A5A9AC00ECF0F30037A3
      FF003AA5FF003095F3003BA2FF00636A7000D0D8DF00D5DCE200288AED003394
      F600369CFF003495F60032383E00BBC8D500C2CEDA0056585A001B72CC002C91
      FF003394FA003290F500338EF100CCD6E1002178DC002F8BF6002A7BDB003F72
      AC006287B100BDC3CA001F67C6002777DE0017478400297AE0002874DA002977
      DE002A77DE004672AB00222C3900256BD1002873DD00286CD200276CCC001D48
      84004A72A9005F7EAA00262F3C0097A9C2001D5BBD002162CD002164CB002265
      CE002266CD002467D3002567CC002660BF0018263D00205CC200215DC4002058
      BD00215BBD002460C800245DC0002B5AB0001E58C30010203E003D3E4000113D
      9F00113B93001948B1001845A2001B4DB4001A4AAF001A4AAD000B1324003A5C
      A200071B4A001444B2001841A700042C9D000731A30008319E00263869000327
      90000C267900393F520000114D00383D4E00192554005253570013172A005761
      90000014890014278A000001080001138200031276001B2281005F606E003535
      3C004D4D4E00CACACC00BDBDBE00FEFEFE00EEEEEE00D4D4D400CCCCCC00C1C1
      C100BBBBBB00B9B9B900AFAFAF00AAAAAA008888880077777700666666005D5D
      5D00444444003333330028282800232323001111110001010101010101010101
      01010101010101010101010101010100000001010101010101535041412E3501
      01F2000000000000010101000000010101013E234539332C2D323C3F4BF20000
      000000000101010000000101013D30362F271D1E1E274D37443401FB0000F701
      01010100000001010131252817181A211F4958492B1C4CFA0000F60101010100
      0000010101432617181A2A2947596C593B150EFA0000F6010101010000000101
      013F19141B2A2B485A6C705D3B150EFA0000F601010101000000010101012319
      203A4A555E6F6F5C4E2416FA0000F601010101000000010101010B2229384751
      565B625C4FF0FAFE0000F60101010100000001010101014044420C0702050A3D
      4FF200000000F60101010100000001010101ED0F524604E6E2E5E7060DEEF2F6
      F8FEF60101010100000001010101A3837C03DCD9D6D7D5E3E1010101F0F00101
      010101000000010101878284E4D2CACBCECFCDD3D18E01F70000F70101010100
      0000010196860068D0CCC6BFC2C1C4C3C5B50100000000010101010000000101
      85816360C7C0B7B8BAB9BCAFBDB388F70000F70101010100000001018D7D655F
      BEADAEA8A5A5AAA7B0B29D01F0F00101010101000000010154787367ACA49F9A
      93919B9FA0AB96010101010101010100000001017B79FC6994A69E99928C8A89
      90A19501010101010101010000000101EFF9FD7211B4B1B6BBA99C8B98A28F01
      01010101010101000000010101EF12EA7771DFDDDEDAD4C9D8A3010101010101
      01010100000001010101ECC897106A5708E8DBE0E9EB01010101010101010100
      00000101010101F47E7574616B6D66646E010101010101010101010000000101
      0101010176F30809807FF47A0101010101010101010101000000010101010101
      0101F5137BF1EDED010101010101010101010100000001010101010101010101
      010101010101010101010101010101000000}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 317
    Top = 280
    Width = 27
    Height = 25
    Caption = '>>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton5Click
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
  object Label4: TLabel
    Left = 456
    Top = 368
    Width = 71
    Height = 13
    Caption = 'Za placanje : 0'
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 24
    Width = 306
    Height = 305
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
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
        Width = 73
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
    TabOrder = 0
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn2: TBitBtn
    Left = 463
    Top = 391
    Width = 93
    Height = 29
    Caption = 'Potvrdi'
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 563
    Top = 391
    Width = 93
    Height = 29
    Caption = 'Odustani'
    TabOrder = 2
    Kind = bkCancel
  end
  object StringGrid1: TStringGrid
    Left = 350
    Top = 24
    Width = 306
    Height = 305
    ColCount = 2
    Ctl3D = True
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
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
