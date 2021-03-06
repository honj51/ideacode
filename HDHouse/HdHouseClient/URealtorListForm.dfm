object RealtorListForm: TRealtorListForm
  Left = 628
  Top = 188
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #32622#19994#39038#38382
  ClientHeight = 360
  ClientWidth = 297
  Color = clBtnFace
  Constraints.MaxHeight = 394
  Constraints.MaxWidth = 305
  Constraints.MinHeight = 394
  Constraints.MinWidth = 305
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TbsSkinButton
    Left = 17
    Top = 323
    Width = 68
    Height = 25
    HintImageIndex = 0
    TabOrder = 1
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
    Caption = #26032#22686
    NumGlyphs = 2
    Spacing = 1
    OnClick = btn1Click
  end
  object btn2: TbsSkinButton
    Left = 131
    Top = 324
    Width = 67
    Height = 25
    HintImageIndex = 0
    TabOrder = 2
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
    Caption = #30830#23450'(&O)'
    NumGlyphs = 2
    Spacing = 1
    OnClick = btn2Click
  end
  object btn3: TbsSkinButton
    Left = 219
    Top = 324
    Width = 68
    Height = 25
    HintImageIndex = 0
    TabOrder = 3
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
    Left = 3
    Top = 5
    Width = 290
    Height = 309
    HintImageIndex = 0
    TabOrder = 0
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
    Caption = #21592#24037#20449#24687
    object bskndbgrd1: TbsSkinDBGrid
      Left = 1
      Top = 23
      Width = 288
      Height = 285
      HintImageIndex = 0
      TabOrder = 0
      SkinData = HDHouseDataModule.bsSkinData1
      SkinDataName = 'grid'
      Transparent = False
      WallpaperStretch = False
      UseSkinFont = True
      UseSkinCellHeight = True
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
      DataSource = HDHouseDataModule.dsygxx
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = bskndbgrd1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ygxx_bh'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#32534#21495
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ygxx_xm'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#22995#21517
          Width = 184
          Visible = True
        end>
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
    Left = 246
    Top = 65529
  end
end
