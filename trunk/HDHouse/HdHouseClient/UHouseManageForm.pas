unit UHouseManageForm;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinShellCtrls,
  bsColorCtrls, bsSkinCtrls, ComCtrls, bsSkinBoxCtrls, bsSkinGrids,
  StdCtrls, bsCalendar, bscalc, Mask, bsButtonGroup, bsCategoryButtons,
  bsSkinExCtrls, bsSkinTabs, UHouseSecureInfoView, UHouseDetailInfoView,
  UCustomerAutoMatchView, UDataOperateBarView, DB, ADODB, BusinessSkinForm,
  frxClass, frxDBSet, frxExportXLS, frxExportXML, Menus, bsSkinMenus,
  bsMessages;

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
    dskhzy: TDataSource;
    qryfczy: TADOQuery;
    dsfczy: TDataSource;
    qrykhzy: TADOQuery;
    bsbsnsknfrm2: TbsBusinessSkinForm;
    frxReportfczy: TfrxReport;
    frxXLSExportfczy: TfrxXLSExport;
    frxDBDatasetfczy: TfrxDBDataset;
    frxXMLExport1: TfrxXMLExport;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    bsSkinPopupMenu2: TbsSkinPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    bsknmsg1: TbsSkinMessage;
    procedure hslstvw1btn1Click(Sender: TObject);
    procedure hslstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure hslstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure hslstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure hslstvw1bskndbgrd1DblClick(Sender: TObject);
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure qryfczyAfterScroll(DataSet: TDataSet);
    procedure Search;
    procedure hslstvw1btngaojibtn2Click(Sender: TObject);
    procedure dtprtbrvw1btn5Click(Sender: TObject);
    procedure dtprtbrvw1btn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    strFilter,looktest : string;
    isno:string;
  end;

var
  HouseManageForm: THouseManageForm;

implementation

uses UHDHouseDataModule, UHouseDetailsForm,UHouseQueryForm,Common;

{$R *.dfm}
   //查询
procedure THouseManageForm.hslstvw1btn1Click(Sender: TObject);
begin
  self.Search;
 end;
    //出租
procedure THouseManageForm.hslstvw1bsknchckrdbx2Click(Sender: TObject);
begin
  self.Search;
end;
     //出售
procedure THouseManageForm.hslstvw1bsknchckrdbx1Click(Sender: TObject);
begin
  self.Search;
end;

procedure THouseManageForm.hslstvw1bsknchckrdbx3Click(Sender: TObject);
begin
  self.Search;
end;
   //grid数据详情
procedure THouseManageForm.hslstvw1bskndbgrd1DblClick(Sender: TObject);
begin
  inherited;
 if not qryfczy.IsEmpty THEN
  Begin
    Try
        HouseDetailsForm.ParmEditorMode:= 'EDIT';
        HouseDetailsForm.ParmId := qryfczy.fieldbyname('fczy_bh').AsString;
        HouseDetailsForm.ShowModal;
        self.qryfczy.Close; //更新一下数据
        self.qryfczy.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;

end;
  //     修改信息
procedure THouseManageForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
 inherited;
 if not qryfczy.IsEmpty then
  Begin
    Try
        HouseDetailsForm.ParmEditorMode:= 'EDIT';
        HouseDetailsForm.ParmId := qryfczy.fieldbyname('fczy_bh').AsString;
        HouseDetailsForm.ShowModal;
        qryfczy.Close;
        qryfczy.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;
     //删除
procedure THouseManageForm.dtprtbrvw1btn3Click(Sender: TObject);
begin
  inherited;
  if not qryfczy.IsEmpty THEN
  Begin
    Try
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后无法恢复，确定删除吗？', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
      end;
      qryfczy.Delete;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;
      //添加
procedure THouseManageForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
  inherited;
 if not qryfczy.IsEmpty THEN
  Begin
    Try
        HouseDetailsForm.ParmId :='';
        HouseDetailsForm.ParmEditorMode:= 'ADD';
        HouseDetailsForm.ShowModal;
        self.qryfczy.Close;
        self.qryfczy.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

  //数据改变
