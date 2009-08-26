unit UHousePosterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinGrids, bsDBGrids, bsSkinCtrls, StdCtrls, Mask,
  bsSkinBoxCtrls, bsdbctrls, ComCtrls;

type
  THousePosterForm = class(TForm)
    bsknpnl1: TbsSkinPanel;
    tv1: TbsSkinTreeView;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    btn6: TbsSkinSpeedButton;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    btn4: TbsSkinButtonLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bvl1: TBevel;
    bskngrpbx1: TbsSkinGroupBox;
    bsknscrlbr3: TbsSkinScrollBar;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinDateEdit;
    bskndbgrd1: TbsSkinDBGrid;
    edt1: TbsSkinMaskEdit;
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HousePosterForm: THousePosterForm;

implementation
     uses UHDHouseDataModule;
{$R *.dfm}
  //只显示出租信息
procedure THousePosterForm.bsknchckrdbx1Click(Sender: TObject);
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
procedure THousePosterForm.bsknchckrdbx2Click(Sender: TObject);
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
  //房源查找
procedure THousePosterForm.btn4Click(Sender: TObject);
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
          strFilter := strFilter + ' fczy_djrq >= #'+self.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' fczy_djrq <= #'+self.edt3.Text+'#';
     end
     else
     begin
          strFilter := strFilter + ' fczy_djrq >= #'+self.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' fczy_djrq <= #'+DateTimeToStr(Now)+'#'+'';
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

   end;
   if(isgo)then
   begin
     HDHouseDataModule.qryfczy.Filter := strFilter;
     HDHouseDataModule.qryfczy.Filtered := true;
   end
   else
   begin
      HDHouseDataModule.qryfczy.Filtered := false;
   end;
end;

end.
