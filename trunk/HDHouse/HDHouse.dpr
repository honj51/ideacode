program HDHouse;

uses
  Forms,
  StdCtrls,
  MainForm in 'MainForm.pas' {TformMain},
  HouseListFrame in 'HouseListFrame.pas' {frameHouseList: TFrame},
  UHouseListView in 'UHouseListView.pas' {HouseListView: TFrame},
  UCustomerListView in 'UCustomerListView.pas' {CustomerListView: TFrame},
  UHouseDetailInfoView in 'UHouseDetailInfoView.pas' {HouseDetailInfoView: TFrame},
  UHouseSecureInfoView in 'UHouseSecureInfoView.pas' {HouseSecureInfoView: TFrame},
  UCustomerAutoMatchView in 'UCustomerAutoMatchView.pas' {CustomerAutoMatchView: TFrame},
  UCustomerSecureInfoView in 'UCustomerSecureInfoView.pas' {CustomerSecureInfoView: TFrame},
  UDataOperatoBarView in 'UDataOperatoBarView.pas' {DataOperateBarView: TFrame},
  UDetailRequirementInfoView in 'UDetailRequirementInfoView.pas' {DetailRequirementInfoView: TFrame},
  UEmployeeInfoFrame in 'UEmployeeInfoFrame.pas' {EmployeeInfoFrame: TFrame},
  UHouseAutoMatchView in 'UHouseAutoMatchView.pas' {HouseAutoMatchView: TFrame},
  UHouseQueryFrame in 'UHouseQueryFrame.pas' {HouseQueryFrame: TFrame},
  UTrackInfoView in 'UTrackInfoView.pas' {TrackInfoView: TFrame},
  UTrackQueryFrame in 'UTrackQueryFrame.pas' {TrackQueryFrame: TFrame},
  UTrackRecordView in 'UTrackRecordView.pas' {TrackRecordView: TFrame},
  UCompanyInfoSettingForm in 'UCompanyInfoSettingForm.pas' {CompanyInfoSettingForm},
  UEmployeeManageForm in 'UEmployeeManageForm.pas' {EmployeeManageForm},
  UOperatePermissionSettingForm in 'UOperatePermissionSettingForm.pas' {OperatePermissionSettingForm},
  UPermissionGroupSettingForm in 'UPermissionGroupSettingForm.pas' {PermissionGroupSettingForm},
  UOperatorInfoForm in 'UOperatorInfoForm.pas' {OperatorInfoForm},
  UChangePasswordForm in 'UChangePasswordForm.pas' {ChangePasswordForm},
  UContractSampleSettingForm in 'UContractSampleSettingForm.pas' {ContractSampleSettingForm},
  UAddContractSampleForm in 'UAddContractSampleForm.pas' {AddContractSampleForm},
  UDatabaseMantainForm in 'UDatabaseMantainForm.pas' {DatabaseMantainForm},
  UDatabaseInitialForm in 'UDatabaseInitialForm.pas' {DatabaseInitialForm},
  UParametersSettingForm in 'UParametersSettingForm.pas' {ParametersSettingForm},
  USystemOperationLogForm in 'USystemOperationLogForm.pas' {SystemOperationLogForm},
  UAboutForm in 'UAboutForm.pas' {AboutForm},
  ULoginForm in 'ULoginForm.pas' {LoginForm},
  UHDHouseDataModule in 'UHDHouseDataModule.pas' {HDHouseDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TEmployeeManageForm, EmployeeManageForm);
  Application.CreateForm(TSystemOperationLogForm, SystemOperationLogForm);
  Application.CreateForm(TContractSampleSettingForm, ContractSampleSettingForm);
  Application.CreateForm(TDatabaseMantainForm, DatabaseMantainForm);
  Application.CreateForm(TParametersSettingForm, ParametersSettingForm);
  Application.CreateForm(TAddContractSampleForm, AddContractSampleForm);
  Application.CreateForm(TChangePasswordForm, ChangePasswordForm);
  Application.CreateForm(TOperatorInfoForm, OperatorInfoForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TOperatePermissionSettingForm, OperatePermissionSettingForm);
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TCompanyInfoSettingForm, CompanyInfoSettingForm);
  Application.CreateForm(TPermissionGroupSettingForm, PermissionGroupSettingForm);
  Application.CreateForm(TDatabaseInitialForm, DatabaseInitialForm);
  Application.CreateForm(THDHouseDataModule, HDHouseDataModule);
  Application.Run;
end.
