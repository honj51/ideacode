unit UHouseDealManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinTabs, bsSkinCtrls, UHouseListView, ImgList,
  bsPngImageList, UInHouseListView, UHouseSecureInfoView,
  UHouseDetailInfoView, UTrackRecordView, UDealHouseListView,
  UContractQueryFrame, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm, frxClass, frxExportXML, frxDBSet, Menus, bsSkinMenus;

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
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxXMLExport1: TfrxXMLExport;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    bsSkinPopupMenu2: TbsSkinPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure cntrctqryfrm1bsknchckrdbx2Click(Sender: TObject);
    procedure cntrctqryfrm1bsknchckrdbx1Click(Sender: TObject);
    procedure cntrctqryfrm1btn1Click(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure dlhslstvw1cbb1Change(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure dlhslstvw1btn1Click(Sender: TObject);
    procedure houseSearch;
    procedure ContractQuery;
    procedure FormCreate(Sender: TObject);
    procedure trckrcrdvw1btn1Click(Sender: TObject);
    procedure trckrcrdvw1btn2Click(Sender: TObject);
    procedure trckrcrdvw1btn3Click(Sender: TObject);
    procedure trckrcrdvw1bskndbgrd1DblClick(Sender: TObject);
    procedure dlhslstvw1btngaojibtn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dlhslstvw1bskndbgrd1DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    function tcxxCount(pream:string):Integer;
    procedure btn3Click(Sender: TObject);
    procedure trckrcrdvw1btn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest : string;
  end;

var
  HouseDealManageForm: THouseDealManageForm;

implementation
uses UHDHouseDataModule,UHouseTrackInfoForm,UHouseQueryForm,UContractInfo,UContractsFile,ShellAPI;
{$R *.dfm}
//  出售选择框
procedure THouseDealManageForm.cntrctqryfrm1bsknchckrdbx2Click(
  Sender: TObject);
begin
   self.ContractQuery;
  end;
//    出租选择框

procedure THouseDealManageForm.cntrctqryfrm1bsknchckrdbx1Click(
  Sender: TObject);
begin
  self.ContractQuery;
end;
  //查找信息
procedure THouseDealManageForm.cntrctqryfrm1btn1Click(Sender: TObject);
begin
  self.ContractQuery;
end;
   //只显示出租信息
procedure THouseDealManageForm.dlhslstvw1bsknchckrdbx1Click(
  Sender: TObject);
begin
    self.houseSearch;
end;
    //只显示出售信息
procedure THouseDealManageForm.dlhslstvw1bsknchckrdbx2Click(
  Sender: TObject);
begin
   self.houseSearch;
end;
//签约状态改变时
procedure THouseDealManageForm.dlhslstvw1cbb1Change(Sender: TObject);
begin
    self.houseSearch;
end;
     //只显示最近信息
procedure THouseDealManageForm.dlhslstvw1bsknchckrdbx3Click(
  Sender: TObject);
begin
    self.houseSearch;
end;
     ///开始查询
procedure THouseDealManageForm.dlhslstvw1btn1Click(Sender: TObject);
var strFilter,looktest : string;
begin
   self.houseSearch;
end;
////////////////////////////////////////////////////////////////////
 procedure THouseDealManageForm.houseSearch;
 var isChange:bool;
 begin
    HDHouseDataModule.qryfczy.Close;
    HDHouseDataModule.qryfczy.SQL.Clear;
    strFilter := 'select * from fczy ';
    ischange:=false;
    if(self.dlhslstvw1.cbb1.Text = '已签约') then
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
      strFilter := strFilter+'fczy_dqzt='+'''已经成交''';
    end
    else if(self.dlhslstvw1.cbb1.Text='未签约') then
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
      strFilter := strFilter+'fczy_dqzt='+'''正常状态''';
    end;
    ///文本
    if  trim(self.dlhslstvw1.edt1.Text) <>'' then
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
         looktest:=  self.dlhslstvw1.edt1.Text;
         strFilter := strFilter + ' ((fczy_bh like '+'''%'+looktest+'%'')'+' OR ';
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
         strFilter := strFilter + ' (fczy_sby like '+'''%'+looktest+'%''))';
    end;
    if(self.dlhslstvw1.bsknchckrdbx1.Checked)then
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
      strFilter := strFilter + 'fczy_zs='+'''出租''';
    end;
    if(self.dlhslstvw1.bsknchckrdbx2.Checked)then
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
       strFilter := strFilter + 'fczy_zs='+'''出售''';
    end;
    if(self.dlhslstvw1.bsknchckrdbx3.Checked)then
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
       strFilter := strFilter + ' fczy_djrq >= #'+FormatDateTime('yyyy-mm-dd',Now-StrToInt(self.dlhslstvw1.edt2.Text))+'#'  ;
    end;
    HDHouseDataModule.qryfczy.SQL.Add(strFilter) ;
    HDHouseDataModule.qryfczy.Open;
 end;
 //窗体创建时
 procedure THouseDealManageForm.FormCreate(Sender: TObject);
