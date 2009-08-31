object HouseTrackInfoForm: THouseTrackInfoForm
  Left = 432
  Top = 342
  Width = 507
  Height = 328
  Caption = #25151#28304#36319#36827#20449#24687
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
  inline trcknfvw1: TTrackInfoView
    Left = 0
    Top = 0
    Width = 499
    Height = 294
    Align = alClient
    TabOrder = 0
    inherited bskngrpbx1: TbsSkinGroupBox
      inherited btnAddAdviser1: TbsSkinSpeedButton
        OnClick = trcknfvw1btnAddAdviser1Click
      end
      inherited mmo2: TbsSkinDBMemo
        DataField = 'fcgj_ms'
        DataSource = dsfcgj
      end
      inherited dblkcbbgxfs: TDBLookupComboBox
        DataField = 'fcgj_fs'
        DataSource = dsfcgj
        ListField = 'cs_mc'
        ListSource = ParametersDataModule.dsTrackMethod
      end
      inherited edt3: TbsSkinDBEdit
        OnClick = trcknfvw1edt3Click
        DataField = 'fcgj_gjr'
        DataSource = dsfcgj
      end
    end
    inherited bskngrpbx2: TbsSkinGroupBox
      Tag = 1
      inherited cbb1: TbsSkinDBComboBox
        Tag = 1
        Left = 93
        DataField = 'fcgj_txlx'
        DataSource = dsfcgj
      end
    end
    inherited btn1: TbsSkinButton
      Left = 307
      Top = 255
      TabOrder = 2
      OnClick = trcknfvw1btn1Click
    end
    inherited btn2: TbsSkinButton
      Left = 401
      Top = 256
      TabOrder = 3
      OnClick = trcknfvw1btn2Click
    end
  end
  object qryfcgj: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\HD' +
      'House\database\hdhouse.mdb;Mode=Share Deny None;Extended Propert' +
      'ies="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";J' +
      'et OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:' +
      'Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet ' +
      'OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password' +
      '="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Dat' +
      'abase=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLE' +
      'DB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        DataType = ftString
        Size = 4
        Value = 'null'
      end>
    SQL.Strings = (
      'select * from fcgj where fcgj_bh=id')
    Left = 449
    Top = 4
  end
  object dsfcgj: TDataSource
    DataSet = qryfcgj
    Left = 394
    Top = 1
  end
end
