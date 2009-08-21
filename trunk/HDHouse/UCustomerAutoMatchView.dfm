object CustomerAutoMatchView: TCustomerAutoMatchView
  Left = 0
  Top = 0
  Width = 760
  Height = 209
  TabOrder = 0
  object bskndbgrd1: TbsSkinDBGrid
    Left = 0
    Top = 0
    Width = 741
    Height = 190
    HintImageIndex = 0
    TabOrder = 0
    SkinDataName = 'grid'
    Transparent = False
    WallpaperStretch = False
    UseSkinFont = True
    UseSkinCellHeight = True
    VScrollBar = bsSkinScrollBar1
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
        FieldName = #23458#25143#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25143#22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32622#19994#39038#38382
        Visible = True
      end
      item
        Expanded = False
        FieldName = #30331#35760#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24403#21069#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25152#22788#21306#22495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#19994#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#19994#29992#36884
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#19994#31867#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25151#38388#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38656#27714#38754#31215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35013#20462#31243#24230
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24314#25104#24180#20221
        Visible = True
      end>
  end
  object bsSkinScrollBar1: TbsSkinScrollBar
    Left = 741
    Top = 0
    Width = 19
    Height = 495
    HintImageIndex = 0
    TabOrder = 1
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
    PageSize = 0
    Min = 0
    Max = 100
    Position = 0
    SmallChange = 1
    LargeChange = 1
  end
  object bsknscrlbr1: TbsSkinScrollBar
    Left = 0
    Top = 190
    Width = 760
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
end
