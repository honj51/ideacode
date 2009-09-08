unit UCompanyInfoSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls,
  BusinessSkinForm, DB, ADODB;

type
  TCompanyInfoSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    edtxtxx_mc: TbsSkinDBEdit;
    edtxtxx_dh: TbsSkinDBEdit;
    edtxtxx_yx: TbsSkinDBEdit;
    edtxtxx_wz: TbsSkinDBEdit;
    edtxtxx_dz: TbsSkinDBEdit;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpnl1: TbsSkinPanel;
    btn2: TbsSkinButton;
    btn1: TbsSkinButton;
    qry_xtxx: TADOQuery;
    ds_xtxx: TDataSource;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    function f_CheckValue:Boolean;  // 检查数据录入的有效性
    { Private declarations }
  public
    ParmId:string;
    { Public declarations }
  end;

var
  CompanyInfoSettingForm: TCompanyInfoSettingForm;

implementation
      uses UHDHouseDataModule;
{$R *.dfm}

{-------------------------------------------
            检查数据录入的有效性
-------------------------------------------}
function TCompanyInfoSettingForm.f_CheckValue:Boolean;
begin

  //
  if edtxtxx_mc.text='' then
  begin
    MessageBox(handle,'请输入名称！','提示',MB_OK+MB_ICONINFORMATION);
    edtxtxx_mc.SetFocus;
    Result :=False;
    Exit;
  end;
  //
  if edtxtxx_dh.Text='' then
  begin
    MessageBox(handle,'请输入电话！','提示',MB_OK+MB_ICONINFORMATION);
    edtxtxx_dh.SetFocus;
    Result :=False;
    Exit;
  end;
  //
    if edtxtxx_yx.Text='' then
    begin
      MessageBox(handle,'请输入邮箱！','提示',MB_OK+MB_ICONINFORMATION);
      edtxtxx_yx.SetFocus;
      Result :=False;
      Exit;
    end;
    //
    if edtxtxx_wz.Text='' then
    begin
      MessageBox(handle,'请输入网址！','提示',MB_OK+MB_ICONINFORMATION);
      edtxtxx_wz.SetFocus;
      Result :=False;
      Exit;
    end;
    //
    if edtxtxx_dz.Text='' then
    begin
      MessageBox(handle,'请输入佣金金额！','提示',MB_OK+MB_ICONINFORMATION);
      edtxtxx_dz.SetFocus;
      Result :=False;
      Exit;
    end;
  //
  result:=True;
end;

procedure TCompanyInfoSettingForm.btn2Click(Sender: TObject);
begin
  inherited;
CompanyInfoSettingForm.Close;
end;

procedure TCompanyInfoSettingForm.FormShow(Sender: TObject);
begin
     inherited;
        //
        with qry_xtxx do
        begin
          Close;
          Parameters.ParamByName('id').Value:=ParmId;
          Open;
        end;
end;

procedure TCompanyInfoSettingForm.btn1Click(Sender: TObject);
begin
     inherited;
        //
           if f_CheckValue()=False then  exit;

            // 数据保存处理
  HDHouseDataModule.con1.BeginTrans;
  try
    qry_xtxx.UpdateBatch;
    //
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
    MessageBox(handle,'数据保存失败！','警告',MB_OK);
    exit;
  end;
  
  MessageBox(handle,'数据保存成功！','提示',MB_OK+MB_ICONINFORMATION);
    Close;
end;

end.
