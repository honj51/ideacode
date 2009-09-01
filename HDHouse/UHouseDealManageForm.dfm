object HouseDealManageForm: THouseDealManageForm
  Left = 314
  Top = 278
  Width = 958
  Height = 603
  Caption = #25104#20132#31649#29702' '
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
    Width = 950
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
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25104#20132#31649#29702
      DesignSize = (
        948
        547)
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
        Top = 322
        Width = 948
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
        SkinDataName = 'tab'
        object bskntbsht3: TbsSkinTabSheet
          Caption = #25151#28304#36319#36827#35760#24405
          inline trckrcrdvw1: TTrackRecordView
            Left = 0
            Top = 0
            Width = 946
            Height = 203
            Align = alClient
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 946
              inherited btn1: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn1Click
              end
              inherited btn2: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn2Click
              end
              inherited btn3: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn3Click
              end
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 927
              Height = 135
              DefaultRowHeight = 18
              DataSource = HDHouseDataModule.dsTrackRecords
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
              Width = 946
            end
            inherited bsknscrlbr2: TbsSkinScrollBar
              Left = 927
              Height = 135
            end
            inherited bspngmglst24: TbsPngImageList
              Left = 651
              Top = 7
            end
          end
        end
        object bskntbsht4: TbsSkinTabSheet
          Caption = #25151#28304#35814#32454#20449#24687
          inline hsdtlnfvw1: THouseDetailInfoView
            Left = 0
            Top = 0
            Width = 946
            Height = 203
            Align = alClient
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              inherited edt1: TbsSkinDBEdit
                Text = '5800'
                DataField = 'fczy_zj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt2: TbsSkinDBEdit
                Text = '1260'
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
                Text = #27491#24120#29366#24577
                DataField = 'fczy_dqzt'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt6: TbsSkinDBEdit
                Text = #19996#20851#30343#23478#33457#22253
                DataField = 'fczy_wymc'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt7: TbsSkinDBEdit
                Text = #19996#22478#21306
                DataField = 'fczy_qy'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt8: TbsSkinDBEdit
                Text = '3'#23460'1'#21381'1'#21355'1'
                DataField = 'fczy_hxjg'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt9: TbsSkinDBEdit
                Text = #23567#40644
                DataField = 'fczy_fwly'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt10: TbsSkinDBEdit
                Text = #26222#36890#20303#23429
                DataField = 'fczy_wyyt'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt11: TbsSkinDBEdit
                Text = #26222#35013
                DataField = 'fczy_zxcd'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt12: TbsSkinDBEdit
                Text = '168'
                DataField = 'fczy_jzmj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt13: TbsSkinDBEdit
                Text = '2006'
                DataField = 'fczy_jcnf'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt14: TbsSkinDBEdit
                Text = #24179#23618
                DataField = 'fczy_fx'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt15: TbsSkinDBEdit
                Text = #23567#39640#23618
                DataField = 'fczy_wylb'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt16: TbsSkinDBEdit
                Text = '15/8'
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
                Text = #29123#27668';'#26262#27668';'
                DataField = 'fczy_ptss1'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt18: TbsSkinDBEdit
                Text = #20912#31665';'#30005#35805';'#23485#24102';'#26377#32447';'#27927#34915#26426';'#34915#26588';'#24202';'#30005#35270';'
                DataField = 'fczy_ptss2'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt19: TbsSkinDBEdit
                Text = #19996#20851#22823#36947'108'#21495
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
            Width = 946
            Height = 203
            Align = alClient
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              Width = 946
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
                Text = #26126#26126
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm1: TbsSkinDBEdit
                Left = 318
                Top = 29
                Text = '86868686'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm2: TbsSkinDBEdit
                Left = 542
                Top = 29
                Text = '1260'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm3: TbsSkinDBEdit
                Left = 102
                Top = 53
                Text = #19996#20851#22823#36947'108'#21495
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited mmofczy_yzxm: TbsSkinDBMemo
                Left = 102
                Top = 85
                Lines.Strings = (
                  #26080)
                DataSource = HDHouseDataModule.dsfczy
              end
            end
          end
        end
      end
      inline dlhslstvw1: TDealHouseListView
        Left = -1
        Top = 68
        Width = 939
        Height = 253
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        inherited btn1: TbsSkinButtonLabel
          Left = 455
          Width = 34
          OnClick = dlhslstvw1btn1Click
        end
        inherited bvl1: TBevel
          Width = 939
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
              Width = 130
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
              Width = 92
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
          Width = 939
          Visible = True
          Max = 127
          SmallChange = 11
          LargeChange = 11
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
        inherited cbb1: TbsSkinDBComboBox
          Left = 61
          TabOrder = 2
          OnChange = dlhslstvw1cbb1Change
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
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #31614#32422#26597#35810
      DesignSize = (
        948
        547)
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
        Left = 2
        Top = 68
        Width = 929
        Height = 479
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        inherited btn1: TbsSkinButtonLabel
          Left = 518
          OnClick = cntrctqryfrm1btn1Click
        end
        inherited bvl1: TBevel
          Width = 929
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
          Left = 2
          Top = 47
          Width = 931
          Height = 407
          Align = alCustom
          DataSource = HDHouseDataModule.dsContractQuery
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
          Top = 458
          Width = 929
          Height = 21
          Visible = True
          Max = 127
        end
        inherited edt1: TbsSkinMaskEdit
          Text = ''
        end
      end
    end
  end
end
