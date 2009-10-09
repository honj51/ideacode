object CustomerAutoMatchView: TCustomerAutoMatchView
  Left = 0
  Top = 0
  Width = 725
  Height = 209
  TabOrder = 0
  object bsSkinScrollBar1: TbsSkinScrollBar
    Left = 706
    Top = 0
    Width = 19
    Height = 190
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
    PageSize = 3
    Min = 1
    Max = 5
    Position = 1
    SmallChange = 1
    LargeChange = 1
  end
  object bsknscrlbr1: TbsSkinScrollBar
    Left = 0
    Top = 190
    Width = 725
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
  object bskndbgrd1: TbsSkinDBGrid
    Left = 0
    Top = 0
    Width = 706
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
        FieldName = 'khzy_bh'
        Title.Caption = #23458#25143#32534#21495
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_yzxm'
        Title.Caption = #23458#25143#22995#21517
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_fwly'
        Title.Caption = #32622#19994#39038#38382
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_djrq'
        Title.Caption = #30331#35760#26085#26399
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_dqzt'
        Title.Caption = #24403#21069#29366#24577
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_qy'
        Title.Caption = #25152#22788#21306#22495
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_wylb'
        Title.Caption = #29289#19994#21517#31216
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_wyyt'
        Title.Caption = #29289#19994#29992#36884
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_wylb'
        Title.Caption = #29289#19994#31867#21035
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_wssl'
        Title.Caption = #25151#38388#25968#37327
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_mj'
        Title.Caption = #38656#27714#38754#31215
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_zxcd'
        Title.Caption = #35013#20462#31243#24230
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'khzy_nf'
        Title.Caption = #24314#25104#24180#20221
        Visible = True
      end>
  end
end
