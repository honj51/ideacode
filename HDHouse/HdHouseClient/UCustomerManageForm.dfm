object CustomerManageForm: TCustomerManageForm
  Left = 221
  Top = 95
  Width = 1097
  Height = 577
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23458#25143#31649#29702
  Color = clBtnFace
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
    Width = 1089
    Height = 75
    Align = alTop
    AutoScroll = False
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 1089
      Height = 75
      SkinDataName = 'resizetoolpanel'
      BorderStyle = bvFrame
      inherited btn1: TbsSkinSpeedButton
        Top = 5
        OnClick = dtprtbrvw1btn1Click
      end
      inherited btn2: TbsSkinSpeedButton
        Top = 5
        OnClick = dtprtbrvw1btn2Click
      end
      inherited btn3: TbsSkinSpeedButton
        Top = 5
        OnClick = dtprtbrvw1btn3Click
      end
      inherited btn4: TbsSkinSpeedButton
        Top = 5
      end
      inherited btn5: TbsSkinSpeedButton
        Top = 5
      end
    end
  end
  object bsknpgcntrlPageC: TbsSkinPageControl
    Left = 0
    Top = 331
    Width = 1089
    Height = 212
    HelpType = htKeyword
    ActivePage = bskntbsht1
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
      Caption = #35814#32454#38656#27714#20449#24687
      inline DetailRequirementInfoView1: TDetailRequirementInfoView
        Left = 0
        Top = 0
        Width = 1087
        Height = 190
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          inherited bsknlbl3: TbsSkinLabel
            Width = 89
          end
          inherited bsknlbl4: TbsSkinLabel
            Width = 89
          end
          inherited bsknlbl13: TbsSkinLabel
            Width = 57
          end
          inherited bsknlbl14: TbsSkinLabel
            Width = 57
          end
          inherited bsknlbl15: TbsSkinLabel
            Width = 57
          end
          inherited bsknlbl16: TbsSkinLabel
            Width = 81
          end
          inherited edt1: TbsSkinDBEdit
            Text = ''
            DataField = 'qzjg'
            DataSource = dsKhzy
          end
          inherited edt2: TbsSkinDBEdit
            Text = ''
            DataField = 'qgjg'
            DataSource = dsKhzy
          end
          inherited edt3: TbsSkinDBEdit
            Left = 288
            Text = #26080
            DataField = 'khzy_qzsm'
            DataSource = dsKhzy
          end
          inherited edt4: TbsSkinDBEdit
            Left = 288
            Text = #26080
            DataField = 'khzy_qgsm'
            DataSource = dsKhzy
          end
          inherited edt5: TbsSkinDBEdit
            Text = #24050#32463#25104#20132
            DataField = 'khzy_dqzt'
            DataSource = dsKhzy
          end
          inherited edt6: TbsSkinDBEdit
            Text = #26080
            DataField = 'khzy_wymc'
            DataSource = dsKhzy
          end
          inherited edt7: TbsSkinDBEdit
            Text = #19981#38480
            DataField = 'khzy_qy'
            DataSource = dsKhzy
          end
          inherited edt8: TbsSkinDBEdit
            Text = '1-3'
            DataField = 'khzy_wssl'
            DataSource = dsKhzy
          end
          inherited edt9: TbsSkinDBEdit
            Text = #23567#26446
            DataField = 'khzy_fwly'
            DataSource = dsKhzy
          end
          inherited edt10: TbsSkinDBEdit
            Text = #26222#36890#20303#23429
            DataField = 'khzy_wyyt'
            DataSource = dsKhzy
          end
          inherited edt11: TbsSkinDBEdit
            Text = #19981#38480
            DataField = 'khzy_zxcd'
            DataSource = dsKhzy
          end
          inherited edt12: TbsSkinDBEdit
            Text = '0-100'
            DataField = 'khzy_mj'
            DataSource = dsKhzy
          end
          inherited edt13: TbsSkinDBEdit
            Left = 368
            Text = '2000-2008'
            DataField = 'khzy_nf'
            DataSource = dsKhzy
          end
          inherited edt14: TbsSkinDBEdit
            Left = 368
            Text = #19981#38480
            DataField = 'khzy_wylb'
            DataSource = dsKhzy
          end
          inherited edt15: TbsSkinDBEdit
            Left = 368
            Text = #19981#38480
            DataField = 'khzy_fx'
            DataSource = dsKhzy
          end
          inherited edt16: TbsSkinDBEdit
            Left = 368
          end
        end
        inherited bsknpnl2: TbsSkinPanel
          Width = 505
          inherited bsknlbl17: TbsSkinLabel
            Width = 65
          end
          inherited bsknlbl18: TbsSkinLabel
            Width = 65
          end
          inherited bsknlbl19: TbsSkinLabel
            Width = 65
          end
          inherited bsknlbl20: TbsSkinLabel
            Width = 65
          end
          inherited edt17: TbsSkinDBEdit
            Left = 88
            Text = #26080
            DataField = 'khzy_ptss1'
            DataSource = dsKhzy
          end
          inherited edt18: TbsSkinDBEdit
            Left = 88
            Text = #26080
            DataField = 'khzy_ptss2'
            DataSource = dsKhzy
          end
          inherited edt19: TbsSkinDBEdit
            Left = 88
            Text = #26080
            DataField = 'khzy_jtdz'
            DataSource = dsKhzy
          end
          inherited edt20: TbsSkinDBEdit
            Left = 88
          end
          inherited mmo1: TbsSkinDBMemo
            Left = 88
            Lines.Strings = (
              #26080)
            DataField = 'khzy_xxbz'
            DataSource = dsKhzy
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #23458#25143#20445#23494#20449#24687
      inline CustomerSecureInfoView1: TCustomerSecureInfoView
        Left = 0
        Top = 0
        Width = 1087
        Height = 190
        Align = alClient
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited edtName: TbsSkinDBEdit
          Text = #23567#24352
          DataField = 'khzy_yzxm'
          DataSource = dsKhzy
        end
        inherited edtPhone: TbsSkinDBEdit
          Text = '685976798'
          DataField = 'khzy_dh'
          DataSource = dsKhzy
        end
        inherited edtHandset: TbsSkinDBEdit
          Text = '136558996897'
          DataField = 'khzy_tel'
          DataSource = dsKhzy
        end
        inherited edtAddress: TbsSkinDBEdit
          Text = #21335#36890#36335'125'#21495'3'#21495#27004'301'
          DataField = 'khzy_jtwz'
          DataSource = dsKhzy
        end
        inherited mmoDescription: TbsSkinDBMemo
          Lines.Strings = (
            #26080)
          DataField = 'khzy_bmbz'
          DataSource = dsKhzy
        end
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #33258#21160#21305#37197#25151#28304
      inline HouseAutoMatchView1: THouseAutoMatchView
        Left = 0
        Top = 0
        Width = 1087
        Height = 190
        Align = alClient
        TabOrder = 0
        inherited bskndbgrd1: TbsSkinDBGrid
          Left = 0
          Top = 0
          Width = 1087
          Height = 171
          DefaultRowHeight = 18
          Align = alClient
          DataSource = dsHouse
          PopupMenu = pmAutoHouse
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
          Columns = <
            item
              Expanded = False
              FieldName = 'fczy_bh'
              Title.Caption = #25151#28304#32534#21495
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_yzxm'
              Title.Caption = #23458#25143#22995#21517
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_djrq'
              Title.Caption = #30331#35760#26085#26399
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_dqzt'
              Title.Caption = #24403#21069#29366#24577
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_wymc'
              Title.Caption = #29289#19994#21517#31216
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_jzmj'
              Title.Caption = #24314#31569#38754#31215
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_lccg'
              Title.Caption = #27004#23618'/'#23618#39640
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_qy'
              Title.Caption = #25152#22788#21306#22495
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_wyyt'
              Title.Caption = #29289#19994#29992#36884
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_wylb'
              Title.Caption = #29289#19994#31867#21035
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_hxjg'
              Title.Caption = #25143#22411#32467#26500
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_fwly'
              Title.Caption = #32622#19994#39038#38382
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_zxcd'
              Title.Caption = #35013#20462#31243#24230
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_fx'
              Title.Caption = #25151#22411
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_jcnf'
              Title.Caption = #24314#25104#24180#26376
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fczy_jtwz'
              Title.Caption = #20855#20307#20301#32622
              Width = 504
              Visible = True
            end>
        end
        inherited HouseAutoMatchView: TbsSkinScrollBar
          Left = 0
          Top = 171
          Width = 1087
          Align = alBottom
          PageSize = 8
          Min = 1
          Max = 17
          Position = 1
        end
      end
    end
  end
  inline cstmrlstvw1: TCustomerListView
    Left = 0
    Top = 75
    Width = 1089
    Height = 256
    Align = alTop
    TabOrder = 2
    inherited bvl1: TBevel
      Width = 1089
    end
    inherited bsknpnl1: TbsSkinPanel
      Width = 1089
      inherited btn1: TbsSkinButtonLabel
        OnClick = cstmrlstvw1btn1Click
      end
      inherited btn2: TbsSkinButton
        OnClick = cstmrlstvw1btn2Click
      end
      inherited bsknchckrdbx2: TbsSkinCheckRadioBox
        SkinDataName = 'checkbox'
        Radio = False
        OnClick = cstmrlstvw1bsknchckrdbx2Click
      end
      inherited bsknchckrdbx1: TbsSkinCheckRadioBox
        SkinDataName = 'checkbox'
        Radio = False
        OnClick = cstmrlstvw1bsknchckrdbx1Click
      end
      inherited bsknchckrdbx3: TbsSkinCheckRadioBox
        OnClick = cstmrlstvw1bsknchckrdbx3Click
      end
      inherited edtDate: TbsSkinNumericEdit
        Text = '100'
        Value = 100.000000000000000000
      end
    end
    inherited bsknpnl2: TbsSkinPanel
      Width = 1089
      Height = 213
      inherited bskndbgrd1: TbsSkinDBGrid
        Width = 1068
        Height = 192
        DataSource = dsKhzy
        PopupMenu = pmCustomer
        OnDblClick = cstmrlstvw1bskndbgrd1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'khzy_bh'
            Title.Caption = #23458#25143#32534#21495
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_dqzt'
            Title.Caption = #24403#21069#29366#24577
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
            FieldName = 'khzy_yzxm'
            Title.Caption = #23458#25143#22995#21517
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
            FieldName = 'khzy_djrq'
            Title.Caption = #30331#35760#26085#26399
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wymc'
            Title.Caption = #29289#19994#21517#31216
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
            FieldName = 'khzy_mj'
            Title.Caption = #38656#27714#38754#31215
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
            FieldName = 'khzy_qy'
            Title.Caption = #25152#22788#21306#22495
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wylb'
            Title.Caption = #29289#19994#31867#21035
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
            FieldName = 'khzy_wssl'
            Title.Caption = #25151#38388#25968#37327
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
            FieldName = 'khzy_zxcd'
            Title.Caption = #35013#20462#31243#24230
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_fwly'
            Title.Caption = #32622#19994#39038#38382
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
            FieldName = 'khzy_jcnf1'
            Title.Caption = #24314#25104#24180#20221
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 88
            Visible = True
          end>
      end
      inherited bsknscrlbrCustomerDown: TbsSkinScrollBar
        Top = 193
        Width = 1087
        Visible = False
        Both = True
        Max = 0
        SmallChange = 127
        LargeChange = 127
      end
      inherited bsknscrlbrCustomerRight: TbsSkinScrollBar
        Left = 1069
        Height = 192
        Visible = True
        PageSize = 3
        Max = 5
      end
    end
  end
  object dsKhzy: TDataSource
    DataSet = qryKhzy
    Left = 785
    Top = 17
  end
  object qryKhzy: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    AfterScroll = qryKhzyAfterScroll
    OnCalcFields = qryKhzyCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from khzy')
    Left = 744
    Top = 16
    object wdstrngfldKhzykhzy_bh: TWideStringField
      FieldName = 'khzy_bh'
      Size = 50
    end
    object wdstrngfldKhzykhzy_yn: TWideStringField
      FieldName = 'khzy_yn'
      Size = 50
    end
    object wdstrngfldKhzykhzy_htbh: TWideStringField
      FieldName = 'khzy_htbh'
      Size = 50
    end
    object qryKhzykhzy_djrq: TDateTimeField
      FieldName = 'khzy_djrq'
    end
    object qryKhzykhzy_sxrq: TDateTimeField
      FieldName = 'khzy_sxrq'
    end
    object qryKhzykhzy_zhrq: TDateTimeField
      FieldName = 'khzy_zhrq'
    end
    object wdstrngfldKhzykhzy_fwly: TWideStringField
      FieldName = 'khzy_fwly'
      Size = 50
    end
    object wdstrngfldKhzykhzy_dqzt: TWideStringField
      FieldName = 'khzy_dqzt'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wymc: TWideStringField
      FieldName = 'khzy_wymc'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wyyt: TWideStringField
      FieldName = 'khzy_wyyt'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wylb: TWideStringField
      FieldName = 'khzy_wylb'
      Size = 50
    end
    object wdstrngfldKhzykhzy_zxcd: TWideStringField
      FieldName = 'khzy_zxcd'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jtdz: TWideStringField
      FieldName = 'khzy_jtdz'
      Size = 255
    end
    object wdstrngfldKhzykhzy_qy: TWideStringField
      FieldName = 'khzy_qy'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jcnf1: TWideStringField
      FieldName = 'khzy_jcnf1'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jcnf2: TWideStringField
      FieldName = 'khzy_jcnf2'
      Size = 50
    end
    object intgrfldKhzykhzy_ws1: TIntegerField
      FieldName = 'khzy_ws1'
    end
    object intgrfldKhzykhzy_ws2: TIntegerField
      FieldName = 'khzy_ws2'
    end
    object fltfldKhzykhzy_jzmj1: TFloatField
      FieldName = 'khzy_jzmj1'
    end
    object fltfldKhzykhzy_jzmj2: TFloatField
      FieldName = 'khzy_jzmj2'
    end
    object wdstrngfldKhzykhzy_fx: TWideStringField
      FieldName = 'khzy_fx'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ptss1: TWideStringField
      FieldName = 'khzy_ptss1'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ptss2: TWideStringField
      FieldName = 'khzy_ptss2'
      Size = 50
    end
    object wdstrngfldKhzykhzy_qz: TWideStringField
      FieldName = 'khzy_qz'
      Size = 50
    end
    object fltfldKhzykhzy_zj1: TFloatField
      FieldName = 'khzy_zj1'
    end
    object fltfldKhzykhzy_zj2: TFloatField
      FieldName = 'khzy_zj2'
    end
    object wdstrngfldKhzykhzy_qzsm: TWideStringField
      FieldName = 'khzy_qzsm'
      Size = 255
    end
    object wdstrngfldKhzykhzy_qg: TWideStringField
      FieldName = 'khzy_qg'
      Size = 50
    end
    object fltfldKhzykhzy_sj1: TFloatField
      FieldName = 'khzy_sj1'
    end
    object fltfldKhzykhzy_sj2: TFloatField
      FieldName = 'khzy_sj2'
    end
    object wdstrngfldKhzykhzy_qgsm: TWideStringField
      FieldName = 'khzy_qgsm'
      Size = 255
    end
    object wdstrngfldKhzykhzy_yzxm: TWideStringField
      FieldName = 'khzy_yzxm'
      Size = 50
    end
    object wdstrngfldKhzykhzy_dh: TWideStringField
      FieldName = 'khzy_dh'
      Size = 50
    end
    object wdstrngfldKhzykhzy_tel: TWideStringField
      FieldName = 'khzy_tel'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jtwz: TWideStringField
      FieldName = 'khzy_jtwz'
      Size = 255
    end
    object wdstrngfldKhzykhzy_bmbz: TWideStringField
      FieldName = 'khzy_bmbz'
      Size = 255
    end
    object qryKhzykhzy_xxbz: TMemoField
      FieldName = 'khzy_xxbz'
      BlobType = ftMemo
    end
    object wdstrngfldKhzykhzy_czy: TWideStringField
      FieldName = 'khzy_czy'
      Size = 50
    end
    object wdstrngfldKhzykhzy_mj: TWideStringField
      FieldName = 'khzy_mj'
      Size = 50
    end
    object wdstrngfldKhzykhzy_nf: TWideStringField
      FieldName = 'khzy_nf'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wssl: TWideStringField
      FieldName = 'khzy_wssl'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ly: TWideStringField
      FieldName = 'khzy_ly'
      Size = 50
    end
    object wdstrngfldKhzykhzy_zg: TWideStringField
      FieldName = 'khzy_zg'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ygbh: TWideStringField
      FieldName = 'khzy_ygbh'
      Size = 50
    end
    object wdstrngfldKhzykhzy_sby: TWideStringField
      FieldName = 'khzy_sby'
      Size = 50
    end
    object qryKhzyqzjg: TStringField
      FieldKind = fkCalculated
      FieldName = 'qzjg'
      Calculated = True
    end
    object qryKhzyqgjg: TStringField
      FieldKind = fkCalculated
      FieldName = 'qgjg'
      Calculated = True
    end
  end
  object qryHouse: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    Left = 856
    Top = 24
  end
  object dsHouse: TDataSource
    DataSet = qryHouse
    Left = 912
    Top = 24
  end
  object pmCustomer: TPopupMenu
    Left = 968
    Top = 24
    object V1: TMenuItem
      Caption = '  '#28155' '#21152'  '
      OnClick = V1Click
    end
    object W1: TMenuItem
      Caption = '  '#20462' '#25913'  '
      OnClick = W1Click
    end
    object X1: TMenuItem
      Caption = '  '#21024' '#38500'  '
      OnClick = X1Click
    end
    object Y1: TMenuItem
      Caption = '  '#23548' '#20986'  '
    end
    object Z1: TMenuItem
      Caption = '  '#25171' '#21360'  '
    end
  end
  object pmAutoHouse: TPopupMenu
    Left = 1032
    Top = 24
    object MenuItem1: TMenuItem
      Caption = '  '#26174#31034#25151#28304#35814#32454#20449#24687'  '
    end
  end
end
