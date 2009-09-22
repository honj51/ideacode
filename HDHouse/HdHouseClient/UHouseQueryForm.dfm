object HouseQueryForm: THouseQueryForm
  Left = 772
  Top = 180
  AutoScroll = False
  BorderIcons = []
  Caption = #25151#28304#26597#35810
  ClientHeight = 270
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline hsqryfrm1: THouseQueryFrame
    Left = 0
    Top = 0
    Width = 585
    Height = 270
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited btn1: TbsSkinXFormButton
      Left = 392
      Top = 230
      SkinData = HDHouseDataModule.bsSkinData1
      OnClick = hsqryfrm1btn1Click
    end
    inherited btn2: TbsSkinXFormButton
      Left = 490
      Top = 230
      SkinData = HDHouseDataModule.bsSkinData1
      OnClick = hsqryfrm1btn2Click
    end
    inherited bskngrpbx1: TbsSkinGroupBox
      Width = 570
      Anchors = [akLeft, akTop, akRight, akBottom]
      inherited lbl3: TbsSkinStdLabel
        Left = 479
        Top = 29
      end
      inherited lbl10: TbsSkinStdLabel
        Left = 479
        Top = 61
        Height = 15
      end
      inherited lbl9: TbsSkinStdLabel
        Left = 370
        Top = 63
      end
      inherited lbl7: TbsSkinStdLabel
        Left = 279
        Top = 63
      end
      inherited bvl1: TBevel
        Width = 560
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      inherited cbb6: TbsSkinComboBox
        TabOrder = 1
      end
      inherited cbb4: TbsSkinComboBox
        TabOrder = 7
      end
      inherited cbb3: TbsSkinComboBox
        Left = 224
      end
      inherited edt1: TbsSkinNumericEdit
        Left = 403
        Top = 28
        Height = 18
        TabOrder = 2
      end
      inherited edt2: TbsSkinNumericEdit
        Top = 28
      end
      inherited edt3: TbsSkinNumericEdit
        Left = 402
        Top = 59
        TabOrder = 5
      end
      inherited edt4: TbsSkinNumericEdit
        Top = 59
        TabOrder = 6
      end
    end
    inherited bsSkinFrame1: TbsSkinFrame
      Left = 552
      Top = 0
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
    BorderIcons = [biSystemMenu, biMinimize, biMaximize, biRollUp]
    Left = 501
    Top = 1
  end
end
