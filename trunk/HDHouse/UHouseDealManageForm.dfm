object HouseDealManageForm: THouseDealManageForm
  Left = 280
  Top = 55
  AutoScroll = False
  BorderIcons = []
  Caption = #25104#20132#31649#29702' '
  ClientHeight = 569
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bsknpgcntrl1: TbsSkinPageControl
    Left = 0
    Top = 0
    Width = 876
    Height = 569
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
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25104#20132#31649#29702
      DesignSize = (
        874
        547)
      object btn1: TbsSkinSpeedButton
        Left = 23
        Top = 5
        Width = 64
        Height = 64
        HintImageIndex = 0
        SkinData = HDHouseDataModule.bsSkinData1
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
        OnClick = btn1Click
      end
      object btn2: TbsSkinSpeedButton
        Left = 112
        Top = 5
        Width = 64
        Height = 64
        HintImageIndex = 0
        SkinData = HDHouseDataModule.bsSkinData1
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
        OnClick = btn2Click
      end
      object btn3: TbsSkinSpeedButton
        Left = 200
        Top = 5
        Width = 64
        Height = 64
        HintImageIndex = 0
        SkinData = HDHouseDataModule.bsSkinData1
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
        OnClick = btn3Click
      end
      object bsknpgcntrl2: TbsSkinPageControl
        Left = 0
        Top = 322
        Width = 874
        Height = 225
        ActivePage = bskntbsht3
        Align = alBottom
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
        object bskntbsht3: TbsSkinTabSheet
          Caption = #25151#28304#36319#36827#35760#24405
          inline trckrcrdvw1: TTrackRecordView
            Left = 0
            Top = 0
            Width = 872
            Height = 203
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 872
              inherited btn1: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn1Click
              end
              inherited btn2: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn2Click
              end
              inherited btn3: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn3Click
              end
              inherited btn4: TbsSkinSpeedButton
                Left = 172
                OnClick = trckrcrdvw1btn4Click
              end
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 853
              Height = 135
              DefaultRowHeight = 18
              DataSource = HDHouseDataModule.dsTrackRecords
              PopupMenu = bsSkinPopupMenu1
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
              OnDblClick = trckrcrdvw1bskndbgrd1DblClick
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'fcgj_date'
                  Title.Caption = #36319#36827#26085#26399
                  Width = 100
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
                  Width = 350
                  Visible = True
                end>
            end
            inherited bsknscrlbr1: TbsSkinScrollBar
              Top = 184
              Width = 872
            end
            inherited bsknscrlbr2: TbsSkinScrollBar
              Left = 853
              Height = 135
            end
            inherited bspngmglst24: TbsPngImageList
              Left = 651
              Top = 7
            end
            inherited bsSkinFrame1: TbsSkinFrame
              Left = 565
              Top = 7
            end
          end
        end
        object bskntbsht4: TbsSkinTabSheet
          Caption = #25151#28304#35814#32454#20449#24687
          inline hsdtlnfvw1: THouseDetailInfoView
            Left = 0
            Top = 0
            Width = 872
            Height = 203
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              inherited edt1: TbsSkinDBEdit
                Text = '6800'
                DataField = 'fczy_zj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt2: TbsSkinDBEdit
                Text = '200'
                DataField = 'fczy_sj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt3: TbsSkinDBEdit
                Text = #20928#20215#65292#20080#26041#36127#36131#31246#36153
                DataField = 'fczy_cssm'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt4: TbsSkinDBEdit
                Left = 255
                Top = 41
                Text = #20928#20215#65292#20080#26041#36127#36131#31246#36153
                DataField = 'fczy_cssm'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt5: TbsSkinDBEdit
                Text = #20445#30041#29366#24577
                DataField = 'fczy_dqzt'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt6: TbsSkinDBEdit
                Text = #37329#25104#22269#36152
                DataField = 'fczy_wymc'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt7: TbsSkinDBEdit
                Text = #26397#38451#21306
                DataField = 'fczy_qy'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt8: TbsSkinDBEdit
                Text = '4'#23460'2'#21381'1'#21355'1'
                DataField = 'fczy_hxjg'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt9: TbsSkinDBEdit
                Text = #23567#29579
                DataField = 'fczy_fwly'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt10: TbsSkinDBEdit
                Text = #21830#19994#29992#25143
                DataField = 'fczy_wyyt'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt11: TbsSkinDBEdit
                Text = #26222#35013
                DataField = 'fczy_zxcd'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt12: TbsSkinDBEdit
                Text = '360'
                DataField = 'fczy_jzmj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt13: TbsSkinDBEdit
                Text = '2005'
                DataField = 'fczy_jcnf'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt14: TbsSkinDBEdit
                Text = #24179#23618
                DataField = 'fczy_fx'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt15: TbsSkinDBEdit
                Text = #39640#23618
                DataField = 'fczy_wylb'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt16: TbsSkinDBEdit
                Text = '2/10'
                DataField = 'fczy_lccg'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox
                State = cbChecked
                Checked = True
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox
                State = cbChecked
                Checked = True
                DataSource = HDHouseDataModule.dsfczy
              end
            end
            inherited bsknpnl2: TbsSkinPanel
              inherited edt17: TbsSkinDBEdit
                Text = #23485#24102';'
                DataField = 'fczy_ptss1'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt18: TbsSkinDBEdit
                Text = #30005#35805';'#23485#24102';'
                DataField = 'fczy_ptss2'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt19: TbsSkinDBEdit
                Text = #21830#22478#36335'110'#21495
                DataField = 'fczy_jtdz'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited mmoxxxx: TbsSkinDBMemo2
                DataSource = HDHouseDataModule.dsfczy
              end
            end
          end
        end
        object bskntbsht5: TbsSkinTabSheet
          Caption = #25151#28304#20445#23494#20449#24687
          inline hscrnfvw1: THouseSecureInfoView
            Left = 0
            Top = 0
            Width = 872
            Height = 203
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              Width = 872
              Height = 203
              inherited bsSkinStdLabel1: TbsSkinStdLabel
                Left = 30
                Top = 32
              end
              inherited bsSkinStdLabel2: TbsSkinStdLabel
                Left = 238
                Top = 32
              end
              inherited bsSkinStdLabel3: TbsSkinStdLabel
                Left = 454
                Top = 32
              end
              inherited bsSkinStdLabel4: TbsSkinStdLabel
                Left = 30
                Top = 57
              end
              inherited bsSkinStdLabel5: TbsSkinStdLabel
                Left = 28
                Top = 85
              end
              inherited edtfczy_yzxm: TbsSkinDBEdit
                Left = 102
                Top = 29
                Text = #20029#20029
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm1: TbsSkinDBEdit
                Left = 318
                Top = 29
                Text = '56585658'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm2: TbsSkinDBEdit
                Left = 542
                Top = 29
                Text = '200'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm3: TbsSkinDBEdit
                Left = 102
                Top = 53
                Text = #21830#22478#36335'110'#21495
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited mmofczy_yzxm: TbsSkinDBMemo
                Left = 102
                Top = 85
                Lines.Strings = (
                  #25105#26159#35841#21834)
                DataSource = HDHouseDataModule.dsfczy
              end
            end
          end
        end
      end
      inline dlhslstvw1: TDealHouseListView
        Left = 1
        Top = 68
        Width = 865
        Height = 253
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoScroll = False
        TabOrder = 0
        inherited btn1: TbsSkinButtonLabel
          Left = 455
          Width = 34
          SkinData = HDHouseDataModule.bsSkinData1
          OnClick = dlhslstvw1btn1Click
        end
        inherited bvl1: TBevel
          Width = 865
        end
        inherited bsSkinStdLabel1: TbsSkinStdLabel
          Left = 166
          Top = 20
          Width = 99
        end
        inherited bsSkinStdLabel2: TbsSkinStdLabel
          Left = 856
          Width = 82
        end
        inherited i: TbsSkinStdLabel
          Left = 4
          Top = 21
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Left = 2
          Top = 47
          Width = 968
          Height = 181
          DataSource = HDHouseDataModule.dsfczy
          PopupMenu = pm1
          OnDblClick = dlhslstvw1bskndbgrd1DblClick
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
              Width = 105
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
              Width = 70
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
              Width = 75
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
              Width = 69
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
              Width = 78
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
              Width = 75
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
              Width = 67
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
              Width = 88
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
              Width = 81
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
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_fx'
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
              FieldName = 'fczy_jcnf'
              Title.Caption = #24314#25104#24180#26376
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 95
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
          Left = 718
          Top = 13
          OnClick = dlhslstvw1bsknchckrdbx3Click
        end
        inherited btngaojibtn2: TbsSkinButton
          Left = 377
          Top = 13
          OnClick = dlhslstvw1btngaojibtn2Click
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 234
          Width = 865
          Visible = True
          Max = 127
          SmallChange = 42
          LargeChange = 42
        end
        inherited bsknchckrdbx2: TbsSkinCheckRadioBox
          Left = 606
          Top = 17
          Width = 108
          OnClick = dlhslstvw1bsknchckrdbx2Click
        end
        inherited bsknchckrdbx1: TbsSkinCheckRadioBox
          Left = 493
          Top = 17
          Width = 109
          OnClick = dlhslstvw1bsknchckrdbx1Click
        end
        inherited edt2: TbsSkinMaskEdit
          Left = 810
          Top = 15
          Width = 43
          Height = 19
          TabOrder = 4
        end
        inherited edt1: TbsSkinMaskEdit
          Left = 269
          Height = 22
          TabOrder = 3
        end
        inherited cbb1: TbsSkinComboBox
          TabOrder = 2
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #31614#32422#26597#35810
      DesignSize = (
        874
        547)
      object btn4: TbsSkinSpeedButton
        Left = 104
        Top = 5
        Width = 64
        Height = 64
        HintImageIndex = 0
        SkinData = HDHouseDataModule.bsSkinData1
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
        OnClick = btn4Click
      end
      object btn5: TbsSkinSpeedButton
        Left = 185
        Top = 6
        Width = 64
        Height = 64
        HintImageIndex = 0
        SkinData = HDHouseDataModule.bsSkinData1
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
        OnClick = btn5Click
      end
      object btn6: TbsSkinSpeedButton
        Left = 25
        Top = 5
        Width = 64
        Height = 64
        HintImageIndex = 0
        SkinData = HDHouseDataModule.bsSkinData1
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
        OnClick = btn6Click
      end
      inline cntrctqryfrm1: TContractQueryFrame
        Left = 2
        Top = 67
        Width = 947
        Height = 481
        Anchors = [akLeft, akTop, akBottom]
        AutoScroll = False
        TabOrder = 0
        inherited btn1: TbsSkinButtonLabel
          Left = 518
          OnClick = cntrctqryfrm1btn1Click
        end
        inherited bvl1: TBevel
          Width = 947
        end
        inherited bsknchckrdbx1: TbsSkinCheckRadioBox
          GroupIndex = 1
          OnClick = cntrctqryfrm1bsknchckrdbx1Click
        end
        inherited bsknchckrdbx2: TbsSkinCheckRadioBox
          GroupIndex = 1
          OnClick = cntrctqryfrm1bsknchckrdbx2Click
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Left = -2
          Top = 47
          Width = 933
          Height = 407
          Align = alCustom
          DataSource = HDHouseDataModule.dsContractQuery
          PopupMenu = bsSkinPopupMenu2
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
              Width = 97
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
              Width = 66
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
              Width = 100
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
              Width = 68
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
              Width = 62
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
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cjxx_khxb'
              Title.Caption = #23458#25143#22995#21517
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
              FieldName = 'cjxx_fcyt'
              Title.Caption = #29289#19994#29992#36884
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
              FieldName = 'cjxx_fcmj'
              Title.Caption = #38754#31215
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 53
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
              Width = 68
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
          Top = 460
          Width = 947
          Height = 21
          Visible = True
          SkinData = HDHouseDataModule.bsSkinData1
          Max = 127
        end
        inherited edt1: TbsSkinMaskEdit
          Text = ''
        end
        inherited bsSkinFrame1: TbsSkinFrame
          Left = 824
          Top = 6
        end
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
    BorderIcons = [biSystemMenu, biMinimize, biMaximize, biRollUp]
    Left = 842
    Top = 32
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
    Left = 510
    Top = 1
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
            #37812#24874#27686#28103#8451#20229)
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
        Height = 22.677180000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Top = 3.779529999999994000
          Width = 90.708720000000000000
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
          Left = 90.708720000000000000
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
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779529999999994000
          Width = 90.708720000000000000
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
          Left = 222.992270000000000000
          Top = 3.779529999999994000
          Width = 64.252010000000000000
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
          Left = 287.244280000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
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
        object Memo8: TfrxMemoView
          Left = 332.598640000000000000
          Top = 3.779529999999994000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #28729#12833#22491#32514#26663#24447)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 430.866420000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 483.779840000000000000
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
            #38344#12834#1053)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 525.354670000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
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
          Left = 578.268090000000000000
          Top = 3.779529999999994000
          Width = 64.252010000000000000
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
          Left = 642.520100000000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1cjxx_htbh: TfrxMemoView
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_htbh'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_htbh"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_czssqk: TfrxMemoView
          Left = 90.708720000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_czssqk'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_czssqk"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_fybh: TfrxMemoView
          Left = 132.283550000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_fybh'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_fybh"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_wymc: TfrxMemoView
          Left = 222.992270000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_wymc'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_wymc"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_yzxm: TfrxMemoView
          Left = 287.244280000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_yzxm'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_yzxm"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_khbh: TfrxMemoView
          Left = 340.157700000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_khbh'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_khbh"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_fcyt: TfrxMemoView
          Left = 430.866420000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_fcyt'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_fcyt"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_fcmj: TfrxMemoView
          Left = 483.779840000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_fcmj'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_fcmj"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_zygw: TfrxMemoView
          Left = 525.354670000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_zygw'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_zygw"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_date: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_date'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_date"]')
          ParentFont = False
        end
        object frxDBDataset1cjxx_enddate: TfrxMemoView
          Left = 642.520100000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'cjxx_enddate'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."cjxx_enddate"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = HDHouseDataModule.qryContractQuery
    BCDToCurrency = False
    Left = 575
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 447
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = HDHouseDataModule.qryTrackQuery
    BCDToCurrency = False
    Left = 578
    Top = 48
  end
  object frxReport2: TfrxReport
    Version = '4.7.181'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40063.477187858800000000
    ReportOptions.LastChange = 40063.486961620400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 513
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
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
          Left = 257.008040000000000000
          Top = 7.559059999999999000
          Width = 173.858380000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#29825#26495#32141)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 563.149970000000000000
          Top = 30.236240000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37827#12518#28257)
          ParentFont = False
          VAlign = vaCenter
        end
        object Date: TfrxMemoView
          Left = 612.283860000000000000
          Top = 30.236240000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 26.456710000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #25652#24531#24447)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37812#25358#31790#32514#26663#24447)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 204.094620000000000000
          Top = 3.779529999999994000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 253.228510000000000000
          Top = 3.779529999999994000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#37826#29808#32033)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 313.700990000000000000
          Top = 3.779529999999994000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#37827#22549#26879)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779529999999994000
          Width = 283.464750000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#37712#21613#57744)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2fcgj_bh: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'fcgj_bh'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_bh"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_fybh: TfrxMemoView
          Left = 109.606370000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_fybh'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_fybh"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_fs: TfrxMemoView
          Left = 253.228510000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_fs'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_fs"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_date: TfrxMemoView
          Left = 313.700990000000000000
          Top = 3.779529999999994000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_date'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_date"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_ms: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779529999999994000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_ms'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_ms"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_gjr: TfrxMemoView
          Left = 204.094620000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_gjr'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_gjr"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object pm1: TPopupMenu
    Left = 664
    Top = 34
    object N1: TMenuItem
      Caption = #31614#32422#25104#20132
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913#31614#32422
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21512#21516#25991#20214
      OnClick = N3Click
    end
  end
  object bsSkinPopupMenu1: TbsSkinPopupMenu
    Left = 744
    Top = 40
    object N4: TMenuItem
      Caption = #22686#21152
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #20462#25913
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21024#38500
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #25171#21360
      OnClick = N7Click
    end
  end
  object bsSkinPopupMenu2: TbsSkinPopupMenu
    Left = 358
    Top = 41
    object N8: TMenuItem
      Caption = #25171#24320#21512#21516
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #23548#20986
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #25171#21360
      OnClick = N10Click
    end
  end
end
