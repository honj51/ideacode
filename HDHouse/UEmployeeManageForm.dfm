object EmployeeManageForm: TEmployeeManageForm
  Left = 289
  Top = 131
  Width = 864
  Height = 566
  Caption = #21592#24037#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline dtprtbrvw1: TDataOperateBarView
    Left = 0
    Top = 0
    Width = 856
    Height = 65
    Align = alTop
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 856
      Height = 64
      Align = alTop
      inherited btn1: TbsSkinSpeedButton
        Top = 0
      end
      inherited btn2: TbsSkinSpeedButton
        Top = 0
      end
      inherited btn3: TbsSkinSpeedButton
        Top = 0
      end
      inherited btn4: TbsSkinSpeedButton
        Top = 0
      end
      inherited btn5: TbsSkinSpeedButton
        Top = 0
      end
    end
    inherited bspngmglst32: TbsPngImageList
      Left = 728
      Top = 8
    end
  end
  object bskntlbr1: TbsSkinToolBar
    Left = 0
    Top = 65
    Width = 856
    Height = 57
    HintImageIndex = 0
    TabOrder = 1
    SkinDataName = 'toolpanel'
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
      Left = 56
      Top = 22
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
      Left = 152
      Top = 19
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
  object bskndbgrd1: TbsSkinDBGrid
    Left = 0
    Top = 122
    Width = 837
    Height = 391
    HintImageIndex = 0
    TabOrder = 2
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
  object bsknscrlbr1: TbsSkinScrollBar
    Left = 0
    Top = 513
    Width = 856
    Height = 19
    HintImageIndex = 0
    TabOrder = 3
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
    Left = 837
    Top = 122
    Width = 19
    Height = 391
    HintImageIndex = 0
    TabOrder = 4
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
    PageSize = 0
    Min = 0
    Max = 127
    Position = 0
    SmallChange = 63
    LargeChange = 63
  end
end
