object CustomerDetailsForm: TCustomerDetailsForm
  Left = 235
  Top = 95
  Width = 960
  Height = 577
  Caption = #23458#25143#20449#24687
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
    TabOrder = 2
    inherited bvl1: TBevel
      Width = 952
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Width = 952
    end
  end
end
