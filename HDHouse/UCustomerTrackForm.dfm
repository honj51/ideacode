object CustomerTrackForm: TCustomerTrackForm
  Left = 240
  Top = 95
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
          Top = 41
          Width = 929
          Height = 353
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
              Width = 944
              Height = 144
              DefaultRowHeight = 18
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
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
