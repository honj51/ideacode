unit UHouseManageForm;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinShellCtrls,
  bsColorCtrls, bsSkinCtrls, ComCtrls, bsSkinBoxCtrls, bsSkinGrids,
  StdCtrls, bsCalendar, bscalc, Mask, bsButtonGroup, bsCategoryButtons,
  bsSkinExCtrls, bsSkinTabs, UHouseSecureInfoView, UHouseDetailInfoView,
  UCustomerAutoMatchView, UDataOperateBarView;

type
  THouseManageForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    hscrnfvw1: THouseSecureInfoView;
    cstmrtmtchvw1: TCustomerAutoMatchView;
    hsdtlnfvw1: THouseDetailInfoView;
    hslstvw1: THouseListView;
    procedure hslstvw1btn1Click(Sender: TObject);
    procedure hslstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure hslstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure hslstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure hslstvw1bskndbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseManageForm: THouseManageForm;

implementation

uses UHDHouseDataModule, UHouseDetailsForm;

{$R *.dfm}
   //查询
procedure THouseManageForm.hslstvw1btn1Click(Sender: TObject);
var strFilter,looktest : string;
begin
  strFilter := '';
  if  trim(self.hslstvw1.edt1.Text) <>'' then
  begin
       looktest:= self.hslstvw1.edt1.Text;
       strFilter := strFilter + ' (fczy_bh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_yn like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_htbh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_fwly like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_dqzt like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_wymc like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_wyyt like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_wylb like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_zxcd like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_jtdz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_qy like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_jcnf like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_hxjg like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_fx like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_lccg like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_ptss1 like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_ptss2 like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_czsm like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_cssm like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_yzxm like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_dh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_tel like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_jtwz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_bmbz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_xxbz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_czy like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_ly like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_zs like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_ygbh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_sby like '+'''%'+looktest+'%'')';
       HDHouseDataModule.qryfczy.Filter :=  strFilter;
       HDHouseDataModule.qryfczy.Filtered := true;
  end
  else
  begin
      HDHouseDataModule.qryfczy.Filtered := false;
  end;
 end;
    //出租
procedure THouseManageForm.hslstvw1bsknchckrdbx2Click(Sender: TObject);
begin
    if(TbsSkinCheckRadioBox(Sender).Checked)then
    begin
     HDHouseDataModule.qryfczy.Filter := 'fczy_zs='+'''出售''';
     HDHouseDataModule.qryfczy.Filtered := true;
    end
    else
    begin
      HDHouseDataModule.qryfczy.Filtered := false;
    end;
end;
     //出售
procedure THouseManageForm.hslstvw1bsknchckrdbx1Click(Sender: TObject);
begin
    if(TbsSkinCheckRadioBox(Sender).Checked)then
    begin
     HDHouseDataModule.qryfczy.Filter:= 'fczy_zs='+'''出租''';
     HDHouseDataModule.qryfczy.Filtered := true;
    end
    else
    begin
      HDHouseDataModule.qryfczy.Filtered := false;
    end;
end;

procedure THouseManageForm.hslstvw1bsknchckrdbx3Click(Sender: TObject);
  var day:Integer;
  var date:string;
begin
       if(TbsSkinCheckRadioBox(Sender).Checked)then
       begin
         day:=StrToInt(self.hslstvw1.edt2.Text);
         date:= DateTimeToStr(Now-day);
         HDHouseDataModule.qryfczy.Filter := ' fczy_djrq >= #'+date+'#'  ;
         HDHouseDataModule.qryfczy.Filtered := true;
       end
       else
       begin
         HDHouseDataModule.qryfczy.Filtered := false;
       end;
end;
   //grid数据详情
procedure THouseManageForm.hslstvw1bskndbgrd1DblClick(Sender: TObject);
begin
  inherited;
 if not HDHouseDataModule.qryfczy.IsEmpty THEN
  Begin
    //HouseDetailsForm:=THouseDetailsForm.Create(self);
    Try
        HouseDetailsForm.ParmEditorMode:= 'EDIT';
        HouseDetailsForm.ParmId := HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString;
        HouseDetailsForm.ShowModal;
    Finally
        HouseDetailsForm.Free;
    End;
  end;

end;

end.
