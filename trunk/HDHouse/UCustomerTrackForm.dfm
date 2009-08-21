object CustomerTrackForm: TCustomerTrackForm
  Left = 277
  Top = 133
  Width = 956
  Height = 544
  Caption = #23458#25143#36319#36827
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
    Width = 948
    Height = 510
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
      Caption = #36319#36827#31649#29702
      inline cstmrlstvw1: TCustomerListView
        Left = 0
        Top = 0
        Width = 946
        Height = 273
        Align = alTop
        TabOrder = 0
        inherited btn1: TbsSkinButtonLabel
          Left = 272
        end
        inherited bvl1: TBevel
          Width = 929
        end
        inherited bsSkinStdLabel2: TbsSkinStdLabel
          Left = 768
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 929
          Height = 353
          DataSource = HDHouseDataModule.dsCustomer
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
              Width = 123
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
              Width = 87
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
              Width = 92
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
              Width = 91
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
              Width = 103
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
              Width = 85
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
              Width = 112
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
              Width = 85
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
              Width = 96
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
              Width = 96
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
              Width = 87
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
              Width = 94
              Visible = True
            end>
        end
        inherited edt1: TEdit
          Width = 129
          Height = 22
        end
        inherited bsknchckrdbx1: TbsSkinCheckRadioBox
          Left = 528
        end
        inherited bsknchckrdbx2: TbsSkinCheckRadioBox
          Left = 408
        end
        inherited bsknchckrdbx3: TbsSkinCheckRadioBox
          Left = 648
        end
        inherited btn2: TbsSkinButton
          Left = 312
        end
        inherited edt2: TbsSkinDBEdit
          Left = 736
        end
      end
      object bsknpgcntrlPageC: TbsSkinPageControl
        Left = 0
        Top = 273
        Width = 946
        Height = 215
        HelpType = htKeyword
        ActivePage = bskntbsht4
        Align = alClient
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
        object bskntbsht4: TbsSkinTabSheet
          Caption = #35814#32454#38656#27714#20449#24687
          inline DetailRequirementInfoView1: TDetailRequirementInfoView
            Left = 0
            Top = 0
            Width = 944
            Height = 193
            Align = alClient
            AutoScroll = False
            TabOrder = 0
          end
        end
        object bskntbsht5: TbsSkinTabSheet
          Caption = #23458#25143#20445#23494#20449#24687
          inline CustomerSecureInfoView1: TCustomerSecureInfoView
            Left = 0
            Top = 0
            Width = 944
            Height = 193
            Align = alClient
            AutoScroll = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inherited bsSkinStdLabel1: TbsSkinStdLabel
              Left = 32
              Width = 57
              AutoSize = False
            end
            inherited bsSkinStdLabel2: TbsSkinStdLabel
              Left = 240
              Width = 57
              AutoSize = False
            end
            inherited bsSkinStdLabel3: TbsSkinStdLabel
              Left = 432
              Width = 57
              AutoSize = False
            end
            inherited bsSkinStdLabel4: TbsSkinStdLabel
              Left = 32
              Width = 57
              AutoSize = False
            end
            inherited bsSkinStdLabel5: TbsSkinStdLabel
              Left = 32
              Width = 57
              AutoSize = False
            end
          end
        end
        object bskntbsht3: TbsSkinTabSheet
          Caption = #23458#25143#36319#36827#35760#24405
          inline trckrcrdvw1: TTrackRecordView
            Left = 0
            Top = 0
            Width = 944
            Height = 193
            Align = alClient
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 944
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 925
              Height = 125
              DefaultRowHeight = 18
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
            end
            inherited bsknscrlbr1: TbsSkinScrollBar
              Top = 174
              Width = 944
            end
            inherited bsknscrlbr2: TbsSkinScrollBar
              Left = 925
              Height = 125
            end
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #36319#36827#26597#35810
      inline cntrctqryfrm1: TContractQueryFrame
        Left = 0
        Top = 0
        Width = 946
        Height = 488
        Align = alClient
        TabOrder = 0
        inherited bvl1: TBevel
          Width = 946
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Top = 48
          Width = 931
          Height = 537
          Align = alCustom
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 467
          Width = 946
          Height = 21
        end
      end
    end
  end
end
