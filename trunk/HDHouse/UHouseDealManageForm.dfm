object HouseDealManageForm: THouseDealManageForm
  Left = 274
  Top = 25
  Width = 948
  Height = 727
  Caption = #25104#20132#31649#29702' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bsknpgcntrl1: TbsSkinPageControl
    Left = 0
    Top = 0
    Width = 940
    Height = 693
    ActivePage = bskntbsht1
    Align = alClient
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
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25104#20132#31649#29702
      DesignSize = (
        938
        671)
      object btn1: TbsSkinSpeedButton
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
        Caption = #31614#32422#25104#20132
        ShowCaption = True
        NumGlyphs = 1
        Spacing = 1
        Layout = blGlyphTop
      end
      object btn2: TbsSkinSpeedButton
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
        ImageIndex = 1
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = #20462#25913#31614#32422
        ShowCaption = True
        NumGlyphs = 1
        Spacing = 1
        Layout = blGlyphTop
      end
      object btn3: TbsSkinSpeedButton
        Left = 200
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
        ImageIndex = 2
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = #21512#21516#25991#20214
        ShowCaption = True
        NumGlyphs = 1
        Spacing = 1
        Layout = blGlyphTop
      end
      object bsknpgcntrl2: TbsSkinPageControl
        Left = 0
        Top = 439
        Width = 933
        Height = 225
        ActivePage = bskntbsht3
        Anchors = [akLeft, akRight, akBottom]
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
        object bskntbsht3: TbsSkinTabSheet
          Caption = #25151#28304#36319#36827#35760#24405
          inline trckrcrdvw1: TTrackRecordView
            Left = 0
            Top = 0
            Width = 931
            Height = 203
            Align = alClient
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 931
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 931
              Height = 154
              DefaultRowHeight = 18
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
            end
          end
        end
        object bskntbsht4: TbsSkinTabSheet
          Caption = #25151#28304#35814#32454#20449#24687
          inline hsdtlnfvw1: THouseDetailInfoView
            Left = 0
            Top = 0
            Width = 931
            Height = 203
            Align = alClient
            TabOrder = 0
          end
        end
        object bskntbsht5: TbsSkinTabSheet
          Caption = #25151#28304#20445#23494#20449#24687
          inline hscrnfvw1: THouseSecureInfoView
            Left = 0
            Top = 0
            Width = 931
            Height = 203
            Align = alClient
            TabOrder = 0
          end
        end
      end
      inline inhslstvw1: TDealHouseListView
        Left = 2
        Top = 64
        Width = 925
        Height = 373
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        inherited bvl1: TBevel
          Height = 26
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 925
          Height = 253
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        inherited edt1: TEdit
          Height = 22
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 337
          SmallChange = 63
          LargeChange = 63
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #31614#32422#26597#35810
      object btn4: TbsSkinSpeedButton
        Left = 104
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
        ImageIndex = 1
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
      object btn5: TbsSkinSpeedButton
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
        ImageIndex = 2
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
      inline cntrctqryfrm1: TContractQueryFrame
        Left = 8
        Top = 56
        Width = 929
        Height = 609
        TabOrder = 0
        inherited bvl1: TBevel
          Width = 929
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Top = 48
          Width = 931
          Height = 537
          Align = alCustom
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 588
          Width = 929
          Height = 21
        end
      end
    end
  end
end