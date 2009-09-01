unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinData, StdCtrls, bsSkinCtrls,
  ImgList, bsPngImageList, ComCtrls, bsSkinTabs, bsColorCtrls, bsDialogs,
  bsMessages, HouseListFrame, DB, ADODB, UCustomerAutoMatchView,
  UTrackInfoView, UDataOperateBarView, UDetailRequirementInfoView,
  UTrackRecordView;

type
  TformMain = class(TForm)
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht4: TbsSkinTabSheet;
    bskntbsht5: TbsSkinTabSheet;
    bsknmsg1: TbsSkinMessage;
    frmhslst1: TframeHouseList;
    btn8: TbsSkinButton;
    btn9: TbsSkinButton;
    btn10: TbsSkinButton;
    btn11: TbsSkinButton;
    btn12: TbsSkinButton;
    btn13: TbsSkinButton;
    btn14: TbsSkinButton;
    btn15: TbsSkinButton;
    btn16: TbsSkinButton;
    btn17: TbsSkinButton;
    btn18: TbsSkinButton;
    btn19: TbsSkinButton;
    btn20: TbsSkinButton;
    btn21: TbsSkinButton;
    btn22: TbsSkinButton;
    btn23: TbsSkinButton;
    btn24: TbsSkinButton;
    btn25: TbsSkinButton;
    bskntbsht3: TbsSkinTabSheet;
    btn26: TbsSkinButton;
    btn27: TbsSkinButton;
    btn28: TbsSkinButton;
    btn29: TbsSkinButton;
    btn30: TbsSkinButton;
    btn31: TbsSkinButton;
    procedure btn7Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn23Click(Sender: TObject);
    procedure btn25Click(Sender: TObject);
    procedure btn24Click(Sender: TObject);
    procedure btn22Click(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure btn28Click(Sender: TObject);
    procedure btn29Click(Sender: TObject);
    procedure btn27Click(Sender: TObject);
    procedure btn26Click(Sender: TObject);
    procedure btn30Click(Sender: TObject);
    procedure btn31Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    state:string;
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation
 uses UHDHouseDataModule,ULoginForm,UCompanyInfoSettingForm,UOperatePermissionSettingForm
 ,UEmployeeManageForm,UChangePasswordForm,UContractSampleSettingForm,UDatabaseMantainForm
 ,UDatabaseInitialForm,UParametersSettingForm,USystemOperationLogForm,UAboutForm,UHouseDetailsForm
 ,UHouseDealManageForm,UHouseTrackForm,UHousePosterForm,UHouseManageForm,UContractQueryForm
 ,UCustomerTrackForm,UContactRecordForm,UCustomeStatisticrQueryForm,UNotificationManageForm
 ,USalesCommissionDetailsForm,USalesCommissionSumForm,UStatisticForm,UTrackQueryForm;
{$R *.dfm}

procedure TformMain.btn7Click(Sender: TObject);
var i:Integer;
begin
  i := Self.bsknmsg1.MessageDlg2('真的要退出本系统吗？','提示信息', mtConfirmation, [mbYes,mbNo],0);
  if i = 6 then
    Application.Terminate;
end;

procedure TformMain.btn4Click(Sender: TObject);
begin
  inherited;
        //
        LoginForm.CloseState:=False;
     LoginForm.Show;
end;

procedure TformMain.btn10Click(Sender: TObject);
begin
      EmployeeManageForm.ShowModal;
end;

procedure TformMain.btn8Click(Sender: TObject);
begin
   CompanyInfoSettingForm.ParmId:='001';
    CompanyInfoSettingForm.ShowModal;
end;

procedure TformMain.btn12Click(Sender: TObject);
begin
  OperatePermissionSettingForm.ShowModal;
end;

procedure TformMain.btn14Click(Sender: TObject);
begin
     ChangePasswordForm.ShowModal;
end;

procedure TformMain.btn16Click(Sender: TObject);
begin
  ContractSampleSettingForm.ShowModal;
end;

procedure TformMain.btn9Click(Sender: TObject);
begin
         DatabaseMantainForm.ShowModal;
end;

procedure TformMain.btn11Click(Sender: TObject);
begin
  DatabaseInitialForm.ShowModal;
end;

procedure TformMain.btn13Click(Sender: TObject);
begin
     ParametersSettingForm.ShowModal;
end;

procedure TformMain.btn15Click(Sender: TObject);
begin
  SystemOperationLogForm.ShowModal;
end;

procedure TformMain.btn17Click(Sender: TObject);
begin
    AboutForm.ShowModal;
end;

procedure TformMain.btn1Click(Sender: TObject);
begin
  HouseDetailsForm.ShowModal;
end;

procedure TformMain.btn23Click(Sender: TObject);
begin
    HouseDealManageForm.ShowModal;
end;

procedure TformMain.btn25Click(Sender: TObject);
begin
   HouseTrackForm.ShowModal;
end;

procedure TformMain.btn24Click(Sender: TObject);
begin
   HousePosterForm.ShowModal;
end;

procedure TformMain.btn22Click(Sender: TObject);
begin
     HouseManageForm.ShowModal;
end;

procedure TformMain.btn19Click(Sender: TObject);
begin
   ContractQueryForm.ShowModal;
end;

procedure TformMain.btn20Click(Sender: TObject);
begin
   CustomerTrackForm.ShowModal;
end;

procedure TformMain.btn21Click(Sender: TObject);
begin
   ContactRecordForm.ShowModal;
end;

procedure TformMain.btn28Click(Sender: TObject);
begin
   HouseStatisticQueryForm.ShowModal;
end;

procedure TformMain.btn29Click(Sender: TObject);
begin
HouseStatisticQueryForm.ShowModal;
end;

procedure TformMain.btn27Click(Sender: TObject);
begin
NotificationManageForm.ShowModal;
end;

procedure TformMain.btn26Click(Sender: TObject);
begin
SalesCommissionDetailsForm.ShowModal;
end;

procedure TformMain.btn30Click(Sender: TObject);
begin
SalesCommissionSumForm.ShowModal;
end;

procedure TformMain.btn31Click(Sender: TObject);
begin
       StatisticForm.ShowModal;
end;

procedure TformMain.btn3Click(Sender: TObject);
begin
  TrackQueryForm.ShowModal;
end;


end.
