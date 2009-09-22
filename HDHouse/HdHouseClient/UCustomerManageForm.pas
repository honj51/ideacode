unit UCustomerManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseAutoMatchView, UCustomerSecureInfoView,
  UDetailRequirementInfoView, UCustomerListView, ComCtrls, bsSkinTabs,
  UDataOperateBarView, DB, ADODB, Menus, bsSkinMenus, BusinessSkinForm,
  bsMessages, frxClass, frxDBSet, frxExportXML;

type
  TCustomerManageForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    cstmrlstvw1: TCustomerListView;
    DetailRequirementInfoView1: TDetailRequirementInfoView;
    CustomerSecureInfoView1: TCustomerSecureInfoView;
    HouseAutoMatchView1: THouseAutoMatchView;
    dsKhzy: TDataSource;
    qryKhzy: TADOQuery;
    wdstrngfldKhzykhzy_bh: TWideStringField;
    wdstrngfldKhzykhzy_yn: TWideStringField;
    wdstrngfldKhzykhzy_htbh: TWideStringField;
    qryKhzykhzy_djrq: TDateTimeField;
    qryKhzykhzy_sxrq: TDateTimeField;
    qryKhzykhzy_zhrq: TDateTimeField;
    wdstrngfldKhzykhzy_fwly: TWideStringField;
    wdstrngfldKhzykhzy_dqzt: TWideStringField;
    wdstrngfldKhzykhzy_wymc: TWideStringField;
    wdstrngfldKhzykhzy_wyyt: TWideStringField;
    wdstrngfldKhzykhzy_wylb: TWideStringField;
    wdstrngfldKhzykhzy_zxcd: TWideStringField;
    wdstrngfldKhzykhzy_jtdz: TWideStringField;
    wdstrngfldKhzykhzy_qy: TWideStringField;
    wdstrngfldKhzykhzy_jcnf1: TWideStringField;
    wdstrngfldKhzykhzy_jcnf2: TWideStringField;
    intgrfldKhzykhzy_ws1: TIntegerField;
    intgrfldKhzykhzy_ws2: TIntegerField;
    fltfldKhzykhzy_jzmj1: TFloatField;
    fltfldKhzykhzy_jzmj2: TFloatField;
    wdstrngfldKhzykhzy_fx: TWideStringField;
    wdstrngfldKhzykhzy_ptss1: TWideStringField;
    wdstrngfldKhzykhzy_ptss2: TWideStringField;
    wdstrngfldKhzykhzy_qz: TWideStringField;
    fltfldKhzykhzy_zj1: TFloatField;
    fltfldKhzykhzy_zj2: TFloatField;
    wdstrngfldKhzykhzy_qzsm: TWideStringField;
    wdstrngfldKhzykhzy_qg: TWideStringField;
    fltfldKhzykhzy_sj1: TFloatField;
    fltfldKhzykhzy_sj2: TFloatField;
    wdstrngfldKhzykhzy_qgsm: TWideStringField;
    wdstrngfldKhzykhzy_yzxm: TWideStringField;
    wdstrngfldKhzykhzy_dh: TWideStringField;
    wdstrngfldKhzykhzy_tel: TWideStringField;
    wdstrngfldKhzykhzy_jtwz: TWideStringField;
    wdstrngfldKhzykhzy_bmbz: TWideStringField;
    qryKhzykhzy_xxbz: TMemoField;
    wdstrngfldKhzykhzy_czy: TWideStringField;
    wdstrngfldKhzykhzy_mj: TWideStringField;
    wdstrngfldKhzykhzy_nf: TWideStringField;
    wdstrngfldKhzykhzy_wssl: TWideStringField;
    wdstrngfldKhzykhzy_ly: TWideStringField;
    wdstrngfldKhzykhzy_zg: TWideStringField;
    wdstrngfldKhzykhzy_ygbh: TWideStringField;
    wdstrngfldKhzykhzy_sby: TWideStringField;
    qryKhzyqzjg: TStringField;
    qryKhzyqgjg: TStringField;
    qryHouse: TADOQuery;
    dsHouse: TDataSource;
    pmCustomer: TPopupMenu;
    V1: TMenuItem;
    W1: TMenuItem;
    X1: TMenuItem;
    Y1: TMenuItem;
    Z1: TMenuItem;
    pmAutoHouse: TPopupMenu;
    MenuItem1: TMenuItem;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxReportkhzy1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxXMLExport1: TfrxXMLExport;
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure qryKhzyAfterScroll(DataSet: TDataSet);
    procedure cstmrlstvw1btn1Click(Sender: TObject);
    procedure cstmrlstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure qryKhzyCalcFields(DataSet: TDataSet);
    procedure cstmrlstvw1btn2Click(Sender: TObject);
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure cstmrlstvw1bskndbgrd1DblClick(Sender: TObject);
    procedure cstmrlstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure cstmrlstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure dtprtbrvw1btn5Click(Sender: TObject);
    procedure dtprtbrvw1btn4Click(Sender: TObject);
    //procedure cstmrlstvw1bskndbgrd1CellClick(Column: TbsColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerManageForm: TCustomerManageForm;

