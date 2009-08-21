object HouseManageForm: THouseManageForm
  Left = 364
  Top = 66
  Width = 936
  Height = 603
  BorderIcons = []
  Caption = #25151#28304#31649#29702
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline dtprtbrvw1: TDataOperateBarView
    Left = 0
    Top = 0
    Width = 928
    Height = 75
    Align = alTop
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 928
      BorderStyle = bvFrame
    end
  end
  object bsknpgcntrlPageC: TbsSkinPageControl
    Left = 0
    Top = 346
    Width = 928
    Height = 223
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
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25151#28304#35814#32454#20449#24687
      inline hsdtlnfvw1: THouseDetailInfoView
        Left = 0
        Top = 0
        Width = 926
        Height = 201
        Align = alClient
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          inherited edt1: TbsSkinDBEdit
            Text = '6800'
            DataField = 'fczy_zj'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt2: TbsSkinDBEdit
            Text = '200'
            DataField = 'fczy_sj'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt3: TbsSkinDBEdit
            Text = #20986#31199#19981#21253#25324#27700#30005#36153#29992
            DataField = 'fczy_czsm'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt4: TbsSkinDBEdit
            Text = #20928#20215#65292#20080#26041#36127#36131#31246#36153
            DataField = 'fczy_cssm'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt5: TbsSkinDBEdit
            Text = #27491#24120#29366#24577
            DataField = 'fczy_dqzt'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt6: TbsSkinDBEdit
            Text = #37329#25104#22269#36152
            DataField = 'fczy_wymc'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt7: TbsSkinDBEdit
            Text = #19996#22478#21306
            DataField = 'fczy_qy'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt8: TbsSkinDBEdit
            Text = '4'#23460'1'#21381'1'#21355'1'#38451
            DataField = 'fczy_hxjg'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt9: TbsSkinDBEdit
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt10: TbsSkinDBEdit
            Text = #21150#20844#29992#25151
            DataField = 'fczy_wyyt'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt11: TbsSkinDBEdit
            Text = #26222#35013
            DataField = 'fczy_zxcd'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt12: TbsSkinDBEdit
            Text = '360'
            DataField = 'fczy_jzmj'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt13: TbsSkinDBEdit
            Text = '2005'
            DataField = 'fczy_jcnf'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt14: TbsSkinDBEdit
            Text = #24179#23618
            DataField = 'fczy_fx'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt15: TbsSkinDBEdit
            Text = #39640#23618
            DataField = 'fczy_wylb'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt16: TbsSkinDBEdit
            Text = '16/36'
            DataField = 'fczy_lccg'
            DataSource = HDHouseDataModule.ds1
          end
        end
        inherited bsknpnl2: TbsSkinPanel
          inherited edt17: TbsSkinDBEdit
            Text = #23485#24102';'
            DataField = 'fczy_ptss1'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt18: TbsSkinDBEdit
            Text = #30005#35805';'#23485#24102';'
            DataField = 'fczy_ptss2'
            DataSource = HDHouseDataModule.ds1
          end
          inherited edt19: TbsSkinDBEdit
            Text = #21830#22478#36335'110'#21495
            DataField = 'fczy_jtdz'
            DataSource = HDHouseDataModule.ds1
          end
          inherited mmoxxxx: TbsSkinDBMemo2
            Lines.Strings = (
              'FC200801070001')
            DataField = 'fczy_'
            DataSource = HDHouseDataModule.ds1
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #25151#28304#20445#23494#20449#24687
      inline hscrnfvw1: THouseSecureInfoView
        Left = 0
        Top = 0
        Width = 926
        Height = 201
        Align = alClient
        TabOrder = 0
        inherited edt1: TbsSkinDBEdit
          Text = #21830#22478#36335'110'#21495
          DataField = 'fczy_jtdz'
          DataSource = HDHouseDataModule.ds1
        end
        inherited edt2: TbsSkinDBEdit
          Text = '56585658'
          DataField = 'fczy_dh'
          DataSource = HDHouseDataModule.ds1
        end
        inherited edt3: TbsSkinDBEdit
          Text = '200'
          DataField = 'fczy_sj'
          DataSource = HDHouseDataModule.ds1
        end
        inherited edt4: TbsSkinDBEdit
          Text = #21830#22478#36335'110'#21495
          DataField = 'fczy_jtdz'
          DataSource = HDHouseDataModule.ds1
        end
        inherited mmo1: TbsSkinDBMemo
          Left = 110
          Top = 81
          Lines.Strings = (
            #20132#36890#26041#20415#65292#22788#20110#24066#21306#32321#21326#22320#24102)
          DataField = 'fczy_xxbz'
          DataSource = HDHouseDataModule.ds1
        end
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #33258#21160#21305#37197#30340#23458#25143
      inline cstmrtmtchvw1: TCustomerAutoMatchView
        Left = 0
        Top = 0
        Width = 926
        Height = 201
        Align = alClient
        TabOrder = 0
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 907
          Height = 182
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
        inherited bsSkinScrollBar1: TbsSkinScrollBar
          Left = 907
          Height = 182
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 182
          Width = 926
        end
      end
    end
  end
  inline hslstvw1: THouseListView
    Left = 0
    Top = 75
    Width = 928
    Height = 271
    Align = alClient
    TabOrder = 1
    inherited lbl1: TLabel
      Left = 8
    end
    inherited btn1: TbsSkinButtonLabel
      Left = 248
    end
    inherited lbl2: TLabel
      Left = 824
    end
    inherited bvl1: TBevel
      Width = 928
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Width = 925
      Height = 201
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = HDHouseDataModule.ds1
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
    inherited edt1: TEdit
      Left = 112
      Width = 113
    end
    inherited bsknchckrdbx1: TbsSkinCheckRadioBox
      Left = 552
    end
    inherited bsknchckrdbx2: TbsSkinCheckRadioBox
      Left = 424
    end
    inherited bsknchckrdbx3: TbsSkinCheckRadioBox
      Left = 680
    end
    inherited btn2: TbsSkinButton
      Left = 296
    end
    inherited edt2: TbsSkinDBEdit
      Left = 776
    end
    inherited bsknscrlbr1: TbsSkinScrollBar
      Top = 252
      Width = 928
      SmallChange = 25
      LargeChange = 25
    end
  end
end
