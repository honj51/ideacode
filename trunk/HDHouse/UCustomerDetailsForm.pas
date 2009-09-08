unit UCustomerDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ComCtrls, bsSkinTabs, bsdbctrls, StdCtrls, Mask,
  bsSkinBoxCtrls, DB, ADODB;

type
  TCustomerDetailsForm = class(TForm)
    bsSkinPanel1: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    edtCustomerName: TbsSkinDBEdit;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    edtZygw: TbsSkinDBEdit;
    bsknpgcntrlbsknpgcntr: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    lbl5: TbsSkinStdLabel;
    edtWymm: TbsSkinDBEdit;
    lbl6: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    edtJtwz: TbsSkinDBEdit;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    lbl13: TbsSkinStdLabel;
    edtSl1: TbsSkinDBEdit;
    edtSl2: TbsSkinDBEdit;
    lbl14: TbsSkinStdLabel;
    lbl15: TbsSkinStdLabel;
    edtMj1: TbsSkinDBEdit;
    edtMj2: TbsSkinDBEdit;
    lbl16: TbsSkinStdLabel;
    lbl17: TbsSkinStdLabel;
    lbl18: TbsSkinStdLabel;
    lbl19: TbsSkinStdLabel;
    lbl20: TbsSkinStdLabel;
    lbl21: TbsSkinStdLabel;
    edtJcss: TbsSkinDBEdit;
    lbl22: TbsSkinStdLabel;
    edtPtss: TbsSkinDBEdit;
    bsknpnl1: TbsSkinPanel;
    lbl24: TbsSkinStdLabel;
    lbl25: TbsSkinStdLabel;
    lbl26: TbsSkinStdLabel;
    lbl27: TbsSkinStdLabel;
    lbl28: TbsSkinStdLabel;
    bsknpnl2: TbsSkinPanel;
    mmoXxxx: TbsSkinDBMemo;
    bsSkinButton1: TbsSkinButton;
    btn1: TbsSkinButton;
    lbl23: TbsSkinStdLabel;
    lbl29: TbsSkinStdLabel;
    lbl30: TbsSkinStdLabel;
    edtC1: TbsSkinDBEdit;
    edtCj2: TbsSkinDBEdit;
    edtMaijia1: TbsSkinDBEdit;
    edtMaijia2: TbsSkinDBEdit;
    edtQzsm: TbsSkinDBEdit;
    edtQgsm: TbsSkinDBEdit;
    lbl7: TbsSkinStdLabel;
    edtKhxm: TbsSkinDBEdit;
    lbl31: TbsSkinStdLabel;
    edtLxdh: TbsSkinDBEdit;
    lbl32: TbsSkinStdLabel;
    edtLxsj: TbsSkinDBEdit;
    lbl33: TbsSkinStdLabel;
    edtLxdz: TbsSkinDBEdit;
    lbl34: TbsSkinStdLabel;
    mmoBzsm: TbsSkinDBMemo;
    bsknchckrdbxQz: TbsSkinCheckRadioBox;
    bsknchckrdbxQg: TbsSkinCheckRadioBox;
    qryKhzy: TADOQuery;
    dsKhzy: TDataSource;
    cbbWyyt: TbsSkinComboBox;
    cbbWylb: TbsSkinComboBox;
    cbbQy: TbsSkinComboBox;
    cbbZxcd: TbsSkinComboBox;
    cbbLx: TbsSkinComboBox;
    cbbKhly: TbsSkinComboBox;
    cbbDqzt: TbsSkinComboBox;
    edtJcnf1: TbsSkinDBNumericEdit;
    edtJcnf2: TbsSkinDBNumericEdit;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    ParmMode:string;  // 参数：编辑器模式(ADD:新增,EDIT:修改)
    ParmId:string;    //参数ID
    { Public declarations }
  end;

var
  CustomerDetailsForm: TCustomerDetailsForm;

implementation
 uses UHDHouseDataModule,UParametersDataModule,UCustomerManageForm,Math;
{$R *.dfm}

//窗体加载
procedure TCustomerDetailsForm.FormShow(Sender: TObject);
 begin
//客户来源绑定
    cbbKhly.Items.Clear;
    with ParametersDataModule.dsHouseSource.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbKhly.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbKhly.ItemIndex:=0;
    end;
//当前装状态绑定
    cbbDqzt.Items.Clear;
    with ParametersDataModule.dsCustomerStatus.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbDqzt.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbDqzt.ItemIndex:=0;
    end;

//物业用途绑定
    cbbWyyt.Items.Clear;
    cbbWyyt.Items.Add('不限');
    with ParametersDataModule.dsPropertyUsage.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbWyyt.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbWyyt.ItemIndex:=0;
    end;
//物业类别绑定
    cbbWylb.Items.Clear;
    cbbWylb.Items.Add('不限');
    with ParametersDataModule.dsPropertyClass.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbWylb.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbWylb.ItemIndex:=0;
    end;
//装修程度绑定
    cbbZxcd.Items.Clear;
    cbbZxcd.Items.Add('不限');
    with ParametersDataModule.dsFitmentClass .DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbZxcd.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbZxcd.ItemIndex:=0;
    end;
//所属区域绑定
    cbbQy.Items.Clear;
    cbbQy.Items.Add('不限');
    with ParametersDataModule.dsHouseRegion.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbQy.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbQy.ItemIndex:=0;
    end;
//房屋类型绑定
    cbbLx.Items.Clear;
    cbbLx.Items.Add('不限');
    with ParametersDataModule.dsHouseType.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbLx.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
      cbbLx.ItemIndex:=0;
    end;


