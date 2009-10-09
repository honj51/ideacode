object HouseManageForm: THouseManageForm
  Left = 317
  Top = 55
  AutoScroll = False
  BorderIcons = []
  Caption = #25151#28304#31649#29702
  ClientHeight = 594
  ClientWidth = 941
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inline dtprtbrvw1: TDataOperateBarView
    Left = 0
    Top = 0
    Width = 941
    Height = 75
    Align = alTop
    AutoScroll = False
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 941
      Height = 75
      SkinDataName = 'resizetoolpanel'
      BorderStyle = bvFrame
      inherited btn1: TbsSkinSpeedButton
        Left = 11
        Top = 5
        OnClick = dtprtbrvw1btn1Click
      end
      inherited btn2: TbsSkinSpeedButton
        Left = 86
        Top = 5
        OnClick = dtprtbrvw1btn2Click
      end
      inherited btn3: TbsSkinSpeedButton
        Left = 172
        Top = 5
        OnClick = dtprtbrvw1btn3Click
      end
      inherited btn4: TbsSkinSpeedButton
        Left = 266
        Top = 5
        OnClick = dtprtbrvw1btn4Click
      end
      inherited btn5: TbsSkinSpeedButton
        Left = 352
        Top = 5
        OnClick = dtprtbrvw1btn5Click
      end
    end
    inherited bsknfrm1: TbsSkinFrame
      Left = 588
      Top = 34
    end
  end
  object bsknpgcntrlPageC: TbsSkinPageControl
    Left = 0
    Top = 367
    Width = 941
    Height = 227
    HelpType = htKeyword
    ActivePage = bskntbsht1
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabExtededDraw = False
    TabSpacing = 1
    TextInHorizontal = False
    TabsInCenter = False
    FreeOnClose = False
    ShowCloseButtons = False
    TabsBGTransparent = True
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBtnText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultItemHeight = 20
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25151#28304#35814#32454#20449#24687
      inline hsdtlnfvw1: THouseDetailInfoView
        Left = 0
        Top = 0
        Width = 939
        Height = 205
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          inherited edt1: TbsSkinDBEdit
            Text = '6800'
            DataField = 'fczy_zj'
            DataSource = dsfczy
          end
          inherited edt2: TbsSkinDBEdit
            Text = '200'
            DataField = 'fczy_sj'
            DataSource = dsfczy
          end
          inherited edt3: TbsSkinDBEdit
            Text = #20986#31199#19981#21253#25324#27700#30005#36153#29992
            DataField = 'fczy_czsm'
            DataSource = dsfczy
          end
          inherited edt4: TbsSkinDBEdit
            Text = #20928#20215#65292#20080#26041#36127#36131#31246#36153
            DataField = 'fczy_cssm'
            DataSource = dsfczy
          end
          inherited edt5: TbsSkinDBEdit
            Text = #27491#24120#29366#24577
            DataField = 'fczy_dqzt'
            DataSource = dsfczy
          end
          inherited edt6: TbsSkinDBEdit
            Text = #37329#25104#22269#36152
            DataField = 'fczy_wymc'
            DataSource = dsfczy
          end
          inherited edt7: TbsSkinDBEdit
            Text = #35199#22478#21306
            DataField = 'fczy_qy'
            DataSource = dsfczy
          end
          inherited edt8: TbsSkinDBEdit
            Text = '4'#23460'1'#21381'1'#21355'1'#38451
            DataField = 'fczy_hxjg'
            DataSource = dsfczy
          end
          inherited edt9: TbsSkinDBEdit
            Text = #23567#29579
            DataField = 'fczy_fwly'
            DataSource = dsfczy
          end
          inherited edt10: TbsSkinDBEdit
            Text = #21150#20844#29992#25151
            DataField = 'fczy_wyyt'
            DataSource = dsfczy
          end
          inherited edt11: TbsSkinDBEdit
            Text = #26222#35013
            DataField = 'fczy_zxcd'
            DataSource = dsfczy
          end
          inherited edt12: TbsSkinDBEdit
            Text = '360'
            DataField = 'fczy_jzmj'
            DataSource = dsfczy
          end
          inherited edt13: TbsSkinDBEdit
            Text = '2005'
            DataField = 'fczy_jcnf'
            DataSource = dsfczy
          end
          inherited edt14: TbsSkinDBEdit
            Text = #24179#23618
            DataField = 'fczy_fx'
            DataSource = dsfczy
          end
          inherited edt15: TbsSkinDBEdit
            Text = #39640#23618
            DataField = 'fczy_wylb'
            DataSource = dsfczy
          end
          inherited edt16: TbsSkinDBEdit
            Text = '36/16'
            DataField = 'fczy_lccg'
            DataSource = dsfczy
          end
          inherited bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox
            Left = 12
            State = cbChecked
            DataSource = dsfczy
          end
          inherited bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox
            State = cbChecked
            Checked = True
            DataSource = dsfczy
          end
        end
        inherited bsknpnl2: TbsSkinPanel
          inherited edt17: TbsSkinDBEdit
            Text = #26377#32447';'#23485#24102';'
            DataField = 'fczy_ptss1'
            DataSource = dsfczy
          end
          inherited edt18: TbsSkinDBEdit
            Text = #30005#35805';'#23485#24102';'
            DataField = 'fczy_ptss2'
            DataSource = dsfczy
          end
          inherited edt19: TbsSkinDBEdit
            Text = #21830#22478#36335'110'#21495
            DataField = 'fczy_jtdz'
            DataSource = dsfczy
          end
          inherited mmoxxxx: TbsSkinDBMemo2
            Lines.Strings = (
              #20132#36890#26041#20415#65292#22788#20110#24066#21306#32321#21326#22320#24102)
            DataField = 'fczy_xxbz'
            DataSource = dsfczy
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #25151#28304#20445#23494#20449#24687
      inline hscrnfvw1: THouseSecureInfoView
        Left = 0
        Top = 0
        Width = 939
        Height = 205
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          Width = 939
          Height = 205
          inherited edtfczy_yzxm: TbsSkinDBEdit
            Text = #20029#20029
            ReadOnly = True
            DataSource = dsfczy
          end
          inherited edtfczy_yzxm1: TbsSkinDBEdit
            Text = '56585658'
            ReadOnly = True
            DataSource = dsfczy
          end
          inherited edtfczy_yzxm2: TbsSkinDBEdit
            Text = '138666666666'
            ReadOnly = True
            DataField = 'fczy_tel'
            DataSource = dsfczy
          end
          inherited edtfczy_yzxm3: TbsSkinDBEdit
            Text = #21830#22478#36335'110'#21495
            ReadOnly = True
            DataSource = dsfczy
          end
          inherited mmofczy_yzxm: TbsSkinDBMemo
            Top = 88
            Lines.Strings = (
              #26080)
            ReadOnly = True
            DataSource = dsfczy
          end
        end
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #33258#21160#21305#37197#30340#23458#25143
      inline cstmrtmtchvw1: TCustomerAutoMatchView
        Left = 0
        Top = 0
        Width = 939
        Height = 205
        Align = alClient
        TabOrder = 0
        inherited bsSkinScrollBar1: TbsSkinScrollBar
          Left = 920
          Height = 186
          Max = 17
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 186
          Width = 939
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 920
          Height = 186
          SkinData = HDHouseDataModule.bsSkinData1
          DefaultRowHeight = 18
          DataSource = dskhzy
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = bsSkinPopupMenu2
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
      end
    end
  end
  inline hslstvw1: THouseListView
    Left = 0
    Top = 75
    Width = 941
    Height = 292
    Align = alClient
    AutoScroll = False
    TabOrder = 1
    inherited btn1: TbsSkinButtonLabel
      Left = 265
      Top = 9
      SkinData = HDHouseDataModule.bsSkinData1
      OnClick = hslstvw1btn1Click
    end
    inherited bvl1: TBevel
      Width = 941
    end
    inherited bsSkinStdLabel2: TbsSkinStdLabel
      Left = 824
      Top = 19
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Left = 1
      Width = 938
      Height = 222
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsfczy
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = bsSkinPopupMenu1
      OnDblClick = hslstvw1bskndbgrd1DblClick
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
          Width = 114
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
          Width = 94
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
          Width = 85
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
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_hxjg'
          Title.Caption = #25143#22411#32467#26500
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 105
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
          FieldName = 'fczy_qy'
          Title.Caption = #25152#22788#21306#22495
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
          FieldName = 'fczy_lccg'
          Title.Caption = #27004#23618'/'#23618#39640
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_fwly'
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
          FieldName = 'fczy_wyyt'
          Title.Caption = #29289#19994#29992#36884
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
          FieldName = 'fczy_wylb'
          Title.Caption = #29289#19994#31867#21035
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
          FieldName = 'fczy_zxcd'
          Title.Caption = #35013#20462#31243#24230
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_wylb'
          Title.Caption = #25151#22411
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_jcnf'
          Title.Caption = #24314#25104#24180#26376
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fczy_jtdz'
          Title.Caption = #20855#20307#22320#22336
          Visible = True
        end>
    end
    inherited bsknchckrdbx3: TbsSkinCheckRadioBox
      Left = 680
      Top = 15
      TabOrder = 1
      OnClick = hslstvw1bsknchckrdbx3Click
    end
    inherited btngaojibtn2: TbsSkinButton
      Left = 303
      TabOrder = 0
      OnClick = hslstvw1btngaojibtn2Click
    end
    inherited bsknscrlbr1: TbsSkinScrollBar
      Top = 273
      Width = 941
      SmallChange = 18
      LargeChange = 18
    end
    inherited bsknchckrdbx2: TbsSkinCheckRadioBox
      Left = 551
      Top = 17
      TabOrder = 3
      OnClick = hslstvw1bsknchckrdbx2Click
    end
    inherited bsknchckrdbx1: TbsSkinCheckRadioBox
      Left = 417
      Top = 18
      TabOrder = 5
      OnClick = hslstvw1bsknchckrdbx1Click
    end
    inherited edt2: TbsSkinMaskEdit
      Left = 777
      Top = 17
      Text = '30'
      TabOrder = 4
    end
    inherited edt1: TbsSkinMaskEdit
      Width = 131
      Text = ''
      TabOrder = 2
    end
  end
  object dskhzy: TDataSource
    DataSet = qrykhzy
    Left = 744
  end
  object qryfczy: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    AfterScroll = qryfczyAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from fczy')
    Left = 662
    Top = 65532
  end
  object dsfczy: TDataSource
    DataSet = qryfczy
    Left = 707
    Top = 65530
  end
  object qrykhzy: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    Left = 799
    Top = 45
  end
  object bsbsnsknfrm2: TbsBusinessSkinForm
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
    BorderIcons = [biSystemMenu, biMinimize, biMaximize, biRollUp]
    Left = 800
    Top = 65532
  end
  object frxReportfczy: TfrxReport
    Version = '4.7.181'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40058.432030706000000000
    ReportOptions.LastChange = 40058.432030706000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 528
    Top = 65531
    Datasets = <
      item
        DataSet = frxDBDatasetfczy
        DataSetName = 'frxDBDatasetfczy'
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
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37812#25358#31790#28103#8451#20229)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 521.575140000000000000
          Top = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 597.165740000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 30.236240000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 83.149660000000000000
          Top = 7.559059999999988000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #27996#12422#27095#32491#35826#28727)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 151.181200000000000000
          Top = 7.559059999999988000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #37911#9536#31519#37722#23943#1054)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 226.771800000000000000
          Top = 7.559059999999988000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #37812#22446#28727#32513#25780#28719)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 313.700990000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #38344#12834#1053)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 366.614410000000000000
          Top = 7.559059999999988000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #22948#29006#30512'/'#28766#20638#29678)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 442.205010000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 521.575140000000000000
          Top = 7.559059999999988000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #37726#57787#29615)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 563.149970000000000000
          Top = 7.559059999999988000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #32457#29110#29615)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Top = 7.559059999999988000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetfczy
        DataSetName = 'frxDBDatasetfczy'
        RowCount = 0
        object frxDBDatasetfczyfczy_wymc: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_wymc'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_wymc"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_wylb: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_wylb'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_wylb"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_qy: TfrxMemoView
          Left = 151.181200000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_qy'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_qy"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_hxjg: TfrxMemoView
          Left = 226.771800000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_hxjg'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_hxjg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_jzmj: TfrxMemoView
          Left = 313.700990000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_jzmj'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_jzmj"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_lccg: TfrxMemoView
          Left = 366.614410000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_lccg'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_lccg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_wyyt: TfrxMemoView
          Left = 442.205010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_wyyt'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_wyyt"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_zj: TfrxMemoView
          Left = 521.575140000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_zj'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_zj"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_sj: TfrxMemoView
          Left = 563.149970000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_sj'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_sj"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDatasetfczyfczy_dqzt: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fczy_dqzt'
          DataSet = frxDBDatasetfczy
          DataSetName = 'frxDBDatasetfczy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetfczy."fczy_dqzt"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 34.015770000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
      end
      object ReportSummary1: TfrxReportSummary
        Height = 30.236240000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 578.268090000000000000
          Top = 3.779530000000022000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779530000000022000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 510.236550000000000000
          Top = 3.779530000000022000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779530000000022000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxXLSExportfczy: TfrxXLSExport
    UseFileCache = False
    ShowProgress = False
    OverwritePrompt = False
    ExportEMF = False
    ExportStyles = False
    ExportPictures = False
    MergeCells = False
    AsText = False
    Background = False
    FastExport = False
    PageBreaks = False
    EmptyLines = False
    SuppressPageHeadersFooters = False
    Left = 455
    Top = 45
  end
  object frxDBDatasetfczy: TfrxDBDataset
    UserName = 'frxDBDatasetfczy'
    CloseDataSource = False
    DataSet = qryfczy
    BCDToCurrency = False
    Left = 527
    Top = 45
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 456
    Top = 65532
  end
  object bsSkinPopupMenu1: TbsSkinPopupMenu
    Left = 658
    Top = 41
    object N1: TMenuItem
      Caption = #28155#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #23548#20986
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #25171#21360
      OnClick = N5Click
    end
  end
  object bsSkinPopupMenu2: TbsSkinPopupMenu
    Left = 708
    Top = 42
    object N6: TMenuItem
      Caption = #26174#31034#35814#32454#20449#24687
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #26174#31034#20445#23494#20449#24687
      OnClick = N7Click
    end
  end
  object bsknmsg1: TbsSkinMessage
    ShowAgainFlag = False
    ShowAgainFlagValue = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    SkinData = HDHouseDataModule.bsSkinData1
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
    Left = 861
    Top = 5
  end
end
