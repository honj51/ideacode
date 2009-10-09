unit UParametersDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TParametersDataModule = class(TDataModule)
    dsHouseSource: TDataSource;
    qryHouseSource: TADOQuery;
    dsHouseStatus: TDataSource;
    qryHouseStatus: TADOQuery;
    dsHouseRegion: TDataSource;
    qryHouseRegion: TADOQuery;
    dsPropertyUsage: TDataSource;
    qryPropertyUsage: TADOQuery;
    dsPropertyClass: TDataSource;
    qryPropertyClass: TADOQuery;
    dsFitmentClass: TDataSource;
    qryFitmentClass: TADOQuery;
    dsHouseType: TDataSource;
    qryHouseType: TADOQuery;
    dsHouseFacilities: TDataSource;
    qryHouseFacilities: TADOQuery;
    dsCustomerStatus: TDataSource;
    qryCustomerStatus: TADOQuery;
    dsTrackMethod: TDataSource;
    qryTrackMethod: TADOQuery;
    dsPaymentMethod: TDataSource;
    qryPaymentMethod: TADOQuery;
    dsSalesCommissionDescription: TDataSource;
    qrySalesCommissionDescription: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParametersDataModule: TParametersDataModule;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
