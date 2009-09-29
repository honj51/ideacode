unit UHousePosterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinGrids, bsDBGrids, bsSkinCtrls, StdCtrls, Mask,
  bsSkinBoxCtrls, bsdbctrls, ComCtrls, ImgList, DB, ADODB, BusinessSkinForm,
  frxClass, frxDBSet, frxExportXML, Menus, bsSkinMenus;

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
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxXMLExport1: TfrxXMLExport;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    bsSkinPopupMenu2: TbsSkinPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure Search;
    procedure FormShow(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest,noteText: string;
    { Public declarations }
  end;

var
  HousePosterForm: THousePosterForm;

implementation
     uses UHDHouseDataModule,UParametersDataModule,Common;
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
          if IsUsingAccess then
          begin
            strFilter := strFilter + ' fczy_djrq >= #'+self.edt2.Text+'#' +' AND ';
            strFilter := strFilter + ' fczy_djrq <= #'+self.edt3.Text+'#';
          end
          else
          begin
            strFilter := strFilter + ' fczy_djrq >= '+QuotedStr(self.edt2.Text) +' AND ';
            strFilter := strFilter + ' fczy_djrq <= '+QuotedStr(self.edt3.Text);
          end;

      end
      else
      begin
          if IsUsingAccess then
          begin
            strFilter := strFilter + ' fczy_djrq >= #'+self.edt2.Text+'#' +' AND ';
            strFilter := strFilter + ' fczy_djrq <= #'+FormatDateTime('yyyy-mm-dd',Now)+'#'+'';
          end
          else
          begin
            strFilter := strFilter + ' fczy_djrq >= '+QuotedStr(self.edt2.Text) +' AND ';
            strFilter := strFilter + ' fczy_djrq <= '+QuotedStr(FormatDateTime('yyyy-mm-dd',Now));
          end;
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
    self.tv1.autoexpand := true;   //展开
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
 //  导出
procedure THousePosterForm.N1Click(Sender: TObject);
begin
  btn6Click(Sender);
end;
   // 打印列表
procedure THousePosterForm.N2Click(Sender: TObject);
begin
 btn1Click(Sender);
end;
 //   小招贴单
procedure THousePosterForm.N3Click(Sender: TObject);
begin
 btn2Click(Sender);
end;
 //大招帖单（单个）
procedure THousePosterForm.N4Click(Sender: TObject);
begin
  N6Click(Sender);
end;
  //大招帖单（多个）
procedure THousePosterForm.N5Click(Sender: TObject);
begin
  N7Click(Sender);
end;
   //打印列表
procedure THousePosterForm.btn1Click(Sender: TObject);
begin
   //
end;
  // 小招帖单
procedure THousePosterForm.btn2Click(Sender: TObject);
begin
//
end;
 // 大招帖单（单个）
procedure THousePosterForm.N6Click(Sender: TObject);
begin
    if not(self.bsknchckrdbx1.Checked or self.bsknchckrdbx2.Checked)then
    begin
      Application.MessageBox('请选择打印出租/出售', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
    end;
    if self.bsknchckrdbx1.Checked then
    begin
        if self.frxReport2.PrepareReport then
        begin
           self.frxReport2.ShowPreparedReport;
        end;
    end
    else
    begin
        if self.frxReport1.PrepareReport then
        begin
           self.frxReport1.ShowPreparedReport;
        end;
    end;
end;
  //大招帖单（多个）
procedure THousePosterForm.N7Click(Sender: TObject);
begin
    if not(self.bsknchckrdbx1.Checked or self.bsknchckrdbx2.Checked)then
    begin
      Application.MessageBox('请选择打印出租/出售', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
    end;
    if self.bsknchckrdbx1.Checked then
    begin
        if self.frxReport2.PrepareReport then
        begin
           self.frxReport2.ShowPreparedReport;
        end;
    end
    else
    begin
        if self.frxReport1.PrepareReport then
        begin
           self.frxReport1.ShowPreparedReport;
        end;
    end;
end;

procedure THousePosterForm.btn3Click(Sender: TObject);
begin
  self.bsSkinPopupMenu2.Popup(Mouse.CursorPos.X-30,Mouse.CursorPos.Y+12);
end;

end.
