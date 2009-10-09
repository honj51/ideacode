object PermissionGroupSettingForm: TPermissionGroupSettingForm
  Left = 476
  Top = 174
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #26435#38480#32452#35774#32622
  ClientHeight = 434
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bskngrpbx1: TbsSkinGroupBox
    Left = 0
    Top = 54
    Width = 318
    Height = 318
    HintImageIndex = 0
    TabOrder = 1
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
    Caption = #21487#25805#20316#26435#38480
    Align = alClient
    object bsknscrlbr1: TbsSkinScrollBar
      Left = 1
      Top = 298
      Width = 316
      Height = 19
      HintImageIndex = 0
      TabOrder = 2
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
      Both = False
      BothMarkerWidth = 19
      BothSkinDataName = 'bothhscrollbar'
      CanFocused = False
      Align = alBottom
      Kind = sbHorizontal
      PageSize = 0
      Min = 0
      Max = 100
      Position = 0
      SmallChange = 1
      LargeChange = 1
    end
    object bsknscrlbr2: TbsSkinScrollBar
      Left = 298
      Top = 23
      Width = 19
      Height = 275
      HintImageIndex = 0
      TabOrder = 1
      Visible = False
      SkinDataName = 'vscrollbar'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Both = False
      BothMarkerWidth = 19
      BothSkinDataName = 'bothhscrollbar'
      CanFocused = False
      Align = alRight
      Kind = sbVertical
      PageSize = 17
      Min = 0
      Max = 33
      Position = 17
      SmallChange = 1
      LargeChange = 1
    end
    object rzchcktr1: TRzCheckTree
      Left = 1
      Top = 23
      Width = 297
      Height = 275
      Align = alClient
      Indent = 35
      SelectionPen.Color = clBtnShadow
      StateImages = rzchcktr1.CheckImages
      TabOrder = 0
      Items.Data = {
        0500000021000000000000000000000001000000FFFFFFFF0000000006000000
        08C8D5B3A3B9DCC0ED21000000000000000000000001000000FFFFFFFF000000
        000000000008B7BFD4B4B2E9D1AF21000000000000000000000001000000FFFF
        FFFF000000000000000008D0C2D4F6B7BFD4B421000000000000000000000001
        000000FFFFFFFF000000000000000008B4F2D3A1B7BFD4B42100000000000000
        0000000001000000FFFFFFFF000000000000000008B8FABDF8B2E9D1AF210000
        00000000000000000001000000FFFFFFFF000000000000000008D0C2D4F6BFCD
        BBA721000000000000000000000001000000FFFFFFFF000000000000000008B1
        A3C3DCD0C5CFA221000000000000000000000001000000FFFFFFFF0000000004
        00000008B7BFD4B4B9DCC0ED21000000000000000000000001000000FFFFFFFF
        000000000000000008B7BFD4B4B9DCC0ED210000000000000000000000010000
        00FFFFFFFF000000000000000008B7BFD4B4B8FABDF821000000000000000000
        000001000000FFFFFFFF000000000000000008B3C9BDBBB9DCC0ED2100000000
        0000000000000001000000FFFFFFFF000000000000000008C3C5B5EAD5D0CCF9
        21000000000000000000000001000000FFFFFFFF000000000400000008BFCDBB
        A7B9DCC0ED21000000000000000000000001000000FFFFFFFF00000000000000
        0008BFCDBBA7B9DCC0ED21000000000000000000000001000000FFFFFFFF0000
        00000000000008BFCDBBA7B8FABDF821000000000000000000000001000000FF
        FFFFFF000000000000000008C7A9D4BCB2E9D1AF210000000000000000000000
        01000000FFFFFFFF000000000000000008C0B4B5E7B2E9D1AF21000000000000
        000000000001000000FFFFFFFF000000000600000008C4DAB2BFB9DCC0ED2100
        0000000000000000000001000000FFFFFFFF000000000000000008B7BFD4B4B2
        E9D1AF21000000000000000000000001000000FFFFFFFF000000000000000008
        CCE1D0D1B9DCC0ED21000000000000000000000001000000FFFFFFFF00000000
        0000000008CCE1B3C9C3F7CFB821000000000000000000000001000000FFFFFF
        FF000000000000000008CCE1B3C9BBE3D7DC2100000000000000000000000100
        0000FFFFFFFF000000000000000008BFCDD4B4B2E9D1AF210000000000000000
        00000001000000FFFFFFFF000000000000000008D7DBBACFCDB3BCC621000000
        000000000000000001000000FFFFFFFF000000000900000008CFB5CDB3C9E8D6
        C325000000000000000000000001000000FFFFFFFF00000000000000000CB9AB
        CBBED0C5CFA2C9E8D6C325000000000000000000000001000000FFFFFFFF0000
        0000000000000CB2D9D7F7C8A8CFDEC9E8D6C325000000000000000000000001
        000000FFFFFFFF00000000000000000CD0DEB8C4B5B1C7B0C3DCC2EB23000000
        000000000000000001000000FFFFFFFF00000000000000000ACAFDBEDDBFE2CE
        ACBBA423000000000000000000000001000000FFFFFFFF00000000000000000A
        B3F5CABCBBAFCAFDBEDD25000000000000000000000001000000FFFFFFFF0000
        0000000000000CB2CECAFDD0C5CFA2C9E8D6C321000000000000000000000001
        000000FFFFFFFF000000000000000008D4B1B9A4B9DCC0ED2500000000000000
        0000000001000000FFFFFFFF00000000000000000CCFB5CDB3B2D9D7F7C8D5D6
        BE25000000000000000000000001000000FFFFFFFF00000000000000000CBACF
        CDACD1F9B1BEC9E8D6C3}
    end
  end
  object bsknpnl1: TbsSkinPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 54
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
    Align = alTop
    object lbl1: TbsSkinStdLabel
      Left = 24
      Top = 18
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
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #26435#38480#32452#21517#31216
    end
    object edtQx_mc: TbsSkinDBEdit
      Left = 96
      Top = 16
      Width = 169
      Height = 18
      Text = 'edtQx_mc'
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
      DataField = 'Qx_mc'
      DataSource = ds_qxxxxx
    end
  end
  object bsknpnl2: TbsSkinPanel
    Left = 0
    Top = 372
    Width = 318
    Height = 62
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
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'bsknpnl2'
    Align = alBottom
    object btn1: TbsSkinButton
      Left = 110
      Top = 21
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
      Caption = #20445#23384
      NumGlyphs = 1
      Spacing = 1
      OnClick = btn1Click
    end
    object btn2: TbsSkinButton
      Left = 206
      Top = 21
      Width = 75
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
      Caption = #21462#28040
      NumGlyphs = 1
      Spacing = 1
      OnClick = btn2Click
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
    Left = 32
    Top = 388
  end
  object qry_qxxxxx: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = 'null'
      end>
    SQL.Strings = (
      'select * from Qx where Qx_bh =:id')
    Left = 231
    Top = 96
  end
  object ds_qxxxxx: TDataSource
    DataSet = qry_qxxxxx
    Left = 229
    Top = 171
  end
end
