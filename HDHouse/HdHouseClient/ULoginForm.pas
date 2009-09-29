unit ULoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm, DB, ADODB, RzBorder, RzStatus, RzPrgres, RzDBProg,
  ComCtrls, bsDialogs, bsSkinExCtrls;

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
    bsSkinAnimateGauge1: TbsSkinAnimateGauge;
    bsSkinGauge1: TbsSkinGauge;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CreateForms();
  private
    { Private declarations }
  public
    { Public declarations }
    CloseState: Boolean;
    login: boolean;
  end;

var
  LoginForm: TLoginForm;
  LoginNum: integer;

implementation
uses UHDHouseDataModule, Common, MainForm, CnDebug,
  UCompanyInfoSettingForm, UOperatePermissionSettingForm,
  UChangePasswordForm, UContractSampleSettingForm, UDatabaseMantainForm,
  UDatabaseInitialForm, UParameterSettingForm, USystemOperationLogForm,
  UAboutForm, UParametersSettingForm, UEmployeeManageForm,
  UOperatorInfoForm, UEmployeeInfoForm, UPermissionGroupSettingForm,
  UAddContractSampleForm, UHouseStatisticQueryForm, UNotificationInfoForm,
  UNotificationManageForm, USalesCommissionDetailsForm,
  USalesCommissionSumForm, UStatisticForm, UCustomerManageForm,
  UCustomerDetailsForm, UCustomerTrackForm, UContactRecordForm,
  UContactRecordDetailsForm, UTrackQueryForm, UHouseManageForm,
  UBaseFacilitiesForm, UOtherFacilitiesForm, URealtorListForm,
  UHouseDetailsForm, UContractInfo, UDivideIntoInfo, UCustomerListForm,
  UHouseDealManageForm, UHousePosterForm, UHouseTrackForm, UHouseQueryForm,
  UHouseTrackInfoForm, UContractsFile, UContractQueryForm,
  UCustomerQueryForm, UParametersDataModule;
{$R *.dfm}
procedure TLoginForm.CreateForms();
begin
  Application.CreateForm(TParametersDataModule, ParametersDataModule);
  Application.CreateForm(TformMain, formMain);
  CnDebugger.LogMsg('30%');
  bsSkinGauge1.Value := 30;
  Self.Refresh;
  Application.CreateForm(TCompanyInfoSettingForm, CompanyInfoSettingForm);
  Application.CreateForm(TOperatePermissionSettingForm, OperatePermissionSettingForm);
  Application.CreateForm(TOperatePermissionSettingForm, OperatePermissionSettingForm);
  Application.CreateForm(TChangePasswordForm, ChangePasswordForm);
  Application.CreateForm(TContractSampleSettingForm, ContractSampleSettingForm);
  Application.CreateForm(TDatabaseMantainForm, DatabaseMantainForm);
  Application.CreateForm(TDatabaseInitialForm, DatabaseInitialForm);
  Application.CreateForm(TParameterSettingForm, ParameterSettingForm);
  Application.CreateForm(TSystemOperationLogForm, SystemOperationLogForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TParametersSettingForm, ParametersSettingForm);
  Application.CreateForm(TEmployeeManageForm, EmployeeManageForm);
    CnDebugger.LogMsg('40%');
  bsSkinGauge1.Value := 40;
  Self.Refresh;
  Application.CreateForm(TOperatorInfoForm, OperatorInfoForm);
  Application.CreateForm(TEmployeeInfoForm, EmployeeInfoForm);
  Application.CreateForm(TPermissionGroupSettingForm, PermissionGroupSettingForm);
  Application.CreateForm(TAddContractSampleForm, AddContractSampleForm);
  Application.CreateForm(THouseStatisticQueryForm, HouseStatisticQueryForm);
  Application.CreateForm(TNotificationInfoForm, NotificationInfoForm);
  Application.CreateForm(TNotificationManageForm, NotificationManageForm);
  Application.CreateForm(TSalesCommissionDetailsForm, SalesCommissionDetailsForm);
    CnDebugger.LogMsg('50%');
  bsSkinGauge1.Value := 50;
  Self.Refresh;
  Application.CreateForm(TSalesCommissionSumForm, SalesCommissionSumForm);
  Application.CreateForm(TStatisticForm, StatisticForm);
  Application.CreateForm(TCustomerManageForm, CustomerManageForm);
  Application.CreateForm(TCustomerDetailsForm, CustomerDetailsForm);
  Application.CreateForm(TCustomerTrackForm, CustomerTrackForm);
  Application.CreateForm(TContactRecordForm, ContactRecordForm);
  Application.CreateForm(TContactRecordDetailsForm, ContactRecordDetailsForm);
  bsSkinGauge1.Value := 60;
  Self.Refresh;
    CnDebugger.LogMsg('60%');
  Application.CreateForm(TTrackQueryForm, TrackQueryForm);
  Application.CreateForm(THouseManageForm, HouseManageForm);
  Application.CreateForm(TBaseFacilitiesForm, BaseFacilitiesForm);
  Application.CreateForm(TOtherFacilitiesForm, OtherFacilitiesForm);
  Application.CreateForm(TRealtorListForm, RealtorListForm);
  CnDebugger.LogMsg('70%');
  bsSkinGauge1.Value := 70;
  Self.Refresh;
  Application.CreateForm(THouseDetailsForm, HouseDetailsForm);
  Application.CreateForm(TContractInfo, ContractInfo);
  Application.CreateForm(TDivideIntoInfo, DivideIntoInfo);
  Application.CreateForm(TCustomerListForm, CustomerListForm);
  Application.CreateForm(THouseDealManageForm, HouseDealManageForm);
  Application.CreateForm(THousePosterForm, HousePosterForm);
  bsSkinGauge1.Value := 80;
  Self.Refresh;
    CnDebugger.LogMsg('80%');
  Application.CreateForm(THouseTrackForm, HouseTrackForm);
  Application.CreateForm(THouseQueryForm, HouseQueryForm);
  Application.CreateForm(THouseTrackInfoForm, HouseTrackInfoForm);
  Application.CreateForm(TContractsFile, ContractsFile);
  Application.CreateForm(TContractQueryForm, ContractQueryForm);
  Application.CreateForm(TCustomerQueryForm, CustomerQueryForm);
  bsSkinGauge1.Value := 90;
  Self.Refresh;
    CnDebugger.LogMsg('90%');

