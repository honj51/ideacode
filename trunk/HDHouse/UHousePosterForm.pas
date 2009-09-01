unit UHousePosterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinGrids, bsDBGrids, bsSkinCtrls, StdCtrls, Mask,
  bsSkinBoxCtrls, bsdbctrls, ComCtrls, ImgList, DB, ADODB;

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
    ImageList: TImageList;
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure Search;
    procedure FormShow(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest,noteText: string;
    { Public declarations }
  end;

var
  HousePosterForm: THousePosterForm;

implementation
     uses UHDHouseDataModule,UParametersDataModule;
{$R *.dfm}
  //只显示出租信息
procedure THousePosterForm.bsknchckrdbx1Click(Sender: TObject);
begin
  self.Search;
end;
  //只显示出售信息
procedure THousePosterForm.bsknchckrdbx2Click(Sender: TObject);
begin
self.Search;
end;
  //房源查找
procedure THousePosterForm.btn4Click(Sender: TObject);
begin
    self.Search;
end;
procedure THousePosterForm.Search;
var isChange:bool;
begin
      HDHouseDataModule.qryfczy.Close;
      HDHouseDataModule.qryfczy.SQL.Clear;
      strFilter := 'select * from fczy ';
      ischange:=false;
      if not (noteText = '所有区域') then
      begin
         if ischange then
         begin
          strFilter := strFilter +' and ';
         end
         else
         begin
           strFilter := strFilter +' where ';
         end;
         ischange:=true;
         strFilter:=strFilter + 'fczy_qy ='''+noteText+'''';
      end;
      if(self.edt2.Date <> 0)then
      begin
         if ischange then
         begin
          strFilter := strFilter +' and ';
         end
         else
         begin
           strFilter := strFilter +' where ';
         end;
         ischange:=true;
      if(self.edt3.Date <> 0)then
      begin
          strFilter := strFilter + ' fczy_djrq >= #'+self.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' fczy_djrq <= #'+self.edt3.Text+'#';
      end
      else
      begin
          strFilter := strFilter + ' fczy_djrq >= #'+self.edt2.Text+'#' +' AND ';
          strFilter := strFilter + ' fczy_djrq <= #'+FormatDateTime('yyyy-mm-dd',Now)+'#'+'';
      end;
      end;
      if  trim(self.edt1.Text) <>'' then
      begin
         if ischange then
         begin
          strFilter := strFilter +' and ';
         end
         else
         begin
           strFilter := strFilter +' where ';
         end;
         ischange:=true;
         looktest:= self.edt1.Text;
         strFilter := strFilter + ' ((fczy_bh like '+'''%'+looktest+'%'')'+' OR ';
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
         strFilter := strFilter + ' (fczy_sby like '+'''%'+looktest+'%''))';
      end;
      if(self.bsknchckrdbx1.Checked)then
      begin
         if ischange then
         begin
          strFilter := strFilter +' and ';
         end
         else
         begin
           strFilter := strFilter +' where ';
         end;
         ischange:=true;
       strFilter := strFilter + ' fczy_zs='+'''出租''';
      end;

      if(self.bsknchckrdbx2.Checked)then
      begin
         if ischange then
         begin
          strFilter := strFilter +' and ';
         end
         else
         begin
           strFilter := strFilter +' where ';
         end;
         ischange:=true;
       strFilter := strFilter + ' fczy_zs='+'''出售''';
      end;
      HDHouseDataModule.qryfczy.SQL.Add(strFilter) ;
      HDHouseDataModule.qryfczy.Open;
   end;
procedure THousePosterForm.FormShow(Sender: TObject);
var may:TTreeNode;
begin
    self.edt2.Date:=Now-30;
    self.edt3.Date:=Now;
    self.tv1.Items.Clear;
    may:=TTreeNode.Create(self.tv1.Items);
    may:=self.tv1.Items.Add(nil,'所有区域');
    self.tv1.autoexpand := true;   //展开
    with ParametersDataModule.dsHouseRegion.DataSet do
    begin
      First;
      while not Eof do
      begin
        self.tv1.Items.AddChild(may,VarToStr(FieldValues['cs_mc']));
        Next;
      end;
    end;
end;

procedure THousePosterForm.tv1Change(Sender: TObject; Node: TTreeNode);
begin
noteText:=Node.Text;
self.Search;
end;
 //导出Excel
procedure THousePosterForm.btn6Click(Sender: TObject);
begin
  //  self.con1.Execute('select * into dsfczy in "D:\dbdemos.xls" "Excel 8.0;" FROM CUSTOMER');
end;

end.
