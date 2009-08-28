unit UHDHouseDataModule;

interface

uses
  Windows, Messages,SysUtils, Classes, ImgList, bsPngImageList, DB, ADODB, bsSkinData;

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
    dsygxx: TDataSource;
    qryygxx: TADOQuery;
    procedure qryfczyAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HDHouseDataModule: THDHouseDataModule;

implementation

{$R *.dfm}

procedure THDHouseDataModule.qryfczyAfterScroll(DataSet: TDataSet);
begin

//MessageDlg(DataSet.FieldByName('房源编号').asstring,  mtWarning, [mbOK], 0);

//Application.MessageBox(DataSet.FieldByName('房源编号').asstring, '警告', MB_OK + MB_ICONWARNING);

end;

end.
