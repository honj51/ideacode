object formMain: TformMain
  Left = 257
  Top = 132
  AutoScroll = False
  BiDiMode = bdLeftToRight
  BorderIcons = []
  Caption = 'MainForm'
  ClientHeight = 560
  ClientWidth = 998
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 13
  object bsknpgcntrl1: TbsSkinPageControl
    Left = 0
    Top = 90
    Width = 998
    Height = 470
    ActivePage = bskntbsht2
    Align = alClient
    BiDiMode = bdRightToLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    MultiLine = True
    ParentBiDiMode = False
    ParentFont = False
    TabHeight = 120
    TabOrder = 0
    TabPosition = tpLeft
    TabWidth = 60
    TabExtededDraw = True
    TabSpacing = 1
    TextInHorizontal = True
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
      Caption = #26085#24120#31649#29702
      ParentShowHint = False
      ShowHint = False
      inline frmhslst1: TframeHouseList
        Left = 0
        Top = 0
        Width = 876
        Height = 470
        HelpContext = 1
        Align = alClient
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = '@Arial Unicode MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited bsSkinButtonLabel2: TbsSkinButtonLabel
          Left = 264
        end
        inherited bvl1: TBevel
          Left = 8
        end
        inherited Edit1: TEdit
          Left = 112
        end
        inherited bsSkinButton1: TbsSkinButton
          Left = 328
        end
        inherited bsSkinButton2: TbsSkinButton
          Left = 440
        end
        inherited bsSkinButton3: TbsSkinButton
          Left = 552
        end
        inherited bsSkinButton4: TbsSkinButton
          Left = 664
        end
        inherited bsSkinDBGrid1: TbsSkinDBGrid
          Top = 96
          Width = 802
          Height = 163
          Align = alNone
          Columns = <
            item
              Expanded = False
              FieldName = 'fczy_bh'
              Title.Caption = #25151#28304#32534#21495
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_djrq'
              Title.Caption = #30331#35760#26085#26399
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_dqzt'
              Title.Caption = #24403#21069#29366#24577
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_wymc'
              Title.Caption = #29289#19994#21517#31216
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_hxjg'
              Title.Caption = #25151#22411#32467#26500
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_jzmj'
              Title.Caption = #24314#31569#38754#31215
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #25152#22788#21306#22495
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #27004#23618'/'#23618#39640
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #32622#19994#39038#38382
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #29289#19994#29992#36884
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #29289#19994#31867#21035
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #35013#20462#31243#24230
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #25151#22411
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = #24314#25104#24180#26376
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end>
        end
        inherited bsknpgcntrl1: TbsSkinPageControl
          Top = 260
          Width = 876
          ActivePage = frmhslst1.bsSkinTabSheet1
          inherited bsSkinTabSheet1: TbsSkinTabSheet
            inherited mmo1: TbsSkinDBMemo
              Width = 874
            end
          end
          inherited bsSkinTabSheet2: TbsSkinTabSheet
            inherited mmo2: TbsSkinDBMemo
              Width = 900
              Height = 171
            end
          end
          inherited bskntbsht1: TbsSkinTabSheet
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 800
              Height = 171
            end
          end
          inherited bskntbsht2: TbsSkinTabSheet
            inherited bskndbgrd2: TbsSkinDBGrid
              Top = 4
              Width = 605
            end
          end
        end
        inherited bsknfrm1: TbsSkinFrame
          Left = 944
          Top = 112
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #25151#28304#31649#29702
      inline CustomerAutoMatchView1: TCustomerAutoMatchView
        Left = 14
        Top = 67
        Width = 840
        Height = 410
        TabOrder = 0
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 821
          Height = 391
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
        inherited bsSkinScrollBar1: TbsSkinScrollBar
          Left = 821
          Height = 391
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 391
          Width = 840
        end
      end
    end
    object bskntbsht4: TbsSkinTabSheet
      Caption = #20869#37096#32479#35745
      inline trckrcrdvw1: TTrackRecordView
        Left = 192
        Top = 104
        Width = 641
        Height = 271
        TabOrder = 0
        inherited bskntlbr1: TbsSkinToolBar
          Width = 641
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 622
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Width = 641
        end
        inherited bsknscrlbr2: TbsSkinScrollBar
          Left = 622
        end
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #23458#25143#31649#29702
      inline trcknfvw1: TTrackInfoView
        Left = 104
        Top = 112
        Width = 505
        Height = 306
        TabOrder = 0
      end
    end
    object bskntbsht5: TbsSkinTabSheet
      Caption = #31995#32479#35774#32622
      object btn8: TbsSkinButton
        Left = 232
        Top = 120
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #20844#21496#20449#24687#35774#32622
        NumGlyphs = 1
        Spacing = 1
      end
      object btn9: TbsSkinButton
        Left = 376
        Top = 120
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #25968#25454#24211#32500#25252
        NumGlyphs = 1
        Spacing = 1
      end
      object btn10: TbsSkinButton
        Left = 232
        Top = 168
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 2
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #21592#24037#31649#29702
        NumGlyphs = 1
        Spacing = 1
      end
      object btn11: TbsSkinButton
        Left = 376
        Top = 168
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 3
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #21021#22987#21270#25968#25454
        NumGlyphs = 1
        Spacing = 1
      end
      object btn12: TbsSkinButton
        Left = 232
        Top = 216
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 4
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #25805#20316#26435#38480#35774#32622
        NumGlyphs = 1
        Spacing = 1
      end
      object btn13: TbsSkinButton
        Left = 376
        Top = 216
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 5
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #21442#25968#20449#24687#35774#32622
        NumGlyphs = 1
        Spacing = 1
      end
      object btn14: TbsSkinButton
        Left = 232
        Top = 264
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 6
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #20462#25913#24403#21069#23494#30721
        NumGlyphs = 1
        Spacing = 1
      end
      object btn15: TbsSkinButton
        Left = 376
        Top = 264
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 7
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #31995#32479#25805#20316#26085#24535
        NumGlyphs = 1
        Spacing = 1
      end
      object btn16: TbsSkinButton
        Left = 232
        Top = 312
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 8
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #21512#21516#26679#26412#35774#32622
        NumGlyphs = 1
        Spacing = 1
      end
      object btn17: TbsSkinButton
        Left = 376
        Top = 312
        Width = 100
        Height = 30
        HintImageIndex = 0
        TabOrder = 9
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 100
        DefaultHeight = 30
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
        Caption = #20851#20110#26412#36719#20214
        NumGlyphs = 1
        Spacing = 1
      end
    end
  end
  object bskntlbr1: TbsSkinToolBar
    Left = 0
    Top = 0
    Width = 998
    Height = 90
    HintImageIndex = 0
    TabOrder = 1
    SkinDataName = 'resizetoolpanel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 90
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
    object btn1: TbsSkinSpeedButton
      Left = 24
      Top = 5
      Width = 80
      Height = 81
      HintImageIndex = 0
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
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
      Caption = #26032#22686#25151#28304
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
    end
    object btn2: TbsSkinSpeedButton
      Left = 120
      Top = 5
      Width = 80
      Height = 81
      HintImageIndex = 1
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
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
      Caption = #26032#22686#23458#25143
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
    end
    object btn3: TbsSkinSpeedButton
      Left = 216
      Top = 5
      Width = 80
      Height = 81
      HintImageIndex = 0
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
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
      Caption = #36319#36827#26597#35810
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
    end
    object btn4: TbsSkinSpeedButton
      Left = 312
      Top = 5
      Width = 89
      Height = 81
      HintImageIndex = 0
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 3
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = #20999#25442#29992#25143
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
    end
    object btn5: TbsSkinSpeedButton
      Left = 416
      Top = 5
      Width = 89
      Height = 81
      HintImageIndex = 0
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 4
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = #38145#23450#23631#24149
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
    end
    object btn6: TbsSkinSpeedButton
      Left = 528
      Top = 5
      Width = 89
      Height = 81
      HintImageIndex = 0
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 5
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = #36719#20214#24110#21161
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
    end
    object btn7: TbsSkinSpeedButton
      Left = 640
      Top = 5
      Width = 89
      Height = 81
      HintImageIndex = 0
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      ImageList = HDHouseDataModule.bspngmglstPngImglst64
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 6
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = #36864#20986#31995#32479
      ShowCaption = True
      NumGlyphs = 1
      Align = alCustom
      Spacing = 1
      Layout = blGlyphTop
      OnClick = btn7Click
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
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Magnetic = False
    MagneticSize = 5
    BorderIcons = [biSystemMenu, biMinimize, biMaximize, biRollUp]
    Left = 960
    Top = 456
  end
  object bsknmsg1: TbsSkinMessage
    ShowAgainFlag = False
    ShowAgainFlagValue = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ButtonSkinDataName = 'button'
    MessageLabelSkinDataName = 'stdlabel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultButtonFont.Charset = DEFAULT_CHARSET
    DefaultButtonFont.Color = clWindowText
    DefaultButtonFont.Height = 14
    DefaultButtonFont.Name = 'Arial'
    DefaultButtonFont.Style = []
    UseSkinFont = True
    Left = 1057
    Top = 464
  end
end
