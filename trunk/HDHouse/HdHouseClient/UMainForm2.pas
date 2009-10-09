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
    procedure btn1Sections0Items0Click(Sender: TObject);
    procedure btn1Sections0Items1Click(Sender: TObject);
    procedure btn1Sections0Items2Click(Sender: TObject);
    procedure btn1Sections0Items3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Sections0Items6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm2: TMainForm2;

implementation
uses
  UHDHouseDataModule,UHouseManageForm, UHouseTrackForm,
  UCustomerManageForm,UCustomerTrackForm,Common,UMortgageCalculatorForm;
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

end.
