program HDHouse;

uses
  Forms,
  StdCtrls,
  MainForm in 'MainForm.pas' {TformMain},
  UCompanyInfoSettingForm in 'UCompanyInfoSettingForm.pas' {CompanyInfoSettingForm},
  ULoginForm in 'ULoginForm.pas' {LoginForm},
  UHDHouseDataModule in 'UHDHouseDataModule.pas' {HDHouseDataModule: TDataModule},
  Common in 'Common.pas',
  UDeletelogForm in 'UDeletelogForm.pas' {DeletelogForm},
  UOperatePermissionSettingForm in 'UOperatePermissionSettingForm.pas' {OperatePermissionSettingForm},
  UChangePasswordForm in 'UChangePasswordForm.pas' {ChangePasswordForm},
  UContractSampleSettingForm in 'UContractSampleSettingForm.pas' {ContractSampleSettingForm},
  UDatabaseMantainForm in 'UDatabaseMantainForm.pas' {DatabaseMantainForm},
  UDatabaseInitialForm in 'UDatabaseInitialForm.pas' {DatabaseInitialForm},
  UParameterSettingForm in 'UParameterSettingForm.pas' {ParameterSettingForm},
  USystemOperationLogForm in 'USystemOperationLogForm.pas' {SystemOperationLogForm},
  UAboutForm in 'UAboutForm.pas' {AboutForm},
  UParametersSettingForm in 'UParametersSettingForm.pas' {ParametersSettingForm},
  UDataOperateBarView in 'UDataOperateBarView.pas' {DataOperateBarView: TFrame},
  UEmployeeManageForm in 'UEmployeeManageForm.pas' {EmployeeManageForm},
  UOperatorInfoForm in 'UOperatorInfoForm.pas' {OperatorInfoForm},
  UEmployeeInfoForm in 'UEmployeeInfoForm.pas' {EmployeeInfoForm},
  UEmployeeInfoFrame in 'UEmployeeInfoFrame.pas' {EmployeeInfoFrame: TFrame},
  UPermissionGroupSettingForm in 'UPermissionGroupSettingForm.pas' {PermissionGroupSettingForm},
  UAddContractSampleForm in 'UAddContractSampleForm.pas' {AddContractSampleForm},
  UHouseStatisticQueryForm in 'UHouseStatisticQueryForm.pas' {HouseStatisticQueryForm},
  UCustomerSecureInfoView in 'UCustomerSecureInfoView.pas' {CustomerSecureInfoView: TFrame},
  UParametersDataModule in 'UParametersDataModule.pas' {ParametersDataModule: TDataModule},
  UHouseDetailInfoView in 'UHouseDetailInfoView.pas' {HouseDetailInfoView: TFrame},
  UNotificationInfoForm in 'UNotificationInfoForm.pas' {NotificationInfoForm},
  UNotificationManageForm in 'UNotificationManageForm.pas' {NotificationManageForm},
  USalesCommissionDetailsForm in 'USalesCommissionDetailsForm.pas' {SalesCommissionDetailsForm},
  USalesCommissionSumForm in 'USalesCommissionSumForm.pas' {SalesCommissionSumForm},
  UStatisticForm in 'UStatisticForm.pas' {StatisticForm},
  UHouseListView in 'UHouseListView.pas' {HouseListView: TFrame},
  UDetailRequirementInfoView in 'UDetailRequirementInfoView.pas' {DetailRequirementInfoView: TFrame},
  UCustomerListView in 'UCustomerListView.pas' {CustomerListView: TFrame},
  UCustomerManageForm in 'UCustomerManageForm.pas' {CustomerManageForm},
  UCustomerDetailsForm in 'UCustomerDetailsForm.pas' {CustomerDetailsForm},
  UContractQueryFrame in 'UContractQueryFrame.pas' {ContractQueryFrame: TFrame},
  UHouseSecureInfoView in 'UHouseSecureInfoView.pas' {HouseSecureInfoView: TFrame},
  UTrackRecordView in 'UTrackRecordView.pas' {TrackRecordView: TFrame},
  UCustomerTrackForm in 'UCustomerTrackForm.pas' {CustomerTrackForm},
  UCustomerTrackInfoView in 'UCustomerTrackInfoView.pas',
  UContactRecordForm in 'UContactRecordForm.pas' {ContactRecordForm},
  UContactRecordDetailsForm in 'UContactRecordDetailsForm.pas' {ContactRecordDetailsForm},
  UTrackQueryFrame in 'UTrackQueryFrame.pas' {TrackQueryFrame: TFrame},
  UTrackQueryForm in 'UTrackQueryForm.pas' {TrackQueryForm},
  UHouseAutoMatchView in 'UHouseAutoMatchView.pas' {HouseAutoMatchView: TFrame},
  UCustomerAutoMatchView in 'UCustomerAutoMatchView.pas' {CustomerAutoMatchView: TFrame},
  UHouseManageForm in 'UHouseManageForm.pas' {HouseManageForm},
  UBaseFacilitiesForm in 'UBaseFacilitiesForm.pas' {BaseFacilitiesForm},
  UOtherFacilitiesForm in 'UOtherFacilitiesForm.pas' {OtherFacilitiesForm},
  URealtorListForm in 'URealtorListForm.pas' {RealtorListForm},
  UHouseDetailsForm in 'UHouseDetailsForm.pas' {HouseDetailsForm},
  UDealHouseListView in 'UDealHouseListView.pas' {DealHouseListView: TFrame},
  UContractInfo in 'UContractInfo.pas' {ContractInfo},
  UDivideIntoInfo in 'UDivideIntoInfo.pas' {DivideIntoInfo},
  UCustomerListForm in 'UCustomerListForm.pas' {CustomerListForm},
  UHouseDealManageForm in 'UHouseDealManageForm.pas' {HouseDealManageForm},
  UHousePosterForm in 'UHousePosterForm.pas' {HousePosterForm},
  UTrackInfoView in 'UTrackInfoView.pas' {TrackInfoView: TFrame},
  UHouseTrackForm in 'UHouseTrackForm.pas' {HouseTrackForm},
  UHouseQueryFrame in 'UHouseQueryFrame.pas' {HouseQueryFrame: TFrame},
  UHouseQueryForm in 'UHouseQueryForm.pas' {HouseQueryForm},
  UHouseTrackInfoForm in 'UHouseTrackInfoForm.pas' {HouseTrackInfoForm},
  UContractsFile in 'UContractsFile.pas' {ContractsFile},
  UContractQueryForm in 'UContractQueryForm.pas' {ContractQueryForm},
  UCustomerQueryForm in 'UCustomerQueryForm.pas' {CustomerQueryForm},
  HouseListFrame in 'HouseListFrame.pas' {frameHouseList: TFrame},
  CnDebug in '..\..\..\Program Files\Borland\Delphi7\Experts\CnWizards\Source\CnDebug.pas',
  UformLock in 'UformLock.pas' {formLock},
  UMainForm2 in 'UMainForm2.pas' {MainForm2},
  UMortgageCalculatorForm in 'UMortgageCalculatorForm.pas' {MortgageCalculatorForm};

{$R *.res}

begin
  Application.Initialize;
  CnDebugger.LogMsg('Application Start');
  CnDebugger.LogEnter('窗体创建计时');
  Application.Title := '互动房产中介管理';
  Application.CreateForm(THDHouseDataModule, HDHouseDataModule);
  if CheckPassword then
    Application.CreateForm(TMainForm2, MainForm2);
  //Application.CreateForm(TLoginForm, LoginForm);
  //Application.CreateForm(TformLock, formLock);
  Application.Run;
end.