begin
    self.cntrctqryfrm1.edtBeginDate.Date:=Now-50;
    self.cntrctqryfrm1.edtEndDate.Date:=Now;
end;
 procedure THouseDealManageForm.ContractQuery;
 var isChange:bool;
 begin
    HDHouseDataModule.qryContractQuery.Close;
    HDHouseDataModule.qryContractQuery.SQL.Clear;
    strFilter := 'select * from cjxx ';
    ischange:=false;
   if(self.cntrctqryfrm1.edtBeginDate.Date <> 0)then
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
     if(self.cntrctqryfrm1.edtEndDate.Date <> 0)then
     begin
          strFilter := strFilter + ' cjxx_date >= #'+self.cntrctqryfrm1.edtBeginDate.Text+'#' +' AND ';
          strFilter := strFilter + ' cjxx_date <= #'+self.cntrctqryfrm1.edtEndDate.Text+'#';
     end
     else
     begin
          strFilter := strFilter + ' cjxx_date >= #'+self.cntrctqryfrm1.edtBeginDate.Text+'#' +' AND ';
          strFilter := strFilter + ' cjxx_date <= #'+DateTimeToStr(Now)+'#';
     end;
   end;
   if(Trim(self.cntrctqryfrm1.edtSearch.Text)<>'') then
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
       looktest:= self.cntrctqryfrm1.edtSearch.Text;
       strFilter := strFilter + ' ((cjxx_htbh like '+'''%'+looktest+'%'')'+' OR ';
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
       strFilter := strFilter + ' (cjxx_sby like '+'''%'+looktest+'%''))';
   end;
   if(self.cntrctqryfrm1.bsknchckrdbx1.Checked)then
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
      strFilter := strFilter + 'cjxx_czssqk='+'''出租''';
   end;
   if(self.cntrctqryfrm1.bsknchckrdbx2.Checked)then
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
      strFilter := strFilter + 'cjxx_czssqk='+'''出售''';
   end;
    HDHouseDataModule.qryContractQuery.SQL.Add(strFilter) ;
    HDHouseDataModule.qryContractQuery.Open;
 end;
 //添加
procedure THouseDealManageForm.trckrcrdvw1btn1Click(Sender: TObject);
var str:string;
var i:Integer;
begin
  inherited;
  Begin
    Try
        HouseTrackInfoForm.ParmEditorMode:= 'ADD';
        Randomize;//初始
        for i := 0 to 10 do
        begin
           str:= str+IntToStr(random(10));
        end;

        HouseTrackInfoForm.ParmId := str;
        HouseTrackInfoForm.fybh := HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString;
        HouseTrackInfoForm.ShowModal;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;
   //修改
procedure THouseDealManageForm.trckrcrdvw1btn2Click(Sender: TObject);
begin
 inherited;
 if not HDHouseDataModule.tblTrackRecords.IsEmpty THEN
  Begin
    Try
        HouseTrackInfoForm.ParmEditorMode:= 'EDIT';
        HouseTrackInfoForm.ParmId := HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_bh').AsString;
        HouseTrackInfoForm.ShowModal;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;
     //删除
procedure THouseDealManageForm.trckrcrdvw1btn3Click(Sender: TObject);
begin
   if not HDHouseDataModule.tblTrackRecords.IsEmpty then
    begin
      HDHouseDataModule.tblTrackRecords.Delete;
    end;
end;
   //选择查看
procedure THouseDealManageForm.trckrcrdvw1bskndbgrd1DblClick(
  Sender: TObject);
begin
 inherited;
 if not HDHouseDataModule.tblTrackRecords.IsEmpty THEN
  Begin
    Try
        HouseTrackInfoForm.ParmEditorMode:= 'EDIT';
        HouseTrackInfoForm.ParmId := HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_bh').AsString;
        HouseTrackInfoForm.ShowModal;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure THouseDealManageForm.dlhslstvw1btngaojibtn2Click(
  Sender: TObject);
begin
  HouseQueryForm.ShowModal;
  HDHouseDataModule.qryfczy.Close;
  HDHouseDataModule.qryfczy.SQL.Clear;
  HDHouseDataModule.qryfczy.SQL.Add(HouseQueryForm.strFilter) ;
  HDHouseDataModule.qryfczy.Open;
end;

procedure THouseDealManageForm.btn5Click(Sender: TObject);
begin
 if self.frxReport1.PrepareReport then
 begin
   self.frxReport1.ShowPreparedReport;
 end;
end;

procedure THouseDealManageForm.btn4Click(Sender: TObject);
begin
 if self.frxReport1.PrepareReport then
 begin
   self.frxReport1.Export(self.frxXMLExport1);
 end;
