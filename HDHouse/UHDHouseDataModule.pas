unit UHDHouseDataModule;

interface

uses
  SysUtils, Classes, ImgList, bsPngImageList, DB, ADODB, bsSkinData;

type
  THDHouseDataModule = class(TDataModule)
    dsfczy: TDataSource;
    bsSkinData1: TbsSkinData;
    con1: TADOConnection;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    qryfczy: TADOQuery;
    bspngmglstPngImglst64: TbsPngImageList;
    bspngmglst32: TbsPngImageList;
    qryfcgj: TADOQuery;
    dsHouses: TDataSource;
    tblTrackRecords: TADOTable;
    tblHouses: TADOTable;
    dsTrackRecords: TDataSource;
    tblContractQuery: TADOTable;
    dsContractQuery: TDataSource;
    dsTrackQuery: TDataSource;
    tblTrackQuery: TADOTable;
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
