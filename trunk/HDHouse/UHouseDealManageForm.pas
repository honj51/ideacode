unit UHouseDealManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinTabs, bsSkinCtrls, UHouseListView, ImgList,
  bsPngImageList, UInHouseListView, UHouseSecureInfoView,
  UHouseDetailInfoView, UTrackRecordView, UDealHouseListView,
  UContractQueryFrame, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls;

type
  THouseDealManageForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht3: TbsSkinTabSheet;
    bskntbsht4: TbsSkinTabSheet;
    bskntbsht5: TbsSkinTabSheet;
    trckrcrdvw1: TTrackRecordView;
    hsdtlnfvw1: THouseDetailInfoView;
    hscrnfvw1: THouseSecureInfoView;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    cntrctqryfrm1: TContractQueryFrame;
    dlhslstvw1: TDealHouseListView;
    procedure cntrctqryfrm1bsknchckrdbx2Click(Sender: TObject);
    procedure cntrctqryfrm1bsknchckrdbx1Click(Sender: TObject);
    procedure cntrctqryfrm1btn1Click(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure dlhslstvw1cbb1Change(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure dlhslstvw1btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseDealManageForm: THouseDealManageForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}
//  出售选择框
procedure THouseDealManageForm.cntrctqryfrm1bsknchckrdbx2Click(
  Sender: TObject);
begin
  if(TbsSkinCheckRadioBox(Sender).Checked)then
    begin
     HDHouseDataModule.tblContractQuery.Filter := 'cjxx_czssqk'+'='+'''出售''';
     HDHouseDataModule.tblContractQuery.Filtered := true;
    end
    else
    begin
      HDHouseDataModule.tblContractQuery.Filtered := false;
    end;

  end;
//    出租选择框

procedure THouseDealManageForm.cntrctqryfrm1bsknchckrdbx1Click(
  Sender: TObject);
begin
  if(TbsSkinCheckRadioBox(Sender).Checked)then
    begin
     HDHouseDataModule.tblContractQuery.Filter := 'cjxx_czssqk='+'''出租''';
     HDHouseDataModule.tblContractQuery.Filtered := true;
    end
    else
    begin
      HDHouseDataModule.tblContractQuery.Filtered := false;
    end;

  end;
  //查找信息
procedure THouseDealManageForm.cntrctqryfrm1btn1Click(Sender: TObject);
    var strFilter,looktest : string;  //cjxx_date
    var isgo:bool  ;
begin
  isgo:=false;
    strFilter:='';
   if(self.cntrctqryfrm1.edt2.Date <> 0)then
   begin
     isgo:=true;
     if(self.cntrctqryfrm1.edt3.Date <> 0)then
     begin      //' fczy_djrq >= #'+date+'#'  ;
          strFilter := strFilter + ' cjxx_date >= #'+self.cntrctqryfrm1.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' cjxx_date <= #'+self.cntrctqryfrm1.edt3.Text+'#';
     end
     else
     begin
          strFilter := strFilter + ' cjxx_date >= #'+self.cntrctqryfrm1.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' cjxx_date <= #'+DateTimeToStr(Now)+'#';
     end;
   end;
   if(Trim(self.cntrctqryfrm1.edt1.Text)<>'') then
   begin
     if(isgo)then
     begin
        strFilter := strFilter +' AND';
     end;
       isgo:=true;
       looktest:= self.cntrctqryfrm1.edt1.Text;
       strFilter := strFilter + ' (cjxx_htbh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_czxs like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_czssqk like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_fybh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_wymc like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_yzxm like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_khlx like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_khbh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_khxm like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_khxb like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_lxsj like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_lxdh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_sfzh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_lxdz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_fkfs like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_zygw like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_czy like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_fcyt like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_bz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_ygbh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (cjxx_sby like '+'''%'+looktest+'%'')';

   end;
   if(isgo)then
   begin
     HDHouseDataModule.tblContractQuery.Filter := strFilter;
     HDHouseDataModule.tblContractQuery.Filtered := true;
   end
   else
   begin
      HDHouseDataModule.tblContractQuery.Filtered := false;
   end;
end;
   //只显示出租信息
procedure THouseDealManageForm.dlhslstvw1bsknchckrdbx1Click(
  Sender: TObject);
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
    //只显示出售信息
procedure THouseDealManageForm.dlhslstvw1bsknchckrdbx2Click(
  Sender: TObject);
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
//签约状态改变时
procedure THouseDealManageForm.dlhslstvw1cbb1Change(Sender: TObject);
begin
     if(self.dlhslstvw1.cbb1.Text = '已签约') then
     begin
      HDHouseDataModule.qryfczy.Filter := 'fczy_dqzt='+'''已经成交''';
      HDHouseDataModule.qryfczy.Filtered := true;
     end
     else if(self.dlhslstvw1.cbb1.Text='未签约') then
     begin
      HDHouseDataModule.qryfczy.Filter := 'fczy_dqzt='+'''正常状态''';
      HDHouseDataModule.qryfczy.Filtered := true;
     end
     else
     begin
         HDHouseDataModule.qryfczy.Filtered := false;
     end;
end;
     //只显示最近信息
procedure THouseDealManageForm.dlhslstvw1bsknchckrdbx3Click(
  Sender: TObject);
  var day:Integer;
  var date:string;
begin
       if(TbsSkinCheckRadioBox(Sender).Checked)then
       begin
         day:=StrToInt(self.dlhslstvw1.edt2.Text);
         date:= DateTimeToStr(Now-day);
         HDHouseDataModule.qryfczy.Filter := ' fczy_djrq >= #'+date+'#'  ;
         HDHouseDataModule.qryfczy.Filtered := true;
       end
       else
       begin
         HDHouseDataModule.qryfczy.Filtered := false;
       end;
end;
     ///开始查询
procedure THouseDealManageForm.dlhslstvw1btn1Click(Sender: TObject);
var strFilter,looktest : string;
begin
  strFilter := '';
  if  trim(self.dlhslstvw1.edt1.Text) <>'' then
  begin
       looktest:=  self.dlhslstvw1.edt1.Text;
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
       HDHouseDataModule.qryfczy.Filter := strFilter;
       HDHouseDataModule.qryfczy.Filtered := true;
  end
  else
  begin
      HDHouseDataModule.qryfczy.Filtered := false;
  end;
 end;
end.
