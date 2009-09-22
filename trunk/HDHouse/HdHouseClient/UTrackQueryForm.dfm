object TrackQueryForm: TTrackQueryForm
  Left = 288
  Top = 144
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #36319#36827#26597#35810
  ClientHeight = 570
  ClientWidth = 931
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
    Width = 931
    Height = 570
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
      Caption = #25151#28304#36319#36827#26597#35810
      inline trckqryfrm2: TTrackQueryFrame
        Left = 0
        Top = 0
        Width = 929
        Height = 548
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          Width = 929
          SkinData = HDHouseDataModule.bsSkinData1
          inherited lbl1: TbsSkinStdLabel
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited lbl3: TLabel
            Height = 14
          end
          inherited lbl4: TbsSkinStdLabel
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited btn1: TbsSkinButtonLabel
            Left = 616
            SkinData = HDHouseDataModule.bsSkinData1
            OnClick = trckqryfrm2btn1Click
          end
          inherited btn2: TbsSkinButtonLabel
            Left = 611
            Top = 21
            Visible = False
            OnClick = trckqryfrm2btn2Click
          end
          inherited edt1: TbsSkinDateEdit
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited edt6: TbsSkinEdit
            Text = ''
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited edt5: TbsSkinDateEdit
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited bsknchckrdbx1: TbsSkinCheckRadioBox
            SkinData = HDHouseDataModule.bsSkinData1
            GroupIndex = 1
            OnClick = trckqryfrm2bsknchckrdbx1Click
          end
          inherited bsknchckrdbx2: TbsSkinCheckRadioBox
            SkinData = HDHouseDataModule.bsSkinData1
            GroupIndex = 1
            OnClick = trckqryfrm2bsknchckrdbx2Click
          end
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 929
          Height = 475
          DefaultRowHeight = 18
          DataSource = HDHouseDataModule.dsTrackQuery
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
          Columns = <
            item
              Expanded = False
              FieldName = 'fcgj_date'
              Title.Caption = #36319#36827#20107#20214
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fcgj_gjr'
              Title.Caption = #36319#36827#20154
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fcgj_fs'
              Title.Caption = #36319#36827#26041#24335
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fcgj_ms'
              Title.Caption = #36319#36827#20869#23481
              Visible = True
            end>
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #23458#28304#36319#36827#26597#35810
      inline trckqryfrm1: TTrackQueryFrame
        Left = 0
        Top = 0
        Width = 929
        Height = 548
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        inherited bsknpnl1: TbsSkinPanel
          Width = 929
          SkinData = HDHouseDataModule.bsSkinData1
          inherited lbl1: TbsSkinStdLabel
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited lbl3: TLabel
            Height = 14
          end
          inherited lbl4: TbsSkinStdLabel
            Left = 344
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited btn1: TbsSkinButtonLabel
            Left = 612
            OnClick = trckqryfrm1btn1Click
          end
          inherited btn2: TbsSkinButtonLabel
            SkinData = HDHouseDataModule.bsSkinData1
            Visible = False
            OnClick = trckqryfrm1btn2Click
          end
          inherited edt1: TbsSkinDateEdit
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited edt6: TbsSkinEdit
            Text = ''
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited edt5: TbsSkinDateEdit
            SkinData = HDHouseDataModule.bsSkinData1
          end
          inherited bsknchckrdbx1: TbsSkinCheckRadioBox
            SkinData = HDHouseDataModule.bsSkinData1
            GroupIndex = 1
            Caption = #26174#31034#27714#31199#36319#36827
            OnClick = trckqryfrm1bsknchckrdbx1Click
          end
          inherited bsknchckrdbx2: TbsSkinCheckRadioBox
            SkinData = HDHouseDataModule.bsSkinData1
            GroupIndex = 1
            Caption = #21482#26174#26179#27714#36141#36319#36827
            OnClick = trckqryfrm1bsknchckrdbx2Click
          end
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Width = 929
          Height = 475
          DefaultRowHeight = 18
          DataSource = dsTrackAll
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
          Columns = <
            item
              Expanded = False
              FieldName = 'khgj_date'
              Title.Caption = #36319#36827#20107#20214
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'khgj_gjr'
              Title.Caption = #36319#36827#20154
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'khgj_fs'
              Title.Caption = #36319#36827#26041#24335
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'khgj_ms'
              Title.Caption = #36319#36827#20869#23481
              Visible = True
            end>
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
    BorderIcons = [biSystemMenu]
    Left = 869
    Top = 14
  end
  object qryTrackAll: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from khgj')
    Left = 772
    Top = 5
  end
  object dsTrackAll: TDataSource
    DataSet = qryTrackAll
    Left = 715
    Top = 5
  end
end
