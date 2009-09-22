unit UParameterSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls,
  BusinessSkinForm, DB, ADODB;

type
  TParameterSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    edtcs_mc: TbsSkinDBEdit;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry_csxxxx: TADOQuery;
    ds_csxxxx: TDataSource;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    ParmEditorMode: string; // 参数：编辑器模式(ADD:新增,EDIT:修改)
    lxbh: string;
    bh: string;
    lxmc:string;
    { Public declarations }
  end;

var
  ParameterSettingForm: TParameterSettingForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

procedure TParameterSettingForm.btn2Click(Sender: TObject);
begin
  inherited;
  //
  qry_csxxxx.CancelBatch;
          qry_csxxxx.close;
  Close;
end;

procedure TParameterSettingForm.FormShow(Sender: TObject);
var
  num: string;
var
  num2: Int64;
begin
  inherited;
  //
  with qry_csxxxx do
  begin
    if ParmEditorMode <> 'ADD' then
    begin
      close;
      Filter := 'cs_lxbh =''' + lxbh + ''' and cs_bh=''' + bh + '''';
      //Filter:='cs_lxbh ='+lxbh+' and cs_bh='+bh;
      Filtered := True;
      open;
    end;
    if ParmEditorMode = 'ADD' then
    begin
      Randomize; //有了这个每次随机数就不一样
      num2 := random(100000000);
      num := IntToStr(num2);
      close;
      Filter := 'cs_lxbh =''' + lxbh + ''' and cs_bh=''' + num + '''';
      //Filter:='cs_lxbh ='+lxbh+' and cs_bh='+bh;
      Filtered := True;
      open;
      append;

      FieldByName('cs_bh').AsString := num;
      FieldByName('cs_lxbh').AsString := lxbh;
      FieldByName('cs_yhlx').AsString := 'N';
       FieldByName('cs_lxmc').AsString := lxmc;
      FieldByName('cs_date').AsString := FormatDateTime('yyyy-mm-dd', Now);

    end;

  end;
end;

procedure TParameterSettingForm.btn1Click(Sender: TObject);
begin
  inherited;

  if edtcs_mc.Text = '' then
  begin
    HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入名称！', '提示', nil,
      -1, [mbOk], 0);
    exit;
  end;
  // 数据保存处理

  qry_csxxxx.POST;
  HDHouseDataModule.con1.BeginTrans;
  try
    qry_csxxxx.UpdateBatch;
    //
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
    HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存失败！', '提示', nil,
      -1, [mbOk], 0);
    exit;
  end;

  HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存成功！', '提示', nil,
    -1, [mbOk], 0);
  with HDHouseDataModule.qry_cs do
  begin
    Close;
    Open;
  end;
  Close;
end;

procedure TParameterSettingForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
       inherited;
        //  数据已更改
      if qry_csxxxx.Modified then
      begin
        // 放弃修改
          btn2Click(nil);
      end;
end;

end.

