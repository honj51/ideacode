unit UHouseDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinExCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  ComCtrls, bsSkinTabs, BusinessSkinForm, bsdbctrls, bsSkinData, ImgList,
  bsPngImageList, DB, ADODB, UHouseSecureInfoView, DBCtrls;

type
  THouseDetailsForm = class(TForm)
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht12: TbsSkinTabSheet;
    bskntbshtEditsTabSheet: TbsSkinTabSheet;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    Label1: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bskndt1: TbsSkinData;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    edtfczy_wylb: TbsSkinDBEdit;
    edtfczy_jtdz: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
    edt6: TbsSkinDBEdit;
    edt7: TbsSkinDBEdit;
    edt8: TbsSkinDBEdit;
    edtfczy_ptss2: TbsSkinDBEdit;
    edtfczy_ptss1: TbsSkinDBEdit;
    lbl23: TLabel;
    btnAddAdviser1: TbsSkinSpeedButton;
    btnAddAdviser2: TbsSkinSpeedButton;
    edtfczy_mj: TbsSkinDBEdit;
    bsPngImageList1: TbsPngImageList;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    qry1: TADOQuery;
    dsfczyinfo: TDataSource;
    bskngrpbx1: TbsSkinGroupBox;
    bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox;
    bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox;
    lbl24: TLabel;
    lbl25: TLabel;
    edtfczy_sj: TbsSkinDBEdit;
    edtfczy_zj: TbsSkinDBEdit;
    lbl27: TLabel;
    lbl26: TLabel;
    lbl29: TLabel;
    lbl28: TLabel;
    edtfczy_cssm: TbsSkinDBEdit;
    edtfczy_czsm: TbsSkinDBEdit;
    bskngrpbx2: TbsSkinGroupBox;
    mmoHouseInfo: TbsSkinDBMemo;
    bsknpnl1: TbsSkinPanel;
    lbl1: TLabel;
    edtfczy_bh: TbsSkinDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt15: TbsSkinDBEdit;
    btnAddAdviser: TbsSkinSpeedButton;
    hscrnfvw1: THouseSecureInfoView;
    dblkcbbfczy_qy1: TDBLookupComboBox;
    dblkcbbfczy_qy2: TDBLookupComboBox;
    dblkcbbfczy_qy3: TDBLookupComboBox;
    dblkcbbfczy_qy: TDBLookupComboBox;
    dblkcbbfczy_qy4: TDBLookupComboBox;
    dblkcbbfczy_qy5: TDBLookupComboBox;
    dblkcbbfczy_qy6: TDBLookupComboBox;
    edtfczy_jcnf: TbsSkinDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    { Public declarations }
  end;

var
  HouseDetailsForm: THouseDetailsForm;

implementation
  uses UHDHouseDataModule;
{$R *.dfm}
 //显示
procedure THouseDetailsForm.FormShow(Sender: TObject);
begin
    with self.qry1 do
    begin
      close;
      Parameters.ParamByName('id').Value := ParmId;
      open;
      //
//      if ParmEditorMode = 'ADD' then
//      begin
//       {
//        append;
//        FieldByName('类型').AsString       :='出租';
//        FieldByName('创建用户').AsString       :=gs_login_username;
//        FieldByName('创建日期').AsString   :=FormatDateTime('yyyy-mm-dd',f_GetNow());
//        FieldByName('成交价格').AsString   :='0';
//        FieldByName('佣金金额').AsString   :='0';
//        FieldByName('状态').AsString   :='未处理';
//       POST;   }
//      end;
    end;
end;


end.