//
if ParmMode='view' then
begin
   bsSkinButton1.Visible:=False;
end else
begin
   bsSkinButton1.Visible:=True;
end;

if ParmMode='add' then
begin
//添加
 with qryKhzy do
  begin
    Append;
    Randomize;
    // ParametersDataModule.qryTrackMethod.FindFirst;
    FieldByName('khzy_bh').Value :=  RandomRange(10000000,99999999);
    FieldByName('khzy_ws1').Value := 0;
    FieldByName('khzy_ws2').Value := 3;
    FieldByName('khzy_jzmj1').Value := 0;
    FieldByName('khzy_jzmj2').Value := 200;
    FieldByName('khzy_jcnf1').Value := 2000;
    FieldByName('khzy_zj1').Value := 0;
    FieldByName('khzy_zj2').Value := 0;
    FieldByName('khzy_sj1').Value := 0;
    FieldByName('khzy_sj2').Value := 0;
    FieldByName('khzy_wymc').Value := '不限';
    FieldByName('khzy_jtdz').Value := '不限';
    FieldByName('khzy_jcnf2').Value:=FormatDateTime('yyyy',Now);
  end;

end else
begin
//修改
qryKhzy.Close;
qryKhzy.Parameters.FindParam('id').Value:=ParmId;
qryKhzy.Open;
if qryKhzy.FieldByName('khzy_bh').Text <> '' then  begin
cbbKhly.ItemIndex:=cbbKhly.Items.IndexOf(qryKhzy.FieldByName('khzy_ly').Value);
cbbDqzt.ItemIndex:=cbbDqzt.Items.IndexOf(qryKhzy.FieldByName('khzy_dqzt').Value);
cbbWyyt.ItemIndex:=cbbWyyt.Items.IndexOf(qryKhzy.FieldByName('khzy_wyyt').Value);
cbbWylb.ItemIndex:=cbbWylb.Items.IndexOf(qryKhzy.FieldByName('khzy_wylb').Value);
cbbZxcd.ItemIndex:=cbbZxcd.Items.IndexOf(qryKhzy.FieldByName('khzy_zxcd').Value);
cbbQy.ItemIndex:=cbbQy.Items.IndexOf(qryKhzy.FieldByName('khzy_qy').Value);
cbbLx.ItemIndex:=cbbLx.Items.IndexOf(qryKhzy.FieldByName('khzy_fx').Value);
if qryKhzy.FieldByName('khzy_qz').Text ='Y' then
begin
  bsknchckrdbxQz.Checked:=True;
end;
if qryKhzy.FieldByName('khzy_qg').Text ='Y' then
begin
  bsknchckrdbxQg.Checked:=True;
end;
 end;
end;

//Parameters
end;

//取消
procedure TCustomerDetailsForm.btn1Click(Sender: TObject);
begin
   Close;
end;

//修改
procedure TCustomerDetailsForm.bsSkinButton1Click(Sender: TObject);
begin
//
if edtZygw.Text ='' then
begin
    Application.MessageBox('置业顾问不存在或不是本店员工', '提示', MB_OK+ MB_iconexclamation);
    Exit;
end;
if (bsknchckrdbxQz.Checked=False) and (bsknchckrdbxQg.Checked=False) then
begin
    Application.MessageBox('必须选择求租求购类型', '提示', MB_OK+ MB_iconexclamation);
    Exit;
end;
if edtKhxm.Text ='' then
begin
    Application.MessageBox('客户姓名不能为空', '提示', MB_OK+ MB_iconexclamation);
    bskntbsht2.Show;
    edtKhxm.SetFocus;
    Exit;
end;
if edtLxdh.Text ='' then
begin
    Application.MessageBox('联系电话和联系手机不能为空', '提示', MB_OK+ MB_iconexclamation);
    bskntbsht2.Show;
    edtLxdh.SetFocus;
    Exit;
end;
if edtLxsj.Text ='' then
begin
    Application.MessageBox('联系电话和联系手机不能为空', '提示', MB_OK+ MB_iconexclamation);
    bskntbsht2.Show;
    edtLxsj.SetFocus;
    Exit;
end;
if edtLxdz.Text ='' then
begin
    Application.MessageBox('联系地址不能为空', '提示', MB_OK+ MB_iconexclamation);
    bskntbsht2.Show;
    edtLxdz.SetFocus;
    Exit;
end;
qryKhzy.Edit;
qryKhzy.FieldByName('khzy_ly').Value:=cbbKhly.Text;
qryKhzy.FieldByName('khzy_dqzt').Value:=cbbDqzt.Text;
qryKhzy.FieldByName('khzy_wyyt').Value:=cbbWyyt.Text;
qryKhzy.FieldByName('khzy_wylb').Value:=cbbWylb.Text;
qryKhzy.FieldByName('khzy_zxcd').Value:=cbbZxcd.Text;
qryKhzy.FieldByName('khzy_qy').Value:=cbbQy.Text;
qryKhzy.FieldByName('khzy_fx').Value:=cbbLx.Text;
if bsknchckrdbxQz.Checked =True then
begin
  qryKhzy.FieldByName('khzy_qz').Value :='Y';
end else
begin
   qryKhzy.FieldByName('khzy_qz').Value :='N';
end;
if bsknchckrdbxQg.Checked =True then
begin
  qryKhzy.FieldByName('khzy_qg').Value :='Y';
end else
begin
  qryKhzy.FieldByName('khzy_qg').Value :='N';
end;

qryKhzy.Post;
//刷新用户管理数据

CustomerManageForm.qryKhzy.Close;
 CustomerManageForm.qryKhzy.Open;
Close;
end;

end.
