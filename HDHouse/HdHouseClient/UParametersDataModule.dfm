object ParametersDataModule: TParametersDataModule
  OldCreateOrder = False
  Left = 506
  Top = 166
  Height = 417
  Width = 459
  object dsHouseSource: TDataSource
    DataSet = qryHouseSource
    Left = 44
    Top = 22
  end
  object qryHouseSource: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'001'#39)
    Left = 131
    Top = 23
  end
  object dsHouseStatus: TDataSource
    DataSet = qryHouseStatus
    Left = 43
    Top = 82
  end
  object qryHouseStatus: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'002'#39)
    Left = 131
    Top = 83
  end
  object dsHouseRegion: TDataSource
    DataSet = qryHouseRegion
    Left = 35
    Top = 308
  end
  object qryHouseRegion: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'006'#39)
    Left = 130
    Top = 309
  end
  object dsPropertyUsage: TDataSource
    DataSet = qryPropertyUsage
    Left = 38
    Top = 143
  end
  object qryPropertyUsage: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'003'#39)
    Left = 127
    Top = 144
  end
  object dsPropertyClass: TDataSource
    DataSet = qryPropertyClass
    Left = 43
    Top = 199
  end
  object qryPropertyClass: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'004'#39)
    Left = 131
    Top = 200
  end
  object dsFitmentClass: TDataSource
    DataSet = qryFitmentClass
    Left = 43
    Top = 250
  end
  object qryFitmentClass: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'005'#39)
    Left = 133
    Top = 258
  end
  object dsHouseType: TDataSource
    DataSet = qryHouseType
    Left = 263
    Top = 28
  end
  object qryHouseType: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'007'#39)
    Left = 351
    Top = 29
  end
  object dsHouseFacilities: TDataSource
    DataSet = qryHouseFacilities
    Left = 265
    Top = 94
  end
  object qryHouseFacilities: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'008'#39)
    Left = 353
    Top = 95
  end
  object dsCustomerStatus: TDataSource
    DataSet = qryCustomerStatus
    Left = 270
    Top = 150
  end
  object qryCustomerStatus: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'009'#39)
    Left = 358
    Top = 151
  end
  object dsTrackMethod: TDataSource
    DataSet = qryTrackMethod
    Left = 270
    Top = 207
  end
  object qryTrackMethod: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'010'#39)
    Left = 358
    Top = 208
  end
  object dsPaymentMethod: TDataSource
    DataSet = qryPaymentMethod
    Left = 264
    Top = 259
  end
  object qryPaymentMethod: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'011'#39)
    Left = 352
    Top = 260
  end
  object dsSalesCommissionDescription: TDataSource
    DataSet = qrySalesCommissionDescription
    Left = 265
    Top = 304
  end
  object qrySalesCommissionDescription: TADOQuery
    Active = True
    Connection = HDHouseDataModule.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cs where cs_lxbh='#39'012'#39)
    Left = 353
    Top = 305
  end
end
