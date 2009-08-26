unit UHouseTrackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContractQueryFrame, UHouseSecureInfoView, UHouseDetailInfoView,
  UTrackRecordView, UHouseListView, UDealHouseListView, ComCtrls,
  bsSkinTabs, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls,
  StdCtrls, Mask;

type
  THouseTrackForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht3: TbsSkinTabSheet;
    trckrcrdvw1: TTrackRecordView;
    bskntbsht4: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    bskntbsht5: TbsSkinTabSheet;
    hscrnfvw1: THouseSecureInfoView;
    dlhslstvw1: TDealHouseListView;
    bsSkinStdLabel1: TbsSkinStdLabel;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinDateEdit;
    bsSkinStdLabel2: TbsSkinStdLabel;
    edt1: TbsSkinMaskEdit;
    btn1: TbsSkinButtonLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    procedure dlhslstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure dlhslstvw1btn1Click(Sender: TObject);
    procedure dlhslstvw1cbb1Change(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseTrackForm: THouseTrackForm;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}
   //添加 房源跟进信息
procedure THouseTrackForm.dlhslstvw1bsknchckrdbx3Click(Sender: TObject);
  var day:Integer;
  var date:string;
begin
       if(self.dlhslstvw1.bsknchckrdbx3.Checked)then
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
   //只显示出售信息
procedure THouseTrackForm.dlhslstvw1bsknchckrdbx2Click(Sender: TObject);
begin
    if(self.dlhslstvw1.bsknchckrdbx2.Checked)then
    begin
     HDHouseDataModule.qryfczy.Filter := 'fczy_zs='+'''出售''';
     HDHouseDataModule.qryfczy.Filtered := true;
    end
    else
    begin
      HDHouseDataModule.qryfczy.Filtered := false;
    end;
end;
     //只显示出租信息
procedure THouseTrackForm.dlhslstvw1btn1Click(Sender: TObject);
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
       strFilter := strFilter + ' (fczy_cz like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_czsm like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fczy_cs like '+'''%'+looktest+'%'')'+' OR ';
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

procedure THouseTrackForm.dlhslstvw1cbb1Change(Sender: TObject);
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

procedure THouseTrackForm.dlhslstvw1bsknchckrdbx1Click(Sender: TObject);
begin
    if(self.dlhslstvw1.bsknchckrdbx1.Checked)then
    begin
     HDHouseDataModule.qryfczy.Filter:= 'fczy_zs='+'''出租''';
     HDHouseDataModule.qryfczy.Filtered := true;
    end
    else
    begin
      HDHouseDataModule.qryfczy.Filtered := false;
    end;
end;
//跟进查询
procedure THouseTrackForm.btn1Click(Sender: TObject);
    var strFilter,looktest : string;  //cjxx_date
    var isgo:bool  ;
begin
  isgo:=false;
    strFilter:='';
   if(self.edt2.Date <> 0)then
   begin
     isgo:=true;
     if(self.edt3.Date <> 0)then
     begin      //' fczy_djrq >= #'+date+'#'  ;
          strFilter := strFilter + ' cjxx_date >= #'+self.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' cjxx_date <= #'+self.edt3.Text+'#';
     end
     else
     begin
          strFilter := strFilter + ' cjxx_date >= #'+self.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' cjxx_date <= #'+DateTimeToStr(Now)+'#';
     end;
   end;
   if(Trim(self.edt1.Text)<>'') then
   begin
     if(isgo)then
     begin
        strFilter := strFilter +' AND';
     end;
       isgo:=true;
       looktest:= self.edt1.Text;
       strFilter := strFilter + ' (fcgj_bh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_ms like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_fs like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_gjr like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_czy like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_fybh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_txyn like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_txlx like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_ygbh like '+'''%'+looktest+'%'')';
   end;
   if(isgo)then
   begin
     HDHouseDataModule.tblTrackQuery.Filter := strFilter;
     HDHouseDataModule.tblTrackQuery.Filtered := true;
   end
   else
   begin
      HDHouseDataModule.tblTrackQuery.Filtered := false;
   end;
end;
   //出租跟进
procedure THouseTrackForm.bsknchckrdbx1Click(Sender: TObject);
begin
//  if(TbsSkinCheckRadioBox(Sender).Checked)then
//    begin
//     HDHouseDataModule.tblContractQuery.Filter := 'cjxx_czssqk='+'''出租''';
//     HDHouseDataModule.tblContractQuery.Filtered := true;
//    end
//    else
//    begin
//      HDHouseDataModule.tblContractQuery.Filtered := false;
//    end;
end;
   //出售跟进
procedure THouseTrackForm.bsknchckrdbx2Click(Sender: TObject);
begin
//  if(TbsSkinCheckRadioBox(Sender).Checked)then
//    begin
//     HDHouseDataModule.tblContractQuery.Filter := 'cjxx_czssqk='+'''出租''';
//     HDHouseDataModule.tblContractQuery.Filtered := true;
//    end
//    else
//    begin
//      HDHouseDataModule.tblContractQuery.Filtered := false;
//    end;
end;

end.
