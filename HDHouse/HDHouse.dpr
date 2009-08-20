program HDHouse;

uses
  Forms,
  MainForm in 'MainForm.pas' {TformMain},
  HouseListFrame in 'HouseListFrame.pas' {frameHouseList: TFrame},
  UHouseListView in 'UHouseListView.pas' {HouseListView: TFrame},
  UCustomerListView in 'UCustomerListView.pas' {CustomerListView: TFrame},
  UHouseDetailInfoView in 'UHouseDetailInfoView.pas' {HouseDetailInfoView: TFrame},
  UHouseSecureInfoView in 'UHouseSecureInfoView.pas' {HouseSecureInfoView: TFrame},
  UTest in 'UTest.pas' {test},
  UTest2 in 'UTest2.pas' {test2},
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
  UHouseManageForm in 'UHouseManageForm.pas' {HouseManageForm},
  UHouseDealManageForm in 'UHouseDealManageForm.pas' {HouseDealManageForm},
  UHouseTrackForm in 'UHouseTrackForm.pas' {HouseTrackForm},
  UHousePosterForm in 'UHousePosterForm.pas' {HousePosterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Ttest2, test2);
  Application.CreateForm(Ttest, test);
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(THouseManageForm, HouseManageForm);
  Application.CreateForm(THouseDealManageForm, HouseDealManageForm);
  Application.CreateForm(THouseTrackForm, HouseTrackForm);
  Application.CreateForm(THousePosterForm, HousePosterForm);
  Application.Run;
end.
