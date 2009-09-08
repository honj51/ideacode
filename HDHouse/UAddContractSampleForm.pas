unit UAddContractSampleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls,
  BusinessSkinForm, DB, ADODB, bsSkinShellCtrls;

type
  TAddContractSampleForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edtht_mc: TbsSkinDBEdit;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    qry_htxxxx: TADOQuery;
    ds_htxxxx: TDataSource;
    edtht_path: TbsSkinFileEdit;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function f_CheckValue:Boolean;
    { Private declarations }
  public
     ParmEditorMode:string;  // 参数：编辑器模式(ADD:新增,EDIT:修改)
    ParmId:string;
    { Public declarations }
  end;

var
  AddContractSampleForm: TAddContractSampleForm;

implementation
       uses UHDHouseDataModule;
{$R *.dfm}

function TAddContractSampleForm.f_CheckValue:Boolean;
begin
  //
  if edtht_mc.Text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('合同名称不能为空！', '提示', nil, -1, [mbOk], 0);
    edtht_mc.SetFocus;
    Result :=False;
    Exit;
  end;
     //
  if edtht_path.Text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('合同样本文件路径不能为空！', '提示', nil, -1, [mbOk], 0);
    edtht_path.SetFocus;
    Result :=False;
    Exit;
  end;
  Result :=True;
  end;
procedure TAddContractSampleForm.btn2Click(Sender: TObject);
begin
inherited;
    //
         qry_htxxxx.CancelBatch;
          qry_htxxxx.close;
          Close;
end;
procedure TAddContractSampleForm.btn1Click(Sender: TObject);
begin
  inherited;
//
   if f_CheckValue()=False then  exit;
    // 数据保存处理
        if ParmEditorMode='EDIT' then
    begin
        qry_htxxxx.Edit;
    end;

    qry_htxxxx.fieldbyname('ht_path').AsString:=edtht_path.Text;
    if ParmEditorMode='ADD' then
    begin
          qry_htxxxx.Post;
    end;

  HDHouseDataModule.con1.BeginTrans;
  try
    qry_htxxxx.UpdateBatch;
    //
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存失败！', '提示', nil, -1, [mbOk], 0);
    exit;
  end;
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存成功！', '提示', nil, -1, [mbOk], 0);
    Close;

end;

procedure TAddContractSampleForm.FormShow(Sender: TObject);
begin
 inherited;
    //
             
  with qry_htxxxx do
  begin
    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //
      edtht_path.Text:=fieldbyname('ht_path').AsString;
  if ParmEditorMode = 'ADD' then
    begin
     append;
      Randomize; //每次随机数就不一样
      FieldByName('ht_bh').Value:=random(100000000);

    end;
  end;

 { //操作按钮
  if ParmEditorMode='EDIT' then
  begin
    edtygxx_bh.Enabled:=False;
  end
  else
  begin
     edtygxx_bh.Enabled:=True;
  end; }
end;

procedure TAddContractSampleForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    inherited;
      //  数据已更改
      if qry_htxxxx.Modified then
      begin
        // 放弃修改
          btn2Click(nil);
      end;
end;

end.
