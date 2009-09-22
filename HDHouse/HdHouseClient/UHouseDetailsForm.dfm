object HouseDetailsForm: THouseDetailsForm
  Left = 331
  Top = 64
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #25151#28304#35814#32454#20449#24687
  ClientHeight = 612
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bsknpgcntrlPageC: TbsSkinPageControl
    Left = 4
    Top = 87
    Width = 858
    Height = 220
    ActivePage = bskntbshttab1
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabExtededDraw = False
    TabSpacing = 1
    TextInHorizontal = False
    TabsInCenter = False
    FreeOnClose = True
    ShowCloseButtons = False
    TabsBGTransparent = True
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBtnText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultItemHeight = 20
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'tab'
    object bskntbshttab1: TbsSkinTabSheet
      Caption = #25151#28304#24773#20917
      Constraints.MaxHeight = 198
      Constraints.MaxWidth = 856
      Constraints.MinHeight = 198
      Constraints.MinWidth = 856
      object btnAddAdviser1: TbsSkinSpeedButton
        Left = 797
        Top = 124
        Width = 25
        Height = 21
        Hint = 'Load skin...'
        HintImageIndex = 1
        SkinDataName = 'toolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImageList = bsPngImageList1
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 0
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        ShowHint = True
        ParentShowHint = False
        Down = False
        GroupIndex = 0
        ShowCaption = True
        NumGlyphs = 1
        Align = alCustom
        Spacing = 1
        OnClick = btnAddAdviser1Click
      end
      object btnAddAdviser2: TbsSkinSpeedButton
        Left = 797
        Top = 156
        Width = 25
        Height = 24
        Hint = 'Load skin...'
        HintImageIndex = 1
        SkinDataName = 'toolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImageList = bsPngImageList1
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 0
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        ShowHint = True
        ParentShowHint = False
        Down = False
        GroupIndex = 0
        ShowCaption = True
        NumGlyphs = 1
        Align = alCustom
        Spacing = 1
        OnClick = btnAddAdviser2Click
      end
      object bsSkinStdLabel3: TbsSkinStdLabel
        Left = 226
        Top = 92
        Width = 3
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
      end
      object bsSkinStdLabel4: TbsSkinStdLabel
        Left = 281
        Top = 92
        Width = 3
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
      end
      object bsSkinStdLabel15: TbsSkinStdLabel
        Left = 18
        Top = 31
        Width = 54
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
        Caption = #29289#19994#21517#31216
      end
      object bsSkinStdLabel16: TbsSkinStdLabel
        Left = 246
        Top = 31
        Width = 60
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
        Caption = #29289#19994#29992#36884
      end
      object bsSkinStdLabel17: TbsSkinStdLabel
        Left = 460
        Top = 32
        Width = 62
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
        Caption = #29289#19994#31867#22411
      end
      object bsSkinStdLabel18: TbsSkinStdLabel
        Left = 641
        Top = 28
        Width = 64
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
        Caption = #35013#20462#31243#24230
      end
      object bsSkinStdLabel19: TbsSkinStdLabel
        Left = 17
        Top = 63
        Width = 56
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
        Caption = #20855#20307#22320#22336
      end
      object bsSkinStdLabel20: TbsSkinStdLabel
        Left = 461
        Top = 64
        Width = 59
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
        Caption = #25152#22788#21306#22495
      end
      object bsSkinStdLabel21: TbsSkinStdLabel
        Left = 643
        Top = 63
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
        Caption = #24314#25104#24180#20221
      end
      object bsSkinStdLabel22: TbsSkinStdLabel
        Left = 826
        Top = 61
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
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #24180
      end
      object bsSkinStdLabel23: TbsSkinStdLabel
        Left = 820
        Top = 93
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
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #23618
      end
      object bsSkinStdLabel24: TbsSkinStdLabel
        Left = 739
        Top = 94
        Width = 47
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
        Caption = #23618','#20301#20110
      end
      object bsSkinStdLabel25: TbsSkinStdLabel
        Left = 644
        Top = 94
        Width = 56
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
        Caption = #24635'  '#23618'  '#25968
      end
      object bsSkinStdLabel26: TbsSkinStdLabel
        Left = 464
        Top = 95
        Width = 59
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
        Caption = #24314#31569#38754#31215
      end
      object bsSkinStdLabel27: TbsSkinStdLabel
        Left = 324
        Top = 94
        Width = 31
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
        Caption = #25151#22411
      end
      object bsSkinStdLabel5: TbsSkinStdLabel
        Left = 277
        Top = 92
        Width = 24
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
        Caption = #38451#21488
      end
      object bsSkinStdLabel28: TbsSkinStdLabel
        Left = 226
        Top = 91
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
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #21355
      end
      object bsSkinStdLabel2: TbsSkinStdLabel
        Left = 170
        Top = 91
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
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #21381
      end
      object bsSkinStdLabel1: TbsSkinStdLabel
        Left = 117
        Top = 92
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
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #23460
      end
      object bsSkinStdLabel29: TbsSkinStdLabel
        Left = 16
        Top = 93
        Width = 59
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
        Caption = #25143#22411#32467#26500
      end
      object bsSkinStdLabel30: TbsSkinStdLabel
        Left = 17
        Top = 130
        Width = 54
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
        Caption = #22522#30784#35774#26045
      end
      object bsSkinStdLabel31: TbsSkinStdLabel
        Left = 15
        Top = 164
        Width = 57
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
        Caption = #37197#22871#35774#26045
      end
      object edtfczy_wylb: TbsSkinDBEdit
        Left = 81
        Top = 28
        Width = 161
        Height = 18
        Text = 'edtfczy_wylb'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_wymc'
        DataSource = dsfczyinfo
      end
      object edtfczy_lc: TbsSkinDBEdit
        Left = 785
        Top = 90
        Width = 32
        Height = 18
        Text = 'edtfczy_lc'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_lc'
        DataSource = dsfczyinfo
      end
      object edtfczy_ws: TbsSkinDBEdit
        Left = 82
        Top = 90
        Width = 29
        Height = 18
        Text = 'edtfczy_ws'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
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
        AutoSize = False
        DataField = 'fczy_ws'
        DataSource = dsfczyinfo
      end
      object edtfczy_jtdz: TbsSkinDBEdit
        Left = 81
        Top = 60
        Width = 368
        Height = 18
        Text = 'edtfczy_jtdz'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_jtdz'
        DataSource = dsfczyinfo
      end
      object edtfczy_ptss1: TbsSkinDBEdit
        Left = 81
        Top = 128
        Width = 701
        Height = 18
        Text = 'edtfczy_ptss1'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        OnClick = edtfczy_ptss1Click
        AutoSize = False
        DataField = 'fczy_ptss1'
        DataSource = dsfczyinfo
      end
      object edtfczy_lczs: TbsSkinDBEdit
        Left = 708
        Top = 91
        Width = 31
        Height = 18
        Text = 'edtfczy_lczs'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_lczs'
        DataSource = dsfczyinfo
      end
      object edtfczy_ptss2: TbsSkinDBEdit
        Left = 81
        Top = 161
        Width = 702
        Height = 18
        Text = 'edtfczy_ptss2'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        OnClick = edtfczy_ptss2Click
        AutoSize = False
        DataField = 'fczy_ptss2'
        DataSource = dsfczyinfo
      end
      object edtfczy_mj: TbsSkinDBEdit
        Left = 533
        Top = 92
        Width = 105
        Height = 18
        Text = 'edtfczy_mj'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_jzmj'
        DataSource = dsfczyinfo
      end
      object dblkcbbfczy_qy1: TDBLookupComboBox
        Left = 533
        Top = 58
        Width = 104
        Height = 22
        DataField = 'fczy_qy'
        DataSource = dsfczyinfo
        KeyField = 'cs_mc'
        ListField = 'cs_mc'
        ListSource = ParametersDataModule.dsHouseRegion
        TabOrder = 4
      end
      object dblkcbbfczy_fwlx: TDBLookupComboBox
        Left = 361
        Top = 89
        Width = 90
        Height = 22
        DataField = 'fczy_fx'
        DataSource = dsfczyinfo
        KeyField = 'cs_mc'
        ListField = 'cs_mc'
        ListSource = ParametersDataModule.dsHouseType
        TabOrder = 7
      end
      object dblkcbbfczy_wyyt: TDBLookupComboBox
        Left = 310
        Top = 27
        Width = 139
        Height = 22
        DataField = 'fczy_wyyt'
        DataSource = dsfczyinfo
        KeyField = 'cs_mc'
        ListField = 'cs_mc'
        ListSource = ParametersDataModule.dsPropertyUsage
        TabOrder = 2
      end
      object dblkcbbfczy_wylx: TDBLookupComboBox
        Left = 531
        Top = 25
        Width = 107
        Height = 22
        DataField = 'fczy_wylb'
        DataSource = dsfczyinfo
        KeyField = 'cs_mc'
        ListField = 'cs_mc'
        ListSource = ParametersDataModule.dsPropertyClass
        TabOrder = 1
      end
      object dblkcbbfczy_zxcd: TDBLookupComboBox
        Left = 704
        Top = 23
        Width = 115
        Height = 22
        DataField = 'fczy_zxcd'
        DataSource = dsfczyinfo
        KeyField = 'cs_mc'
        ListField = 'cs_mc'
        ListSource = ParametersDataModule.dsFitmentClass
        TabOrder = 0
      end
      object edtfczy_jcnf: TbsSkinDBEdit
        Left = 705
        Top = 59
        Width = 117
        Height = 18
        Text = 'edtfczy_jcnf'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_jcnf'
        DataSource = dsfczyinfo
      end
      object edtfczy_kt: TbsSkinDBEdit
        Left = 136
        Top = 90
        Width = 29
        Height = 18
        Text = 'edtfczy_kt'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_kt'
        DataSource = dsfczyinfo
      end
      object edtfczy_wc: TbsSkinDBEdit
        Left = 189
        Top = 90
        Width = 29
        Height = 18
        Text = 'edtfczy_wc'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_wc'
        DataSource = dsfczyinfo
      end
      object edtfczy_yt: TbsSkinDBEdit
        Left = 249
        Top = 90
        Width = 25
        Height = 18
        Text = 'edtfczy_yt'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_yt'
        DataSource = dsfczyinfo
      end
    end
    object bskntbshttab2: TbsSkinTabSheet
      Caption = #20445#23494#20449#24687
      object bsSkinStdLabel8: TbsSkinStdLabel
        Left = 35
        Top = 82
        Width = 65
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
        Caption = #22791#27880#35828#26126
      end
      object bsSkinStdLabel9: TbsSkinStdLabel
        Left = 37
        Top = 57
        Width = 65
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
        Caption = #20855#20307#20301#32622
      end
      object bsSkinStdLabel6: TbsSkinStdLabel
        Left = 36
        Top = 34
        Width = 65
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
        Caption = #19994#20027#22995#21517
      end
      object bsSkinStdLabel7: TbsSkinStdLabel
        Left = 467
        Top = 32
        Width = 73
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
        Caption = #32852#31995#25163#26426
      end
      object bsSkinStdLabel10: TbsSkinStdLabel
        Left = 250
        Top = 32
        Width = 65
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
        Caption = #32852#31995#30005#35805
      end
      object edtfczy_yzxm: TbsSkinDBEdit
        Left = 109
        Top = 29
        Width = 121
        Height = 18
        Text = 'edtfczy_yzxm'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_yzxm'
        DataSource = dsfczyinfo
      end
      object edtfczy_jtwz: TbsSkinDBEdit
        Left = 109
        Top = 54
        Width = 624
        Height = 18
        Text = 'edtfczy_jtwz'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_jtwz'
        DataSource = dsfczyinfo
      end
      object mmofczy_yzxm: TbsSkinDBMemo
        Left = 109
        Top = 78
        Width = 626
        Height = 89
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'mmofczy_yzxm')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 4
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        UseSkinFontColor = True
        BitMapBG = True
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'memo'
        DataField = 'fczy_bmbz'
        DataSource = dsfczyinfo
      end
      object edtfczy_yzxm1: TbsSkinDBEdit
        Left = 327
        Top = 29
        Width = 121
        Height = 18
        Text = 'edtfczy_yzxm1'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_dh'
        DataSource = dsfczyinfo
      end
      object edtfczy_tel: TbsSkinDBEdit
        Left = 550
        Top = 29
        Width = 182
        Height = 18
        Text = 'edtfczy_tel'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'fczy_tel'
        DataSource = dsfczyinfo
      end
    end
  end
  object btn2: TbsSkinButton
    Left = 635
    Top = 575
    Width = 67
    Height = 25
    HintImageIndex = 0
    TabOrder = 4
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
    Caption = #20445#23384'(&O)'
    NumGlyphs = 2
    Spacing = 1
    OnClick = btn2Click
  end
  object btn3: TbsSkinButton
    Left = 749
    Top = 576
    Width = 68
    Height = 25
    HintImageIndex = 0
    TabOrder = 5
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
    Caption = #21462#28040'(&E)'
    NumGlyphs = 2
    Spacing = 1
    OnClick = btn3Click
  end
  object bskngrpbx1: TbsSkinGroupBox
    Left = 6
    Top = 320
    Width = 857
    Height = 90
    HintImageIndex = 0
    TabOrder = 2
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'groupbox'
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
    CaptionMode = True
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = #20986#31199#20986#21806
    object bsSkinStdLabel32: TbsSkinStdLabel
      Left = 119
      Top = 33
      Width = 57
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
      Caption = #20986#31199#20215#26684
    end
    object bsSkinStdLabel33: TbsSkinStdLabel
      Left = 119
      Top = 64
      Width = 55
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
      Caption = #20986#21806#20215#26684
    end
    object bsSkinStdLabel34: TbsSkinStdLabel
      Left = 267
      Top = 34
      Width = 33
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
      Caption = #20803'/'#26376
    end
    object bsSkinStdLabel35: TbsSkinStdLabel
      Left = 270
      Top = 65
      Width = 32
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
      Caption = #19975#20803
    end
    object bsSkinStdLabel36: TbsSkinStdLabel
      Left = 314
      Top = 34
      Width = 58
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
      Caption = #20986#31199#35828#26126
    end
    object bsSkinStdLabel37: TbsSkinStdLabel
      Left = 314
      Top = 63
      Width = 54
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
      Caption = #20986#21806#35828#26126
    end
    object bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox
      Left = 28
      Top = 59
      Width = 74
      Height = 25
      HintImageIndex = 0
      TabOrder = 3
      SkinData = HDHouseDataModule.bsSkinData1
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
      Caption = #27492#25151#20986#21806
      DataField = 'fczy_cs'
      DataSource = dsfczyinfo
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox
      Left = 28
      Top = 26
      Width = 76
      Height = 25
      HintImageIndex = 0
      TabOrder = 0
      SkinData = HDHouseDataModule.bsSkinData1
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
      Caption = #27492#25151#20986#31199
      DataField = 'fczy_cz'
      DataSource = dsfczyinfo
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edtfczy_sj: TbsSkinDBEdit
      Left = 189
      Top = 63
      Width = 72
      Height = 18
      Text = 'edtfczy_sj'
      DefaultColor = clWindow
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      DataField = 'fczy_sj'
      DataSource = dsfczyinfo
    end
    object edtfczy_zj: TbsSkinDBEdit
      Left = 188
      Top = 30
      Width = 73
      Height = 18
      Text = 'edtfczy_zj'
      DefaultColor = clWindow
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      DataField = 'fczy_zj'
      DataSource = dsfczyinfo
    end
    object edtfczy_cssm: TbsSkinDBEdit
      Left = 384
      Top = 60
      Width = 438
      Height = 18
      Text = 'edtfczy_cssm'
      DefaultColor = clWindow
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      DataField = 'fczy_cssm'
      DataSource = dsfczyinfo
    end
    object edtfczy_czsm: TbsSkinDBEdit
      Left = 384
      Top = 30
      Width = 438
      Height = 18
      Text = 'edtfczy_czsm'
      DefaultColor = clWindow
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      DataField = 'fczy_czsm'
      DataSource = dsfczyinfo
    end
  end
  object bskngrpbx2: TbsSkinGroupBox
    Left = 7
    Top = 417
    Width = 856
    Height = 150
    HintImageIndex = 0
    TabOrder = 3
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'groupbox'
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
    CaptionMode = True
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = #25151#28304#35814#32454#20449#24687
    object mmoHouseInfo: TbsSkinDBMemo
      Left = 11
      Top = 23
      Width = 834
      Height = 119
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'bsSkinDBMemo1')
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
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'memo'
      DataField = 'fczy_xxbz'
      DataSource = dsfczyinfo
    end
  end
  object bsknpnl1: TbsSkinPanel
    Left = 8
    Top = 8
    Width = 856
    Height = 75
    HintImageIndex = 0
    TabOrder = 0
    SkinData = HDHouseDataModule.bsSkinData1
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
    Caption = 'bsknpnl1'
    object bsSkinStdLabel11: TbsSkinStdLabel
      Left = 10
      Top = 31
      Width = 67
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
      Caption = #25151#28304#32534#21495' '#65306
    end
    object bsSkinStdLabel12: TbsSkinStdLabel
      Left = 225
      Top = 31
      Width = 63
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
      Caption = #25151#20135#26469#28304' '#65306
    end
    object bsSkinStdLabel13: TbsSkinStdLabel
      Left = 420
      Top = 30
      Width = 63
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
      Caption = #24403#21069#29366#24577' '#65306
    end
    object bsSkinStdLabel14: TbsSkinStdLabel
      Left = 615
      Top = 32
      Width = 63
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
      Caption = #32622#19994#39038#38382' '#65306
    end
    object btn1: TbsSkinSpeedButton
      Left = 809
      Top = 26
      Width = 25
      Height = 24
      Hint = 'Load skin...'
      HintImageIndex = 1
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'toolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = bsPngImageList1
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 0
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      ShowHint = True
      ParentShowHint = False
      Down = False
      GroupIndex = 0
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      OnClick = btn1Click
    end
    object edtfczy_fwly: TbsSkinDBEdit
      Left = 683
      Top = 29
      Width = 121
      Height = 18
      Text = 'edtfczy_fwly'
      DefaultColor = clWindow
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      OnClick = edtfczy_fwlyClick
      AutoSize = False
      DataField = 'fczy_fwly'
      DataSource = dsfczyinfo
    end
    object dblkcbbfczy_qy3: TDBLookupComboBox
      Left = 440
      Top = -60
      Width = 106
      Height = 21
      DataField = 'fczy_dqzt'
      DataSource = dsfczyinfo
      KeyField = 'cs_mc'
      ListField = 'cs_mc'
      ListSource = ParametersDataModule.dsHouseStatus
      TabOrder = 0
    end
    object dblkcbbfczy_qy: TDBLookupComboBox
      Left = 296
      Top = 26
      Width = 115
      Height = 21
      DataField = 'fczy_ly'
      DataSource = dsfczyinfo
      KeyField = 'cs_mc'
      ListField = 'cs_mc'
      ListFieldIndex = 1
      ListSource = ParametersDataModule.dsHouseSource
      TabOrder = 2
    end
    object dblkcbbfczy_dqzt: TDBLookupComboBox
      Left = 489
      Top = 25
      Width = 115
      Height = 21
      DataField = 'fczy_dqzt'
      DataSource = dsfczyinfo
      KeyField = 'cs_mc'
      ListField = 'cs_mc'
      ListSource = ParametersDataModule.dsHouseStatus
      TabOrder = 1
    end
    object edt1: TbsSkinMaskEdit
      Left = 83
      Top = 29
      Width = 134
      Height = 18
      Text = 'edt1'
      DefaultColor = clWindow
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clBlack
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      ButtonMode = False
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      BorderStyle = bsNone
    end
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
    Left = 634
    Top = 65529
  end
  object bsPngImageList1: TbsPngImageList
    PngImages = <
      item
        Name = 'PngImage0'
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000004C94944415478DAB5956B6C145514C7FF7766677667B765
          D9EE36F210111123622A350805431A08D41A10F58B89242A104589261A8C7E40
          2386F8C118889818F5838012C488213C221F686B5020510169838FA40634105A
          0BECA3FBECEC3CEEF5DC99DD6DD742821FBCD9B33B731FFFDF3DE7DC7B960921
          F0E2900AC600A6024A00706DC0CCC0EB83029D7EDBE96906D93D6406D9CF6443
          82E3E4A7B3781A3768529BC9AFE709A048710DB08A809DF36051127E8386D743
          204A62501485E6A9701CDBDF90028B74F6D2D8E6CFEEE6976E0878EE4AC01377
          CBB4F3B4B7B09344BFA0854DB1681C0AD10417B4825631DF98C2C804529924BD
          088BC65EDF33C7FDE0BA8075D702DEA29121D98B97A96B5B5033D488D100E152
          1797934717B20A447A2DC3EA700BD95C560EEDF8EA3EF7D97180355703DECE9D
          125611E0506343149AAA833BF0952B9BAF01C63C3095F9A000433275554EDCBC
          7F9EBBA50EB07A2080E220A682A33F140A47C2A14865E71559FA7965FA6EB44E
          E8F05E7B735DD87EF1691F500D17415CE160389B91F3171F6E734FD6008FF593
          0757B00B2AD624E2CDA3E263B6BDB765A82E81ABCF4D1AF5C23B6DE48902E40A
          599825ABAFABDD6DAD013ACF6A4D4E1E43F178428360E3C465DB37F7EFBAF727
          FA26D7C5AC0AA1038264F21A988E45DD6DF60F1EA0FD98F61425727722D1ECC5
          DC4BE8BF0007EEAF073C7E7672FD8431905432492752BC7FF2617BA307987F44
          DBA185D475B158CC17267BEBCECF317F62076EA69D1AEEC2960BCFD440A55209
          C5E1D2A99F56DA0B3C40EB21BDDB880497353636FA47840047170CDE9478B575
          9E9E52F3DCB66D64D2D9C1DE55D6540FD072583F1E0C85163736367893D51043
          77EBC07F0274FC722B9C02F79EADB22D937DE5DC4A6B9207987D48FF26A06A2B
          A213A35E1C83CD2ADEB97D17DAF4653725FEA3D9834D7FAD819526007DCAE532
          8AE5FC9FBFAFB0667A803BBED4B729616C8C4F4CC8E206BD4981DAA0789E705B
          C019E63871EFE53AD1A583D3A104498FAA915BE4700B0276D6F72097CFC11656
          CFF947ACE51E60D2BBFAA3C603CAC19812F7572B636E2BFC5B7AE6C17AC082BE
          69702A82B28D3D79692B0967005B2EAF2B6FF6008CB1E894A3C1DEA008CD8804
          22BEA8322AA6180C7D6DF580D633D3E0E6F93871876E7341CB8E64B63BF30B07
          9C5F7D0F8E87607ECB5F0D2D55B636F10484236A474E5A20A1E2C3BB76A2DDF0
          73F27DB1072FF5AF8593E1B5635DF53CC352B0FFE03BD31BEC1748DBF60089EF
          0CA4969889D8D7C1C32CC616C655829447216A5C851AA15B4A399149E432E679
          019E1F0D910C6386A5C14D7E31FFB6B5C23ECD7FAB958AE831C39B54DC602D0A
          6FD3F73003339A8D66B8393EEE468F6BB26C8715A49D14555F9E353FB2D75B07
          DDFD90B5AF0A08F7F88091E5A6AACC5596E96F6AEFB1286B894563D01C0D7C84
          4358C2DB7D5594E9BE472CCC705596691383F627F66BCE11F720CD28F9B9A900
          821250D9A9D5616A2CC1E60536696BD96C653555D8881136601861685AC09BE3
          3A2E464C13C54241AE73C42571C4D96A7F2CFAF989AA781D40AD022A10FE9029
          CFD06D98A3B4B027034BD84CB61013D82C04D0E4135044415CC080382B0EB85D
          E2B8DB4BBDE7E5211A1BBD1A80751B951ED4C7BCD3A47F6ADC4246651613C8F4
          CA8814CA93A5C8649935AF979E1AE0FF6CFF006C2A68EF42030A6F0000000049
          454E44AE426082}
      end
      item
        Name = 'PngImage1'
      end
      item
        Name = 'PngImage2'
      end>
    PngWidth = 16
    PngHeight = 16
    Left = 536
    Top = 65528
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object qry1: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = 'null'
      end>
    SQL.Strings = (
      'select * from fczy where fczy_bh=id')
    Left = 741
  end
  object dsfczyinfo: TDataSource
    DataSet = qry1
    Left = 699
    Top = 65532
  end
end
