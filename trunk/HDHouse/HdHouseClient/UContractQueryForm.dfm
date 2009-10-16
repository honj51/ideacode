object ContractQueryForm: TContractQueryForm
  Left = 326
  Top = 114
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #31614#32422#26597#35810
  ClientHeight = 564
  ClientWidth = 988
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnShow = FormShow
  DesignSize = (
    988
    564)
  PixelsPerInch = 96
  TextHeight = 13
  object btn6: TbsSkinSpeedButton
    Left = 26
    Top = -1
    Width = 64
    Height = 64
    HintImageIndex = 0
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'resizebutton'
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
    Left = 111
    Top = -1
    Width = 64
    Height = 64
    HintImageIndex = 0
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'resizebutton'
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
    OnClick = btn1Click
  end
  object btn2: TbsSkinSpeedButton
    Left = 186
    Top = -1
    Width = 64
    Height = 64
    HintImageIndex = 0
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'resizebutton'
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
    OnClick = btn2Click
  end
  inline cntrctqryfrm1: TContractQueryFrame
    Left = 0
    Top = 56
    Width = 988
    Height = 288
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoScroll = False
    TabOrder = 0
    inherited bsSkinStdLabel2: TbsSkinStdLabel
      Left = 272
    end
    inherited btn1: TbsSkinButtonLabel
      Left = 536
      OnClick = cntrctqryfrm1btn1Click
    end
    inherited bvl1: TBevel
      Width = 988
    end
    inherited bsknchckrdbx1: TbsSkinCheckRadioBox
      Left = 592
      SkinDataName = 'radiobox'
      Radio = True
      GroupIndex = 1
      OnClick = cntrctqryfrm1bsknchckrdbx1Click
    end
    inherited bsknchckrdbx2: TbsSkinCheckRadioBox
      Left = 704
      SkinDataName = 'radiobox'
      Radio = True
      GroupIndex = 1
      OnClick = cntrctqryfrm1bsknchckrdbx2Click
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Top = 37
      Width = 985
      Height = 230
      Align = alCustom
      DataSource = dsCjxx
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmContract
      Columns = <
        item
          Expanded = False
          FieldName = 'cjxx_htbh'
          Title.Caption = #21512#21516#32534#21495
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_czssqk'
          Title.Caption = #31199#21806
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_fybh'
          Title.Caption = #25151#28304#32534#21495
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_wymc'
          Title.Caption = #29289#19994#21517#31216
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_yzxm'
          Title.Caption = #19994#20027#22995#21517
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_khbh'
          Title.Caption = #23458#25143#32534#21495
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_khxm'
          Title.Caption = #23458#25143#22995#21517
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 70
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
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_fcmj'
          Title.Caption = #38754#31215
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_zygw'
          Title.Caption = #32622#19994#39038#38382
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_date'
          Title.Caption = #31614#32422#26085#26399
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cjxx_enddate'
          Title.Caption = #21512#21516#21040#26399#26085
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
    inherited bsknscrlbr1: TbsSkinScrollBar
      Top = 269
      Width = 988
      Visible = True
      SkinData = HDHouseDataModule.bsSkinData1
      Max = 127
    end
    inherited edtBeginDate: TbsSkinDateEdit
      Date = 40064.622299074070000000
    end
    inherited edtEndDate: TbsSkinDateEdit
      Left = 168
      Date = 40064.622299074070000000
    end
    inherited edtSearch: TbsSkinMaskEdit
      Left = 392
    end
  end
  object bsknpgcntrl2: TbsSkinPageControl
    Left = 0
    Top = 345
    Width = 989
    Height = 219
    ActivePage = bskntbsht4
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
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'tab'
    object bskntbsht4: TbsSkinTabSheet
      Caption = #25151#28304#35814#32454#20449#24687
      inline hsdtlnfvw1: THouseDetailInfoView
        Left = 0
        Top = 0
        Width = 987
        Height = 197
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          inherited edt1: TbsSkinDBEdit
            Left = 105
            DataField = 'fczy_zj'
            DataSource = dsFyxxxx
          end
          inherited edt2: TbsSkinDBEdit
            DataField = 'fczy_sj'
            DataSource = dsFyxxxx
          end
          inherited edt3: TbsSkinDBEdit
            DataField = 'fczy_cssm'
            DataSource = dsFyxxxx
          end
          inherited edt4: TbsSkinDBEdit
            DataField = 'fczy_cssm'
            DataSource = dsFyxxxx
          end
          inherited edt5: TbsSkinDBEdit
            DataField = 'fczy_dqzt'
            DataSource = dsFyxxxx
          end
          inherited edt6: TbsSkinDBEdit
            DataField = 'fczy_wymc'
            DataSource = dsFyxxxx
          end
          inherited edt7: TbsSkinDBEdit
            DataField = 'fczy_qy'
            DataSource = dsFyxxxx
          end
          inherited edt8: TbsSkinDBEdit
            DataField = 'fczy_hxjg'
            DataSource = dsFyxxxx
          end
          inherited edt9: TbsSkinDBEdit
            Text = '(MEMO)'
            DataField = 'cjxx_zygw'
            DataSource = dsCjxx
          end
          inherited edt10: TbsSkinDBEdit
            DataField = 'fczy_wyyt'
            DataSource = dsFyxxxx
          end
          inherited edt11: TbsSkinDBEdit
            DataField = 'fczy_zxcd'
            DataSource = dsFyxxxx
          end
          inherited edt12: TbsSkinDBEdit
            DataField = 'fczy_jzmj'
            DataSource = dsFyxxxx
          end
          inherited edt13: TbsSkinDBEdit
            DataField = 'fczy_jcnf'
            DataSource = dsFyxxxx
          end
          inherited edt14: TbsSkinDBEdit
            DataField = 'fczy_fx'
            DataSource = dsFyxxxx
          end
          inherited edt15: TbsSkinDBEdit
            DataField = 'fczy_wylb'
            DataSource = dsFyxxxx
          end
          inherited edt16: TbsSkinDBEdit
            DataField = 'fczy_lccg'
            DataSource = dsFyxxxx
          end
        end
        inherited bsknpnl2: TbsSkinPanel
          inherited edt17: TbsSkinDBEdit
            DataField = 'fczy_ptss1'
            DataSource = dsFyxxxx
          end
          inherited edt18: TbsSkinDBEdit
            DataField = 'fczy_ptss2'
            DataSource = dsFyxxxx
          end
          inherited edt19: TbsSkinDBEdit
            DataField = 'fczy_jtdz'
          end
          inherited mmoxxxx: TbsSkinDBMemo2
            Lines.Strings = (
              #26080)
            DataField = 'fczy_xxbz'
            DataSource = dsFyxxxx
          end
        end
      end
    end
    object bskntbsht5: TbsSkinTabSheet
      Caption = #25151#28304#20445#23494#20449#24687
      inline hscrnfvw1: THouseSecureInfoView
        Left = 0
        Top = 0
        Width = 987
        Height = 197
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          Width = 987
          Height = 197
          inherited edtfczy_yzxm: TbsSkinDBEdit
            ReadOnly = True
            DataSource = dsFyxxxx
          end
          inherited edtfczy_yzxm1: TbsSkinDBEdit
            ReadOnly = True
            DataSource = dsFyxxxx
          end
          inherited edtfczy_yzxm2: TbsSkinDBEdit
            ReadOnly = True
            DataSource = dsFyxxxx
          end
          inherited edtfczy_yzxm3: TbsSkinDBEdit
            ReadOnly = True
            DataSource = dsFyxxxx
          end
          inherited mmofczy_yzxm: TbsSkinDBMemo
            Lines.Strings = (
              #26080)
            ReadOnly = True
            DataSource = dsFyxxxx
          end
        end
      end
    end
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25151#28304#36319#36827#20449#24687
      object bskndbgrd1: TbsSkinDBGrid
        Left = 0
        Top = 0
        Width = 987
        Height = 197
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
        DefaultRowHeight = 18
        MouseWheelSupport = False
        SaveMultiSelection = False
        PickListBoxSkinDataName = 'listbox'
        PickListBoxCaptionMode = False
        Align = alClient
        DataSource = dsFygj
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_date'
            Title.Caption = #36319#36827#26102#38388
            Width = 131
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_gjr'
            Title.Caption = #36319#36827#20154
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_fs'
            Title.Caption = #36319#36827#26041#24335
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_ms'
            Title.Caption = #36319#36827#20869#23481
            Width = 522
            Visible = True
          end>
      end
    end
  end
  object qryCjxx: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cjxx')
    Left = 697
    Top = 9
  end
  object dsCjxx: TDataSource
    DataSet = qryCjxx
    Left = 657
    Top = 9
  end
  object tblFyxxxx: TADOTable
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    IndexFieldNames = 'fczy_bh'
    MasterFields = 'cjxx_fybh'
    MasterSource = dsCjxx
    TableName = 'fczy'
    Left = 608
    Top = 8
  end
  object dsFyxxxx: TDataSource
    DataSet = tblFyxxxx
    OnDataChange = dsFyxxxxDataChange
    Left = 544
    Top = 8
  end
  object tblFygj: TADOTable
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    IndexFieldNames = 'fcgj_fybh'
    MasterFields = 'fczy_bh'
    MasterSource = dsFyxxxx
    TableName = 'fcgj'
    Left = 785
    Top = 8
  end
  object dsFygj: TDataSource
    DataSet = tblFygj
    Left = 736
    Top = 8
  end
  object pmContract: TPopupMenu
    Left = 837
    Top = 7
    object V1: TMenuItem
      Caption = '  '#25171#24320#21512#21516'  '
    end
    object W1: TMenuItem
      Caption = '  '#23548' '#20986'  '
    end
    object X1: TMenuItem
      Caption = '  '#25171' '#21360'  '
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
    Left = 931
    Top = 26
  end
  object frxReport1: TfrxReport
    Version = '4.7.181'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40058.490241064800000000
    ReportOptions.LastChange = 40058.516240405100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 388
    Top = 9
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 287.244280000000000000
          Top = 11.338590000000000000
          Width = 124.724490000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #32475#21095#23475#28103#8451#20229)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 548.031850000000000000
          Top = 30.236240000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #37827#12518#28257)
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 608.504330000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 26.456710000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Top = 3.779529999999994000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37722#22557#24723#32514#26663#24447)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779529999999994000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #32457#29111#25965)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 143.622140000000000000
          Top = 3.779529999999994000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37812#25358#31790#32514#26663#24447)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 245.669450000000000000
          Top = 3.779529999999994000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37911#9536#31519#37722#23943#1054)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 332.598640000000000000
          Top = 3.779529999999994000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #28051#27691#23500#28654#25779#24725)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 415.748300000000000000
          Top = 3.779529999999994000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #32515#57787#31519#26916#40515#26870)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 483.779840000000000000
          Top = 3.779529999999994000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #32475#21095#23475#37827#33333#28257)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 597.165740000000000000
          Top = 3.779529999999994000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37714#29256#28257#37827#22549#26879)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1cjxx_htbh: TfrxMemoView
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_htbh'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_htbh"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_czssqk: TfrxMemoView
          Left = 102.047310000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_czssqk'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_czssqk"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_fybh: TfrxMemoView
          Left = 143.622140000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_fybh'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_fybh"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_wymc: TfrxMemoView
          Left = 245.669450000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_wymc'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_wymc"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_khxm: TfrxMemoView
          Left = 332.598640000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_khxm'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_khxm"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_date: TfrxMemoView
          Left = 483.779840000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_date'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_date"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_zygw: TfrxMemoView
          Left = 415.748300000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_zygw'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_zygw"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_enddate: TfrxMemoView
          Left = 597.165740000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_enddate'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_enddate"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 3.779529999999994000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dsCjxx
    BCDToCurrency = False
    Left = 466
    Top = 10
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 310
    Top = 12
  end
end
