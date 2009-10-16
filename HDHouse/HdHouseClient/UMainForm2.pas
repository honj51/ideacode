unit UMainForm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, Menus, ExtCtrls;

type
  TMainForm2 = class(TForm)
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknmnmnbr1: TbsSkinMainMenuBar;
    btn1: TbsSkinButtonsBar;
    bsknstsbr1: TbsSkinStatusBar;
    bsknmnmn2: TbsSkinMainMenu;
    F1: TMenuItem;
    H1: TMenuItem;
    C1: TMenuItem;
    T1: TMenuItem;
    T2: TMenuItem;
    N1: TMenuItem;
    W1: TMenuItem;
    H2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    bsknstspnl1: TbsSkinStatusPanel;
    bsknstspnl2: TbsSkinStatusPanel;
    bsknstspnl3: TbsSkinStatusPanel;
    bsknstspnl4: TbsSkinStatusPanel;
    E1: TMenuItem;
    N6: TMenuItem;
    L1: TMenuItem;
    R1: TMenuItem;
    T3: TMenuItem;
    A1: TMenuItem;
    C2: TMenuItem;
    R2: TMenuItem;
    T4: TMenuItem;
    K1: TMenuItem;
    D1: TMenuItem;
    T5: TMenuItem;
    C3: TMenuItem;
    R3: TMenuItem;
    D2: TMenuItem;
    W2: TMenuItem;
    O1: TMenuItem;
    D3: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    A2: TMenuItem;
    bskntlbr1: TbsSkinToolBar;
    btn8: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    procedure btn1Sections0Items0Click(Sender: TObject);
    procedure btn1Sections0Items1Click(Sender: TObject);
    procedure btn1Sections0Items2Click(Sender: TObject);
    procedure btn1Sections0Items3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Sections0Items6Click(Sender: TObject);
    procedure btn1Sections3Items3Click(Sender: TObject);
    procedure btn1Sections3Items4Click(Sender: TObject);
    procedure btn1Sections3Items2Click(Sender: TObject);
    procedure btn1Sections3Items5Click(Sender: TObject);
    procedure btn1Sections3Items1Click(Sender: TObject);
    procedure btn1Sections5Items1Click(Sender: TObject);
    procedure btn1Sections5Items2Click(Sender: TObject);
    procedure btn1Sections4Items0Click(Sender: TObject);
    procedure btn1Sections4Items3Click(Sender: TObject);
    procedure btn1Sections3Items6Click(Sender: TObject);
    procedure btn1Sections3Items7Click(Sender: TObject);
    procedure btn1Sections4Items4Click(Sender: TObject);
    procedure btn1Sections3Items8Click(Sender: TObject);
    procedure btn1Sections5Items5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm2: TMainForm2;

implementation
uses
  UHDHouseDataModule,UHouseManageForm, UHouseTrackForm,UCommentForm,UNewsForm,UPlanForm,
  UEmployeeManageForm,UContractQueryForm,UNotificationManageForm,UHouseDealManageForm,UBusinessQA,URecycleBin,UElectronicAttendance,UEstateDictionaryForm,UCityForm,UWorkSummaryForm,UMessageForm,UCustomerManageForm,UCustomerTrackForm,Common,UMortgageCalculatorForm;
{$R *.dfm}

procedure TMainForm2.btn1Sections0Items0Click(Sender: TObject);
begin
   if HouseManageForm = nil then
   begin
     HouseManageForm := THouseManageForm.Create(Self);
     bsbsnsknfrm1.MaximizeAll;
   end
   else
   begin
    HouseManageForm.BringToFront;
   end;                          
end;

procedure TMainForm2.btn1Sections0Items1Click(Sender: TObject);
begin
  if HouseTrackForm = nil then
  begin
    HouseTrackForm := THouseTrackForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    HouseTrackForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections0Items2Click(Sender: TObject);
begin
  if CustomerManageForm = nil then
  begin
    CustomerManageForm := TCustomerManageForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    CustomerManageForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections0Items3Click(Sender: TObject);
begin
   if CustomerTrackForm = nil then
  begin
    CustomerTrackForm := TCustomerTrackForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    CustomerTrackForm.BringToFront;
  end;
end;

procedure TMainForm2.FormShow(Sender: TObject);
begin
  bsknstspnl1.Caption := '就绪';
  bsknstspnl2.Caption := '';
  bsknstspnl3.Caption := '用户: '+gs_login_username;
  bsknstspnl4.Caption := '版本：1.1 门店联网版【南昌】';
end;

procedure TMainForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TMainForm2.btn1Sections0Items6Click(Sender: TObject);
begin
  if not Assigned(MortgageCalculatorForm) then
   begin
    MortgageCalculatorForm := TMortgageCalculatorForm.Create(Self);
  end;
  MortgageCalculatorForm.Show;

end;

procedure TMainForm2.btn1Sections3Items3Click(Sender: TObject);
begin
  if CommentForm = nil then
  begin
    CommentForm := TCommentForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    CommentForm.BringToFront;
  end;
end;


procedure TMainForm2.btn1Sections3Items4Click(Sender: TObject);
begin
        if NewsForm = nil then
  begin
    NewsForm := TNewsForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    NewsForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections3Items2Click(Sender: TObject);
begin
             if PlanForm = nil then
  begin
    PlanForm := TPlanForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    PlanForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections3Items5Click(Sender: TObject);
begin
         if MessageForm = nil then
  begin
    MessageForm := TMessageForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    MessageForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections3Items1Click(Sender: TObject);
begin
 if WorkSummaryForm = nil then
  begin
    WorkSummaryForm := TWorkSummaryForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    WorkSummaryForm.BringToFront;
  end;

end;

procedure TMainForm2.btn1Sections5Items1Click(Sender: TObject);
begin
      if CityForm = nil then
  begin
    CityForm := TCityForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    CityForm.BringToFront;
  end;
end;

    procedure TMainForm2.btn1Sections5Items2Click(Sender: TObject);
begin
       if EstateDictionaryForm = nil then
  begin
    EstateDictionaryForm := TEstateDictionaryForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    EstateDictionaryForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections4Items0Click(Sender: TObject);
begin
       if ElectronicAttendance = nil then
  begin
    ElectronicAttendance := TElectronicAttendance.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    ElectronicAttendance.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections4Items3Click(Sender: TObject);
begin
      if RecycleBin = nil then
  begin
    RecycleBin :=TRecycleBin.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    RecycleBin.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections3Items6Click(Sender: TObject);
begin
      if BusinessQA = nil then
  begin
    BusinessQA :=TBusinessQA.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    BusinessQA.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections3Items7Click(Sender: TObject);
begin
      if HouseDealManageForm = nil then
  begin
    HouseDealManageForm :=THouseDealManageForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    HouseDealManageForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections4Items4Click(Sender: TObject);
begin
      if NotificationManageForm = nil then
  begin
    NotificationManageForm :=TNotificationManageForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    NotificationManageForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections3Items8Click(Sender: TObject);
begin
       if ContractQueryForm = nil then
  begin
    ContractQueryForm :=TContractQueryForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    ContractQueryForm.BringToFront;
  end;
end;

procedure TMainForm2.btn1Sections5Items5Click(Sender: TObject);
begin
         if EmployeeManageForm = nil then
  begin
    EmployeeManageForm :=TEmployeeManageForm.Create(Self);
    bsbsnsknfrm1.MaximizeAll;
  end
  else
  begin
    EmployeeManageForm.BringToFront;
  end;
end;

end.
