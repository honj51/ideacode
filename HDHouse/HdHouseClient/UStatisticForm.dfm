object StatisticForm: TStatisticForm
  Left = 294
  Top = 67
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #32508#21512#32479#35745
  ClientHeight = 633
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 617
    Caption = #32508#21512#32479#35745
    TabOrder = 0
    object tv1: TbsSkinTreeView
      Left = 8
      Top = 16
      Width = 161
      Height = 593
      Items.Data = {
        05000000230000000000000000000000FFFFFFFFFFFFFFFF0000000006000000
        0AB0B4B7BFD4B4CDB3BCC6210000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000008B7BFCEDDC0B4D4B4210000000000000000000000FFFFFFFF
        FFFFFFFF000000000000000008B7BFD4B4D7B4CCAC2100000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000008CEEFD2B5D3C3CDBE210000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000008CEEFD2B5C0E0B1F021
        0000000000000000000000FFFFFFFFFFFFFFFF000000000000000008CBF9B4A6
        C7F8D3F2210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        08B3F6D7E2B3F6CADB230000000000000000000000FFFFFFFFFFFFFFFF000000
        00060000000AB0B4BFCDD4B4CDB3BCC6210000000000000000000000FFFFFFFF
        FFFFFFFF000000000000000008BFCDBBA7C0B4D4B42100000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000008BFCDBBA7D7B4CCAC210000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000008D0E8C7F3D3C3CDBE21
        0000000000000000000000FFFFFFFFFFFFFFFF000000000000000008D0E8C7F3
        C0E0B1F0210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        08D0E8C7F3C7F8D3F2210000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000008C7F3D7E2C7F3B9BA230000000000000000000000FFFFFFFFFFFF
        FFFF00000000030000000AB0B4D4B1B9A4CDB3BCC62100000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000008B7BFD4B4CAFDC1BF210000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000008BFCDD4B4CAFDC1BF21
        0000000000000000000000FFFFFFFFFFFFFFFF000000000000000008B3C9BDBB
        CAFDC1BF230000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
        0AB0B4CAB1BCE4CDB3BCC6210000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000008C8D5D4F6B7BFD4B4210000000000000000000000FFFFFFFF
        FFFFFFFF000000000000000008D4C2D4F6B7BFD4B42100000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000008C8D5D4F6BFCDD4B4210000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000008D4C2D4F6BFCDD4B425
        0000000000000000000000FFFFFFFFFFFFFFFF00000000020000000CB0B4D3AA
        D2B5B6EECDB3BCC6210000000000000000000000FFFFFFFFFFFFFFFF00000000
        0000000008C8D5D3AAD2B5B6EE210000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000008D4C2D3AAD2B5B6EE}
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      SkinDataName = 'treeview'
      DefaultColor = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Indent = 19
      ParentFont = False
      TabOrder = 0
      OnChange = tv1Change
    end
  end
  object grp1: TGroupBox
    Left = 200
    Top = 16
    Width = 681
    Height = 617
    Caption = #32479#35745#20449#24687
    TabOrder = 1
    object btn3: TbsSkinButtonLabel
      Left = 268
      Top = 25
      Width = 33
      Height = 27
      UseCustomGlowColor = False
      CustomGlowColor = clAqua
      GlowEffect = True
      GlowSize = 7
      DoubleBuffered = True
      ImageIndex = -1
      ActiveImageIndex = -1
      WebStyle = False
      Glyph.Data = {
        6E070000424D6E0700000000000036000000280000001C000000160000000100
        18000000000038070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCF8ED6D85D11C4CCE1C4BCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9EE647FD10053E80066
        FE0054EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF8ED687ED0003CE5004DFF004EF82758D4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7ED6880D0193EDC
        1E42F0183DEB1A41CFCFD3E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEEECEB6880D14F6ADF7A8AF17384EC3C5BCDC9CEE3FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEEBAC1DF35
        58D197A4F88D9CF43F5ED0C1C7E1FFFAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEEDFE0E7AAB4
        DC92A2D8A4AFDBD3D6E5FFFAEEFFFAEE4769CF4769CF5D78DA4463D3B7BFDFFF
        FAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF6F3EC8093D55474D7708DE67D98EA7491E75979DB6C84
        D24769CF4769CF4769CFBEC6E1B2BBDEFFFAEEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5ED647FD3
        608AEC7FA7FB81A9FB7FA7FA80A8FA83ABFB6B95F14769CF4769CFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFAEE99A7D93A73E75D9BFF5693FC5693FC5693FC
        5693FC5693FC5B98FF4C86F46C85D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FAEE3662D23487FF2A7EFF3082FF3384FF3384FF3384FF3384FF3383FF3789FF
        265EDBDEDFE7FFFAEEFFFAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEE165ADF2782FF65A4FF23
        7DFF1173FF1474FF1474FF1474FF1474FF1577FF0F60ECB3BCDEFFFAEEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0950E11D7AFFC5DCFF5498FF0061FE0266FE0266FE02
        66FE0266FE0269FF0259EEA9B4DBFFFAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF164D
        D7085FFCB4CDFE86B0FC0053F80058F80058F80058F80058F8005AFB0249E2C1
        C8E1FFFAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D3DCF0044E94C7FF2618DF30047
        EC0047EC0048EC0048EC0048ED0049ED2B55CEF4F1ECFFFAEEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFCCD1E40D3DCF0036DF0037DF0039DE0039DE0039DE0039DF0039
        DF0034D0A5B2DCFFFAEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7B3DC
        103AC9002BCF002AD2002AD2002AD2002BD0032FC88497D5FFFAEEFFFAEEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFAEEFFFFFFFFFFFFD3D7E5617ACF2649C6163AC4
        2245C54F6BCCBEC6E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 1
      Spacing = 1
      Layout = blGlyphTop
      UseSkinFont = True
      DefaultActiveFontColor = clBlue
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'stdlabel'
      OnClick = btn3Click
    end
    object bsSkinStdLabel1: TbsSkinStdLabel
      Left = 12
      Top = 33
      Width = 61
      Height = 13
      EllipsType = bsetNone
      UseSkinFont = True
      UseSkinColor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'MS Sans Serif'
      DefaultFont.Style = []
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #26102#38388#33539#22260
    end
    object lbl10: TbsSkinStdLabel
      Left = 159
      Top = 32
      Width = 12
      Height = 13
      EllipsType = bsetNone
      UseSkinFont = True
      UseSkinColor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'MS Sans Serif'
      DefaultFont.Style = []
      SkinDataName = 'stdlabel'
      Caption = #65293
    end
    object bsSkinDateEdit1: TbsSkinDateEdit
      Left = 76
      Top = 30
      Width = 80
      Height = 18
      EditMask = '!0000/99/99;1; '
      Text = '2009-09-29'
      AlphaBlend = False
      AlphaBlendAnimation = False
      AlphaBlendValue = 0
      UseSkinFont = True
      Date = 40085.407665266200000000
      TodayDefault = True
      CalendarWidth = 200
      CalendarHeight = 150
      CalendarFont.Charset = DEFAULT_CHARSET
      CalendarFont.Color = clWindowText
      CalendarFont.Height = 14
      CalendarFont.Name = 'Arial'
      CalendarFont.Style = []
      CalendarBoldDays = False
      CalendarUseSkinFont = True
      CalendarSkinDataName = 'panel'
      FirstDayOfWeek = Sun
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = True
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'buttonedit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
    end
    object bsSkinDateEdit2: TbsSkinDateEdit
      Left = 179
      Top = 30
      Width = 80
      Height = 18
      EditMask = '!0000/99/99;1; '
      Text = '2009-09-29'
      AlphaBlend = False
      AlphaBlendAnimation = False
      AlphaBlendValue = 0
      UseSkinFont = True
      Date = 40085.407665266200000000
      TodayDefault = True
      CalendarWidth = 200
      CalendarHeight = 150
      CalendarFont.Charset = DEFAULT_CHARSET
      CalendarFont.Color = clWindowText
      CalendarFont.Height = 14
      CalendarFont.Name = 'Arial'
      CalendarFont.Style = []
      CalendarBoldDays = False
      CalendarUseSkinFont = True
      CalendarSkinDataName = 'panel'
      FirstDayOfWeek = Sun
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = True
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'buttonedit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
    end
    object btn4: TbsSkinButton
      Left = 313
      Top = 26
      Width = 75
      Height = 25
      HintImageIndex = 0
      TabOrder = 0
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'button'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageIndex = -1
      AlwaysShowLayeredFrame = False
      UseSkinSize = True
      UseSkinFontColor = True
      RepeatMode = False
      RepeatInterval = 100
      AllowAllUp = False
      TabStop = True
      CanFocused = True
      Down = False
      GroupIndex = 0
      Caption = #23548#20986
      NumGlyphs = 1
      Spacing = 1
    end
    object dbcht1: TDBChart
      Left = 8
      Top = 296
      Width = 609
      Height = 250
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TDBChart')
      TabOrder = 4
      object brsrsSeries1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = True
        DataSource = qry1
        SeriesColor = 16744576
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = #25968#37327
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 7
      Top = 72
      Width = 610
      Height = 213
      DataSource = ds1
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      SumList.Active = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetFooterParams = DBGridEh1GetFooterParams
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 664
    Top = 24
  end
  object qry1: TADOQuery
    Active = True
    AutoCalcFields = False
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select fczy_fwly AS '#25151#23627#26469#28304', COUNT(*) AS '#25968#37327' FROM fczy GROUP BY fczy' +
        '_fwly')
    Left = 752
    Top = 24
  end
  object bsbsnsknfrm1: TbsBusinessSkinForm
    ClientInActiveEffect = False
    ClientInActiveEffectType = bsieSemiTransparent
    DisableSystemMenu = False
    AlwaysResize = False
    PositionInMonitor = bspDefault
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ShowObjectHint = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = True
    SkinData = HDHouseDataModule.bsSkinData1
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Magnetic = False
    MagneticSize = 5
    BorderIcons = [biSystemMenu]
    Left = 815
    Top = 44
  end
end
