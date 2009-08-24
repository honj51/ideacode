object HouseDealManageForm: THouseDealManageForm
  Left = 217
  Top = 59
  Width = 943
  Height = 624
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
    Width = 935
    Height = 590
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
        933
        568)
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
        Top = 343
        Width = 933
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
            Width = 931
            Height = 203
            Align = alClient
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 931
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 912
              Height = 135
              DefaultRowHeight = 18
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
            end
            inherited bsknscrlbr1: TbsSkinScrollBar
              Top = 184
              Width = 931
            end
            inherited bsknscrlbr2: TbsSkinScrollBar
              Left = 912
              Height = 135
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
            inherited bsknpnl1: TbsSkinPanel
              inherited edt1: TbsSkinDBEdit
                DataField = 'fczy_zj'
              end
              inherited edt2: TbsSkinDBEdit
                DataField = 'fczy_sj'
              end
              inherited edt3: TbsSkinDBEdit
                DataField = 'fczy_cssm'
              end
              inherited edt4: TbsSkinDBEdit
                Left = 255
                Top = 41
                DataField = 'fczy_cssm'
              end
              inherited edt5: TbsSkinDBEdit
                DataField = 'fczy_dqzt'
              end
              inherited edt6: TbsSkinDBEdit
                DataField = 'fczy_wymc'
              end
              inherited edt7: TbsSkinDBEdit
                DataField = 'fczy_qy'
              end
              inherited edt8: TbsSkinDBEdit
                DataField = 'fczy_hxjg'
              end
              inherited edt10: TbsSkinDBEdit
                DataField = 'fczy_wyyt'
              end
              inherited edt11: TbsSkinDBEdit
                DataField = 'fczy_zxcd'
              end
              inherited edt12: TbsSkinDBEdit
                DataField = 'fczy_jzmj'
              end
              inherited edt13: TbsSkinDBEdit
                DataField = 'fczy_jcnf'
              end
              inherited edt14: TbsSkinDBEdit
                DataField = 'fczy_fx'
              end
              inherited edt15: TbsSkinDBEdit
                DataField = 'fczy_wylb'
              end
              inherited edt16: TbsSkinDBEdit
                DataField = 'fczy_lccg'
              end
            end
            inherited bsknpnl2: TbsSkinPanel
              inherited edt17: TbsSkinDBEdit
                DataField = 'fczy_ptss1'
              end
              inherited edt18: TbsSkinDBEdit
                DataField = 'fczy_ptss2'
              end
              inherited edt19: TbsSkinDBEdit
                DataField = 'fczy_jtdz'
              end
            end
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
            inherited edt1: TbsSkinDBEdit
              DataField = 'fczy_yzxm'
            end
            inherited edt2: TbsSkinDBEdit
              Left = 329
              Top = 25
              TabOrder = 2
              DataField = 'fczy_dh'
            end
            inherited edt3: TbsSkinDBEdit
              TabOrder = 1
              DataField = 'fczy_sj'
            end
            inherited edt4: TbsSkinDBEdit
              DataField = 'fczy_jtdz'
            end
          end
        end
      end
      inline dlhslstvw1: TDealHouseListView
        Left = -1
        Top = 68
        Width = 924
        Height = 274
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        inherited lbl1: TLabel
          Left = 167
        end
        inherited btn1: TbsSkinButtonLabel
          Left = 374
        end
        inherited lbl2: TLabel
          Left = 849
          Width = 62
        end
        inherited bvl1: TBevel
          Width = 924
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Left = 2
          Top = 47
          Width = 968
          Height = 201
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 7
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
        inherited edt1: TEdit
          Left = 268
          Height = 22
        end
        inherited bsknchckrdbx1: TbsSkinCheckRadioBox
          Left = 613
        end
        inherited bsknchckrdbx2: TbsSkinCheckRadioBox
          Left = 499
        end
        inherited bsknchckrdbx3: TbsSkinCheckRadioBox
          Left = 720
        end
        inherited btn2: TbsSkinButton
          Left = 411
          Width = 84
        end
        inherited edt2: TbsSkinDBEdit
          Left = 810
          TabOrder = 6
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 255
          Width = 924
          TabOrder = 8
          Visible = True
          Max = 127
          SmallChange = 31
          LargeChange = 31
        end
        inherited cbb1: TbsSkinDBComboBox
          Left = 67
          TabOrder = 5
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
