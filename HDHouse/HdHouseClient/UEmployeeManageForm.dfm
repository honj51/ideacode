object EmployeeManageForm: TEmployeeManageForm
  Left = 233
  Top = 167
  BorderIcons = []
  BorderStyle = bsDialog
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bskndbgrd1: TbsSkinDBGrid
    Left = 0
    Top = 165
    Width = 946
    Height = 370
    HintImageIndex = 0
    TabOrder = 2
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
    DataSource = HDHouseDataModule.ds_ygxx
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
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_xm'
        Title.Alignment = taCenter
        Title.Caption = #21592#24037#22995#21517
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_xb'
        Title.Alignment = taCenter
        Title.Caption = #24615#21035
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_lxdh'
        Title.Alignment = taCenter
        Title.Caption = #32852#31995#30005#35805
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_jzdate'
        Title.Alignment = taCenter
        Title.Caption = #23601#32844#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_jg'
        Title.Alignment = taCenter
        Title.Caption = #31821#36143
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_xl'
        Title.Alignment = taCenter
        Title.Caption = #23398#21382
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_hy'
        Title.Alignment = taCenter
        Title.Caption = #23130#23035#29366#20917
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_csdate'
        Title.Alignment = taCenter
        Title.Caption = #20986#29983#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_sfz'
        Title.Alignment = taCenter
        Title.Caption = #36523#20221#35777#21495
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_dz'
        Title.Alignment = taCenter
        Title.Caption = #20303#22336
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ygxx_dz'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
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
      Width = 121
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
      Caption = #36755#20837#21592#24037#20449#24687#26597#35810
    end
    object edt1: TbsSkinEdit
      Left = 160
      Top = 27
      Width = 121
      Height = 18
      Text = #35831#36755#20837#26597#35810#26465#20214
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
      OnButtonClick = edt1ButtonClick
    end
  end
  object bsknscrlbr2: TbsSkinScrollBar
    Left = 0
    Top = 535
    Width = 965
    Height = 19
    HintImageIndex = 0
    TabOrder = 4
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
    Both = True
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
    PageSize = 4
    Min = 1
    Max = 7
    Position = 4
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
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 965
      SkinDataName = 'resizetoolpanel'
      inherited btn1: TbsSkinSpeedButton
        OnClick = dtprtbrvw1btn1Click
      end
      inherited btn2: TbsSkinSpeedButton
        OnClick = dtprtbrvw1btn2Click
      end
      inherited btn3: TbsSkinSpeedButton
        OnClick = dtprtbrvw1btn3Click
      end
      inherited btn4: TbsSkinSpeedButton
        OnClick = dtprtbrvw1btn4Click
      end
      inherited btn5: TbsSkinSpeedButton
        OnClick = dtprtbrvw1btn5Click
      end
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
    Left = 800
    Top = 24
  end
  object frxdbdtstygxx: TfrxDBDataset
    UserName = 'frxdbdtstygxx'
    CloseDataSource = False
    DataSource = HDHouseDataModule.ds_ygxx
    BCDToCurrency = False
    Left = 581
    Top = 22
  end
  object frxrprtygxx: TfrxReport
    Version = '4.7.181'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40073.675374710600000000
    ReportOptions.LastChange = 40073.675374710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 508
    Top = 24
    Datasets = <
      item
        DataSet = frxdbdtstygxx
        DataSetName = 'frxdbdtstygxx'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779530000000001000
          Width = 166.299320000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37723#27194#20240#28103#8451#20229)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 517.795610000000000000
          Top = 26.456710000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #37827#12518#28257)
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 563.149970000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 41.574830000000000000
        Top = 86.929190000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Top = 3.779529999999994000
          Width = 718.110700000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 11.338590000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #32514#26663#24447)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 56.692950000000000000
          Top = 11.338590000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #28654#25779#24725)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 120.944960000000000000
          Top = 11.338590000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #37804#1091#22470)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 158.740260000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #38001#26050#37108#37922#20291#30269)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 253.228510000000000000
          Top = 11.338590000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #28751#21342#8364#20860#26857#37832#0)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 370.393940000000000000
          Top = 11.338590000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #28699#65088#24059)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 430.866420000000000000
          Top = 11.338590000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #29840#57884#30532)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 480.000310000000000000
          Top = 11.338590000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #38892#57505#21796#29831#20344#24447)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 585.827150000000000000
          Top = 11.338590000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #37734#26495#28483)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 30.236239999999990000
          Width = 718.110700000000000000
          Height = 3.779530000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtstygxx
        DataSetName = 'frxdbdtstygxx'
        RowCount = 0
        object frxdbdtstygxxygxx_bh: TfrxMemoView
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_bh'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_bh"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_xm: TfrxMemoView
          Left = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_xm'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_xm"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_xb: TfrxMemoView
          Left = 120.944960000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_xb'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_xb"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_lxdh: TfrxMemoView
          Left = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_lxdh'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_lxdh"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_jzdate: TfrxMemoView
          Left = 253.228510000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_jzdate'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_jzdate"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_xl: TfrxMemoView
          Left = 370.393940000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_xl'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_xl"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_jg: TfrxMemoView
          Left = 434.645950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_jg'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_jg"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_sfz: TfrxMemoView
          Left = 480.000310000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_sfz'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_sfz"]')
          ParentFont = False
        end
        object frxdbdtstygxxygxx_dz: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ygxx_dz'
          DataSet = frxdbdtstygxx
          DataSetName = 'frxdbdtstygxx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdbdtstygxx."ygxx_dz"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 7.559059999999988000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
      end
    end
  end
  object frxmlxprt1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 737
    Top = 42
  end
end
