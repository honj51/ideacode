object HouseTrackForm: THouseTrackForm
  Left = 295
  Top = 31
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #25151#28304#36319#36827
  ClientHeight = 577
  ClientWidth = 975
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
    Width = 975
    Height = 577
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
      Caption = #36319#36827#31649#29702
      DesignSize = (
        973
        555)
      object bsknpgcntrl2: TbsSkinPageControl
        Left = -1
        Top = 335
        Width = 973
        Height = 220
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
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'tab'
        object bskntbsht3: TbsSkinTabSheet
          Caption = #25151#28304#36319#36827#35760#24405
          inline trckrcrdvw1: TTrackRecordView
            Left = 0
            Top = 0
            Width = 971
            Height = 198
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 971
              inherited btnadd: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn1Click
              end
              inherited btnupdate: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn2Click
              end
              inherited btndelete: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn3Click
              end
              inherited btn4: TbsSkinSpeedButton
                SkinDataName = 'resizebutton'
                OnClick = trckrcrdvw1btn4Click
              end
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 952
              Height = 130
              DefaultRowHeight = 18
              DataSource = HDHouseDataModule.dsTrackRecords
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = bsSkinPopupMenu1
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
              OnDblClick = trckrcrdvw1bskndbgrd1DblClick
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'fcgj_date'
                  Title.Caption = #36319#36827#26102#38388
                  Width = 100
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'fcgj_gjr'
                  Title.Caption = #36319#36827#20154
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'fcgj_fs'
                  Title.Caption = #36319#36827#26041#24335
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'fcgj_ms'
                  Title.Caption = #36319#36827#20869#23481
                  Width = 350
                  Visible = True
                end>
            end
            inherited bsknscrlbr1: TbsSkinScrollBar
              Top = 179
              Width = 971
            end
            inherited bsknscrlbr2: TbsSkinScrollBar
              Left = 952
              Height = 130
            end
          end
        end
        object bskntbsht4: TbsSkinTabSheet
          Caption = #25151#28304#35814#32454#20449#24687
          inline hsdtlnfvw1: THouseDetailInfoView
            Left = 0
            Top = 0
            Width = 971
            Height = 198
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              inherited edt1: TbsSkinDBEdit
                Text = '6800'
                DataField = 'fczy_zj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt2: TbsSkinDBEdit
                Text = '200'
                DataField = 'fczy_sj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt3: TbsSkinDBEdit
                Text = #20986#31199#19981#21253#25324#27700#30005#36153#29992
                DataField = 'fczy_czsm'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt4: TbsSkinDBEdit
                Text = #20928#20215#65292#20080#26041#36127#36131#31246#36153
                DataField = 'fczy_cssm'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt5: TbsSkinDBEdit
                Text = #27491#24120#29366#24577
                DataField = 'fczy_dqzt'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt6: TbsSkinDBEdit
                Text = #37329#25104#22269#36152
                DataField = 'fczy_wymc'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt7: TbsSkinDBEdit
                Text = #35199#22478#21306
                DataField = 'fczy_qy'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt8: TbsSkinDBEdit
                Text = '4'#23460'1'#21381'1'#21355'1'#38451
                DataField = 'fczy_hxjg'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt9: TbsSkinDBEdit
                Text = #23567#29579
                DataField = 'fczy_fwly'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt10: TbsSkinDBEdit
                Text = #21150#20844#29992#25151
                DataField = 'fczy_wyyt'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt11: TbsSkinDBEdit
                Text = #26222#35013
                DataField = 'fczy_zxcd'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt12: TbsSkinDBEdit
                Text = '360'
                DataField = 'fczy_jzmj'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt13: TbsSkinDBEdit
                Text = '2005'
                DataField = 'fczy_jcnf'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt14: TbsSkinDBEdit
                Text = #24179#23618
                DataField = 'fczy_fx'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt15: TbsSkinDBEdit
                Text = #39640#23618
                DataField = 'fczy_wylb'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt16: TbsSkinDBEdit
                Text = '16'
                DataField = 'fczy_lc'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox
                Left = 12
                State = cbChecked
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox
                State = cbChecked
                Checked = True
                DataSource = HDHouseDataModule.dsfczy
              end
            end
            inherited bsknpnl2: TbsSkinPanel
              inherited edt17: TbsSkinDBEdit
                Text = #23485#24102';'
                DataField = 'fczy_ptss1'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt18: TbsSkinDBEdit
                Left = 81
                Text = #30005#35805';'#23485#24102';'
                DataField = 'fczy_ptss2'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edt19: TbsSkinDBEdit
                Text = #21830#22478#36335'110'#21495
                DataField = 'fczy_jtdz'
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited mmoxxxx: TbsSkinDBMemo2
                Lines.Strings = (
                  #20132#36890#26041#20415#65292#22788#20110#24066#21306#32321#21326#22320#24102)
                DataField = 'fczy_xxbz'
                DataSource = HDHouseDataModule.dsfczy
              end
            end
          end
        end
        object bskntbsht5: TbsSkinTabSheet
          Caption = #25151#28304#20445#23494#20449#24687
          inline hscrnfvw1: THouseSecureInfoView
            Left = 0
            Top = 0
            Width = 971
            Height = 198
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              Width = 971
              Height = 198
              inherited edtfczy_yzxm: TbsSkinDBEdit
                Text = #20029#20029
                ReadOnly = True
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm1: TbsSkinDBEdit
                Text = '56585658'
                ReadOnly = True
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm2: TbsSkinDBEdit
                Text = '200'
                ReadOnly = True
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited edtfczy_yzxm3: TbsSkinDBEdit
                Text = #21830#22478#36335'110'#21495
                ReadOnly = True
                DataSource = HDHouseDataModule.dsfczy
              end
              inherited mmofczy_yzxm: TbsSkinDBMemo
                Lines.Strings = (
                  #26080)
                ReadOnly = True
                DataSource = HDHouseDataModule.dsfczy
              end
            end
          end
        end
      end
      inline dlhslstvw1: TDealHouseListView
        Left = 0
        Top = 0
        Width = 969
        Height = 332
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoScroll = False
        TabOrder = 0
        inherited btn1: TbsSkinButtonLabel
          Left = 466
          OnClick = dlhslstvw1btn1Click
        end
        inherited bvl1: TBevel
          Width = 969
        end
        inherited bsSkinStdLabel1: TbsSkinStdLabel
          Left = 157
          Top = 18
        end
        inherited i: TbsSkinStdLabel
          Left = 1
          Top = 19
        end
        inherited bskndbgrd1: TbsSkinDBGrid
          Left = -20
          Top = 68
          Height = 246
          Align = alNone
          DataSource = HDHouseDataModule.dsfczy
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        end
        inherited bsknchckrdbx3: TbsSkinCheckRadioBox
          Top = 9
          TabOrder = 0
          OnClick = dlhslstvw1bsknchckrdbx3Click
        end
        inherited btngaojibtn2: TbsSkinButton
          Left = 384
          Top = 13
          Width = 79
          TabOrder = 1
          OnClick = dlhslstvw1btngaojibtn2Click
        end
        inherited bsknscrlbr1: TbsSkinScrollBar
          Top = 310
          Width = 969
          Height = 22
          Visible = True
          Max = 127
        end
        inherited bsknchckrdbx2: TbsSkinCheckRadioBox
          OnClick = dlhslstvw1bsknchckrdbx2Click
        end
        inherited bsknchckrdbx1: TbsSkinCheckRadioBox
          OnClick = dlhslstvw1bsknchckrdbx1Click
        end
        inherited edt2: TbsSkinMaskEdit
          TabOrder = 2
        end
        inherited edt1: TbsSkinMaskEdit
          Left = 280
        end
        inherited cbb1: TbsSkinComboBox
          Top = 15
          Width = 88
          TabOrder = 3
          OnChange = dlhslstvw1cbb1Change
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #36319#36827#26597#35810
      DesignSize = (
        973
        555)
      object bsSkinStdLabel1: TbsSkinStdLabel
        Left = 14
        Top = 15
        Width = 65
        Height = 17
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #26102#38388#33539#22260
      end
      object bsSkinStdLabel2: TbsSkinStdLabel
        Left = 281
        Top = 16
        Width = 113
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        AutoSize = False
        Caption = #36755#20837#36319#36827#20449#24687#26597#35810
      end
      object btn1: TbsSkinButtonLabel
        Left = 532
        Top = 6
        Width = 33
        Height = 33
        UseCustomGlowColor = False
        CustomGlowColor = clAqua
        GlowEffect = True
        GlowSize = 7
        DoubleBuffered = True
        ImageIndex = -1
        ActiveImageIndex = -1
        WebStyle = False
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000004848488C8C8C8E8E8E4C4C4C000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00004848488C8C8C7D7D7D7F7F7F9292924E4E4E000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000048
          48488C8C8C7D7D7D747474777777909090A8A8A8000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C
          8C8C7D7D7D747474777777878787A6A6A6BCBCBC000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C8C8C7D
          7D7D747474777777878787A6A6A6C1C1C1676767000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C8C8C7D7D7D74
          7474777777878787A6A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004848488C8C8C7D7D7D74747477
          7777878787A6A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          000000000000000000000000000000003F3F3F8989897D7D7D74747477777787
          8787A6A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000000000002C2C2C7575759E9E9EB6B6B6C3C3C3C3C3
          C3B5B5B59B9B9B6969691D1D1D2525256868686F6F6F717171777777878787A6
          A6A6C1C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000020202787878B2B2B2C9C9C9C5C5C5C0C0C0BDBDBDBDBD
          BDC0C0C0C5C5C5C9C9C9A7A7A77F7F7F4747475353536C6C6C858585A6A6A6C1
          C1C1686868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000001E1E1E939393CACACAC3C3C3BDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDC3C3C3CACACA8B8B8B4D4D4D6666669C9C9CC0C0C068
          6868000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000020202959595CDCDCDC1C1C1C0C0C0C3B9ABCAA56FD1943BD58816D588
          16D1943BCAA56FC3B9ABC0C0C0C1C1C1CDCDCD9191915D5D5DA8A8A866666600
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          0000007B7B7BCFCFCFC4C4C4C3C3C3C9B18FD8860DDB8F1FDE972EE09D39E09D
          39DE972EDB8F1FD8860DC9B18FC3C3C3C4C4C4CFCFCF939393424242000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          2E2E2EB9B9B9CBCBCBC6C6C6CBB391DA8A15DF9932E3A346E09A33DD9020DD90
          20E09A33E3A346DF9932DA8A15CBB391C6C6C6CBCBCBB1B1B1222222000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          7D7D7DD4D4D4C9C9C9CBC1B3D9870FE19D39E4A245DF9224DF9224DF9224DF92
          24DF9224DF9224E4A245E19D39D9870FCBC1B3C9C9C9D4D4D47D7D7D000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          AAAAAAD5D5D5CDCDCDD1AC76DF952CE9AD5BE39832E39832E39832E39832E398
          32E39832E39832E39832E9AD5BDF952CD1AC76CDCDCDD5D5D5AAAAAA000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          C6C6C6D4D4D4D0D0D0D59940E5A54BE9AB56E6A040E6A040E6A040E6A040E6A0
          40E6A040E6A040E6A040E9AB56E5A54BD59940D0D0D0D4D4D4C6C6C6000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          D9D9D9D5D5D5D4D4D4D78A18EDB569ECAA55EBA74FEBA74FEBA74FEBA74FEBA7
          4FEBA74FEBA74FEBA74FECAA55EDB569D78A18D4D4D4D5D5D5D9D9D9000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          DBDBDBD8D8D8D8D8D8D78A18F0B973F0B264EFAF5FEFAE5DEFAE5DEFAE5DEFAE
          5DEFAE5DEFAE5DEFAF5FF0B264F0B973D78A18D8D8D8D8D8D8DBDBDB000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          CFCFCFE0E0E0DDDDDDD89C43EDB366F5C385F3B972F2B76CF2B66BF2B66BF2B6
          6BF2B66BF2B76CF3B972F5C385EDB366D89C43DDDDDDE0E0E0CFCFCF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          B5B5B5E6E6E6E1E1E1DBB680E6A449F9D0A2F7C489F6BF7FF6BD7AF6BC79F6BC
          79F6BD7AF6BF7FF7C489F9D0A2E6A449DBB680E1E1E1E6E6E6B5B5B5000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          8A8A8AECECECE6E6E6E2D8CADB8C1AF0BE7CFBD7AEFACC99F9C78FF9C58AF9C5
          8AF9C78FFACC99FBD7AEF0BE7CDB8C1AE2D8CAE6E6E6ECECEC8A8A8A000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          343434D4D4D4EDEDEDE8E8E8E1CAA7E0972FF2C387FEE0C2FDDCB9FDD7AFFDD7
          AFFDDCB9FEE0C2F2C387E0972FE1CAA7E8E8E8EDEDEDD4D4D4343434000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000919191F4F4F4EFEFEFEBEBEBE3CCA9DB8E1DE8AE5DF3CA96FBDFBEFBDF
          BEF3CA96E8AE5DDB8E1DE3CCA9EBEBEBEFEFEFF4F4F4919191000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF020202B2B2B2F6F6F6F1F1F1EDEDEDE9DFD1E2BD86DCA047D98B1AD98B
          1ADCA047E2BD86E9DFD1EDEDEDF1F1F1F6F6F6B2B2B2020202FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000252525B5B5B5F9F9F9F7F7F7F3F3F3F0F0F0EFEFEFEEEEEEEEEE
          EEEFEFEFF0F0F0F3F3F3F7F7F7F9F9F9B5B5B5252525000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000020202969696DEDEDEFBFBFBFAFAFAF8F8F8F6F6F6F6F6
          F6F8F8F8FAFAFAFBFBFBDEDEDE969696020202000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000373737959595C8C8C8E7E7E7F8F8F8F8F8
          F8E7E7E7C8C8C8959595373737000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 1
        Spacing = 1
        Layout = blGlyphTop
        UseSkinFont = True
        DefaultActiveFontColor = clBlue
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'stdlabel'
        OnClick = btn1Click
      end
      object edt2: TbsSkinDateEdit
        Left = 81
        Top = 13
        Width = 90
        Height = 18
        EditMask = '!0000/99/99;1; '
        Text = '    -  -  '
        AlphaBlend = False
        AlphaBlendAnimation = False
        AlphaBlendValue = 0
        UseSkinFont = True
        TodayDefault = False
        CalendarWidth = 200
        CalendarHeight = 150
        CalendarFont.Charset = DEFAULT_CHARSET
        CalendarFont.Color = clWindowText
        CalendarFont.Height = 14
        CalendarFont.Name = 'Arial'
        CalendarFont.Style = []
        CalendarBoldDays = False
        CalendarUseSkinFont = True
        CalendarSkinDataName = 'panel'
        FirstDayOfWeek = Sun
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
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
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
      end
      object edt3: TbsSkinDateEdit
        Left = 178
        Top = 13
        Width = 90
        Height = 18
        EditMask = '!0000/99/99;1; '
        Text = '    -  -  '
        AlphaBlend = False
        AlphaBlendAnimation = False
        AlphaBlendValue = 0
        UseSkinFont = True
        TodayDefault = False
        CalendarWidth = 200
        CalendarHeight = 150
        CalendarFont.Charset = DEFAULT_CHARSET
        CalendarFont.Color = clWindowText
        CalendarFont.Height = 14
        CalendarFont.Name = 'Arial'
        CalendarFont.Style = []
        CalendarBoldDays = False
        CalendarUseSkinFont = True
        CalendarSkinDataName = 'panel'
        FirstDayOfWeek = Sun
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
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
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
      end
      object edt1: TbsSkinMaskEdit
        Left = 404
        Top = 13
        Width = 121
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
        BorderStyle = bsNone
      end
      object bsknchckrdbx1: TbsSkinCheckRadioBox
        Left = 576
        Top = 14
        Width = 105
        Height = 17
        HintImageIndex = 0
        TabOrder = 3
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
        Caption = #26174#36827#20986#31199#36319#36827
        OnClick = bsknchckrdbx1Click
      end
      object bsknchckrdbx2: TbsSkinCheckRadioBox
        Left = 688
        Top = 14
        Width = 113
        Height = 17
        HintImageIndex = 0
        TabOrder = 4
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
        Caption = #21482#26174#31034#20986#21806#36319#36827
        OnClick = bsknchckrdbx2Click
      end
      object bskndbgrd1: TbsSkinDBGrid
        Left = 0
        Top = 48
        Width = 973
        Height = 489
        HintImageIndex = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 5
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'grid'
        Transparent = False
        WallpaperStretch = False
        UseSkinFont = True
        UseSkinCellHeight = True
        HScrollBar = bsknscrlbr1
        GridLineColor = clWindowText
        DefaultCellHeight = 20
        DrawGraphicFields = False
        UseColumnsFont = False
        DefaultRowHeight = 18
        MouseWheelSupport = False
        SaveMultiSelection = False
        PickListBoxSkinDataName = 'listbox'
        PickListBoxCaptionMode = False
        DataSource = HDHouseDataModule.dsTrackQuery
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_date'
            Title.Caption = #36319#36827#26102#38388
            Width = 122
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_gjr'
            Title.Caption = #36319#36827#20154
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_fs'
            Title.Caption = #36319#36827#26041#24335
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fcgj_ms'
            Title.Caption = #36319#36827#20869#23481
            Width = 675
            Visible = True
          end>
      end
      object bsknscrlbr1: TbsSkinScrollBar
        Left = 0
        Top = 536
        Width = 973
        Height = 19
        HintImageIndex = 0
        TabOrder = 6
        Visible = False
        SkinData = HDHouseDataModule.bsSkinData1
        SkinDataName = 'hscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 19
        UseSkinFont = True
        Both = False
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alBottom
        Kind = sbHorizontal
        PageSize = 0
        Min = 0
        Max = 0
        Position = 0
        SmallChange = 127
        LargeChange = 127
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
    Left = 911
    Top = 14
  end
  object frxReport2: TfrxReport
    Version = '4.7.181'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40063.477187858800000000
    ReportOptions.LastChange = 40063.486961620400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 789
    Top = 5
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 257.008040000000000000
          Top = 7.559059999999999000
          Width = 173.858380000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#29825#26495#32141)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 563.149970000000000000
          Top = 30.236240000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37827#12518#28257)
          ParentFont = False
          VAlign = vaCenter
        end
        object Date: TfrxMemoView
          Left = 612.283860000000000000
          Top = 30.236240000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 26.456710000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #25652#24531#24447)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #37812#25358#31790#32514#26663#24447)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 204.094620000000000000
          Top = 3.779529999999994000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 253.228510000000000000
          Top = 3.779529999999994000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#37826#29808#32033)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 313.700990000000000000
          Top = 3.779529999999994000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#37827#22549#26879)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779529999999994000
          Width = 283.464750000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #29882#29115#32344#37712#21613#57744)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2fcgj_bh: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'fcgj_bh'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_bh"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_fybh: TfrxMemoView
          Left = 109.606370000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_fybh'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_fybh"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_fs: TfrxMemoView
          Left = 253.228510000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_fs'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_fs"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_date: TfrxMemoView
          Left = 313.700990000000000000
          Top = 3.779529999999994000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_date'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_date"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_ms: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779529999999994000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_ms'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_ms"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2fcgj_gjr: TfrxMemoView
          Left = 204.094620000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'fcgj_gjr'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16763904
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."fcgj_gjr"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = HDHouseDataModule.qryTrackQuery
    BCDToCurrency = False
    Left = 871
    Top = 2
  end
  object bsSkinPopupMenu1: TbsSkinPopupMenu
    Left = 767
    Top = 53
    object N1: TMenuItem
      Caption = #28155#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #25171#21360
      OnClick = N4Click
    end
  end
end
