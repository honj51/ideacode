object HouseTrackForm: THouseTrackForm
  Left = 296
  Top = 103
  Width = 943
  Height = 632
  Caption = #25151#28304#36319#36827
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
    Height = 598
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
      DesignSize = (
        933
        576)
      inline dlhslstvwinhslstvw1: TDealHouseListView
        Left = 2
        Top = 0
        Width = 925
        Height = 423
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        inherited bvl1: TBevel
          Height = 99
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 925
          Height = 303
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        inherited edt1: TEdit
          Height = 22
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 387
          SmallChange = 63
          LargeChange = 63
        end
      end
      object bsknpgcntrl2: TbsSkinPageControl
        Left = 0
        Top = 349
        Width = 933
        Height = 228
        ActivePage = bskntbsht3
        Anchors = [akLeft, akRight, akBottom]
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
            Height = 206
            Align = alClient
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 931
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 931
              Height = 157
              DefaultRowHeight = 18
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
            end
          end
        end
        object bskntbsht4: TbsSkinTabSheet
          Caption = #25151#28304#35814#32454#20449#24687
          inline hsdtlnfvw1: THouseDetailInfoView
            Left = 0
            Top = 0
            Width = 931
            Height = 206
            Align = alClient
            TabOrder = 0
          end
        end
        object bskntbsht5: TbsSkinTabSheet
          Caption = #25151#28304#20445#23494#20449#24687
          inline hscrnfvw1: THouseSecureInfoView
            Left = 0
            Top = 0
            Width = 931
            Height = 206
            Align = alClient
            TabOrder = 0
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #36319#36827#26597#35810
      inline cntrctqryfrm1: TContractQueryFrame
        Left = 0
        Top = 0
        Width = 933
        Height = 576
        Align = alClient
        TabOrder = 0
        inherited bvl1: TBevel
          Width = 933
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Top = 48
          Width = 931
          Height = 537
          Align = alCustom
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 555
          Width = 933
          Height = 21
        end
      end
    end
  end
end
