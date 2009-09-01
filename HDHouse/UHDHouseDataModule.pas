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
    dsContractQuery: TDataSource;
    dsTrackQuery: TDataSource;
    dsygxx: TDataSource;
    qryygxx: TADOQuery;
    qryContractQuery: TADOQuery;
    qryTrackQuery: TADOQuery;
    qryfczyfczy_bh: TWideStringField;
    qryfczyfczy_yn: TBooleanField;
    qryfczyfczy_htbh: TWideStringField;
    qryfczyfczy_djrq: TDateTimeField;
    qryfczyfczy_sxrq: TDateTimeField;
    qryfczyfczy_zhrq: TDateTimeField;
    qryfczyfczy_fwly: TWideStringField;
    qryfczyfczy_dqzt: TWideStringField;
    qryfczyfczy_wymc: TWideStringField;
    qryfczyfczy_wyyt: TWideStringField;
    qryfczyfczy_wylb: TWideStringField;
    qryfczyfczy_zxcd: TWideStringField;
    qryfczyfczy_jtdz: TWideStringField;
    qryfczyfczy_qy: TWideStringField;
    qryfczyfczy_jcnf: TWideStringField;
    qryfczyfczy_ws: TIntegerField;
    qryfczyfczy_kt: TIntegerField;
    qryfczyfczy_wc: TIntegerField;
    qryfczyfczy_yt: TIntegerField;
    qryfczyfczy_hxjg: TWideStringField;
    qryfczyfczy_jzmj: TFloatField;
    qryfczyfczy_fx: TWideStringField;
    qryfczyfczy_lczs: TIntegerField;
    qryfczyfczy_lc: TIntegerField;
    qryfczyfczy_lccg: TWideStringField;
    qryfczyfczy_ptss1: TWideStringField;
    qryfczyfczy_ptss2: TWideStringField;
    qryfczyfczy_cz: TBooleanField;
    qryfczyfczy_zj: TFloatField;
    qryfczyfczy_czsm: TWideStringField;
    qryfczyfczy_cs: TBooleanField;
    qryfczyfczy_sj: TFloatField;
    qryfczyfczy_cssm: TWideStringField;
    qryfczyfczy_yzxm: TWideStringField;
    qryfczyfczy_dh: TWideStringField;
    qryfczyfczy_tel: TWideStringField;
    qryfczyfczy_jtwz: TWideStringField;
    qryfczyfczy_bmbz: TWideStringField;
    qryfczyfczy_xxbz: TMemoField;
    qryfczyfczy_czy: TWideStringField;
    qryfczyfczy_ly: TWideStringField;
    qryfczyfczy_zs: TWideStringField;
    qryfczyfczy_ygbh: TWideStringField;
    qryfczyfczy_sby: TWideStringField;
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
