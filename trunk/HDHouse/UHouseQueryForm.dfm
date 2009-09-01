object HouseQueryForm: THouseQueryForm
  Left = 538
  Top = 190
  Width = 601
  Height = 315
  BorderIcons = [biSystemMenu]
  Caption = #25151#28304#26597#35810
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
    Left = -3
    Top = 3
    Width = 596
    Height = 264
    AutoScroll = False
    TabOrder = 0
    inherited GroupBox1: TGroupBox
      Left = 9
      Top = 8
      Width = 583
      inherited bvl1: TBevel
        Left = 16
        Width = 537
      end
      inherited lbl11: TbsSkinStdLabel
        Width = 62
      end
      inherited lbl12: TbsSkinStdLabel
        Width = 56
      end
      inherited lbl4: TbsSkinStdLabel
        Width = 58
      end
      inherited lbl5: TbsSkinStdLabel
        Left = 144
      end
      inherited lbl6: TbsSkinStdLabel
        Left = 216
      end
      inherited lbl7: TbsSkinStdLabel
        Left = 288
      end
      inherited lbl8: TbsSkinStdLabel
        Left = 368
      end
      inherited lbl9: TbsSkinStdLabel
        Left = 384
      end
      inherited lbl10: TbsSkinStdLabel
        Left = 483
      end
      inherited lbl2: TbsSkinStdLabel
        Left = 368
        Width = 38
      end
      inherited lbl3: TbsSkinStdLabel
        Left = 483
      end
      inherited lbl1: TbsSkinStdLabel
        Left = 216
        Width = 41
      end
      inherited edt1: TbsSkinEdit
        Left = 416
      end
      inherited edt2: TbsSkinEdit
        Left = 498
      end
      inherited edt3: TbsSkinEdit
        Left = 416
      end
      inherited edt4: TbsSkinEdit
        Left = 498
      end
      inherited edt5: TbsSkinEdit
        Left = 80
      end
      inherited edt6: TbsSkinEdit
        Left = 80
      end
      inherited cbb6: TbsSkinComboBox
        Left = 249
        Top = 27
        Width = 108
      end
      inherited cbb1: TbsSkinComboBox
        Items.Strings = (
          #19981#38480
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
      end
      inherited cbb2: TbsSkinComboBox
        Items.Strings = (
          #19981#38480
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
      end
      inherited cbb3: TbsSkinComboBox
        Items.Strings = (
          #19981#38480
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
      end
      inherited cbb4: TbsSkinComboBox
        Items.Strings = (
          #19981#38480
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
      end
    end
    inherited btn1: TbsSkinXFormButton
      Left = 391
      Top = 229
      OnClick = hsqryfrm1btn1Click
    end
    inherited btn2: TbsSkinXFormButton
      Left = 490
      Top = 230
      OnClick = hsqryfrm1btn2Click
    end
  end
end
