object HouseManageForm: THouseManageForm
  Left = 295
  Top = 106
  Width = 949
  Height = 628
  BorderIcons = [biMinimize, biMaximize]
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
      end
      inherited btn5: TbsSkinSpeedButton
        Left = 352
        Top = 5
      end
    end
    inherited bspngmglst32: TbsPngImageList
      Left = 476
      Top = 16
    end
    inherited bsknfrm1: TbsSkinFrame
      Left = 540
      Top = 16
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
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #25151#28304#35814#32454#20449#24687
      inline hsdtlnfvw1: THouseDetailInfoView
        Left = 0
        Top = 0
        Width = 939
        Height = 205
        Align = alClient
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          SkinData = HDHouseDataModule.bsSkinData1
          inherited edt1: TbsSkinDBEdit
            Text = '5800'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_zj'
            DataSource = dsfczy
          end
          inherited edt2: TbsSkinDBEdit
            Text = '1260'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_sj'
            DataSource = dsfczy
          end
          inherited edt3: TbsSkinDBEdit
            Text = #20986#31199#19981#21253#25324#27700#30005#36153#29992
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_czsm'
            DataSource = dsfczy
          end
          inherited edt4: TbsSkinDBEdit
            Text = #20928#20215#65292#20080#26041#36127#36131#31246#36153
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_cssm'
            DataSource = dsfczy
          end
          inherited edt5: TbsSkinDBEdit
            Text = #27491#24120#29366#24577
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_dqzt'
            DataSource = dsfczy
          end
          inherited edt6: TbsSkinDBEdit
            Text = #19996#20851#30343#23478#33457#22253
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_wymc'
            DataSource = dsfczy
          end
          inherited edt7: TbsSkinDBEdit
            Text = #19996#22478#21306
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_qy'
            DataSource = dsfczy
          end
          inherited edt8: TbsSkinDBEdit
            Text = '3'#23460'1'#21381'1'#21355'1'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_hxjg'
            DataSource = dsfczy
          end
          inherited edt9: TbsSkinDBEdit
            Text = #23567#40644
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_fwly'
            DataSource = dsfczy
          end
          inherited edt10: TbsSkinDBEdit
            Text = #26222#36890#20303#23429
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_wyyt'
            DataSource = dsfczy
          end
          inherited edt11: TbsSkinDBEdit
            Text = #26222#35013
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_zxcd'
            DataSource = dsfczy
          end
          inherited edt12: TbsSkinDBEdit
            Text = '168'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_jzmj'
            DataSource = dsfczy
          end
          inherited edt13: TbsSkinDBEdit
            Text = '2006'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_jcnf'
            DataSource = dsfczy
          end
          inherited edt14: TbsSkinDBEdit
            Text = #24179#23618
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_fx'
            DataSource = dsfczy
          end
          inherited edt15: TbsSkinDBEdit
            Text = #23567#39640#23618
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_wylb'
            DataSource = dsfczy
          end
          inherited edt16: TbsSkinDBEdit
            Text = '15/8'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_lccg'
            DataSource = dsfczy
          end
          inherited bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox
            Left = 12
            State = cbChecked
            Checked = True
            DataSource = dsfczy
          end
          inherited bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox
            State = cbChecked
            Checked = True
            DataSource = dsfczy
          end
        end
        inherited bsknpnl2: TbsSkinPanel
          SkinData = HDHouseDataModule.bsSkinData1
          inherited edt17: TbsSkinDBEdit
            Text = #29123#27668';'#26262#27668';'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_ptss1'
            DataSource = dsfczy
          end
          inherited edt18: TbsSkinDBEdit
            Text = #20912#31665';'#30005#35805';'#23485#24102';'#26377#32447';'#27927#34915#26426';'#34915#26588';'#24202';'#30005#35270';'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_ptss2'
            DataSource = dsfczy
          end
          inherited edt19: TbsSkinDBEdit
            Text = #19996#20851#22823#36947'108'#21495
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_jtdz'
            DataSource = dsfczy
          end
          inherited mmoxxxx: TbsSkinDBMemo2
            Lines.Strings = (
              #32039#20020#20154#27665#20844#22253#65292#38468#36817#26377#19996#20851#23567#23398#65292#20154#27665#21307#38498#65292#20132#36890#20415#21033)
            SkinData = HDHouseDataModule.bsSkinData1
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
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          Width = 939
          Height = 205
          SkinData = HDHouseDataModule.bsSkinData1
          inherited edtfczy_yzxm: TbsSkinDBEdit
            Text = #26126#26126
            SkinData = HDHouseDataModule.bsSkinData1
            DataSource = dsfczy
          end
          inherited edtfczy_yzxm1: TbsSkinDBEdit
            Text = '86868686'
            SkinData = HDHouseDataModule.bsSkinData1
            DataSource = dsfczy
          end
          inherited edtfczy_yzxm2: TbsSkinDBEdit
            Text = '138222222222'
            SkinData = HDHouseDataModule.bsSkinData1
            DataField = 'fczy_tel'
            DataSource = dsfczy
          end
          inherited edtfczy_yzxm3: TbsSkinDBEdit
            Text = #19996#20851#22823#36947'108'#21495
            SkinData = HDHouseDataModule.bsSkinData1
            DataSource = dsfczy
          end
          inherited mmofczy_yzxm: TbsSkinDBMemo
            Top = 88
            Lines.Strings = (
              #26080)
            SkinData = HDHouseDataModule.bsSkinData1
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
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 186
          Width = 939
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 920
          Height = 186
          DefaultRowHeight = 18
          DataSource = dskhzy
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
    TabOrder = 1
    inherited btn1: TbsSkinButtonLabel
      Left = 265
      Top = 9
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
    Left = 781
    Top = 19
  end
  object qryfczy: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\HD' +
      'House\database\hdhouse.mdb;Mode=Share Deny None;Extended Propert' +
      'ies="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";J' +
      'et OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:' +
      'Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet ' +
      'OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password' +
      '="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Dat' +
      'abase=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLE' +
      'DB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    CursorType = ctStatic
    AfterScroll = qryfczyAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from fczy')
    Left = 648
    Top = 19
  end
  object dsfczy: TDataSource
    DataSet = qryfczy
    Left = 700
    Top = 23
  end
  object qrykhzy: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\HD' +
      'House\database\hdhouse.mdb;Mode=Share Deny None;Extended Propert' +
      'ies="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";J' +
      'et OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:' +
      'Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet ' +
      'OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password' +
      '="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Dat' +
      'abase=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLE' +
      'DB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 835
    Top = 19
  end
end
