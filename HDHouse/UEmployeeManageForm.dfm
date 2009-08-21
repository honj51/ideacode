object EmployeeManageForm: TEmployeeManageForm
  Left = 261
  Top = 84
  AutoScroll = False
  BorderIcons = []
  Caption = #21592#24037#31649#29702
  ClientHeight = 554
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bskndbgrd1: TbsSkinDBGrid
    Left = 0
    Top = 165
    Width = 946
    Height = 370
    HintImageIndex = 0
    TabOrder = 0
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'grid'
    Transparent = False
    WallpaperStretch = False
    UseSkinFont = True
    UseSkinCellHeight = True
    HScrollBar = bsknscrlbr2
    VScrollBar = bsknscrlbr1
    GridLineColor = clWindowText
    DefaultCellHeight = 20
    DrawGraphicFields = False
    UseColumnsFont = False
    DefaultRowHeight = 17
    MouseWheelSupport = False
    SaveMultiSelection = False
    PickListBoxSkinDataName = 'listbox'
    PickListBoxCaptionMode = False
    Align = alClient
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #21592#24037#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21592#24037#22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24615#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32852#31995#30005#35805
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23601#32844#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31821#36143
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23398#21382
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23130#23035#29366#20917
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#29983#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36523#20221#35777#21495
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20303#22336
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Width = 200
        Visible = True
      end>
  end
  object bskntlbr1: TbsSkinToolBar
    Left = 0
    Top = 93
    Width = 965
    Height = 72
    HintImageIndex = 0
    TabOrder = 1
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'resizetoolpanel'
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
    BorderStyle = bvNone
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'bskntlbr1'
    Align = alTop
    CanScroll = False
    HotScroll = False
    ScrollOffset = 0
    ScrollTimerInterval = 50
    AdjustControls = True
    WidthWithCaptions = 0
    WidthWithoutCaptions = 0
    AutoShowHideCaptions = False
    ShowCaptions = False
    Flat = False
    object lbl1: TbsSkinStdLabel
      Left = 40
      Top = 30
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
      Caption = #36755#20837#21592#24037#20449#24687#26597#35810
    end
    object edt1: TbsSkinEdit
      Left = 160
      Top = 27
      Width = 121
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
      ButtonMode = True
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'buttonedit'
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
    end
  end
  object bsknscrlbr2: TbsSkinScrollBar
    Left = 0
    Top = 535
    Width = 965
    Height = 19
    HintImageIndex = 0
    TabOrder = 2
    SkinData = HDHouseDataModule.bsSkinData1
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
    SmallChange = 127
    LargeChange = 127
  end
  object bsknscrlbr1: TbsSkinScrollBar
    Left = 946
    Top = 165
    Width = 19
    Height = 370
    HintImageIndex = 0
    TabOrder = 3
    Visible = False
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'vscrollbar'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 19
    DefaultHeight = 0
    UseSkinFont = True
    Both = True
    BothMarkerWidth = 19
    BothSkinDataName = 'bothhscrollbar'
    CanFocused = False
    Align = alRight
    Kind = sbVertical
    PageSize = 0
    Min = 0
    Max = 127
    Position = 0
    SmallChange = 63
    LargeChange = 63
  end
  inline dtprtbrvw1: TDataOperateBarView
    Left = 0
    Top = 0
    Width = 965
    Height = 93
    Align = alTop
    AutoScroll = False
    TabOrder = 4
    inherited bskntlbr1: TbsSkinToolBar
      Width = 965
      SkinDataName = 'resizetoolpanel'
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
    BorderIcons = [biSystemMenu, biRollUp]
    Left = 800
    Top = 24
  end
end