end;  
procedure TLoginForm.btn2Click(Sender: TObject);
begin
  if CloseState = False then
  begin
    Self.Hide;
    Exit;
  end
  else
  begin
    Login := False;
    application.Terminate;
  end;

end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  inherited;
  Login := false;
  cbb1.Items.Clear;
  // 初始化用户选择列表
  with qry_login do
  begin
    try
      bsSkinAnimateGauge1.BringToFront;
      bsSkinAnimateGauge1.Visible := True;
      bsSkinAnimateGauge1.StartAnimation;
      Self.Text := '连接数据库...';
      Close;
      SQL.Clear;
      SQL.Add('SELECT user_xm From users');
      Open;
      while not eof do
      begin
        cbb1.Items.Add(FieldByName('user_xm').AsString);
        Next;
      end;
      close;
    except
      bsSkinAnimateGauge1.StopAnimation;
      bsSkinAnimateGauge1.Visible := False;
      Application.MessageBox('数据库连接失败，请检查连接配置和数据库服务是否启动。', '数据库连接失败', MB_OK + MB_ICONSTOP);
    end;
      bsSkinAnimateGauge1.StopAnimation;
      bsSkinAnimateGauge1.Visible := False;
  end;
  cbb1.ItemIndex := 0;

end;

procedure TLoginForm.btn1Click(Sender: TObject);
begin
  inherited;
  //录入检验
  if cbb1.text = '' then
  begin
    HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请输入登录用户名', '提示',
      nil, -1, [mbOk], 0);
    cbb1.SetFocus();
    exit;
  end;
  //登录验证
  with qry_login do
  begin
    bsSkinGauge1.BringToFront;
    bsSkinGauge1.Value := 0;
    bsSkinGauge1.Visible := True;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * From users Where user_xm=' + '''' + cbb1.Text + '''');
    Open;
    //用户有效性
    if not IsEmpty then
    begin
      //登录失败
      if Trim(bsknpswrdt1.Text) <> Trim(Fieldbyname('user_mm').AsString) then
      begin
        HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('口令错误，请修改！',
          '提示', nil, -1, [mbOk], 0);
        LoginNum := LoginNum + 1;
        if LoginNum = 3 then
        begin
          HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('非法用户！你无权使用本系统！', '提示', nil, -1, [mbOk], 0);
          application.Terminate;
        end;
        bsknpswrdt1.Text := '';
        bsknpswrdt1.SetFocus;
        exit;
      end
        //登录成功
      else
      begin
        //保存登录的用户信息
        gs_login_userid := fieldbyname('user_bh').asstring;
        gs_login_username := fieldbyname('user_xm').asstring;
        gs_login_userlevel := fieldbyname('user_xh').asstring;
        gs_login_Password := fieldbyname('user_mm').asstring;
        gs_login_qxid:= fieldbyname('user_qxbh').asstring;
        gt_login_time := now();
        Login := true;
        bsSkinGauge1.Value := 10;
        Self.Refresh;
        CreateForms;

        Self.Hide;
        //  formMain.state:='show';
        CnDebugger.LogMsg('dddd');
        formMain.Show;
      end;
    end
    else
    begin
      HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('指定的用户已被注销！你无权使用本系统！', '提示', nil, -1, [mbOk], 0);
      Login := False;
      self.close;
    end;
  end;
  bsknpswrdt1.Text := '';
end;

procedure TLoginForm.edt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    btn1.SetFocus;
end;

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //
  if CloseState = False then
  begin
    Self.Hide;
    Action := caNone;
  end

end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  inherited;
  //
  CloseState := True;
end;

end.

