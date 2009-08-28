object CustomerManageForm: TCustomerManageForm
  Left = 234
  Top = 215
  Width = 960
  Height = 577
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
    Width = 952
    Height = 75
    Align = alTop
    AutoScroll = False
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 952
      Height = 75
      BorderStyle = bvFrame
      inherited btn1: TbsSkinSpeedButton
        Top = 5
      end
      inherited btn2: TbsSkinSpeedButton
        Top = 5
      end
      inherited btn3: TbsSkinSpeedButton
        Top = 5
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
    Width = 952
    Height = 212
    HelpType = htKeyword
    ActivePage = bskntbsht1
    Align = alClient
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
      Caption = #35814#32454#38656#27714#20449#24687
      inline DetailRequirementInfoView1: TDetailRequirementInfoView
        Left = 0
        Top = 0
        Width = 950
        Height = 190
        Align = alClient
        AutoScroll = False
        TabOrder = 0
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #23458#25143#20445#23494#20449#24687
      inline CustomerSecureInfoView1: TCustomerSecureInfoView
        Left = 0
        Top = 0
        Width = 950
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
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #33258#21160#21305#37197#25151#28304
      inline HouseAutoMatchView1: THouseAutoMatchView
        Left = 0
        Top = 0
        Width = 950
        Height = 190
        Align = alClient
        TabOrder = 0
        inherited bskndbgrd1: TbsSkinDBGrid
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
      end
    end
  end
  inline cstmrlstvw1: TCustomerListView
    Left = 0
    Top = 75
    Width = 952
    Height = 256
    Align = alTop
    TabOrder = 1
    inherited bvl1: TBevel
      Width = 952
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Top = 48
      Width = 952
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
          Width = 110
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
          Width = 102
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
          Width = 89
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
          Width = 96
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
          Width = 139
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
          Width = 87
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
          Width = 98
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
          Width = 95
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
          Visible = True
        end>
    end
  end
end
