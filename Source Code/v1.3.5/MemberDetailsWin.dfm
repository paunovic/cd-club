object MemberDetailsWindow: TMemberDetailsWindow
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Detaljne Informacije o Clanovima'
  ClientHeight = 294
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 132
    Top = 10
    Width = 24
    Height = 13
    Caption = 'Broj :'
  end
  object Label2: TLabel
    Left = 68
    Top = 47
    Width = 23
    Height = 13
    Caption = 'Ime :'
  end
  object Label3: TLabel
    Left = 48
    Top = 71
    Width = 43
    Height = 13
    Caption = 'Prezime :'
  end
  object Label4: TLabel
    Left = 52
    Top = 95
    Width = 39
    Height = 13
    Caption = 'Adresa :'
  end
  object Label5: TLabel
    Left = 11
    Top = 119
    Width = 80
    Height = 13
    Caption = 'Mesto Rodjenja :'
  end
  object Label6: TLabel
    Left = 9
    Top = 143
    Width = 82
    Height = 13
    Caption = 'Datum Rodjenja :'
  end
  object Label7: TLabel
    Left = 1
    Top = 215
    Width = 90
    Height = 13
    Caption = 'Datum Uclanjenja :'
  end
  object Label8: TLabel
    Left = 22
    Top = 167
    Width = 69
    Height = 13
    Caption = 'Broj Telefona :'
  end
  object Label9: TLabel
    Left = 55
    Top = 239
    Width = 36
    Height = 13
    Caption = 'Status :'
  end
  object Label10: TLabel
    Left = 10
    Top = 191
    Width = 81
    Height = 13
    Caption = 'Broj Licne Karte :'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 160
    Top = 7
    Width = 125
    Height = 21
    DropDownRows = 15
    KeyField = 'IDNum'
    ListField = 'IDNum'
    ListSource = DataSource1
    TabOrder = 0
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit1: TDBEdit
    Left = 94
    Top = 44
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'FirstName'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit2: TDBEdit
    Left = 94
    Top = 68
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'LastName'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 94
    Top = 92
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Address'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 94
    Top = 116
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'BirthPlace'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 94
    Top = 140
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'BirthDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit6: TDBEdit
    Left = 94
    Top = 164
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'PhoneNumber'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit7: TDBEdit
    Left = 94
    Top = 212
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'JoinDate'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 10
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit8: TDBEdit
    Left = 94
    Top = 236
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'Status'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 11
    OnKeyDown = DBEdit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 265
    Width = 75
    Height = 25
    TabOrder = 1
    OnKeyDown = DBEdit1KeyDown
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 4
    Top = 261
    Width = 109
    Height = 29
    Caption = 'Clanska Karta'
    Default = True
    TabOrder = 2
    OnClick = BitBtn2Click
    OnKeyDown = DBEdit1KeyDown
    Glyph.Data = {
      C6060000424DC6060000000000000A0400002800000019000000190000000100
      080000000000BC020000120B0000120B0000F5000000F500000000000000FFFF
      FF0048FF0000BBBBBB0058478000020006001F0D38005D477B0065456F008683
      87007F7E7F0085627A008A404600676565004645450097969600F95F4E00D75C
      4E00FE645000FF675200FF6E5C00FF6F5C00FF776400FF786400FF816F00DF4D
      3300E5533C00E1543C00FC755F00FF776200FF7E6900FE826D00C6837800CD21
      0000D63A1800DC462900F65D3C00F57B6100FE846C00B9665500BB685800D33D
      1A00B4371800D54B2900C6503300C95C4300F77D6200B3624F00FD8D7100B665
      5200C2350D00FF8A6800B2624D00FF917400CD5C3A00E8744E00C96A4D00531B
      0800E97A5100E1744E00EF7F5800FD8A6000D3795B00C9887200BC421400DC8B
      680065463800F18D5700DAA98D00948F8C00E7986300E2955D00E3A47200E0B9
      9A00F7BB7E0024201C001D1B1900A4A3A200EDC3950096703A000F0D0A001F1D
      1A0047433D00312C24000E0C0800F1D59F00403E3A00817F7B00A8A6A200F6DB
      A0008C8A8500FFEBAD00FFEEB100FBEEB70056555000928430004D4D4B002A2A
      290090908E00737372009FA16000ACB176002229130083AA34004E4F4C0085B2
      3A0098C55E0064685F0080837C008FB567008EB568008FB5680089BB600088BA
      610091948F006AD6300072BD4C0083D55C005EBB350048FE010049FE02005CD0
      2E004FAF2A0056BD2E0072C152006AAF4E007AB962004261350091AA8700525D
      4E003D533600798D73003EC71C004DC52F0077C0670084A97D003BC225003CC0
      25003EC22A002E3E2C0022232200393A39004546450094959400253526003286
      43001C252000B2CFC200334843005D6A680008090900303434007F8080004585
      8A00235A6A002D34360023628600296A94007B909E0000040700153851002258
      81003D41440036A3FF003AA5FF003095F3003BA2FF002487ED003394F600369C
      FF003495F60032383E0056585A001A71CC002C91FF003394FA003290F500338E
      F1002178DC002275D9002E8AF7002D8AF4001F67C6002677DF002777DF001747
      84002777DD002874DA002977DE002A77DE00222C39001B61C800256BD1002873
      DD001D488400262F3C001D5BBD002162CD002164CB002368D1002265CE002266
      CD002467D3002567CC0018263D000B3F9A00144EB8001C58C500205CC200215D
      C4002058BD00215BBD00235CC0001E58C30010203E00113D9F00113B9300184A
      B3001948B1001845A2001A4AAF001A4AAD000B132400071B4A001841A7000731
      A30007309E0000279B00032790000C267900393F520000114D00383D4E001925
      54005253570013172A0000148900001282000001080003127600151A7C005F60
      6E004D4D4E0028282800FFFFFF00020202020202020202020202020202020202
      0202020202020200000002020202020202716E6D6F7073000000000000000000
      0202020000000202020269675F343127282F4F00010101010101010002020200
      00000202023F2A322923191B1A2B400001010101010101000202020000000202
      022C2124131516181C3C46000103030303030100020202000000020202382212
      141D1F253B4855000101010101010100020202000000020202652D101726303A
      47595D0001030303030301000202020000000202020264111E353D434A5C5B00
      01010101010101000202020000000202020275202E33374144494E0001030303
      0303010002020200000002020202026A3E360C0804070B000101010101010100
      020202000000020202020274423906EFECEDF000010303030300000002020200
      00000202020286949605E7E4E1E2E30001010101010000020202020000000202
      0287929FEEDFD8DADCDDD9000000000000000202020202000000020293A20054
      DEDBD5D0D3D2D4CFCD9102020202020202020200000002029E9B504CD6D1C5C6
      C9C8CBC7CE9A84020202020202020200000002029597514BCCC0C1BBBAB8BDB7
      BFA189020202020202020200000002026B8D6153BEB6B4AFAAA8B0B5B39C8802
      0202020202020200000002028F8EF356ABB9B2AEA9A6A4A3A79D8A0202020202
      020202000000020202818C600EC3C2C4CABCB1A5AD9902020202020202020200
      0000020202027FF2685EEAE8E9E5E0D7A0850202020202020202020000000202
      02027B8BAC0D574509F1E6EB900202020202020202020200000002020202027A
      8263624D585A52667602020202020202020202000000020202020202797E6C0A
      98837D0202020202020202020202020000000202020202020202800F727C7877
      0202020202020202020202000000020202020202020202020202020202020202
      02020202020202000000}
  end
  object DBEdit9: TDBEdit
    Left = 94
    Top = 188
    Width = 318
    Height = 21
    TabStop = False
    Color = clInactiveCaptionText
    DataField = 'PaperNum'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 9
    OnKeyDown = DBEdit1KeyDown
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 4
    Top = 4
  end
  object Table1: TTable
    Active = True
    SessionName = 'Default'
    TableName = 'bases\Members.DB'
    Left = 36
    Top = 4
  end
end
