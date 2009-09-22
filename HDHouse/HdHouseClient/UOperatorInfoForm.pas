unit UOperatorInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsdbctrls, StdCtrls, Mask, bsSkinCtrls,
  BusinessSkinForm, DB, ADODB, Grids, DBGrids, bsMessages;

type
  TOperatorInfoForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    edtuser_bh: TbsSkinDBEdit;
    edtuser_xm: TbsSkinDBEdit;
    cbbuser_ztmc: TbsSkinDBComboBox;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    ds_usersxxxx: TDataSource;
    qry_usersxxxx: TADOQuery;
    cbbuser_qxbh: TbsSkinDBLookupComboBox;
    ds1: TDataSource;
    tbl1: TADOTable;
    bsknpswrdt_mm2: TbsSkinPasswordEdit;
    bskndbpswrdtuser_mm: TbsSkinDBPasswordEdit;
    bsknmsg_msg: TbsSkinMessage;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function f_CheckValue:Boolean;
    { Private declarations }
  public
    ParmEditorMode:string;  // 参数：编辑器模式(ADD:新增,EDIT:修改)
    ParmId:string;
    { Public declarations }
  end;

var
  OperatorInfoForm: TOperatorInfoForm;

implementation
          uses UHDHouseDataModule;
{$R *.dfm}

function TOperatorInfoForm.f_CheckValue:Boolean;

begin

  //
  if edtuser_bh.text='' then
  begin
 HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入编号！', '提示', nil, -1, [mbOk], 0);
    edtuser_bh.SetFocus;
    Result :=False;
    Exit;
  end;
  //
  if edtuser_xm.text='' then
  begin
 HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入姓名！', '提示', nil, -1, [mbOk], 0);
    edtuser_xm.SetFocus;
    Result :=False;
    Exit;
  end;

  //
  if bskndbpswrdtuser_mm.text='' then
  begin
    HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入密码！', '提示', nil, -1, [mbOk], 0);
    bskndbpswrdtuser_mm.SetFocus;
    Result :=False;
    Exit;
  end;

   //
  if bsknpswrdt_mm2.text='' then
  begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入确认密码！', '提示', nil, -1, [mbOk], 0);
    bsknpswrdt_mm2.SetFocus;
    Result :=False;
    Exit;
  end;

    result :=True;
end;

procedure TOperatorInfoForm.btn2Click(Sender: TObject);
begin
  inherited;
  //
  Close;
end;

procedure TOperatorInfoForm.btn1Click(Sender: TObject);
begin
      inherited;
      //
      if f_CheckValue()=False then Exit;
               // 数据保存处理
               if Self.ParmEditorMode='ADD' then
               begin
                 qry_usersxxxx.Post;
               end;  

  HDHouseDataModule.con1.BeginTrans;
  try
    qry_usersxxxx.UpdateBatch;
    //
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
      HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存失败！', '提示', nil, -1, [mbOk], 0);
       exit;
  end;
  
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存成功！', '提示', nil, -1, [mbOk], 0);
        with HDHouseDataModule.qry_users do
    begin
       Close;
       Open;
    end;
    Close;

      
end;

procedure TOperatorInfoForm.FormShow(Sender: TObject);
begin
     inherited;
     //

     with qry_usersxxxx do
  begin
    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //
  if ParmEditorMode = 'ADD' then
    begin
     append;
     FieldByName('user_qxbh').Value :=001;
     FieldByName('user_ztmc').AsString := '可用';
     
    end;
  end;

  //操作按钮
  if ParmEditorMode='EDIT' then
  begin
    edtuser_bh.Enabled:=False;
    bsknpswrdt_mm2.Text:=qry_usersxxxx.FieldByName('user_mm').AsString;
  end
  else
  begin
     edtuser_bh.Enabled:=True;
  end;
end;

end.