end;
  //数据选中修改签约
procedure THouseDealManageForm.dlhslstvw1bskndbgrd1DblClick(
  Sender: TObject);
begin
 if  self.tcxxCount(Trim(HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString))=0 then
 begin
   Application.MessageBox('此房源未签约', '警告', MB_OK + MB_ICONINFORMATION);
   Exit;
 end;
 inherited;
 if not HDHouseDataModule.qryfczy.IsEmpty then
  Begin
    Try
        ContractInfo.ParmEditorMode:= 'EDIT';
        ContractInfo.ParmId:= HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString;
        ContractInfo.ShowModal;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure THouseDealManageForm.btn1Click(Sender: TObject);
var pream:string;
var datecount:Integer;
begin

 if self.tcxxCount(Trim(HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString))>0 then
 begin
   Application.MessageBox('此房源已签约', '警告', MB_OK + MB_ICONINFORMATION);
   Exit;
 end;
 inherited;
 if not HDHouseDataModule.qryfczy.IsEmpty THEN
  Begin
    Try
        ContractInfo.ParmId :='';
        pream:='KH'+FormatDateTime('yyyymmdd',Now);
        ContractInfo.qry1.Filter:='( cjxx_htbh like ''%'+pream+'%'')';
        ContractInfo.qry1.Filtered:=true;
        datecount:=ContractInfo.qry1.Recordset.RecordCount+1;
        ContractInfo.qry1.Filtered :=false;
        ContractInfo.htbh:=pream + Format('%.4d', [datecount]);
        ContractInfo.fczy_bh:=HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString;
        ContractInfo.fczy_ygxm:= HDHouseDataModule.qryfczy.fieldbyname('fczy_yzxm').AsString;
        ContractInfo.fczy_wymc:= HDHouseDataModule.qryfczy.fieldbyname('fczy_wymc').AsString;
        ContractInfo.ParmEditorMode:= 'ADD';
        ContractInfo.ShowModal;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure THouseDealManageForm.btn2Click(Sender: TObject);
begin
    dlhslstvw1bskndbgrd1DblClick(Sender);
end;
function THouseDealManageForm.tcxxCount(pream:string):Integer;
var datecount:Integer;
begin
     ContractInfo.qry1.close;
     ContractInfo.qry1.Parameters.ParamByName('id').Value := pream;
     ContractInfo.qry1.open;
     datecount:=ContractInfo.qry1.Recordset.RecordCount;
     Result:=datecount;
     Exit;
end;
procedure THouseDealManageForm.btn3Click(Sender: TObject);
begin
  ContractsFile.ShowModal;
end;

procedure THouseDealManageForm.trckrcrdvw1btn4Click(Sender: TObject);
begin
 if self.frxReport2.PrepareReport then
 begin
   self.frxReport2.ShowPreparedReport;
 end;
end;
 //签约成交
procedure THouseDealManageForm.N1Click(Sender: TObject);
begin
   self.btn1Click(Sender);
end;
 //修改签约
procedure THouseDealManageForm.N2Click(Sender: TObject);
begin
   dlhslstvw1bskndbgrd1DblClick(Sender);
end;
  //合同文件
procedure THouseDealManageForm.N3Click(Sender: TObject);
begin
   btn3Click(Sender);
end;
// 增加
procedure THouseDealManageForm.N4Click(Sender: TObject);
begin
trckrcrdvw1btn1Click(Sender);
end;
 //修改
procedure THouseDealManageForm.N5Click(Sender: TObject);
begin
     trckrcrdvw1btn2Click(Sender);
end;
  //删除
procedure THouseDealManageForm.N6Click(Sender: TObject);
begin
  trckrcrdvw1btn3Click(Sender);
end;
   //打印
procedure THouseDealManageForm.N7Click(Sender: TObject);
begin
 trckrcrdvw1btn4Click(Sender);
end;
  //   打开合同
procedure THouseDealManageForm.N8Click(Sender: TObject);
begin
   btn6Click(Sender);
end;
   // 导出
procedure THouseDealManageForm.N9Click(Sender: TObject);
begin
btn4Click(Sender);
end;
  //打印

procedure THouseDealManageForm.N10Click(Sender: TObject);
begin
btn5Click(Sender);
end;
 //打开合同
procedure THouseDealManageForm.btn6Click(Sender: TObject);
 var filename:string;
begin
   if HDHouseDataModule.qryContractQuery.IsEmpty then
   begin
      filename:= GetCurrentDir +'\Contract\'+HDHouseDataModule.qryContractQuery.fieldbyname('cjxx_htbh').AsString+'.doc';
      ShellExecute(handle, 'Open', PChar(filename), nil, nil, SW_NORMAL);

   end;
end;

end.
