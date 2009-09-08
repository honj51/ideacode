object frameHouseList: TframeHouseList
  Left = 0
  Top = 0
  Width = 1070
  Height = 545
  HelpContext = 1
  AutoScroll = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = '@Arial Unicode MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object bsknpgcntrl1: TbsSkinPageControl
    Left = 0
    Top = 335
    Width = 1070
    Height = 210
    ActivePage = bsSkinTabSheet1
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabExtededDraw = False
    TabSpacing = 1
    TextInHorizontal = False
    TabsInCenter = False
    FreeOnClose = False
    ShowCloseButtons = False
    TabsBGTransparent = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBtnText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultItemHeight = 20
    SkinDataName = 'tab'
    object bsSkinTabSheet1: TbsSkinTabSheet
      Caption = #25151#28304#35814#32454#20449#24687
      object mmoHouseDetailInfo: TbsSkinDBMemo
        Left = 0
        Top = 0
        Width = 1068
        Height = 188
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        UseSkinFontColor = True
        BitMapBG = True
        SkinDataName = 'memo'
        DataField = 'HouseDetailInfo'
        DataSource = dsHouseList
      end
    end
    object bsSkinTabSheet2: TbsSkinTabSheet
      Caption = #25151#28304#20445#23494#20449#24687
      object mmoHouseSecrecyInfo: TbsSkinDBMemo
        Left = 0
        Top = 0
        Width = 1068
        Height = 188
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        UseSkinFontColor = True
        BitMapBG = True
        SkinDataName = 'memo'
        DataField = 'HouseSecrecyInfo'
        DataSource = dsHouseList
      end
    end
    object bskntbsht1: TbsSkinTabSheet
      Caption = #33258#21160#21305#37197#30340#23458#25143
      object bskndbgrd1: TbsSkinDBGrid
        Left = 0
        Top = 0
        Width = 1049
        Height = 169
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'grid'
        Transparent = False
        WallpaperStretch = False
        UseSkinFont = True
        UseSkinCellHeight = True
        HScrollBar = bsknscrlbrAutoDown
        VScrollBar = bsknscrlbrAutoRight
        GridLineColor = clWindowText
        DefaultCellHeight = 20
        DrawGraphicFields = False
        UseColumnsFont = False
        DefaultRowHeight = 18
        MouseWheelSupport = False
        SaveMultiSelection = False
        PickListBoxSkinDataName = 'listbox'
        PickListBoxCaptionMode = False
        Align = alClient
        DataSource = dsCustomerTrack
        PopupMenu = pmAutoCustomer
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = bskndbgrd1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'khzy_bh'
            Title.Caption = #23458#25143#32534#21495
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_yzxm'
            Title.Caption = #23458#25143#21517#31216
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_fwly'
            Title.Caption = #32622#19994#39038#38382
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_djrq'
            Title.Caption = #30331#35760#26085#26399
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_dqzt'
            Title.Caption = #24403#21069#29366#24577
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_qy'
            Title.Caption = #25152#22788#21306#22495
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wymc'
            Title.Caption = #29289#19994#21517#31216
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wyyt'
            Title.Caption = #29289#19994#29992#36884
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wylb'
            Title.Caption = #29289#19994#31867#21035
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wssl'
            Title.Caption = #25151#38388#25968#37327
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_mj'
            Title.Caption = #38656#27714#38754#31215
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_zxcd'
            Title.Caption = #35013#20462#31243#24230
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_nf'
            Title.Caption = #24314#25104#24180#20221
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_jtdz'
            Title.Caption = #20855#20307#22320#22336
            Width = 332
            Visible = True
          end>
      end
      object bsknscrlbrAutoDown: TbsSkinScrollBar
        Left = 0
        Top = 169
        Width = 1068
        Height = 19
        HintImageIndex = 0
        TabOrder = 1
        SkinDataName = 'hscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 19
        UseSkinFont = True
        Both = False
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alBottom
        Kind = sbHorizontal
        PageSize = 0
        Min = 0
        Max = 127
        Position = 0
        SmallChange = 63
        LargeChange = 63
      end
      object bsknscrlbrAutoRight: TbsSkinScrollBar
        Left = 1049
        Top = 0
        Width = 19
        Height = 169
        HintImageIndex = 0
        TabOrder = 2
        Visible = False
        SkinDataName = 'vscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 19
        DefaultHeight = 0
        UseSkinFont = True
        Both = False
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alRight
        Kind = sbVertical
        PageSize = 2
        Min = 1
        Max = 3
        Position = 1
        SmallChange = 1
        LargeChange = 1
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #36319#36827#35760#24405
      object bskndbgrd2: TbsSkinDBGrid
        Left = 0
        Top = 0
        Width = 1049
        Height = 169
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'grid'
        Transparent = False
        WallpaperStretch = False
        UseSkinFont = True
        UseSkinCellHeight = True
        HScrollBar = bsknscrlbrFollowDown
        VScrollBar = bsknscrlbrFollowRight
        GridLineColor = clWindowText
        DefaultCellHeight = 20
        DrawGraphicFields = False
        UseColumnsFont = False
        DefaultRowHeight = 18
        MouseWheelSupport = False
        SaveMultiSelection = False
        PickListBoxSkinDataName = 'listbox'
        PickListBoxCaptionMode = False
        Align = alClient
        DataSource = dsHouseTrack
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'fcgj_date'
            Title.Caption = #36319#36827#26102#38388
            Width = 168
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fcgj_gjr'
            Title.Caption = #36319#36827#20154
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fcgj_fs'
            Title.Caption = #36319#36827#26041#24335
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fcgj_ms'
            Title.Caption = #36319#36827#20869#23481
            Width = 477
            Visible = True
          end>
      end
      object bsknscrlbrFollowDown: TbsSkinScrollBar
        Left = 0
        Top = 169
        Width = 1068
        Height = 19
        HintImageIndex = 0
        TabOrder = 1
        Visible = False
        SkinDataName = 'hscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 19
        UseSkinFont = True
        Both = True
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alBottom
        Kind = sbHorizontal
        PageSize = 0
        Min = 0
        Max = 0
        Position = 0
        SmallChange = 127
        LargeChange = 127
      end
      object bsknscrlbrFollowRight: TbsSkinScrollBar
        Left = 1049
        Top = 0
        Width = 19
        Height = 169
        HintImageIndex = 0
        TabOrder = 2
        SkinDataName = 'vscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 19
        DefaultHeight = 0
        UseSkinFont = True
        Both = False
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alRight
        Kind = sbVertical
        PageSize = 7
        Min = 1
        Max = 15
        Position = 1
        SmallChange = 1
        LargeChange = 1
      end
    end
  end
  object bsSkinPanel1: TbsSkinPanel
    Left = 0
    Top = 0
    Width = 1070
    Height = 97
    HintImageIndex = 0
    TabOrder = 1
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'bsSkinPanel1'
    Align = alTop
    DesignSize = (
      1070
      97)
    object lbl1: TbsSkinStdLabel
      Left = 56
      Top = 24
      Width = 96
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
      Caption = #36755#20837#25151#28304#20449#24687#26597#35810
    end
    object bsSkinButtonLabel2: TbsSkinButtonLabel
      Left = 424
      Top = 14
      Width = 57
      Height = 33
      UseCustomGlowColor = False
      CustomGlowColor = clAqua
      GlowEffect = True
      GlowSize = 7
      DoubleBuffered = True
      ImageIndex = -1
      ActiveImageIndex = -1
      WebStyle = False
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000004848488C8C8C8E8E8E4C4C4C000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00004848488C8C8C7D7D7D7F7F7F9292924E4E4E000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000048
        48488C8C8C7D7D7D747474777777909090A8A8A8000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C
        8C8C7D7D7D747474777777878787A6A6A6BCBCBC000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C8C8C7D
        7D7D747474777777878787A6A6A6C1C1C1676767000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C8C8C7D7D7D74
        7474777777878787A6A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C8C8C7D7D7D74747477
        7777878787A6A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
        000000000000000000000000000000003F3F3F8989897D7D7D74747477777787
        8787A6A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000000000002C2C2C7575759E9E9EB6B6B6C3C3C3C3C3
        C3B5B5B59B9B9B6969691D1D1D2525256868686F6F6F717171777777878787A6
        A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000020202787878B2B2B2C9C9C9C5C5C5C0C0C0BDBDBDBDBD
        BDC0C0C0C5C5C5C9C9C9A7A7A77F7F7F4747475353536C6C6C858585A6A6A6C1
        C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000001E1E1E939393CACACAC3C3C3BDBDBDBDBDBDBDBDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBDC3C3C3CACACA8B8B8B4D4D4D6666669C9C9CC0C0C068
        6868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000020202959595CDCDCDC1C1C1C0C0C0C3B9ABCAA56FD1943BD58816D588
        16D1943BCAA56FC3B9ABC0C0C0C1C1C1CDCDCD9191915D5D5DA8A8A866666600
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        0000007B7B7BCFCFCFC4C4C4C3C3C3C9B18FD8860DDB8F1FDE972EE09D39E09D
        39DE972EDB8F1FD8860DC9B18FC3C3C3C4C4C4CFCFCF939393424242000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        2E2E2EB9B9B9CBCBCBC6C6C6CBB391DA8A15DF9932E3A346E09A33DD9020DD90
        20E09A33E3A346DF9932DA8A15CBB391C6C6C6CBCBCBB1B1B1222222000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        7D7D7DD4D4D4C9C9C9CBC1B3D9870FE19D39E4A245DF9224DF9224DF9224DF92
        24DF9224DF9224E4A245E19D39D9870FCBC1B3C9C9C9D4D4D47D7D7D000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        AAAAAAD5D5D5CDCDCDD1AC76DF952CE9AD5BE39832E39832E39832E39832E398
        32E39832E39832E39832E9AD5BDF952CD1AC76CDCDCDD5D5D5AAAAAA000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        C6C6C6D4D4D4D0D0D0D59940E5A54BE9AB56E6A040E6A040E6A040E6A040E6A0
        40E6A040E6A040E6A040E9AB56E5A54BD59940D0D0D0D4D4D4C6C6C6000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        D9D9D9D5D5D5D4D4D4D78A18EDB569ECAA55EBA74FEBA74FEBA74FEBA74FEBA7
        4FEBA74FEBA74FEBA74FECAA55EDB569D78A18D4D4D4D5D5D5D9D9D9000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        DBDBDBD8D8D8D8D8D8D78A18F0B973F0B264EFAF5FEFAE5DEFAE5DEFAE5DEFAE
        5DEFAE5DEFAE5DEFAF5FF0B264F0B973D78A18D8D8D8D8D8D8DBDBDB000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        CFCFCFE0E0E0DDDDDDD89C43EDB366F5C385F3B972F2B76CF2B66BF2B66BF2B6
        6BF2B66BF2B76CF3B972F5C385EDB366D89C43DDDDDDE0E0E0CFCFCF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        B5B5B5E6E6E6E1E1E1DBB680E6A449F9D0A2F7C489F6BF7FF6BD7AF6BC79F6BC
        79F6BD7AF6BF7FF7C489F9D0A2E6A449DBB680E1E1E1E6E6E6B5B5B5000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        8A8A8AECECECE6E6E6E2D8CADB8C1AF0BE7CFBD7AEFACC99F9C78FF9C58AF9C5
        8AF9C78FFACC99FBD7AEF0BE7CDB8C1AE2D8CAE6E6E6ECECEC8A8A8A000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        343434D4D4D4EDEDEDE8E8E8E1CAA7E0972FF2C387FEE0C2FDDCB9FDD7AFFDD7
        AFFDDCB9FEE0C2F2C387E0972FE1CAA7E8E8E8EDEDEDD4D4D4343434000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000919191F4F4F4EFEFEFEBEBEBE3CCA9DB8E1DE8AE5DF3CA96FBDFBEFBDF
        BEF3CA96E8AE5DDB8E1DE3CCA9EBEBEBEFEFEFF4F4F4919191000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF020202B2B2B2F6F6F6F1F1F1EDEDEDE9DFD1E2BD86DCA047D98B1AD98B
        1ADCA047E2BD86E9DFD1EDEDEDF1F1F1F6F6F6B2B2B2020202FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000252525B5B5B5F9F9F9F7F7F7F3F3F3F0F0F0EFEFEFEEEEEEEEEE
        EEEFEFEFF0F0F0F3F3F3F7F7F7F9F9F9B5B5B5252525000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000020202969696DEDEDEFBFBFBFAFAFAF8F8F8F6F6F6F6F6
        F6F8F8F8FAFAFAFBFBFBDEDEDE969696020202000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000373737959595C8C8C8E7E7E7F8F8F8F8F8
        F8E7E7E7C8C8C8959595373737000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
        00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
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
      SkinDataName = 'stdlabel'
      OnClick = bsSkinButtonLabel2Click
    end
    object bvl1: TBevel
      Left = 0
      Top = 57
      Width = 1068
      Height = 2
      Anchors = [akLeft, akRight]
    end
    object bsSkinStdLabel1: TbsSkinStdLabel
      Left = 464
      Top = 70
      Width = 81
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
      AutoSize = False
      Caption = #22825#20869#30340#20449#24687
    end
    object bsSkinButton2: TbsSkinButton
      Left = 600
      Top = 18
      Width = 97
      Height = 25
      HintImageIndex = 0
      TabOrder = 0
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
      Caption = #20080#25151#26597#35810'(&F7)'
      NumGlyphs = 1
      Spacing = 1
    end
    object bsSkinButton1: TbsSkinButton
      Left = 496
      Top = 18
      Width = 97
      Height = 25
      HintImageIndex = 0
      TabOrder = 1
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
      Caption = #31199#25151#26597#35810'(&F6)'
      NumGlyphs = 1
      Spacing = 1
    end
    object bsSkinButton3: TbsSkinButton
      Left = 704
      Top = 18
      Width = 97
      Height = 25
      HintImageIndex = 0
      TabOrder = 2
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
      Caption = #26032#22686#25151#28304'(&F8)'
      NumGlyphs = 1
      Spacing = 1
    end
    object bsSkinButton4: TbsSkinButton
      Left = 808
      Top = 18
      Width = 97
      Height = 25
      HintImageIndex = 0
      TabOrder = 3
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
      Caption = #25171#21360#25151#28304'(&F9)'
      NumGlyphs = 1
      Spacing = 1
    end
    object bsSkinCheckRadioBox1: TbsSkinCheckRadioBox
      Left = 56
      Top = 64
      Width = 113
      Height = 25
      HintImageIndex = 0
      TabOrder = 4
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 1
      Caption = #21482#26174#31034#20986#31199#20449#24687
      OnClick = bsSkinCheckRadioBox1Click
    end
    object bsSkinCheckRadioBox2: TbsSkinCheckRadioBox
      Left = 176
      Top = 64
      Width = 113
      Height = 25
      HintImageIndex = 0
      TabOrder = 5
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Caption = #21482#26174#31034#20986#21806#20449#24687
      OnClick = bsSkinCheckRadioBox2Click
    end
    object bsSkinCheckRadioBox3: TbsSkinCheckRadioBox
      Left = 328
      Top = 64
      Width = 89
      Height = 25
      HintImageIndex = 0
      TabOrder = 6
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Caption = #21482#26174#31034#26368#36817
      OnClick = bsSkinCheckRadioBox3Click
    end
    object Edit1: TEdit
      Left = 264
      Top = 19
      Width = 145
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtDate: TbsSkinNumericEdit
      Left = 416
      Top = 68
      Width = 41
      Height = 18
      Text = '100'
      Increment = 1.000000000000000000
      SupportUpDownKeys = False
      UseSkinFont = True
      ValueType = vtInteger
      Value = 100.000000000000000000
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
    end
  end
  object bsSkinPanel2: TbsSkinPanel
    Left = 0
    Top = 97
    Width = 1070
    Height = 238
    HintImageIndex = 0
    TabOrder = 2
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'bsSkinPanel2'
    Align = alClient
    object bsSkinDBGrid1: TbsSkinDBGrid
      Left = 1
      Top = 1
      Width = 1049
      Height = 217
      HintImageIndex = 0
      TabOrder = 0
      SkinDataName = 'grid'
      Transparent = False
      WallpaperStretch = False
      UseSkinFont = True
      UseSkinCellHeight = True
      HScrollBar = bsknscrlbrHouseListDown
      VScrollBar = bsknscrlbrHouseRight
      GridLineColor = clWindowText
      DefaultCellHeight = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DrawGraphicFields = False
      UseColumnsFont = False
      DefaultRowHeight = 17
      MouseWheelSupport = False
      SaveMultiSelection = False
      PickListBoxSkinDataName = 'listbox'
      PickListBoxCaptionMode = False
      Align = alClient
      DataSource = dsHouseList
      ParentFont = False
      PopupMenu = pmHouse
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = '@Arial Unicode MS'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'fczy_bh'
          Title.Caption = #25151#28304#32534#21495
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_djrq'
          Title.Caption = #30331#35760#26085#26399
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_dqzt'
          Title.Caption = #24403#21069#29366#24577
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_wymc'
          Title.Caption = #29289#19994#21517#31216
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_hxjg'
          Title.Caption = #25143#22411#32467#26500
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_jzmj'
          Title.Caption = #24314#31569#38754#31215
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_qy'
          Title.Caption = #25152#22788#21306#22495
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_lccg'
          Title.Caption = #27004#23618'/'#23618#39640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #32622#19994#39038#38382
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_wyyt'
          Title.Caption = #29289#19994#29992#36884
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_wylb'
          Title.Caption = #29289#19994#31867#21035
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_zxcd'
          Title.Caption = #35013#20462#31243#24230
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_fx'
          Title.Caption = #25151#22411
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_jcnf'
          Title.Caption = #24314#25104#24180#20221
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_jtdz'
          Title.Caption = #20855#20307#22320#22336
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
    object bsknscrlbrHouseListDown: TbsSkinScrollBar
      Left = 1
      Top = 218
      Width = 1068
      Height = 19
      HintImageIndex = 0
      TabOrder = 1
      SkinDataName = 'hscrollbar'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 19
      UseSkinFont = True
      Both = True
      BothMarkerWidth = 19
      BothSkinDataName = 'bothhscrollbar'
      CanFocused = False
      Align = alBottom
      Kind = sbHorizontal
      PageSize = 0
      Min = 0
      Max = 127
      Position = 0
      SmallChange = 31
      LargeChange = 31
    end
    object bsknscrlbrHouseRight: TbsSkinScrollBar
      Left = 1050
      Top = 1
      Width = 19
      Height = 217
      HintImageIndex = 0
      TabOrder = 2
      SkinDataName = 'vscrollbar'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 19
      DefaultHeight = 0
      UseSkinFont = True
      Both = False
      BothMarkerWidth = 19
      BothSkinDataName = 'bothhscrollbar'
      CanFocused = False
      Align = alRight
      Kind = sbVertical
      PageSize = 10
      Min = 1
      Max = 19
      Position = 1
      SmallChange = 1
      LargeChange = 1
    end
  end
  object bsknfrm1: TbsSkinFrame
    DrawBackground = True
    Left = 1024
    Top = 8
  end
  object qryHouseList: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    AfterScroll = qryHouseListAfterScroll
    OnCalcFields = qryHouseListCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from fczy')
    Left = 960
    Top = 8
    object qryHouseListfczy_bh: TWideStringField
      FieldName = 'fczy_bh'
      Size = 50
    end
    object qryHouseListfczy_yn: TWideStringField
      FieldName = 'fczy_yn'
      Size = 50
    end
    object qryHouseListfczy_htbh: TWideStringField
      FieldName = 'fczy_htbh'
      Size = 50
    end
    object qryHouseListfczy_djrq: TDateTimeField
      FieldName = 'fczy_djrq'
    end
    object qryHouseListfczy_sxrq: TDateTimeField
      FieldName = 'fczy_sxrq'
    end
    object qryHouseListfczy_zhrq: TDateTimeField
      FieldName = 'fczy_zhrq'
    end
    object qryHouseListfczy_fwly: TWideStringField
      FieldName = 'fczy_fwly'
      Size = 50
    end
    object qryHouseListfczy_dqzt: TWideStringField
      FieldName = 'fczy_dqzt'
      Size = 50
    end
    object qryHouseListfczy_wymc: TWideStringField
      FieldName = 'fczy_wymc'
      Size = 50
    end
    object qryHouseListfczy_wyyt: TWideStringField
      FieldName = 'fczy_wyyt'
      Size = 50
    end
    object qryHouseListfczy_wylb: TWideStringField
      FieldName = 'fczy_wylb'
      Size = 50
    end
    object qryHouseListfczy_zxcd: TWideStringField
      FieldName = 'fczy_zxcd'
      Size = 50
    end
    object qryHouseListfczy_jtdz: TWideStringField
      FieldName = 'fczy_jtdz'
      Size = 255
    end
    object qryHouseListfczy_qy: TWideStringField
      FieldName = 'fczy_qy'
      Size = 50
    end
    object qryHouseListfczy_jcnf: TWideStringField
      FieldName = 'fczy_jcnf'
      Size = 50
    end
    object qryHouseListfczy_ws: TIntegerField
      FieldName = 'fczy_ws'
    end
    object qryHouseListfczy_kt: TIntegerField
      FieldName = 'fczy_kt'
    end
    object qryHouseListfczy_wc: TIntegerField
      FieldName = 'fczy_wc'
    end
    object qryHouseListfczy_yt: TIntegerField
      FieldName = 'fczy_yt'
    end
    object qryHouseListfczy_hxjg: TWideStringField
      FieldName = 'fczy_hxjg'
      Size = 200
    end
    object qryHouseListfczy_jzmj: TFloatField
      FieldName = 'fczy_jzmj'
    end
    object qryHouseListfczy_fx: TWideStringField
      FieldName = 'fczy_fx'
      Size = 50
    end
    object qryHouseListfczy_lczs: TIntegerField
      FieldName = 'fczy_lczs'
    end
    object qryHouseListfczy_lc: TIntegerField
      FieldName = 'fczy_lc'
    end
    object qryHouseListfczy_lccg: TWideStringField
      FieldName = 'fczy_lccg'
      Size = 50
    end
    object qryHouseListfczy_ptss1: TWideStringField
      FieldName = 'fczy_ptss1'
      Size = 50
    end
    object qryHouseListfczy_ptss2: TWideStringField
      FieldName = 'fczy_ptss2'
      Size = 50
    end
    object qryHouseListfczy_cz: TWideStringField
      FieldName = 'fczy_cz'
      Size = 50
    end
    object qryHouseListfczy_zj: TFloatField
      FieldName = 'fczy_zj'
    end
    object qryHouseListfczy_czsm: TWideStringField
      FieldName = 'fczy_czsm'
      Size = 255
    end
    object qryHouseListfczy_cs: TWideStringField
      FieldName = 'fczy_cs'
      Size = 50
    end
    object qryHouseListfczy_sj: TFloatField
      FieldName = 'fczy_sj'
    end
    object qryHouseListfczy_cssm: TWideStringField
      FieldName = 'fczy_cssm'
      Size = 255
    end
    object qryHouseListfczy_yzxm: TWideStringField
      FieldName = 'fczy_yzxm'
      Size = 50
    end
    object qryHouseListfczy_dh: TWideStringField
      FieldName = 'fczy_dh'
      Size = 50
    end
    object qryHouseListfczy_tel: TWideStringField
      FieldName = 'fczy_tel'
      Size = 50
    end
    object qryHouseListfczy_jtwz: TWideStringField
      FieldName = 'fczy_jtwz'
      Size = 255
    end
    object qryHouseListfczy_bmbz: TWideStringField
      FieldName = 'fczy_bmbz'
      Size = 255
    end
    object qryHouseListfczy_xxbz: TMemoField
      FieldName = 'fczy_xxbz'
      BlobType = ftMemo
    end
    object qryHouseListfczy_czy: TWideStringField
      FieldName = 'fczy_czy'
      Size = 50
    end
    object qryHouseListfczy_ly: TWideStringField
      FieldName = 'fczy_ly'
      Size = 50
    end
    object qryHouseListfczy_zs: TWideStringField
      FieldName = 'fczy_zs'
      Size = 50
    end
    object qryHouseListfczy_ygbh: TWideStringField
      FieldName = 'fczy_ygbh'
      Size = 50
    end
    object qryHouseListfczy_sby: TWideStringField
      FieldName = 'fczy_sby'
      Size = 50
    end
    object strngfldHouseListHouseSecrecyInfo: TStringField
      FieldKind = fkCalculated
      FieldName = 'HouseSecrecyInfo'
      Size = 200
      Calculated = True
    end
    object strngfldHouseListHouseDetailInfo: TStringField
      FieldKind = fkCalculated
      FieldName = 'HouseDetailInfo'
      Size = 200
      Calculated = True
    end
  end
  object dsHouseList: TDataSource
    DataSet = qryHouseList
    Left = 897
    Top = 9
  end
  object tblHouseTrack: TADOTable
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    IndexFieldNames = 'fcgj_fybh'
    MasterFields = 'fczy_bh'
    MasterSource = dsHouseList
    TableName = 'fcgj'
    Left = 728
    Top = 56
  end
  object dsHouseTrack: TDataSource
    DataSet = tblHouseTrack
    Left = 697
    Top = 57
  end
  object qryCustomerTrack: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 664
    Top = 56
  end
  object dsCustomerTrack: TDataSource
    DataSet = qryCustomerTrack
    Left = 632
    Top = 56
  end
  object pmAutoCustomer: TPopupMenu
    Left = 784
    Top = 56
    object MenuItem1: TMenuItem
      Caption = '  '#26174#31034#23458#25143#35814#32454#20449#24687'  '
      OnClick = MenuItem1Click
    end
  end
  object pmHouse: TPopupMenu
    Left = 856
    Top = 56
    object MenuItem2: TMenuItem
      Caption = '  '#25151#28304#35814#32454#20449#24687
    end
    object N1: TMenuItem
      Caption = '    '#31199#25151#26597#35810
    end
    object N2: TMenuItem
      Caption = '    '#20080#25151#26597#35810
    end
    object N3: TMenuItem
      Caption = '    '#26032#22686#25151#28304
    end
    object N4: TMenuItem
      Caption = '    '#25171#21360#25151#28304' '
    end
  end
end