implementation
uses UHDHouseDataModule,UCustomerDetailsForm,UCustomerQueryForm;
{$R *.dfm}
//修改
procedure TCustomerManageForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
  if  qryKhzy.FieldByName('khzy_bh').Text <> '' then
  begin
    CustomerDetailsForm.ParmId:=qryKhzy.FieldByName('khzy_bh').Text;
    CustomerDetailsForm.ParmMode:='edit';
    CustomerDetailsForm.ShowModal;
    self.qryKhzy.Close;
    self.qryKhzy.Open;
  end;
end;



procedure TCustomerManageForm.qryKhzyAfterScroll(DataSet: TDataSet);
var sql:string;
begin
  if qryKhzy.FieldByName('khzy_bh').Text <> '' then
  begin
    //Self.DetailRequirementInfoView1.edt1.Text:=qryKhzy.FieldByName('khzy_zj1').AsString+'-'+qryKhzy.FieldByName('khzy_zj2').AsString;
    Self.DetailRequirementInfoView1.edt2.Text:=qryKhzy.FieldByName('khzy_sj1').AsString+'-'+qryKhzy.FieldByName('khzy_sj2').AsString;
   if qryKhzy.FieldByName('khzy_qz').Value='Y' then
     begin
         Self.DetailRequirementInfoView1.bsknchckrdbx1.Checked:=True;
     end
     else
   begin
       Self.DetailRequirementInfoView1.bsknchckrdbx1.Checked:=False;
       Self.DetailRequirementInfoView1.edt1.Text:='';
       Self.DetailRequirementInfoView1.edt3.Text:='';
   end ;

   if qryKhzy.FieldByName('khzy_qg').Value='Y' then
   begin
       Self.DetailRequirementInfoView1.bsknchckrdbx2.Checked:=True;
   end
   else
   begin
       Self.DetailRequirementInfoView1.bsknchckrdbx2.Checked:=False;
       Self.DetailRequirementInfoView1.edt2.Text:='';
       Self.DetailRequirementInfoView1.edt4.Text:='';
   end;
   //自动绑定房源信息
    sql:='select * from fczy where ';
    //建筑面积
    sql:=sql+'fczy_jzmj >='+qryKhzy.FieldByName('khzy_jzmj1').Text+' and fczy_jzmj <='+qryKhzy.FieldByName('khzy_jzmj2').Text;
    //建成年份
    sql:=sql+' and fczy_jcnf >='''+qryKhzy.FieldByName('khzy_jcnf1').Text+''' and fczy_jcnf <= '''+qryKhzy.FieldByName('khzy_jcnf2').Text+'''';
    //物业名称
    if (qryKhzy.FieldByName('khzy_wymc').Text <> '不限') and (qryKhzy.FieldByName('khzy_wymc').Text <> '无') then
    begin
       sql:=sql+' and fczy_wymc='''+qryKhzy.FieldByName('khzy_wymc').Text+'''';
    end;
    //物业用途
    if qryKhzy.FieldByName('khzy_wyyt').Text <> '不限' then
    begin
       sql:=sql+' and fczy_wyyt='''+qryKhzy.FieldByName('khzy_wyyt').Text+'''';
    end;
    //物业类别
    if qryKhzy.FieldByName('khzy_wylb').Text <> '不限' then
    begin
       sql:=sql+' and fczy_wylb='''+qryKhzy.FieldByName('khzy_wylb').Text+'''';
    end;
    //所属区域
    if qryKhzy.FieldByName('khzy_qy').Text <> '不限' then
    begin
       sql:=sql+' and fczy_qy='''+qryKhzy.FieldByName('khzy_qy').Text+'''';
    end;
    //装修程度
    if qryKhzy.FieldByName('khzy_zxcd').Text <> '不限' then
    begin
       sql:=sql+' and fczy_zxcd='''+qryKhzy.FieldByName('khzy_zxcd').Text+'''';
    end;
    //具体地址
    if (qryKhzy.FieldByName('khzy_jtdz').Text <> '不限') and (qryKhzy.FieldByName('khzy_jtdz').Text <> '无')then
    begin
       sql:=sql+' and fczy_jtdz like ''%'+qryKhzy.FieldByName('khzy_jtdz').Text+'%''';
    end;
    qryHouse.Close;
    qryHouse.SQL.Clear;
    qryHouse.SQL.Add(sql);
    qryHouse.Open;
    qryHouse.Active:=True;
    end;

end;

//搜索
procedure TCustomerManageForm.cstmrlstvw1btn1Click(Sender: TObject);
 var paramStr:string;
 var param:Boolean;
