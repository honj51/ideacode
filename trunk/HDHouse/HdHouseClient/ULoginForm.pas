unit ULoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm, DB, ADODB;

type
  TLoginForm = class(TForm)
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry_login: TADOQuery;
    cbb1: TbsSkinComboBox;
    bsknpswrdt1: TbsSkinPasswordEdit;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CloseState:Boolean;
    login:boolean;
  end;

var
  LoginForm: TLoginForm;
  LoginNum  :integer;
  
implementation
uses UHDHouseDataModule,Common,MainForm;
{$R *.dfm}


procedure TLoginForm.btn2Click(Sender: TObject);
begin
      if CloseState=False then
          begin
                Self.Hide;
                Exit;
          end
          else
          begin
             Login :=False;
              application.Terminate ;
          end;


end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
       inherited;
        //
  Login:=false;
             cbb1.Items.Clear;
  // 初始化用户选择列表
  with qry_login do
  begin
    close;
    SQL.Clear;
    SQL.Add('SELECT user_xm From users');
    Open;
    while not eof do
    begin
      cbb1.Items.Add(FieldByName('user_xm').AsString);
      Next;
    end;
    close;
  end;
  cbb1.ItemIndex:= 0;

end;

procedure TLoginForm.btn1Click(Sender: TObject);
begin
       inherited;
        //录入检验
  if cbb1.text='' then
  begin
   HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请 选 择 用 户 名！', '提示', nil, -1, [mbOk], 0);
    cbb1.SetFocus();
    exit;
  end;

  //登录验证
  with qry_login do
  begin
    close;
    SQL.Clear;
    SQL.Add('SELECT * From users Where user_xm='+''''+cbb1.Text+'''');
    Open;
    //用户有效性
    IF not IsEmpty then
    begin
      //登录失败
      If Trim(bsknpswrdt1.Text)  <> Trim(Fieldbyname('user_mm').AsString) then
      begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('口令错误，请修改！', '提示', nil, -1, [mbOk], 0);
       	LoginNum:=LoginNum+1;
	      if LoginNum=3 then
        begin
           HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('非法用户！你无权使用本系统！', '提示', nil, -1, [mbOk], 0);
          application.Terminate ;
        end;
        bsknpswrdt1.Text :='';
        bsknpswrdt1.SetFocus;
        exit;
      end
      //登录成功
      else
      begin
        //保存登录的用户信息
        gs_login_userid     :=fieldbyname('user_bh').asstring;
        gs_login_username   :=fieldbyname('user_xm').asstring;
        gs_login_userlevel  :=fieldbyname('user_xh').asstring;
        gs_login_Password   :=fieldbyname('user_mm').asstring;
        gt_login_time:=now();
        Login:=true;

          Self.Hide;
            //  formMain.state:='show';
               formMain.Show;
      end;
    end
    else
    begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('指定的用户已被注销！你无权使用本系统！', '提示', nil, -1, [mbOk], 0);
        Login:=False;
      self.close;
    end;
  end;
  bsknpswrdt1.Text:='';
end;

procedure TLoginForm.edt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN then
     btn1.SetFocus ;
end;

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      inherited;
      //
      if CloseState=False  then
      begin
        Self.Hide;
        Action :=caNone;
      end
     
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  inherited;
      //
      CloseState:=True;
end;

end.
