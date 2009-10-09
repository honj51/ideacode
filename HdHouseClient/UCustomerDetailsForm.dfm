object CustomerDetailsForm: TCustomerDetailsForm
  Left = 345
  Top = 53
  AutoScroll = False
  BorderIcons = []
  Caption = #23458#25143#20449#24687
  ClientHeight = 640
  ClientWidth = 760
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
  object bsSkinPanel1: TbsSkinPanel
    Left = 9
    Top = 15
    Width = 745
    Height = 73
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
    Caption = 'bsSkinPanel1'
    object lbl1: TbsSkinStdLabel
      Left = 24
      Top = 24
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
      Caption = #23458#25143#32534#21495
    end
    object lbl2: TbsSkinStdLabel
      Left = 216
      Top = 24
      Width = 69
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
      Caption = #23458#25143#26469#28304
    end
    object lbl3: TbsSkinStdLabel
      Left = 376
      Top = 24
      Width = 78
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
      Caption = #24403#21069#29366#24577
    end
    object lbl4: TbsSkinStdLabel
      Left = 536
      Top = 24
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
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #32622#19994#39038#38382
    end
    object btn2: TbsSkinSpeedButton
      Left = 696
      Top = 20
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
      ImageList = bspngmglst1
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
      OnClick = btn2Click
    end
    object edtCustomerName: TbsSkinDBEdit
      Left = 88
      Top = 22
      Width = 121
      Height = 18
      Text = 'edtCustomerName'
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
      Enabled = False
      ParentFont = False
      TabOrder = 0
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      DataField = 'khzy_bh'
      DataSource = dsKhzy
    end
    object edtZygw: TbsSkinDBEdit
      Left = 600
      Top = 22
      Width = 89
      Height = 18
      Text = 'edtZygw'
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
      OnClick = edtZygwClick
      AutoSize = False
      DataField = 'khzy_fwly'
      DataSource = dsKhzy
    end
    object cbbKhly: TbsSkinComboBox
      Left = 280
      Top = 20
      Width = 89
      Height = 20
      HintImageIndex = 0
      TabOrder = 1
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'combobox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      UseSkinSize = True
      ToolButtonStyle = False
      AlphaBlend = False
      AlphaBlendValue = 0
      AlphaBlendAnimation = False
      ListBoxCaptionMode = False
      ListBoxDefaultFont.Charset = DEFAULT_CHARSET
      ListBoxDefaultFont.Color = clWindowText
      ListBoxDefaultFont.Height = 14
      ListBoxDefaultFont.Name = 'Arial'
      ListBoxDefaultFont.Style = []
      ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
      ListBoxDefaultCaptionFont.Color = clWindowText
      ListBoxDefaultCaptionFont.Height = 14
      ListBoxDefaultCaptionFont.Name = 'Arial'
      ListBoxDefaultCaptionFont.Style = []
      ListBoxDefaultItemHeight = 20
      ListBoxCaptionAlignment = taLeftJustify
      ListBoxUseSkinFont = True
      ListBoxUseSkinItemHeight = True
      ListBoxWidth = 0
      HideSelection = True
      AutoComplete = True
      ImageIndex = -1
      CharCase = ecNormal
      DefaultColor = clWindow
      ItemIndex = -1
      DropDownCount = 8
      HorizontalExtent = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Sorted = False
      Style = bscbFixedStyle
    end
    object cbbDqzt: TbsSkinComboBox
      Left = 440
      Top = 20
      Width = 89
      Height = 20
      HintImageIndex = 0
      TabOrder = 2
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'combobox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      UseSkinSize = True
      ToolButtonStyle = False
      AlphaBlend = False
      AlphaBlendValue = 0
      AlphaBlendAnimation = False
      ListBoxCaptionMode = False
      ListBoxDefaultFont.Charset = DEFAULT_CHARSET
      ListBoxDefaultFont.Color = clWindowText
      ListBoxDefaultFont.Height = 14
      ListBoxDefaultFont.Name = 'Arial'
      ListBoxDefaultFont.Style = []
      ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
      ListBoxDefaultCaptionFont.Color = clWindowText
      ListBoxDefaultCaptionFont.Height = 14
      ListBoxDefaultCaptionFont.Name = 'Arial'
      ListBoxDefaultCaptionFont.Style = []
      ListBoxDefaultItemHeight = 20
      ListBoxCaptionAlignment = taLeftJustify
      ListBoxUseSkinFont = True
      ListBoxUseSkinItemHeight = True
      ListBoxWidth = 0
      HideSelection = True
      AutoComplete = True
      ImageIndex = -1
      CharCase = ecNormal
      DefaultColor = clWindow
      ItemIndex = -1
      DropDownCount = 8
      HorizontalExtent = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Sorted = False
      Style = bscbFixedStyle
    end
  end
  object bsknpgcntrlbsknpgcntr: TbsSkinPageControl
    Left = 9
    Top = 97
    Width = 745
    Height = 201
    ActivePage = bskntbsht1
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
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #23458#25143#38656#27714
      object lbl5: TbsSkinStdLabel
        Left = 24
        Top = 27
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
        Caption = #29289#19994#21517#31216
      end
      object lbl6: TbsSkinStdLabel
        Left = 216
        Top = 27
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #29289#19994#29992#36884
      end
      object lbl8: TbsSkinStdLabel
        Left = 408
        Top = 27
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #29289#19994#31867#21035
      end
      object lbl9: TbsSkinStdLabel
        Left = 568
        Top = 27
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #35013#20462#31243#24230
      end
      object lbl10: TbsSkinStdLabel
        Left = 24
        Top = 60
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
      object lbl11: TbsSkinStdLabel
        Left = 408
        Top = 59
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #25152#22788#21306#22495
      end
      object lbl12: TbsSkinStdLabel
        Left = 568
        Top = 60
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #25151#23627#31867#22411
      end
      object lbl13: TbsSkinStdLabel
        Left = 24
        Top = 88
        Width = 66
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
        Caption = #25151#38388#25968#37327
      end
      object lbl14: TbsSkinStdLabel
        Left = 216
        Top = 88
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
        Caption = #25151
      end
      object lbl15: TbsSkinStdLabel
        Left = 240
        Top = 88
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #24314#31569#38754#31215
      end
      object lbl16: TbsSkinStdLabel
        Left = 424
        Top = 88
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #24179#31859
      end
      object lbl17: TbsSkinStdLabel
        Left = 456
        Top = 88
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #24314#25104#24180#20221
      end
      object lbl18: TbsSkinStdLabel
        Left = 144
        Top = 88
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
      object lbl19: TbsSkinStdLabel
        Left = 352
        Top = 88
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
      object lbl20: TbsSkinStdLabel
        Left = 576
        Top = 88
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
      object lbl21: TbsSkinStdLabel
        Left = 24
        Top = 120
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
        Caption = #22522#30784#35774#26045
      end
      object lbl22: TbsSkinStdLabel
        Left = 24
        Top = 152
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
      object btn3: TbsSkinSpeedButton
        Left = 688
        Top = 113
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
        ImageList = bspngmglst1
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
        OnClick = btn3Click
      end
      object btn4: TbsSkinSpeedButton
        Left = 688
        Top = 145
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
        ImageList = bspngmglst1
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
        OnClick = btn4Click
      end
      object edtWymm: TbsSkinDBEdit
        Left = 88
        Top = 24
        Width = 121
        Height = 18
        Text = 'edtWymm'
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
        DataField = 'khzy_wymc'
        DataSource = dsKhzy
      end
      object edtJtwz: TbsSkinDBEdit
        Left = 88
        Top = 57
        Width = 313
        Height = 18
        Text = 'edtJtwz'
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
        DataField = 'khzy_jtdz'
        DataSource = dsKhzy
      end
      object edtSl1: TbsSkinDBEdit
        Left = 88
        Top = 86
        Width = 49
        Height = 18
        Text = 'edtSl1'
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
        DataField = 'khzy_ws1'
        DataSource = dsKhzy
      end
      object edtSl2: TbsSkinDBEdit
        Left = 160
        Top = 86
        Width = 49
        Height = 18
        Text = 'edtSl2'
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
        DataField = 'khzy_ws2'
        DataSource = dsKhzy
      end
      object edtMj1: TbsSkinDBEdit
        Left = 296
        Top = 86
        Width = 49
        Height = 18
        Text = 'edtMj1'
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
        DataField = 'khzy_jzmj1'
        DataSource = dsKhzy
      end
      object edtMj2: TbsSkinDBEdit
        Left = 368
        Top = 86
        Width = 49
        Height = 18
        Text = 'edtMj2'
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
        DataField = 'khzy_jzmj2'
        DataSource = dsKhzy
      end
      object edtJcss: TbsSkinDBEdit
        Left = 88
        Top = 117
        Width = 593
        Height = 18
        Text = 'edtJcss'
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
        OnClick = edtJcssClick
        AutoSize = False
        DataField = 'khzy_ptss1'
        DataSource = dsKhzy
      end
      object edtPtss: TbsSkinDBEdit
        Left = 88
        Top = 149
        Width = 593
        Height = 18
        Text = 'edtPtss'
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
        OnClick = edtPtssClick
        AutoSize = False
        DataField = 'khzy_ptss2'
        DataSource = dsKhzy
      end
      object cbbWyyt: TbsSkinComboBox
        Left = 272
        Top = 24
        Width = 129
        Height = 20
        HintImageIndex = 0
        TabOrder = 1
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'combobox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        ToolButtonStyle = False
        AlphaBlend = False
        AlphaBlendValue = 0
        AlphaBlendAnimation = False
        ListBoxCaptionMode = False
        ListBoxDefaultFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultFont.Color = clWindowText
        ListBoxDefaultFont.Height = 14
        ListBoxDefaultFont.Name = 'Arial'
        ListBoxDefaultFont.Style = []
        ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultCaptionFont.Color = clWindowText
        ListBoxDefaultCaptionFont.Height = 14
        ListBoxDefaultCaptionFont.Name = 'Arial'
        ListBoxDefaultCaptionFont.Style = []
        ListBoxDefaultItemHeight = 20
        ListBoxCaptionAlignment = taLeftJustify
        ListBoxUseSkinFont = True
        ListBoxUseSkinItemHeight = True
        ListBoxWidth = 0
        HideSelection = True
        AutoComplete = True
        ImageIndex = -1
        CharCase = ecNormal
        DefaultColor = clWindow
        ItemIndex = -1
        DropDownCount = 8
        HorizontalExtent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Sorted = False
        Style = bscbFixedStyle
      end
      object cbbWylb: TbsSkinComboBox
        Left = 464
        Top = 24
        Width = 97
        Height = 20
        HintImageIndex = 0
        TabOrder = 2
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'combobox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        ToolButtonStyle = False
        AlphaBlend = False
        AlphaBlendValue = 0
        AlphaBlendAnimation = False
        ListBoxCaptionMode = False
        ListBoxDefaultFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultFont.Color = clWindowText
        ListBoxDefaultFont.Height = 14
        ListBoxDefaultFont.Name = 'Arial'
        ListBoxDefaultFont.Style = []
        ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultCaptionFont.Color = clWindowText
        ListBoxDefaultCaptionFont.Height = 14
        ListBoxDefaultCaptionFont.Name = 'Arial'
        ListBoxDefaultCaptionFont.Style = []
        ListBoxDefaultItemHeight = 20
        ListBoxCaptionAlignment = taLeftJustify
        ListBoxUseSkinFont = True
        ListBoxUseSkinItemHeight = True
        ListBoxWidth = 0
        HideSelection = True
        AutoComplete = True
        ImageIndex = -1
        CharCase = ecNormal
        DefaultColor = clWindow
        ItemIndex = -1
        DropDownCount = 8
        HorizontalExtent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Sorted = False
        Style = bscbFixedStyle
      end
      object cbbQy: TbsSkinComboBox
        Left = 464
        Top = 56
        Width = 97
        Height = 20
        HintImageIndex = 0
        TabOrder = 4
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'combobox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        ToolButtonStyle = False
        AlphaBlend = False
        AlphaBlendValue = 0
        AlphaBlendAnimation = False
        ListBoxCaptionMode = False
        ListBoxDefaultFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultFont.Color = clWindowText
        ListBoxDefaultFont.Height = 14
        ListBoxDefaultFont.Name = 'Arial'
        ListBoxDefaultFont.Style = []
        ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultCaptionFont.Color = clWindowText
        ListBoxDefaultCaptionFont.Height = 14
        ListBoxDefaultCaptionFont.Name = 'Arial'
        ListBoxDefaultCaptionFont.Style = []
        ListBoxDefaultItemHeight = 20
        ListBoxCaptionAlignment = taLeftJustify
        ListBoxUseSkinFont = True
        ListBoxUseSkinItemHeight = True
        ListBoxWidth = 0
        HideSelection = True
        AutoComplete = True
        ImageIndex = -1
        CharCase = ecNormal
        DefaultColor = clWindow
        ItemIndex = -1
        DropDownCount = 8
        HorizontalExtent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Sorted = False
        Style = bscbFixedStyle
      end
      object cbbZxcd: TbsSkinComboBox
        Left = 624
        Top = 24
        Width = 89
        Height = 20
        HintImageIndex = 0
        TabOrder = 3
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'combobox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        ToolButtonStyle = False
        AlphaBlend = False
        AlphaBlendValue = 0
        AlphaBlendAnimation = False
        ListBoxCaptionMode = False
        ListBoxDefaultFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultFont.Color = clWindowText
        ListBoxDefaultFont.Height = 14
        ListBoxDefaultFont.Name = 'Arial'
        ListBoxDefaultFont.Style = []
        ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultCaptionFont.Color = clWindowText
        ListBoxDefaultCaptionFont.Height = 14
        ListBoxDefaultCaptionFont.Name = 'Arial'
        ListBoxDefaultCaptionFont.Style = []
        ListBoxDefaultItemHeight = 20
        ListBoxCaptionAlignment = taLeftJustify
        ListBoxUseSkinFont = True
        ListBoxUseSkinItemHeight = True
        ListBoxWidth = 0
        HideSelection = True
        AutoComplete = True
        ImageIndex = -1
        CharCase = ecNormal
        DefaultColor = clWindow
        ItemIndex = -1
        DropDownCount = 8
        HorizontalExtent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Sorted = False
        Style = bscbFixedStyle
      end
      object cbbLx: TbsSkinComboBox
        Left = 624
        Top = 56
        Width = 89
        Height = 20
        HintImageIndex = 0
        TabOrder = 5
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'combobox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        ToolButtonStyle = False
        AlphaBlend = False
        AlphaBlendValue = 0
        AlphaBlendAnimation = False
        ListBoxCaptionMode = False
        ListBoxDefaultFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultFont.Color = clWindowText
        ListBoxDefaultFont.Height = 14
        ListBoxDefaultFont.Name = 'Arial'
        ListBoxDefaultFont.Style = []
        ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultCaptionFont.Color = clWindowText
        ListBoxDefaultCaptionFont.Height = 14
        ListBoxDefaultCaptionFont.Name = 'Arial'
        ListBoxDefaultCaptionFont.Style = []
        ListBoxDefaultItemHeight = 20
        ListBoxCaptionAlignment = taLeftJustify
        ListBoxUseSkinFont = True
        ListBoxUseSkinItemHeight = True
        ListBoxWidth = 0
        HideSelection = True
        AutoComplete = True
        ImageIndex = -1
        CharCase = ecNormal
        DefaultColor = clWindow
        ItemIndex = -1
        DropDownCount = 8
        HorizontalExtent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Sorted = False
        Style = bscbFixedStyle
      end
      object edtJcnf1: TbsSkinDBNumericEdit
        Left = 520
        Top = 85
        Width = 49
        Height = 18
        Text = '0'
        Increment = 1.000000000000000000
        SupportUpDownKeys = False
        UseSkinFont = True
        ValueType = vtInteger
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
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
        TabOrder = 7
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'khzy_jcnf1'
        DataSource = dsKhzy
      end
      object edtJcnf2: TbsSkinDBNumericEdit
        Left = 592
        Top = 85
        Width = 49
        Height = 18
        Text = '0'
        Increment = 1.000000000000000000
        SupportUpDownKeys = False
        UseSkinFont = True
        ValueType = vtInteger
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
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
        DataField = 'khzy_jcnf2'
        DataSource = dsKhzy
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #20445#23494#20449#24687
      object lbl7: TbsSkinStdLabel
        Left = 24
        Top = 32
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #23458#25143#22995#21517
      end
      object lbl31: TbsSkinStdLabel
        Left = 216
        Top = 32
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #32852#31995#30005#35805
      end
      object lbl32: TbsSkinStdLabel
        Left = 408
        Top = 32
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #32852#31995#25163#26426
      end
      object lbl33: TbsSkinStdLabel
        Left = 24
        Top = 64
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #32852#31995#22320#22336
      end
      object lbl34: TbsSkinStdLabel
        Left = 24
        Top = 88
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
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #22791#27880#35828#26126
      end
      object edtKhxm: TbsSkinDBEdit
        Left = 80
        Top = 29
        Width = 121
        Height = 18
        Text = 'edtKhxm'
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
        DataField = 'khzy_yzxm'
        DataSource = dsKhzy
      end
      object edtLxdh: TbsSkinDBEdit
        Left = 272
        Top = 30
        Width = 121
        Height = 18
        Text = 'edtLxdh'
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
        DataField = 'khzy_dh'
        DataSource = dsKhzy
      end
      object edtLxsj: TbsSkinDBEdit
        Left = 464
        Top = 30
        Width = 121
        Height = 18
        Text = 'edtLxsj'
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
        DataField = 'khzy_tel'
        DataSource = dsKhzy
      end
      object edtLxdz: TbsSkinDBEdit
        Left = 80
        Top = 61
        Width = 505
        Height = 18
        Text = 'edtLxdz'
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
        DataField = 'khzy_jtwz'
        DataSource = dsKhzy
      end
      object mmoBzsm: TbsSkinDBMemo
        Left = 80
        Top = 90
        Width = 649
        Height = 73
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
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
        DataField = 'khzy_bmbz'
        DataSource = dsKhzy
      end
    end
  end
  object bsknpnl1: TbsSkinPanel
    Left = 9
    Top = 302
    Width = 745
    Height = 105
    HintImageIndex = 0
    TabOrder = 2
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
    CaptionMode = True
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = #27714#31199#27714#36141
    object lbl24: TbsSkinStdLabel
      Left = 96
      Top = 70
      Width = 51
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
      Caption = #36141#20080#20215
    end
    object lbl25: TbsSkinStdLabel
      Left = 280
      Top = 38
      Width = 29
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
    object lbl26: TbsSkinStdLabel
      Left = 280
      Top = 70
      Width = 40
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
    object lbl27: TbsSkinStdLabel
      Left = 328
      Top = 38
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
      Caption = #27714#31199#35828#26126
    end
    object lbl28: TbsSkinStdLabel
      Left = 328
      Top = 70
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
      Caption = #27714#36141#35828#26126
    end
    object lbl23: TbsSkinStdLabel
      Left = 96
      Top = 38
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
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #27714#31199#20215
    end
    object lbl29: TbsSkinStdLabel
      Left = 200
      Top = 38
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
    object lbl30: TbsSkinStdLabel
      Left = 200
      Top = 70
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
    object edtC1: TbsSkinDBEdit
      Left = 144
      Top = 36
      Width = 49
      Height = 18
      Text = 'edtC1'
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
      DataField = 'khzy_zj1'
      DataSource = dsKhzy
    end
    object edtCj2: TbsSkinDBEdit
      Left = 216
      Top = 36
      Width = 49
      Height = 18
      Text = 'edtCj2'
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
      DataField = 'khzy_zj2'
      DataSource = dsKhzy
    end
    object edtMaijia1: TbsSkinDBEdit
      Left = 144
      Top = 68
      Width = 49
      Height = 18
      Text = 'edtMaijia1'
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
      DataField = 'khzy_sj1'
      DataSource = dsKhzy
    end
    object edtMaijia2: TbsSkinDBEdit
      Left = 216
      Top = 68
      Width = 49
      Height = 18
      Text = 'edtMaijia2'
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
      DataField = 'khzy_sj2'
      DataSource = dsKhzy
    end
    object edtQzsm: TbsSkinDBEdit
      Left = 384
      Top = 36
      Width = 337
      Height = 18
      Text = 'edtQzsm'
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
      DataField = 'khzy_qzsm'
      DataSource = dsKhzy
    end
    object edtQgsm: TbsSkinDBEdit
      Left = 384
      Top = 68
      Width = 337
      Height = 18
      Text = 'edtQgsm'
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
      TabOrder = 7
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
      AutoSize = False
      DataField = 'khzy_qgsm'
      DataSource = dsKhzy
    end
    object bsknchckrdbxQz: TbsSkinCheckRadioBox
      Left = 16
      Top = 32
      Width = 81
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
      Caption = #27714#31199#25151#23627
    end
    object bsknchckrdbxQg: TbsSkinCheckRadioBox
      Left = 16
      Top = 64
      Width = 81
      Height = 25
      HintImageIndex = 0
      TabOrder = 4
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
      Caption = #27714#36141#25151#23627
    end
  end
  object bsknpnl2: TbsSkinPanel
    Left = 8
    Top = 416
    Width = 745
    Height = 169
    HintImageIndex = 0
    TabOrder = 3
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
    CaptionMode = True
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = #23458#25143#35814#32454#20449#24687
    object mmoXxxx: TbsSkinDBMemo
      Left = 8
      Top = 32
      Width = 721
      Height = 129
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
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'memo'
      DataField = 'khzy_xxbz'
      DataSource = dsKhzy
    end
  end
  object bsSkinButton1: TbsSkinButton
    Left = 566
    Top = 599
    Width = 75
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
    Caption = #20445#23384
    NumGlyphs = 1
    Spacing = 1
    OnClick = bsSkinButton1Click
  end
  object btn1: TbsSkinButton
    Left = 657
    Top = 599
    Width = 75
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
    Caption = #21462#28040
    NumGlyphs = 1
    Spacing = 1
    OnClick = btn1Click
  end
  object qryKhzy: TADOQuery
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
      'select * from khzy where khzy_bh=:id')
    Left = 554
    Top = 88
  end
  object dsKhzy: TDataSource
    DataSet = qryKhzy
    Left = 618
    Top = 88
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
    Left = 636
  end
  object qry1: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from khzy')
    Left = 480
    Top = 87
  end
  object bspngmglst1: TbsPngImageList
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
    Left = 293
    Top = 65523
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
  object ds1: TDataSource
    DataSet = qry1
    Left = 416
    Top = 90
  end
end
