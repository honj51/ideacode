unit UChangePasswordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm, DB, ADODB;

type
  TChangePasswordForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    bsknpnl1: TbsSkinPanel;
    btn2: TbsSkinButton;
    btn1: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry_update: TADOQuery;
    bsknpswrdt2: TbsSkinPasswordEdit;
    bsknpswrdt3: TbsSkinPasswordEdit;
    bsknpswrdt1: TbsSkinPasswordEdit;
    edt1: TbsSkinEdit;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function f_CheckValue:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePasswordForm: TChangePasswordForm;

implementation
   uses UHDHouseDataModule,Common;
{$R *.dfm}

function TChangePasswordForm.f_CheckValue:Boolean;
begin

  if bsknpswrdt1.text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入旧密码！', '提示', nil, -1, [mbOk], 0);
    bsknpswrdt1.SetFocus;
    Result :=False;
    Exit;
  end
  else if bsknpswrdt2.text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入新密码！', '提示', nil, -1, [mbOk], 0);
    bsknpswrdt2.SetFocus;
    Result :=False;
    Exit;
  end
  else if bsknpswrdt3.text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入确认密码！', '提示', nil, -1, [mbOk], 0);
    bsknpswrdt3.SetFocus;
    Result :=False;
    Exit;
  end
  else if bsknpswrdt2.text<>bsknpswrdt3.Text then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('新密码于确认密码不一致！', '提示', nil, -1, [mbOk], 0);
     bsknpswrdt2.Text:='';
     bsknpswrdt3.Text:='';
      bsknpswrdt2.SetFocus;
    Result :=False;
    Exit;
  end;
    Result :=True;
  end;

procedure TChangePasswordForm.btn2Click(Sender: TObject);
begin
  inherited;
      //
      Close;
end;

procedure TChangePasswordForm.btn1Click(Sender: TObject);
begin
  inherited;
      //

  if f_CheckValue()=False then Exit;
  With qry_update do
  begin
       close;
    SQL.Clear;
    SQL.Add('SELECT * From users Where user_xm='+''''+edt1.Text+'''');
    Open;
    //用户有效性
    IF not IsEmpty then
    begin
      //验证成功
      If Trim(bsknpswrdt1.Text)=Trim(Fieldbyname('user_mm').AsString) then
      begin
          SQL.Clear;
          SQL.Add('update users set user_mm='''+bsknpswrdt3.Text+''' where user_xm='''+edt1.Text+'''');
          ExecSQL;
      end
      else
      begin
         HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('您输入的旧密码不正确，请重新输入！', '提示', nil, -1, [mbOk], 0);
          Exit;
      end;
         HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('修改成功！', '提示', nil, -1, [mbOk], 0);
          bsknpswrdt1.Text:='';
         bsknpswrdt2.Text:='';
         bsknpswrdt3.Text:='';
         Self.Close;

    end;
  end;
 end;
procedure TChangePasswordForm.FormShow(Sender: TObject);
begin
    inherited;
      if gs_login_username='' then Exit;
      edt1.Text:=gs_login_username;
      edt1.Enabled:=False;
end;

end.
