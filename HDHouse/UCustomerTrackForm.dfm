object CustomerTrackForm: TCustomerTrackForm
  Left = 329
  Top = 181
  Width = 1174
  Height = 544
  BorderIcons = [biSystemMenu, biMinimize]
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
    Width = 1166
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
        Width = 1164
        Height = 273
        Align = alTop
        TabOrder = 0
        inherited bvl1: TBevel
          Width = 1164
        end
        inherited bsknpnl1: TbsSkinPanel
          Width = 1164
          inherited btn1: TbsSkinButtonLabel
            Left = 272
            OnClick = cstmrlstvw1btn1Click
          end
          inherited bsSkinStdLabel2: TbsSkinStdLabel
            Left = 784
          end
          inherited edtCustomerSearch: TEdit
            Width = 129
            Height = 22
          end
          inherited btn2: TbsSkinButton
            Left = 312
            OnClick = cstmrlstvw1btn2Click
          end
          inherited bsknchckrdbx2: TbsSkinCheckRadioBox
            Left = 408
            SkinDataName = 'checkbox'
            Radio = False
            OnClick = cstmrlstvw1bsknchckrdbx2Click
          end
          inherited bsknchckrdbx1: TbsSkinCheckRadioBox
            Left = 528
            SkinDataName = 'checkbox'
            Radio = False
            GroupIndex = 0
            OnClick = cstmrlstvw1bsknchckrdbx1Click
          end
          inherited bsknchckrdbx3: TbsSkinCheckRadioBox
            Left = 656
            OnClick = cstmrlstvw1bsknchckrdbx3Click
          end
          inherited edtDate: TbsSkinNumericEdit
            Left = 744
            Text = '100'
            Value = 100.000000000000000000
          end
        end
        inherited bsknpnl2: TbsSkinPanel
          Width = 1164
          Height = 230
          inherited bskndbgrd1: TbsSkinDBGrid
            Width = 1143
            Height = 209
            DataSource = dsKhzy
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
                Width = 92
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
                Width = 91
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
                Width = 103
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
                Width = 85
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
                Width = 112
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
                Width = 85
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
                Width = 96
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
                Width = 96
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
                Width = 87
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
                Width = 94
                Visible = True
              end>
          end
          inherited bsknscrlbrCustomerDown: TbsSkinScrollBar
            Top = 210
            Width = 1162
            SmallChange = 127
            LargeChange = 127
          end
          inherited bsknscrlbrCustomerRight: TbsSkinScrollBar
            Left = 1144
            Height = 209
            PageSize = 3
            Max = 5
          end
        end
      end
      object bsknpgcntrlPageC: TbsSkinPageControl
        Left = 0
        Top = 273
        Width = 1164
        Height = 215
        HelpType = htKeyword
        ActivePage = bskntbsht3
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
            Width = 1162
            Height = 193
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited bsknpnl1: TbsSkinPanel
              inherited edt1: TbsSkinDBEdit
                Text = ''
                DataField = 'qgjg'
                DataSource = dsKhzy
              end
              inherited edt2: TbsSkinDBEdit
                Text = ''
                DataField = 'qzjg'
                DataSource = dsKhzy
              end
              inherited edt3: TbsSkinDBEdit
                Text = '1'
                DataField = 'khzy_qzsm'
                DataSource = dsKhzy
              end
              inherited edt4: TbsSkinDBEdit
                Text = #26080
                DataField = 'khzy_qgsm'
                DataSource = dsKhzy
              end
              inherited edt5: TbsSkinDBEdit
                Text = #26377#25928#23458#25143
                DataField = 'khzy_dqzt'
                DataSource = dsKhzy
              end
              inherited edt6: TbsSkinDBEdit
                Text = #26080
                DataField = 'khzy_wymc'
                DataSource = dsKhzy
              end
              inherited edt7: TbsSkinDBEdit
                Text = #19981#38480
                DataField = 'khzy_qy'
                DataSource = dsKhzy
              end
              inherited edt8: TbsSkinDBEdit
                Text = '1-3'
                DataField = 'khzy_wssl'
                DataSource = dsKhzy
              end
              inherited edt9: TbsSkinDBEdit
                Text = #23567#26446
                DataField = 'khzy_fwly'
                DataSource = dsKhzy
              end
              inherited edt10: TbsSkinDBEdit
                Text = #26222#36890#20303#23429
                DataField = 'khzy_wyyt'
                DataSource = dsKhzy
              end
              inherited edt11: TbsSkinDBEdit
                Text = #26222#35013
                DataField = 'khzy_zxcd'
                DataSource = dsKhzy
              end
              inherited edt12: TbsSkinDBEdit
                Text = '0-100'
                DataField = 'khzy_mj'
                DataSource = dsKhzy
              end
              inherited edt13: TbsSkinDBEdit
                Text = '2000-2008'
                DataField = 'khzy_nf'
                DataSource = dsKhzy
              end
              inherited edt14: TbsSkinDBEdit
                Text = #23567#39640#23618
                DataField = 'khzy_wylb'
                DataSource = dsKhzy
              end
              inherited edt15: TbsSkinDBEdit
                Text = #24179#23618
                DataField = 'khzy_fx'
                DataSource = dsKhzy
              end
            end
            inherited bsknpnl2: TbsSkinPanel
              inherited edt17: TbsSkinDBEdit
                Text = #26080
                DataField = 'khzy_ptss1'
                DataSource = dsKhzy
              end
              inherited edt18: TbsSkinDBEdit
                Text = #26080
                DataField = 'khzy_ptss2'
                DataSource = dsKhzy
              end
              inherited edt19: TbsSkinDBEdit
                Text = #26080
                DataField = 'khzy_jtdz'
                DataSource = dsKhzy
              end
              inherited mmo1: TbsSkinDBMemo
                Lines.Strings = (
                  #26080)
                DataField = 'khzy_xxbz'
                DataSource = dsKhzy
              end
            end
          end
        end
        object bskntbsht5: TbsSkinTabSheet
          Caption = #23458#25143#20445#23494#20449#24687
          inline CustomerSecureInfoView1: TCustomerSecureInfoView
            Left = 0
            Top = 0
            Width = 1162
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
              Caption = #19994#20027#22995#21517
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
            inherited edtName: TbsSkinDBEdit
              Text = #23567#24352'1'
              DataField = 'khzy_yzxm'
              DataSource = dsKhzy
            end
            inherited edtPhone: TbsSkinDBEdit
              Text = '685976798'
              DataField = 'khzy_dh'
              DataSource = dsKhzy
            end
            inherited edtHandset: TbsSkinDBEdit
              Text = '136558996897'
              DataField = 'khzy_tel'
              DataSource = dsKhzy
            end
            inherited edtAddress: TbsSkinDBEdit
              Text = #21335#36890#36335'125'#21495'3'#21495#27004'301'
              DataField = 'khzy_jtwz'
              DataSource = dsKhzy
            end
            inherited mmoDescription: TbsSkinDBMemo
              Lines.Strings = (
                #26080)
              DataField = 'khzy_bmbz'
              DataSource = dsKhzy
            end
          end
        end
        object bskntbsht3: TbsSkinTabSheet
          Caption = #23458#25143#36319#36827#35760#24405
          inline trckrcrdvw1: TTrackRecordView
            Left = 0
            Top = 0
            Width = 1162
            Height = 193
            Align = alClient
            TabOrder = 0
            inherited bskntlbr1: TbsSkinToolBar
              Width = 1162
              inherited btn1: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn1Click
              end
              inherited btn2: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn2Click
              end
              inherited btn3: TbsSkinSpeedButton
                OnClick = trckrcrdvw1btn3Click
              end
            end
            inherited bskndbgrd1: TbsSkinDBGrid
              Width = 1143
              Height = 125
              DefaultRowHeight = 18
              DataSource = dsTrack
              PopupMenu = pmCustomerTrack
              TitleFont.Color = clBtnText
              TitleFont.Height = 14
              TitleFont.Name = 'Arial'
              OnDblClick = trckrcrdvw1bskndbgrd1DblClick
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'khgj_date'
                  Title.Caption = #36319#36827#26102#38388
                  Width = 100
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'khgj_gjr'
                  Title.Caption = #36319#36827#20154
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'khgj_fs'
                  Title.Caption = #36319#36827#26041#24335
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'khgj_ms'
                  Title.Caption = #36319#36827#20869#23481
                  Width = 350
                  Visible = True
                end>
            end
            inherited bsknscrlbr1: TbsSkinScrollBar
              Top = 174
              Width = 1162
            end
            inherited bsknscrlbr2: TbsSkinScrollBar
              Left = 1143
              Height = 125
            end
            inherited bspngmglst24: TbsPngImageList
              Left = 496
              Top = 0
            end
          end
        end
      end
    end
    object bskntbsht2: TbsSkinTabSheet
      Caption = #36319#36827#26597#35810
      object bsknpnl1: TbsSkinPanel
        Left = 0
        Top = 0
        Width = 1164
        Height = 65
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'panel'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImagePosition = bsipDefault
        TransparentMode = False
        CaptionImageIndex = -1
        RealHeight = -1
        AutoEnabledControls = True
        CheckedMode = False
        Checked = False
        DefaultAlignment = taLeftJustify
        DefaultCaptionHeight = 22
        BorderStyle = bvFrame
        CaptionMode = False
        RollUpMode = False
        RollUpState = False
        NumGlyphs = 1
        Spacing = 2
        Caption = 'bsknpnl1'
        Align = alTop
        object btn4: TbsSkinButtonLabel
          Left = 520
          Top = 8
          Width = 31
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
          SkinDataName = 'stdlabel'
          OnClick = btn4Click
        end
        object lbl2: TbsSkinStdLabel
          Left = 304
          Top = 18
          Width = 87
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
          Caption = #26469#30005#20449#24687#26597#35810
        end
        object lbl1: TbsSkinStdLabel
          Left = 176
          Top = 18
          Width = 23
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
          Caption = #65293
        end
        object lbl3: TbsSkinStdLabel
          Left = 16
          Top = 16
          Width = 63
          Height = 17
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
          Caption = #26102#38388#33539#22260
        end
        object edtSearch: TbsSkinEdit
          Left = 392
          Top = 16
          Width = 119
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
          SkinDataName = 'edit'
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
        end
        object edtEndDate: TbsSkinDateEdit
          Left = 200
          Top = 16
          Width = 87
          Height = 18
          EditMask = '!0000/99/99;1; '
          Text = '2009-09-08'
          AlphaBlend = False
          AlphaBlendAnimation = False
          AlphaBlendValue = 0
          UseSkinFont = True
          Date = 40064.455858472220000000
          TodayDefault = True
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
        object edtBeginDate: TbsSkinDateEdit
          Left = 80
          Top = 16
          Width = 87
          Height = 18
          EditMask = '!0000/99/99;1; '
          Text = '2009-09-08'
          AlphaBlend = False
          AlphaBlendAnimation = False
          AlphaBlendValue = 0
          UseSkinFont = True
          Date = 40064.455858472220000000
          TodayDefault = True
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
          SkinDataName = 'buttonedit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 14
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
          LeftImageIndex = -1
          LeftImageHotIndex = -1
          LeftImageDownIndex = -1
          RightImageIndex = -1
          RightImageHotIndex = -1
          RightImageDownIndex = -1
        end
        object bsknchckrdbxQz: TbsSkinCheckRadioBox
          Left = 584
          Top = 16
          Width = 121
          Height = 25
          HintImageIndex = 0
          TabOrder = 3
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
          GroupIndex = 1
          Caption = #21482#26174#31034#27714#31199#36319#36827
          OnClick = bsknchckrdbxQzClick
        end
        object bsknchckrdbxQg: TbsSkinCheckRadioBox
          Left = 704
          Top = 16
          Width = 121
          Height = 25
          HintImageIndex = 0
          TabOrder = 4
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
          GroupIndex = 1
          Caption = #21482#26174#31034#27714#36141#36319#36827
          OnClick = bsknchckrdbxQgClick
        end
      end
      object bsknpnl2: TbsSkinPanel
        Left = 0
        Top = 65
        Width = 1164
        Height = 423
        HintImageIndex = 0
        TabOrder = 1
        SkinDataName = 'panel'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        ImagePosition = bsipDefault
        TransparentMode = False
        CaptionImageIndex = -1
        RealHeight = -1
        AutoEnabledControls = True
        CheckedMode = False
        Checked = False
        DefaultAlignment = taLeftJustify
        DefaultCaptionHeight = 22
        BorderStyle = bvFrame
        CaptionMode = False
        RollUpMode = False
        RollUpState = False
        NumGlyphs = 1
        Spacing = 2
        Caption = 'bsknpnl2'
        Align = alClient
        object bskndbgrd1: TbsSkinDBGrid
          Left = 1
          Top = 1
          Width = 1162
          Height = 421
          HintImageIndex = 0
          TabOrder = 0
          SkinDataName = 'grid'
          Transparent = False
          WallpaperStretch = False
          UseSkinFont = True
          UseSkinCellHeight = True
          GridLineColor = clWindowText
          DefaultCellHeight = 20
          DrawGraphicFields = False
          UseColumnsFont = False
          DefaultRowHeight = 18
          MouseWheelSupport = False
          SaveMultiSelection = False
          PickListBoxSkinDataName = 'listbox'
          PickListBoxCaptionMode = False
          Align = alClient
          DataSource = dsTrackAll
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'khgj_date'
              Title.Caption = #36319#36827#26102#38388
              Width = 148
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'khgj_gjr'
              Title.Caption = #36319#36827#20154
              Width = 89
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'khgj_fs'
              Title.Caption = #36319#36827#26041#24335
              Width = 115
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'khgj_ms'
              Title.Caption = #36319#36827#20869#23481
              Width = 350
              Visible = True
            end>
        end
      end
    end
  end
  object qryKhzy: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    AfterScroll = qryKhzyAfterScroll
    OnCalcFields = qryKhzyCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from khzy')
    Left = 1048
    Top = 24
    object wdstrngfldKhzykhzy_bh: TWideStringField
      FieldName = 'khzy_bh'
      Size = 50
    end
    object wdstrngfldKhzykhzy_yn: TWideStringField
      FieldName = 'khzy_yn'
      Size = 50
    end
    object wdstrngfldKhzykhzy_htbh: TWideStringField
      FieldName = 'khzy_htbh'
      Size = 50
    end
    object qryKhzykhzy_djrq: TDateTimeField
      FieldName = 'khzy_djrq'
    end
    object qryKhzykhzy_sxrq: TDateTimeField
      FieldName = 'khzy_sxrq'
    end
    object qryKhzykhzy_zhrq: TDateTimeField
      FieldName = 'khzy_zhrq'
    end
    object wdstrngfldKhzykhzy_fwly: TWideStringField
      FieldName = 'khzy_fwly'
      Size = 50
    end
    object wdstrngfldKhzykhzy_dqzt: TWideStringField
      FieldName = 'khzy_dqzt'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wymc: TWideStringField
      FieldName = 'khzy_wymc'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wyyt: TWideStringField
      FieldName = 'khzy_wyyt'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wylb: TWideStringField
      FieldName = 'khzy_wylb'
      Size = 50
    end
    object wdstrngfldKhzykhzy_zxcd: TWideStringField
      FieldName = 'khzy_zxcd'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jtdz: TWideStringField
      FieldName = 'khzy_jtdz'
      Size = 255
    end
    object wdstrngfldKhzykhzy_qy: TWideStringField
      FieldName = 'khzy_qy'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jcnf1: TWideStringField
      FieldName = 'khzy_jcnf1'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jcnf2: TWideStringField
      FieldName = 'khzy_jcnf2'
      Size = 50
    end
    object intgrfldKhzykhzy_ws1: TIntegerField
      FieldName = 'khzy_ws1'
    end
    object intgrfldKhzykhzy_ws2: TIntegerField
      FieldName = 'khzy_ws2'
    end
    object fltfldKhzykhzy_jzmj1: TFloatField
      FieldName = 'khzy_jzmj1'
    end
    object fltfldKhzykhzy_jzmj2: TFloatField
      FieldName = 'khzy_jzmj2'
    end
    object wdstrngfldKhzykhzy_fx: TWideStringField
      FieldName = 'khzy_fx'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ptss1: TWideStringField
      FieldName = 'khzy_ptss1'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ptss2: TWideStringField
      FieldName = 'khzy_ptss2'
      Size = 50
    end
    object wdstrngfldKhzykhzy_qz: TWideStringField
      FieldName = 'khzy_qz'
      Size = 50
    end
    object fltfldKhzykhzy_zj1: TFloatField
      FieldName = 'khzy_zj1'
    end
    object fltfldKhzykhzy_zj2: TFloatField
      FieldName = 'khzy_zj2'
    end
    object wdstrngfldKhzykhzy_qzsm: TWideStringField
      FieldName = 'khzy_qzsm'
      Size = 255
    end
    object wdstrngfldKhzykhzy_qg: TWideStringField
      FieldName = 'khzy_qg'
      Size = 50
    end
    object fltfldKhzykhzy_sj1: TFloatField
      FieldName = 'khzy_sj1'
    end
    object fltfldKhzykhzy_sj2: TFloatField
      FieldName = 'khzy_sj2'
    end
    object wdstrngfldKhzykhzy_qgsm: TWideStringField
      FieldName = 'khzy_qgsm'
      Size = 255
    end
    object wdstrngfldKhzykhzy_yzxm: TWideStringField
      FieldName = 'khzy_yzxm'
      Size = 50
    end
    object wdstrngfldKhzykhzy_dh: TWideStringField
      FieldName = 'khzy_dh'
      Size = 50
    end
    object wdstrngfldKhzykhzy_tel: TWideStringField
      FieldName = 'khzy_tel'
      Size = 50
    end
    object wdstrngfldKhzykhzy_jtwz: TWideStringField
      FieldName = 'khzy_jtwz'
      Size = 255
    end
    object wdstrngfldKhzykhzy_bmbz: TWideStringField
      FieldName = 'khzy_bmbz'
      Size = 255
    end
    object qryKhzykhzy_xxbz: TMemoField
      FieldName = 'khzy_xxbz'
      BlobType = ftMemo
    end
    object wdstrngfldKhzykhzy_czy: TWideStringField
      FieldName = 'khzy_czy'
      Size = 50
    end
    object wdstrngfldKhzykhzy_mj: TWideStringField
      FieldName = 'khzy_mj'
      Size = 50
    end
    object wdstrngfldKhzykhzy_nf: TWideStringField
      FieldName = 'khzy_nf'
      Size = 50
    end
    object wdstrngfldKhzykhzy_wssl: TWideStringField
      FieldName = 'khzy_wssl'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ly: TWideStringField
      FieldName = 'khzy_ly'
      Size = 50
    end
    object wdstrngfldKhzykhzy_zg: TWideStringField
      FieldName = 'khzy_zg'
      Size = 50
    end
    object wdstrngfldKhzykhzy_ygbh: TWideStringField
      FieldName = 'khzy_ygbh'
      Size = 50
    end
    object wdstrngfldKhzykhzy_sby: TWideStringField
      FieldName = 'khzy_sby'
      Size = 50
    end
    object qryKhzyqzjg: TStringField
      FieldKind = fkCalculated
      FieldName = 'qzjg'
      Calculated = True
    end
    object qryKhzyqgjg: TStringField
      FieldKind = fkCalculated
      FieldName = 'qgjg'
      Calculated = True
    end
  end
  object dsKhzy: TDataSource
    DataSet = qryKhzy
    Left = 985
    Top = 25
  end
  object tblTrack: TADOTable
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    IndexFieldNames = 'khgj_khbh'
    MasterFields = 'khzy_bh'
    MasterSource = dsKhzy
    TableName = 'khgj'
    Left = 944
    Top = 16
  end
  object dsTrack: TDataSource
    DataSet = tblTrack
    Left = 825
    Top = 25
  end
  object qryTrackAll: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from khgj')
    Left = 873
    Top = 21
  end
  object dsTrackAll: TDataSource
    DataSet = qryTrackAll
    Left = 905
    Top = 21
  end
  object pmCustomerTrack: TPopupMenu
    Left = 1096
    Top = 24
    object V1: TMenuItem
      Caption = '  '#28155' '#21152'  '
      OnClick = V1Click
    end
    object W1: TMenuItem
      Caption = '  '#20462' '#25913'  '
      OnClick = W1Click
    end
    object X1: TMenuItem
      Caption = '  '#21024' '#38500'  '
      OnClick = X1Click
    end
    object Z1: TMenuItem
      Caption = '  '#25171' '#21360'  '
    end
  end
end
