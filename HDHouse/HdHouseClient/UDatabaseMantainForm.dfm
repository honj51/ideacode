object DatabaseMantainForm: TDatabaseMantainForm
  Left = 424
  Top = 311
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #25968#25454#24211#32500#25252
  ClientHeight = 201
  ClientWidth = 401
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
  object bsknpgcntrl1: TbsSkinPageControl
    Left = 0
    Top = 0
    Width = 401
    Height = 201
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
    SkinData = HDHouseDataModule.bsSkinData1
    SkinDataName = 'tab'
    object bskntbsht1: TbsSkinTabSheet
      Caption = #22791#20221#25968#25454#24211
      object lbl1: TbsSkinStdLabel
        Left = 16
        Top = 50
        Width = 57
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #23384#25918#36335#24452
      end
      object btn1: TbsSkinButton
        Left = 264
        Top = 112
        Width = 75
        Height = 25
        HintImageIndex = 0
        TabOrder = 1
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImageIndex = -1
        AlwaysShowLayeredFrame = False
        UseSkinSize = True
        UseSkinFontColor = True
        RepeatMode = False
        RepeatInterval = 100
        AllowAllUp = False
        TabStop = True
        CanFocused = True
        Down = False
        GroupIndex = 0
        Caption = #22791#20221
        NumGlyphs = 1
        Spacing = 1
        OnClick = btn1Click
      end
      object edt1: TbsSkinEdit
        Left = 72
        Top = 48
        Width = 289
        Height = 18
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = True
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'buttonedit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        OnButtonClick = edt1ButtonClick
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #36824#21407#25968#25454#24211
      object lbl3: TbsSkinStdLabel
        Left = 32
        Top = 74
        Width = 324
        Height = 12
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = GB2312_CHARSET
        DefaultFont.Color = clRed
        DefaultFont.Height = -12
        DefaultFont.Name = #26032#23435#20307
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Style = []
        Caption = #27880#65306#25191#34892#24674#22797#26102#35831#19981#35201#24378#34892#36864#20986#31243#24207#65292#21542#21017#20250#36896#25104#25968#25454#25439#22351#65281
        ParentFont = False
      end
      object lbl4: TbsSkinStdLabel
        Left = 57
        Top = 90
        Width = 216
        Height = 12
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = GB2312_CHARSET
        DefaultFont.Color = clRed
        DefaultFont.Height = -12
        DefaultFont.Name = #26032#23435#20307
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Style = []
        Caption = #25191#34892#24674#22797#21518#23558#35206#30422#21407#26377#25968#25454#24211#65292#35831#24910#37325#65281
        ParentFont = False
      end
      object lbl2: TbsSkinStdLabel
        Left = 16
        Top = 34
        Width = 57
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #25968#25454#25991#20214
      end
      object btn2: TbsSkinButton
        Left = 264
        Top = 112
        Width = 75
        Height = 25
        HintImageIndex = 0
        TabOrder = 1
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImageIndex = -1
        AlwaysShowLayeredFrame = False
        UseSkinSize = True
        UseSkinFontColor = True
        RepeatMode = False
        RepeatInterval = 100
        AllowAllUp = False
        TabStop = True
        CanFocused = True
        Down = False
        GroupIndex = 0
        Caption = #36824#21407
        NumGlyphs = 1
        Spacing = 1
        OnClick = btn2Click
      end
      object edt2: TbsSkinFileEdit
        Left = 72
        Top = 31
        Width = 281
        Height = 18
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = True
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'buttonedit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        Filter = #25968#25454#24211#25991#20214'(*.dat)|*.dat'
        DlgSkinData = HDHouseDataModule.bsSkinData1
        DlgCtrlSkinData = HDHouseDataModule.bsSkinData1
        LVHeaderSkinDataName = 'resizebutton'
      end
    end
    object bskntbsht3: TbsSkinTabSheet
      Caption = #25968#25454#24211#33258#21160#22791#20221
      object lbl5: TbsSkinStdLabel
        Left = 16
        Top = 50
        Width = 57
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #22791#20221#36335#24452
      end
      object lbl6: TbsSkinStdLabel
        Left = 17
        Top = 82
        Width = 49
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #25968#25454#24211
      end
      object lbl7: TbsSkinStdLabel
        Left = 16
        Top = 106
        Width = 57
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #20445#30041#26368#21518
      end
      object lbl8: TbsSkinStdLabel
        Left = 128
        Top = 81
        Width = 73
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #22825#22791#20221#19968#27425
      end
      object lbl9: TbsSkinStdLabel
        Left = 128
        Top = 106
        Width = 57
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #27425#22791#20221
      end
      object bsknchckrdbx1: TbsSkinCheckRadioBox
        Left = 16
        Top = 16
        Width = 150
        Height = 25
        HintImageIndex = 0
        TabOrder = 0
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'checkbox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        WordWrap = False
        AllowGrayed = False
        State = cbUnchecked
        ImageIndex = 0
        Flat = True
        UseSkinFontColor = True
        TabStop = True
        CanFocused = True
        Radio = False
        Checked = False
        GroupIndex = 0
        Caption = #21551#21160#33258#21160#22791#20221#25968#25454#21151#33021
      end
      object edtbak_days: TbsSkinDBEdit
        Left = 72
        Top = 78
        Width = 57
        Height = 18
        Text = 'edtbak_days'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'bak_days'
        DataSource = HDHouseDataModule.ds_autobak
      end
      object edtbak_blsl: TbsSkinDBEdit
        Left = 72
        Top = 104
        Width = 57
        Height = 18
        Text = 'edtbak_blsl'
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        AutoSize = False
        DataField = 'bak_blsl'
        DataSource = HDHouseDataModule.ds_autobak
      end
      object btn3: TbsSkinButton
        Left = 264
        Top = 112
        Width = 75
        Height = 25
        HintImageIndex = 0
        TabOrder = 4
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImageIndex = -1
        AlwaysShowLayeredFrame = False
        UseSkinSize = True
        UseSkinFontColor = True
        RepeatMode = False
        RepeatInterval = 100
        AllowAllUp = False
        TabStop = True
        CanFocused = True
        Down = False
        GroupIndex = 0
        Caption = #20445#23384
        NumGlyphs = 1
        Spacing = 1
        OnClick = btn3Click
      end
      object edt3: TbsSkinFileEdit
        Left = 72
        Top = 48
        Width = 273
        Height = 18
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = True
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'buttonedit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        Filter = #25968#25454#24211#25991#20214'(*.dat)|*.dat'
        DlgSkinData = HDHouseDataModule.bsSkinData1
        DlgCtrlSkinData = HDHouseDataModule.bsSkinData1
        LVHeaderSkinDataName = 'resizebutton'
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
    BorderIcons = [biSystemMenu]
    Left = 33
    Top = 149
  end
  object bsknsvdlg1: TbsSkinSaveDialog
    ShowHiddenFiles = False
    ToolButtonsTransparent = False
    OverwritePromt = False
    DialogWidth = 0
    DialogHeight = 0
    DialogMinWidth = 0
    DialogMinHeight = 0
    CheckFileExists = True
    MultiSelection = False
    AlphaBlend = False
    AlphaBlendValue = 225
    AlphaBlendAnimation = False
    CtrlAlphaBlend = False
    CtrlAlphaBlendValue = 225
    CtrlAlphaBlendAnimation = False
    LVHeaderSkinDataName = 'resizebutton'
    SkinData = HDHouseDataModule.bsSkinData1
    CtrlSkinData = HDHouseDataModule.bsSkinData1
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    Title = 'Save file'
    Filter = #25968#25454#24211#25991#20214'(*.dat)|*.dat'
    FilterIndex = 1
    OnShow = bsknsvdlg1Show
    OnClose = bsknsvdlg1Close
    Left = 105
    Top = 149
  end
end
