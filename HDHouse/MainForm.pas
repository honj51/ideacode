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
    bskntbsht3: TbsSkinTabSheet;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation
 uses UHDHouseDataModule,ULoginForm,UCompanyInfoSettingForm,UOperatePermissionSettingForm
 ,UEmployeeManageForm,UChangePasswordForm,UContractSampleSettingForm,UDatabaseMantainForm
 ,UDatabaseInitialForm,UParametersSettingForm,USystemOperationLogForm,UAboutForm;
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
       LoginForm.ShowModal;
end;

procedure TformMain.btn10Click(Sender: TObject);
begin
      EmployeeManageForm.ShowModal;
end;

procedure TformMain.btn8Click(Sender: TObject);
begin
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

end.
