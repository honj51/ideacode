object HouseManageForm: THouseManageForm
  Left = -4
  Top = -4
  AutoScroll = False
  BorderIcons = []
  Caption = #25151#28304#31649#29702
  ClientHeight = 712
  ClientWidth = 1360
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
    Width = 1360
    Height = 75
    Align = alTop
    TabOrder = 0
    inherited bskntlbr1: TbsSkinToolBar
      Width = 1360
      BorderStyle = bvFrame
    end
  end
  inline hslstvw1: THouseListView
    Left = 0
    Top = 75
    Width = 1360
    Height = 291
    Align = alTop
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
      Width = 1360
    end
    inherited bskndbgrd1: TbsSkinDBGrid
      Width = 1357
      Anchors = [akLeft, akRight]
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
      Width = 1360
      Visible = False
      Max = 0
      SmallChange = 63
      LargeChange = 63
    end
  end
  object bsknpgcntrlPageC: TbsSkinPageControl
    Left = 0
    Top = 366
    Width = 1360
    Height = 346
    HelpType = htKeyword
    ActivePage = bskntbsht3
    Align = alClient
    Anchors = [akLeft, akRight, akBottom]
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
        Width = 1358
        Height = 324
        Align = alClient
        TabOrder = 0
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #25151#28304#20445#23494#20449#24687
      inline hscrnfvw1: THouseSecureInfoView
        Left = 0
        Top = 0
        Width = 1358
        Height = 324
        Align = alClient
        TabOrder = 0
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #33258#21160#21305#37197#30340#23458#25143
      inline cstmrtmtchvw1: TCustomerAutoMatchView
        Left = 0
        Top = 0
        Width = 1358
        Height = 324
        Align = alClient
        TabOrder = 0
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 1358
          Height = 305
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
        inherited bsSkinScrollBar1: TbsSkinScrollBar
          Top = 305
          Width = 1358
        end
      end
    end
  end
end