begin
  paramStr:=paramStr+'select * from khzy';
  param:=False;
 if Self.cstmrlstvw1.edtCustomerSearch.Text <> '' then begin
  if param = False then begin
      paramStr:=paramStr+ ' where ';
      param:=True;
  end else
  begin
     paramStr:=paramStr+ ' and ';
  end;
  paramStr:=paramStr+' ( ';
  paramStr:=paramStr+'khzy_bh like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_fwly like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_yzxm like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_dqzt like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_qy   like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_wymc like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_wyyt like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_wylb like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_zxcd like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
  +'khzy_jtdz like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%''';
  paramStr:=paramStr+' ) ';
  end;

   if Self.cstmrlstvw1.bsknchckrdbx3.Checked =True then
  begin
      if param = False then begin
      paramStr:=paramStr+ ' where ';
      param:=True;
      end else
      begin
       paramStr:=paramStr+ ' and ';
      end;
     paramStr:=paramStr+'khzy_djrq >=#'+FormatDateTime('yyyy-mm-dd',Now-StrToInt(self.cstmrlstvw1.edtDate.text))+'#';
  end;

  if self.cstmrlstvw1.bsknchckrdbx2.Checked= True then
  begin
      if param = False then begin
      paramStr:=paramStr+ ' where ';
      param:=True;
      end else
      begin
      paramStr:=paramStr+ ' and ';
      end;
      paramStr:=paramStr+ 'khzy_qz=''Y''';
  end;

  if  self.cstmrlstvw1. bsknchckrdbx1.Checked= True then
  begin
      if param = False then begin
      paramStr:=paramStr+ ' where ';
      param:=True;
      end else
      begin
       paramStr:=paramStr+ ' and ';
      end;
      paramStr:=paramStr+ 'khzy_qg=''Y''';
  end;
  qryKhzy.Close;
  qryKhzy.SQL.Clear;
  qryKhzy.SQL.Add(paramStr);
  qryKhzy.Open;

end;

procedure TCustomerManageForm.cstmrlstvw1bsknchckrdbx2Click(
  Sender: TObject);
begin
CustomerManageForm.cstmrlstvw1btn1Click(nil);  
end;

procedure TCustomerManageForm.qryKhzyCalcFields(DataSet: TDataSet);
begin
  qryKhzy.FieldByName('qzjg').Value :=  qryKhzy.FieldByName('khzy_zj1').AsString + ' - ' + qryKhzy.FieldByName('khzy_zj2').AsString;
  qryKhzy.FieldByName('qgjg').Value :=  qryKhzy.FieldByName('khzy_sj1').AsString + ' - ' + qryKhzy.FieldByName('khzy_sj1').AsString;
end;
//高级查询
procedure TCustomerManageForm.cstmrlstvw1btn2Click(Sender: TObject);
var paramStr:string;
begin
  paramStr:=paramStr+'select * from khzy';
  CustomerQueryForm.ShowModal;
  if CustomerQueryForm.FilterString <> '' then
  begin
    paramStr:=paramStr+' where '+CustomerQueryForm.FilterString;
  end;
    qryKhzy.Close;
  qryKhzy.SQL.Clear;
  qryKhzy.SQL.Add(paramStr);
  qryKhzy.Open;
end;

//添加客户信息
procedure TCustomerManageForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
//
CustomerDetailsForm.ParmMode:='add';
CustomerDetailsForm.ShowModal;
self.qryKhzy.Close;
self.qryKhzy.Open;
end;

//删除
procedure TCustomerManageForm.dtprtbrvw1btn3Click(Sender: TObject);
begin
  if qryKhzy.FieldByName('khzy_bh').Text <> '' then
  begin
    if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('确认删除？', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
    begin
        Exit;
    end;
   qryKhzy.Delete;
  end;
end;

//客户信息列表双击
procedure TCustomerManageForm.cstmrlstvw1bskndbgrd1DblClick(
  Sender: TObject);
begin
  //
   CustomerManageForm.dtprtbrvw1btn2Click(nil);
end;
//

procedure TCustomerManageForm.cstmrlstvw1bsknchckrdbx1Click(
  Sender: TObject);
begin
CustomerManageForm.cstmrlstvw1btn1Click(nil);
end;

procedure TCustomerManageForm.cstmrlstvw1bsknchckrdbx3Click(
  Sender: TObject);
begin
CustomerManageForm.cstmrlstvw1btn1Click(nil);
end;
//PopMenuAdd
procedure TCustomerManageForm.V1Click(Sender: TObject);
begin
CustomerManageForm.dtprtbrvw1btn1Click(nil);
end;
//PopMenuEdit
procedure TCustomerManageForm.W1Click(Sender: TObject);
begin
CustomerManageForm.dtprtbrvw1btn2Click(nil);
end;
 //PopMenuDelete
procedure TCustomerManageForm.X1Click(Sender: TObject);
begin
CustomerManageForm.dtprtbrvw1btn3Click(nil);
end;
  //打印
procedure TCustomerManageForm.dtprtbrvw1btn5Click(Sender: TObject);
begin
     if self.frxReportkhzy1.PrepareReport then
     begin
        self.frxReportkhzy1.ShowPreparedReport;
     end;
end;

procedure TCustomerManageForm.dtprtbrvw1btn4Click(Sender: TObject);
begin
   if self.frxReportkhzy1.PrepareReport then
   begin
      self.frxReportkhzy1.Export(self.frxXMLExport1);
   end;
end;

end.
