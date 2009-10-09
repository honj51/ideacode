unit UPermissionGroupSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  BusinessSkinForm, DB, ADODB, bsdbctrls, bsMessages, RzTreeVw;

type
  TPermissionGroupSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bsknpnl1: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    bsknpnl2: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    qry_qxxxxx: TADOQuery;
    ds_qxxxxx: TDataSource;
    edtQx_mc: TbsSkinDBEdit;
    rzchcktr1: TRzCheckTree;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function f_show(strings:string; index:Integer):Integer;
    function f_dataoperate(index:Integer):string;
    { Private declarations }
  public
          ParmEditorMode:string;  // 参数：编辑器模式(ADD:新增,EDIT:修改)
    ParmId:string;
    { Public declarations }
  end;

var
  PermissionGroupSettingForm: TPermissionGroupSettingForm;

implementation
      uses UHDHouseDataModule;
{$R *.dfm}

function TPermissionGroupSettingForm.f_dataoperate(index:Integer):string;
var str:string;
  i:Integer;
begin
      for i:=1 to rzchcktr1.Items[index].Count do
      begin
         if  rzchcktr1.Items[index].Item[i-1].StateIndex=2 then
         begin
             str:=str+'2';
         end
         else
         begin
             str:=str+'1';
         end;    

      end;  

        Result:=str;
end;
function TPermissionGroupSettingForm.f_show(strings:string;index:Integer):Integer;
var strlength,num,i:Integer;
var str:string;
begin
    strlength:=length(strings);
    num:=0;
    for i:=1 to strlength  do
    begin
    str:='';
       str:=copy(strings,i,1);
       if str='2' then
       begin
          rzchcktr1.Items[index].Item[i-1].StateIndex:=2;
          num:=num+1;
       end
       else
       begin
           rzchcktr1.Items[index].Item[i-1].StateIndex:=1;
           num:=num-1;
       end;

    end;
    if num =strlength then
    begin
         rzchcktr1.Items[index].StateIndex:=2;
    end
    else
    begin
      if num<0then
      begin
         rzchcktr1.Items[index].StateIndex:=1;
         Result:=strlength;
          Exit;
      end;
         rzchcktr1.Items[index].StateIndex:=3;
    end;
    Result:=strlength;
end;

procedure TPermissionGroupSettingForm.btn1Click(Sender: TObject);
begin
  inherited;

  if edtQx_mc.text='' then
  begin
   HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入编号！', '提示', nil, -1, [mbOk], 0);
       edtQx_mc.SetFocus;
    Exit;
  end  ;

        qry_qxxxxx.Edit;
        qry_qxxxxx.Fieldbyname('Qx_rcgl').AsString:=f_dataoperate(0);
         qry_qxxxxx.Fieldbyname('Qx_sfgl').AsString:= f_dataoperate(7);
         qry_qxxxxx.Fieldbyname('Qx_cx').AsString:=  f_dataoperate(12);
           qry_qxxxxx.Fieldbyname('Qx_sqfw').AsString:=f_dataoperate(17);
           qry_qxxxxx.Fieldbyname('Qx_xtsz').AsString:=f_dataoperate(24);

          qry_qxxxxx.Post;
      // 数据保存处理
  HDHouseDataModule.con1.BeginTrans;
  try
    qry_qxxxxx.UpdateBatch;
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

procedure TPermissionGroupSettingForm.btn2Click(Sender: TObject);
begin
     inherited;
     Close;
end;

procedure TPermissionGroupSettingForm.FormShow(Sender: TObject);
begin
    inherited;
    //
         //num:=0;
    with qry_qxxxxx do
  begin
    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //

  if ParmEditorMode = 'EDIT' then
    begin
          f_show(Fieldbyname('Qx_rcgl').AsString,0);
          f_show(Fieldbyname('Qx_sfgl').AsString,7);
          f_show(Fieldbyname('Qx_cx').AsString,12);
          f_show(Fieldbyname('Qx_sqfw').AsString,17);
          f_show(Fieldbyname('Qx_xtsz').AsString,24);
    end
    ELSE
    BEGIN
         
       Append;
     Randomize; //每次随机数就不一样
      Fieldbyname('Qx_bh').Value:=random(100000000);
          Fieldbyname('Qx_rcgl').AsString:=f_dataoperate(0);
         Fieldbyname('Qx_sfgl').AsString:= f_dataoperate(7);
         Fieldbyname('Qx_cx').AsString:=  f_dataoperate(12);
           Fieldbyname('Qx_sqfw').AsString:=f_dataoperate(17);
           Fieldbyname('Qx_xtsz').AsString:=f_dataoperate(24);
    
    end;
  end;
end;

procedure TPermissionGroupSettingForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     qry_qxxxxx.Close;
end;

procedure TPermissionGroupSettingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     edtQx_mc.Text:='';
      rzchcktr1.Items[0].StateIndex:=1;
      rzchcktr1.Items[7].StateIndex:=1;
      rzchcktr1.Items[12].StateIndex:=1;
      rzchcktr1.Items[17].StateIndex:=1;
      rzchcktr1.Items[24].StateIndex:=1;
end;

end.
