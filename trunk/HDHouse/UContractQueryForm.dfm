object ContractQueryForm: TContractQueryForm
  Left = 362
  Top = 103
  Width = 938
  Height = 556
  Caption = #31614#32422#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    930
    522)
  PixelsPerInch = 96
  TextHeight = 13
  object btn6: TbsSkinSpeedButton
    Left = 24
    Top = 5
    Width = 64
    Height = 64
    HintImageIndex = 0
    SkinDataName = 'toolbutton'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 64
    DefaultHeight = 64
    UseSkinFont = True
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
    Down = False
    GroupIndex = 0
    Caption = #25171#24320#21512#21516
    ShowCaption = True
    NumGlyphs = 1
    Spacing = 1
    Layout = blGlyphTop
  end
  object btn1: TbsSkinSpeedButton
    Left = 112
    Top = 5
    Width = 64
    Height = 64
    HintImageIndex = 0
    SkinDataName = 'toolbutton'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 64
    DefaultHeight = 64
    UseSkinFont = True
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
    Down = False
    GroupIndex = 0
    Caption = #23548#20986
    ShowCaption = True
    NumGlyphs = 1
    Spacing = 1
    Layout = blGlyphTop
  end
  object btn2: TbsSkinSpeedButton
    Left = 184
    Top = 5
    Width = 64
    Height = 64
    HintImageIndex = 0
    SkinDataName = 'toolbutton'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 64
    DefaultHeight = 64
    UseSkinFont = True
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
    Down = False
    GroupIndex = 0
    Caption = #25171#21360
    ShowCaption = True
    NumGlyphs = 1
    Spacing = 1
    Layout = blGlyphTop
  end
  inline cntrctqryfrm1: TContractQueryFrame
    Left = 0
    Top = 56
    Width = 930
    Height = 238
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    inherited bvl1: TBevel
      Width = 930
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Top = 37
      Width = 930
      Height = 182
      Align = alCustom
    end
    inherited bsknscrlbr1: TbsSkinScrollBar
      Top = 219
      Width = 930
    end
  end
  object bsknpgcntrl2: TbsSkinPageControl
    Left = 0
    Top = 303
    Width = 931
    Height = 219
    ActivePage = bskntbsht1
    Anchors = [akLeft, akRight, akBottom]
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
    SkinDataName = 'tab'
    object bskntbsht4: TbsSkinTabSheet
      Caption = #25151#28304#35814#32454#20449#24687
      inline hsdtlnfvw1: THouseDetailInfoView
        Left = 0
        Top = 0
        Width = 929
        Height = 197
        Align = alClient
        TabOrder = 0
      end
    end
    object bskntbsht5: TbsSkinTabSheet
      Caption = #25151#28304#20445#23494#20449#24687
      inline hscrnfvw1: THouseSecureInfoView
        Left = 0
        Top = 0
        Width = 929
        Height = 197
        Align = alClient
        TabOrder = 0
      end
    end
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25151#28304#36319#36827#20449#24687
      object bskndbgrd1: TbsSkinDBGrid
        Left = 0
        Top = 0
        Width = 929
        Height = 197
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'grid'
        Transparent = False
        WallpaperStretch = False
        UseSkinFont = True
        UseSkinCellHeight = True
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
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #36319#36827#26102#38388
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #36319#36827#20154
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #36319#36827#26041#24335
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #36319#36827#20869#23481
            Width = 350
            Visible = True
          end>
      end
    end
  end
end
