object CustomerManageForm: TCustomerManageForm
  Left = 272
  Top = 80
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #23458#25143#31649#29702
  ClientHeight = 598
  ClientWidth = 1066
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
    Width = 1066
    Height = 75
    Align = alTop
    AutoScroll = False
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 1066
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
        OnClick = dtprtbrvw1btn4Click
      end
      inherited btn5: TbsSkinSpeedButton
        Top = 5
        OnClick = dtprtbrvw1btn5Click
      end
    end
    inherited bsknfrm1: TbsSkinFrame
      Left = 664
      Top = 18
    end
  end
  object bsknpgcntrlPageC: TbsSkinPageControl
    Left = 0
    Top = 386
    Width = 1066
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
      Caption = #35814#32454#38656#27714#20449#24687
      inline DetailRequirementInfoView1: TDetailRequirementInfoView
        Left = 0
        Top = 0
        Width = 1064
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
            ReadOnly = True
            DataField = 'qzjg'
            DataSource = dsKhzy
          end
          inherited edt2: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'qgjg'
            DataSource = dsKhzy
          end
          inherited edt3: TbsSkinDBEdit
            Left = 288
            ReadOnly = True
            DataField = 'khzy_qzsm'
            DataSource = dsKhzy
          end
          inherited edt4: TbsSkinDBEdit
            Left = 288
            ReadOnly = True
            DataField = 'khzy_qgsm'
            DataSource = dsKhzy
          end
          inherited edt5: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_dqzt'
            DataSource = dsKhzy
          end
          inherited edt6: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_wymc'
            DataSource = dsKhzy
          end
          inherited edt7: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_qy'
            DataSource = dsKhzy
          end
          inherited edt8: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_wssl'
            DataSource = dsKhzy
          end
          inherited edt9: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_fwly'
            DataSource = dsKhzy
          end
          inherited edt10: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_wyyt'
            DataSource = dsKhzy
          end
          inherited edt11: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_zxcd'
            DataSource = dsKhzy
          end
          inherited edt12: TbsSkinDBEdit
            ReadOnly = True
            DataField = 'khzy_mj'
            DataSource = dsKhzy
          end
          inherited edt13: TbsSkinDBEdit
            Left = 368
            ReadOnly = True
            DataField = 'khzy_nf'
            DataSource = dsKhzy
          end
          inherited edt14: TbsSkinDBEdit
            Left = 368
            ReadOnly = True
            DataField = 'khzy_wylb'
            DataSource = dsKhzy
          end
          inherited edt15: TbsSkinDBEdit
            Left = 368
            ReadOnly = True
            DataField = 'khzy_fx'
            DataSource = dsKhzy
          end
          inherited edt16: TbsSkinDBEdit
            Left = 368
            ReadOnly = True
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
            ReadOnly = True
            DataField = 'khzy_ptss1'
            DataSource = dsKhzy
          end
          inherited edt18: TbsSkinDBEdit
            Left = 88
            ReadOnly = True
            DataField = 'khzy_ptss2'
            DataSource = dsKhzy
          end
          inherited edt19: TbsSkinDBEdit
            Left = 88
            ReadOnly = True
            DataField = 'khzy_jtdz'
            DataSource = dsKhzy
          end
          inherited edt20: TbsSkinDBEdit
            Left = 88
            ReadOnly = True
          end
          inherited mmo1: TbsSkinDBMemo
            Left = 88
            ReadOnly = True
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
        Width = 1064
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
          ReadOnly = True
          DataField = 'khzy_yzxm'
          DataSource = dsKhzy
        end
        inherited edtPhone: TbsSkinDBEdit
          ReadOnly = True
          DataField = 'khzy_dh'
          DataSource = dsKhzy
        end
        inherited edtHandset: TbsSkinDBEdit
          ReadOnly = True
          DataField = 'khzy_tel'
          DataSource = dsKhzy
        end
        inherited edtAddress: TbsSkinDBEdit
          ReadOnly = True
          DataField = 'khzy_jtwz'
          DataSource = dsKhzy
        end
        inherited mmoDescription: TbsSkinDBMemo
          ReadOnly = True
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
        Width = 1013
        Height = 190
        Align = alClient
        TabOrder = 0
        inherited bskndbgrd1: TbsSkinDBGrid
          Left = 0
          Top = 0
          Width = 1013
          Height = 171
          SkinData = HDHouseDataModule.bsSkinData1
          HScrollBar = HouseAutoMatchView1.HouseAutoMatchView
          VScrollBar = nil
          DefaultRowHeight = 18
          Align = alClient
          DataSource = dsHouse
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          Width = 1013
          SkinData = HDHouseDataModule.bsSkinData1
          Both = True
          Align = alBottom
          Max = 127
          SmallChange = 31
          LargeChange = 31
        end
      end
    end
  end
  inline cstmrlstvw1: TCustomerListView
    Left = 0
    Top = 75
    Width = 1066
    Height = 309
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoScroll = False
    TabOrder = 1
    inherited bvl1: TBevel
      Width = 1066
    end
    inherited bsknpnl1: TbsSkinPanel
      Width = 1066
      SkinData = HDHouseDataModule.bsSkinData1
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
        SkinData = HDHouseDataModule.bsSkinData1
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
      Width = 1066
      Height = 266
      inherited bskndbgrd1: TbsSkinDBGrid
        Width = 1045
        Height = 245
        DataSource = dsKhzy
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = True
        PopupMenu = pmCustomer
        TitleFont.Name = 'MS Sans Serif'
        OnDblClick = cstmrlstvw1bskndbgrd1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'khzy_bh'
            Title.Caption = #23458#25143#32534#21495
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_dqzt'
            Title.Caption = #24403#21069#29366#24577
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_yzxm'
            Title.Caption = #23458#25143#22995#21517
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_djrq'
            Title.Caption = #30331#35760#26085#26399
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wymc'
            Title.Caption = #29289#19994#21517#31216
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_mj'
            Title.Caption = #38656#27714#38754#31215
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_qy'
            Title.Caption = #25152#22788#21306#22495
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wylb'
            Title.Caption = #29289#19994#31867#21035
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_wssl'
            Title.Caption = #25151#38388#25968#37327
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_zxcd'
            Title.Caption = #35013#20462#31243#24230
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_fwly'
            Title.Caption = #32622#19994#39038#38382
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'khzy_jcnf1'
            Title.Caption = #24314#25104#24180#20221
            Width = 88
            Visible = True
          end>
      end
      inherited bsknscrlbrCustomerDown: TbsSkinScrollBar
        Top = 246
        Width = 1064
        SmallChange = 127
        LargeChange = 127
      end
      inherited bsknscrlbrCustomerRight: TbsSkinScrollBar
        Left = 1046
        Height = 245
        Max = 7
      end
    end
  end
  object dsKhzy: TDataSource
    DataSet = qryKhzy
    Left = 770
    Top = 17
  end
  object qryKhzy: TADOQuery
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    AfterScroll = qryKhzyAfterScroll
    OnCalcFields = qryKhzyCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from khzy')
    Left = 724
    Top = 18
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
    Left = 868
    Top = 19
  end
  object dsHouse: TDataSource
    DataSet = qryHouse
    Left = 913
    Top = 20
  end
  object pmCustomer: TPopupMenu
    Left = 951
    Top = 20
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
    Left = 1016
    Top = 24
    object MenuItem1: TMenuItem
      Caption = '  '#26174#31034#25151#28304#35814#32454#20449#24687'  '
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
    Left = 822
    Top = 19
  end
  object frxReportkhzy1: TfrxReport
    Version = '4.7.181'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40058.432030706000000000
    ReportOptions.LastChange = 40073.638983831020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 516
    Top = 13
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13408511
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
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
            #28729#12833#31790#28103#8451#20229)
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
            #37827#12518#28257)
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
            #29761#21612#24936#37812#24876#23475)
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
            #37718#21700#29017)
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
        object Memo7: TfrxMemoView
          Left = 302.362400000000000000
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
          Left = 355.275820000000000000
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
            #39582#32736#21796)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 430.866420000000000000
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
            #37812#22446#30527#32491#35826#28727)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 616.063390000000000000
          Top = 7.559059999999988000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #37711#34562#32139#37734#26495#28483)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 510.236550000000000000
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
            #32457#29116#22142)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 563.149970000000000000
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
            #37726#57792#22142)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Width = 718.110700000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 22.677179999999990000
          Width = 718.110700000000000000
          Height = 7.559060000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 30.236240000000000000
        Top = 268.346630000000000000
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
            #26916#30005#29212)
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
            #37804#26127#58641)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1khzy_wymc: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_wymc'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_wymc"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_zxcd: TfrxMemoView
          Left = 83.149660000000000000
          Top = 3.779529999999994000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_zxcd'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_zxcd"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_qy: TfrxMemoView
          Left = 151.181200000000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_qy'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_qy"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_zg: TfrxMemoView
          Left = 226.771800000000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_zg'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_zg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_mj: TfrxMemoView
          Left = 302.362400000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_mj'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_mj"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_nf: TfrxMemoView
          Left = 355.275820000000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_nf'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_nf"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_wylb: TfrxMemoView
          Left = 430.866420000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_wylb'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_wylb"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_zj2: TfrxMemoView
          Left = 510.236550000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_zj2'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_zj2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_sj2: TfrxMemoView
          Left = 563.149970000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_sj2'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_sj2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1khzy_jtdz: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779529999999994000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'khzy_jtdz'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."khzy_jtdz"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Top = 7.559059999999988000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408511
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dsKhzy
    BCDToCurrency = False
    Left = 587
    Top = 17
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 452
    Top = 14
  end
end