procedure THouseManageForm.qryfczyAfterScroll(DataSet: TDataSet);
var strFilter: string;
begin
 if isno <>'' then
 begin
   strFilter:='';
   self.qrykhzy.Close;
   self.qrykhzy.SQL.Clear;
   if dataset.FieldByName('fczy_dqzt').AsString<>'已经成交' then
   begin
     strFilter := 'select * from khzy where ';
     strFilter := strFilter + ' (khzy_qy ='''+dataset.FieldByName('fczy_qy').AsString+''' or ';
     strfilter:=strfilter+'khzy_qy=''不限'') and ' ;
     strfilter:=strfilter+'khzy_dqzt<>''已经成交'' and ' ;
     strFilter := strFilter + ' (khzy_wyyt ='''+dataset.FieldByName('fczy_wyyt').AsString+''')';
     self.qrykhzy.SQL.Add(strfilter);
     self.qrykhzy.Open;
     self.qrykhzy.Active:=true;
   end;

 end;
    isno:='not' ;
  end;
   procedure THouseManageForm.Search;
   var date:string;
   var isChange:bool;
   begin
      self.qryfczy.Close;
      self.qryfczy.SQL.Clear;
      strFilter := 'select * from fczy ';
      ischange:=false;
      if  trim(self.hslstvw1.edt1.Text) <>'' then
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
         looktest:= self.hslstvw1.edt1.Text;
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

      if(self.hslstvw1.bsknchckrdbx1.Checked)then
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

      if(self.hslstvw1.bsknchckrdbx2.Checked)then
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

      if(self.hslstvw1.bsknchckrdbx3.Checked)then
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
         date:= FormatDateTime('yyyy-mm-dd',Now-StrToInt(self.hslstvw1.edt2.Text));
          if IsUsingAccess then
          begin
              strFilter := strFilter + ' fczy_djrq >= #'+date+'#'  ;
          end
          else
          begin
              strFilter := strFilter + ' fczy_djrq >='+QuotedStr(date);
          end;

      end;
      self.qryfczy.SQL.Add(strFilter) ;
      self.qryfczy.Open;
   end;
   //高级查询
procedure THouseManageForm.hslstvw1btngaojibtn2Click(Sender: TObject);
begin
  HouseQueryForm.ShowModal;
  self.qryfczy.Close;
  self.qryfczy.SQL.Clear;
  self.qryfczy.SQL.Add(HouseQueryForm.strFilter) ;
  self.qryfczy.Open;

end;
    //打印
procedure THouseManageForm.dtprtbrvw1btn5Click(Sender: TObject);
begin
  if self.frxReportfczy.PrepareReport then
  begin
     self.frxReportfczy.ShowPreparedReport;
  end;
  //
end;

procedure THouseManageForm.dtprtbrvw1btn4Click(Sender: TObject);
begin
 if self.frxReportfczy.PrepareScript then
 begin
    self.frxReportfczy.Export(self.frxXMLExport1) ;
 end;
end;
    //添加
procedure THouseManageForm.N1Click(Sender: TObject);
begin
  dtprtbrvw1btn1Click(Sender);
end;
  //修改
procedure THouseManageForm.N2Click(Sender: TObject);
begin
dtprtbrvw1btn2Click(Sender);
end;
 //   删除
procedure THouseManageForm.N3Click(Sender: TObject);
begin
 dtprtbrvw1btn3Click(Sender);
end;
     //导出
procedure THouseManageForm.N4Click(Sender: TObject);
begin
dtprtbrvw1btn4Click(Sender);
end;
  //打印
procedure THouseManageForm.N5Click(Sender: TObject);
begin
dtprtbrvw1btn5Click(Sender);
end;
 //  显示详细信息
procedure THouseManageForm.N6Click(Sender: TObject);
begin
   //
end;
//显示保密信息
procedure THouseManageForm.N7Click(Sender: TObject);
begin
   //
end;

end.
