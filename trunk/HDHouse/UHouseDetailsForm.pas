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
    edtfczy_ws: TbsSkinDBEdit;
    edtfczy_lc: TbsSkinDBEdit;
    edtfczy_lczs: TbsSkinDBEdit;
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
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtfczy_fwly: TbsSkinDBEdit;
    btnAddAdviser: TbsSkinSpeedButton;
    dblkcbbfczy_qy1: TDBLookupComboBox;
    dblkcbbfczy_fwlx: TDBLookupComboBox;
    dblkcbbfczy_qy3: TDBLookupComboBox;
    dblkcbbfczy_qy: TDBLookupComboBox;
    dblkcbbfczy_wyyt: TDBLookupComboBox;
    dblkcbbfczy_wylx: TDBLookupComboBox;
    dblkcbbfczy_zxcd: TDBLookupComboBox;
    edtfczy_jcnf: TbsSkinDBEdit;
    edtfczy_kt: TbsSkinDBEdit;
    edtfczy_wc: TbsSkinDBEdit;
    edtfczy_yt: TbsSkinDBEdit;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    dblkcbbfczy_dqzt: TDBLookupComboBox;
    edt1: TbsSkinMaskEdit;
    bsSkinStdLabel8: TbsSkinStdLabel;
    bsSkinStdLabel9: TbsSkinStdLabel;
    bsSkinStdLabel6: TbsSkinStdLabel;
    edtfczy_yzxm: TbsSkinDBEdit;
    edtfczy_jtwz: TbsSkinDBEdit;
    mmofczy_yzxm: TbsSkinDBMemo;
    edtfczy_yzxm1: TbsSkinDBEdit;
    bsSkinStdLabel7: TbsSkinStdLabel;
    edtfczy_tel: TbsSkinDBEdit;
    bsSkinStdLabel10: TbsSkinStdLabel;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnAddAdviserClick(Sender: TObject);
    procedure btnAddAdviser1Click(Sender: TObject);
    procedure btnAddAdviser2Click(Sender: TObject);
    procedure edtfczy_fwlyClick(Sender: TObject);
    function Validate():Boolean;
  private
    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    ygbh:string;
    { Public declarations }
  end;

var
  HouseDetailsForm: THouseDetailsForm;

implementation
  uses UHDHouseDataModule,UParametersDataModule,URealtorListForm;
{$R *.dfm}
 //显示
