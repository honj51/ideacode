unit UHDHouseDataModule;

interface

uses
  SysUtils, Classes, ImgList, bsPngImageList, DB, ADODB, bsSkinData;

type
  THDHouseDataModule = class(TDataModule)
    ds1: TDataSource;
    bsSkinData1: TbsSkinData;
    con1: TADOConnection;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    qry1: TADOQuery;
    bspngmglstPngImglst64: TbsPngImageList;
    bspngmglst32: TbsPngImageList;
    qryCustomer: TADOQuery;
    dsCustomer: TDataSource;
    qryCustomerTrack: TADOQuery;
    dsCustomerTrack: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HDHouseDataModule: THDHouseDataModule;

implementation

{$R *.dfm}

end.
