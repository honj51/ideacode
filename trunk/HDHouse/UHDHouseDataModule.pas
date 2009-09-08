unit UHDHouseDataModule;

interface

uses
  Windows, Messages,SysUtils, Classes, ImgList, bsPngImageList, DB, ADODB, bsSkinData,
  bsMessages;

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
    dsContractQuery: TDataSource;
    dsTrackQuery: TDataSource;
    dsygxx: TDataSource;
    qryygxx: TADOQuery;
    bsknmsg_msg: TbsSkinMessage;
    qry_users: TADOQuery;
    ds_users: TDataSource;
    ds_Qx: TDataSource;
    qry_Qx: TADOQuery;
    qry_ygxx: TADOQuery;
    ds_ygxx: TDataSource;
    qry_del: TADOQuery;
    ds_cs: TDataSource;
    qry_cs: TADOQuery;
    qry_ht: TADOQuery;
    ds_ht: TDataSource;
    qry_dayjob: TADOQuery;
    ds_dayjob: TDataSource;
    ds_del: TDataSource;
    ds_autobak: TDataSource;
    qry_autobak: TADOQuery;
    qryContractQuery: TADOQuery;
    qryTrackQuery: TADOQuery;
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
