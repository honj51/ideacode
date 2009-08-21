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
  UHDHouseDataModule in 'UHDHouseDataModule.pas' {HDHouseDataModule: TDataModule},
  UCustomerDetailsForm in 'UCustomerDetailsForm.pas' {CustomerDetailsForm},
  UCustomerTrackForm in 'UCustomerTrackForm.pas' {CustomerTrackForm},
  UContractQueryForm in 'UContractQueryForm.pas',
  UContractQueryFrame in 'UContractQueryFrame.pas' {ContractQueryFrame: TFrame},
  UContactRecordForm in 'UContactRecordForm.pas' {ContactRecordForm},
  URealtorListForm in 'URealtorListForm.pas' {RealtorListForm},
  UOtherFacilitiesForm in 'UOtherFacilitiesForm.pas' {OtherFacilitiesForm},
  UHouseDetailsForm in 'UHouseDetailsForm.pas' {HouseDetailsForm},
  UBaseFacilitiesForm in 'UBaseFacilitiesForm.pas' {BaseFacilitiesForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOperatorInfoForm, OperatorInfoForm);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TEmployeeManageForm, EmployeeManageForm);
  Application.CreateForm(TSystemOperationLogForm, SystemOperationLogForm);
  Application.CreateForm(TContractSampleSettingForm, ContractSampleSettingForm);
  Application.CreateForm(TDatabaseMantainForm, DatabaseMantainForm);
  Application.CreateForm(TParametersSettingForm, ParametersSettingForm);
  Application.CreateForm(TAddContractSampleForm, AddContractSampleForm);
  Application.CreateForm(TChangePasswordForm, ChangePasswordForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TOperatePermissionSettingForm, OperatePermissionSettingForm);
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TCompanyInfoSettingForm, CompanyInfoSettingForm);
  Application.CreateForm(TPermissionGroupSettingForm, PermissionGroupSettingForm);
  Application.CreateForm(TDatabaseInitialForm, DatabaseInitialForm);
  Application.CreateForm(THDHouseDataModule, HDHouseDataModule);
  Application.CreateForm(TCustomerDetailsForm, CustomerDetailsForm);
  Application.CreateForm(TContractQueryForm, ContractQueryForm);
  Application.CreateForm(TCustomerTrackForm, CustomerTrackForm);
  Application.CreateForm(TContactRecordForm, ContactRecordForm);
  Application.CreateForm(TCustomerDetailsForm, CustomerDetailsForm);
  Application.CreateForm(TContactRecordForm, ContactRecordForm);
  Application.CreateForm(TRealtorListForm, RealtorListForm);
  Application.CreateForm(TOtherFacilitiesForm, OtherFacilitiesForm);
  Application.CreateForm(THouseDetailsForm, HouseDetailsForm);
  Application.CreateForm(TBaseFacilitiesForm, BaseFacilitiesForm);
  Application.Run;
end.
