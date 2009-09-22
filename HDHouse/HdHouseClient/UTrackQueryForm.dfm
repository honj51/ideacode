object TrackQueryForm: TTrackQueryForm
  Left = 239
  Top = 88
  AutoScroll = False
  BorderIcons = []
  Caption = 'TrackQueryForm '
  ClientHeight = 594
  ClientWidth = 935
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
    Height = 594
    ActivePage = bskntbsht2
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
      Caption = #25151#28304#36319#36827#26597#35810
      inline trckqryfrm2: TTrackQueryFrame
        Left = 0
        Top = 0
        Width = 933
        Height = 572
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsSkinDBGrid1: TbsSkinDBGrid
          Width = 933
          Height = 499
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
        inherited bsknpnl1: TbsSkinPanel
          Width = 933
          inherited lbl3: TLabel
            Height = 14
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #23458#28304#36319#36827#26597#35810
      inline trckqryfrm1: TTrackQueryFrame
        Left = 0
        Top = 0
        Width = 933
        Height = 572
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsSkinDBGrid1: TbsSkinDBGrid
          Width = 933
          Height = 499
          DefaultRowHeight = 18
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
        end
        inherited bsknpnl1: TbsSkinPanel
          Width = 933
          inherited lbl3: TLabel
            Height = 14
          end
          inherited lbl4: TbsSkinStdLabel
            Left = 344
          end
        end
      end
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
    BorderIcons = [biSystemMenu, biRollUp]
    Left = 832
    Top = 368
  end
end
