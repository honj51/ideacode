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
  // ��ʼ���û�ѡ���б�
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
        //¼�����
  if cbb1.text='' then
  begin
   HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('�� ѡ �� �� �� ����', '��ʾ', nil, -1, [mbOk], 0);
    cbb1.SetFocus();
    exit;
  end;

  //��¼��֤
  with qry_login do
  begin
    close;
    SQL.Clear;
    SQL.Add('SELECT * From users Where user_xm='+''''+cbb1.Text+'''');
    Open;
    //�û���Ч��
    IF not IsEmpty then
    begin
      //��¼ʧ��
      If Trim(bsknpswrdt1.Text)  <> Trim(Fieldbyname('user_mm').AsString) then
      begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('����������޸ģ�', '��ʾ', nil, -1, [mbOk], 0);
       	LoginNum:=LoginNum+1;
	      if LoginNum=3 then
        begin
           HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('�Ƿ��û�������Ȩʹ�ñ�ϵͳ��', '��ʾ', nil, -1, [mbOk], 0);
          application.Terminate ;
        end;
        bsknpswrdt1.Text :='';
        bsknpswrdt1.SetFocus;
        exit;
      end
      //��¼�ɹ�
      else
      begin
        //�����¼���û���Ϣ
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
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ָ�����û��ѱ�ע��������Ȩʹ�ñ�ϵͳ��', '��ʾ', nil, -1, [mbOk], 0);
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