procedure THouseDetailsForm.FormShow(Sender: TObject);
var pream:string;
var datecount:Integer;
begin
   self.edt1.ReadOnly:=true;
    with self.qry1 do
    begin
      close;
      Parameters.ParamByName('id').Value := ParmId;
      self.edt1.Text :=ParmId;
      open;
      if( ParmEditorMode = 'ADD') then
      begin
           self.edt1.ReadOnly :=false;
           pream:='FC'+FormatDateTime('yyyymmdd',Now);
           HDHouseDataModule.qryfczy.Filter:='(fczy_bh like '+'''%'+pream+'%'')';
           HDHouseDataModule.qryfczy.Filtered:=true;
           datecount:= HDHouseDataModule.qryfczy.Recordset.RecordCount+1;
           HDHouseDataModule.qryfczy.Filtered :=false;
           self.edt1.Text:=pream + Format('%.4d', [datecount] );
      end;
    end;
end;
  //保存 数据
procedure THouseDetailsForm.btn2Click(Sender: TObject);
var zs:string;
var checks:Boolean;
begin
  checks:=Validate();
  if not checks then
  begin
       Exit;
  end
  else
  begin
    if qry1.Modified then
    begin
      HDHouseDataModule.con1.BeginTrans;
      try
        self.qry1.FindField('fczy_hxjg').Value :=self.edtfczy_ws.Text+'室'+self.edtfczy_kt.Text+'厅'+self.edtfczy_wc.Text+'卫'+self.edtfczy_yt.Text+'阳';
        self.qry1.FindField('fczy_lccg').Value :=self.edtfczy_lczs.Text+'/'+self.edtfczy_lc.Text;
        self.qry1.FindField('fczy_zhrq').Value :=FormatDateTime('yyyy-mm-dd',Now);
        self.qry1.FindField('fczy_bh').Value := self.edt1.Text;
        if( ParmEditorMode = 'ADD') then
        begin
           self.qry1.FindField('fczy_djrq').Value := FormatDateTime('yyyy-mm-dd',Now);
           self.qry1.FindField('fczy_ygbh').Value :=ygbh ;
           self.qry1.FindField('fczy_yn').Value := false;
           if (self.bsSkinDBCheckRadioBox1.Checked and self.bsSkinDBCheckRadioBox2.Checked=false) then
           begin
               zs:='出租';
           end
           else if (self.bsSkinDBCheckRadioBox2.Checked and self.bsSkinDBCheckRadioBox1.Checked=false) then
           begin
               zs:='出售'
           end
           else if(self.bsSkinDBCheckRadioBox2.Checked and self.bsSkinDBCheckRadioBox1.Checked)  then
           begin
               zs:='租售'
           end;
            self.qry1.FindField('fczy_zs').Value :=zs;

           end;
        self.qry1.UpdateBatch;
        HDHouseDataMOdule.con1.CommitTrans;
        HDHouseDataMOdule.qryfczy.Close;
      except
        HDHouseDataMOdule.con1.RollbackTrans;
        MessageBox(handle,'数据保存失败！','警告',MB_OK);
        exit;
      end;
      end;
      MessageBox(handle,'数据保存成功！','提示',MB_OK+MB_ICONINFORMATION);
      HDHouseDataModule.qryfczy.Open;
       close;
   end;
end;

procedure THouseDetailsForm.btn3Click(Sender: TObject);
begin
  close;
end;
 //更改置业顾问
procedure THouseDetailsForm.btnAddAdviserClick(Sender: TObject);
var ygxm:string;
begin
   RealtorListForm.ygxm := self.edtfczy_fwly.Text;
   RealtorListForm.ShowModal;
   self.edtfczy_fwly.Text := RealtorListForm.ygxm;
   ygbh:=RealtorListForm.ygbh;
end;
  //基础设施
procedure THouseDetailsForm.btnAddAdviser1Click(Sender: TObject);
begin
       //
end;
 //配套设施
procedure THouseDetailsForm.btnAddAdviser2Click(Sender: TObject);
begin
     //
end;
procedure THouseDetailsForm.edtfczy_fwlyClick(Sender: TObject);
begin
   btnAddAdviserClick(sender);
end;
function THouseDetailsForm.Validate():Boolean;
begin
    if dblkcbbfczy_qy.Text='' then
    begin
      MessageBox(handle,'请选择房产来源','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_qy.SetFocus;
      Result:=False;
      Exit;
    end;
    if dblkcbbfczy_dqzt.Text='' then
    begin
      MessageBox(handle,'请选择当前状态','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_dqzt.SetFocus;
      Result :=False;
      Exit;
    end;
    if edtfczy_fwly.Text='' then
    begin
      MessageBox(handle,'置业顾问不能为空','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      edtfczy_fwly.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_wyyt.Text='' then
    begin
      MessageBox(handle,'请选择物业用途','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_wyyt.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_wylx.Text='' then
    begin
      MessageBox(handle,'请选择物业类型','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_wylx.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_zxcd.Text='' then
    begin
      MessageBox(handle,'请选择装修成度','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_zxcd.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_qy1.Text='' then
    begin
      MessageBox(handle,'请选择所处区域','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_qy1.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_fwlx.Text='' then
    begin
      MessageBox(handle,'请选择房型','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_fwlx.SetFocus;
      Result :=False;
      Exit;
    end;
    if edtfczy_jcnf.Text='' then
    begin
      MessageBox(handle,'年份不能为空','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      edtfczy_jcnf.SetFocus;
      Result :=False;
      Exit;
    end;
    if(bsSkinDBCheckRadioBox1.Checked<>true and bsSkinDBCheckRadioBox2.Checked<>true) then
    begin
      MessageBox(handle,'必须选择出租出售类型','提示',MB_OK+MB_ICONINFORMATION);
      bsSkinDBCheckRadioBox1.SetFocus;
      Result :=False;
      Exit;
    end;
    if self.edtfczy_yzxm.Text='' then
    begin
      MessageBox(handle,'业主姓名不能为空','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=1;
      edtfczy_yzxm.SetFocus;
      Result :=False;
      Exit;
    end;
    if (self.edtfczy_yzxm1.Text='') and (self.edtfczy_tel.Text='') then
    begin
      MessageBox(handle,'必须填写联系电话','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=1;
      edtfczy_yzxm1.SetFocus;
      Result :=False;
      Exit;
    end;
    if self.edtfczy_jtwz.Text='' then
    begin
      MessageBox(handle,'具体位置不能为空','提示',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=1;
      edtfczy_jtwz.SetFocus;
      Result :=False;
      Exit;
    end;
     result:=True;
end;
end.
