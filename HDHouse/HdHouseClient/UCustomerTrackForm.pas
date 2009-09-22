unit UCustomerTrackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContractQueryFrame, UTrackRecordView, UCustomerSecureInfoView,
  UDetailRequirementInfoView, UCustomerListView, ComCtrls, bsSkinTabs, DB,
  ADODB, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls, StdCtrls, bsSkinCtrls,
  Mask, Menus, BusinessSkinForm, frxClass, frxDBSet;

type
  TCustomerTrackForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    cstmrlstvw1: TCustomerListView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht4: TbsSkinTabSheet;
    DetailRequirementInfoView1: TDetailRequirementInfoView;
    bskntbsht5: TbsSkinTabSheet;
    CustomerSecureInfoView1: TCustomerSecureInfoView;
    bskntbsht3: TbsSkinTabSheet;
    trckrcrdvw1: TTrackRecordView;
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
    dsKhzy: TDataSource;
    tblTrack: TADOTable;
    dsTrack: TDataSource;
    bsknpnl1: TbsSkinPanel;
    btn4: TbsSkinButtonLabel;
    edtSearch: TbsSkinEdit;
    lbl2: TbsSkinStdLabel;
    edtEndDate: TbsSkinDateEdit;
    lbl1: TbsSkinStdLabel;
    edtBeginDate: TbsSkinDateEdit;
    lbl3: TbsSkinStdLabel;
    bsknpnl2: TbsSkinPanel;
    bskndbgrd1: TbsSkinDBGrid;
    qryTrackAll: TADOQuery;
    dsTrackAll: TDataSource;
    bsknchckrdbxQz: TbsSkinCheckRadioBox;
    bsknchckrdbxQg: TbsSkinCheckRadioBox;
    pmCustomerTrack: TPopupMenu;
    V1: TMenuItem;
    W1: TMenuItem;
    X1: TMenuItem;
    Z1: TMenuItem;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure cstmrlstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure cstmrlstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure trckrcrdvw1btn2Click(Sender: TObject);
    procedure cntrctqryfrm1bsknchckrdbx1Click(Sender: TObject);
    procedure qryKhzyAfterScroll(DataSet: TDataSet);
    procedure trckrcrdvw1btn1Click(Sender: TObject);
    procedure cstmrlstvw1btn1Click(Sender: TObject);
    procedure trckrcrdvw1btn3Click(Sender: TObject);
    procedure qryKhzyCalcFields(DataSet: TDataSet);
    procedure btn4Click(Sender: TObject);
    procedure bsknchckrdbxQzClick(Sender: TObject);
    procedure bsknchckrdbxQgClick(Sender: TObject);
    procedure trckrcrdvw1bskndbgrd1DblClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure cstmrlstvw1btn2Click(Sender: TObject);
    procedure cstmrlstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure trckrcrdvw1btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerTrackForm: TCustomerTrackForm;

implementation
uses Math,UHDHouseDataModule,UParametersDataModule, UCustomerQueryForm,UCustomerTrackInfoView;
{$R *.dfm}

procedure TCustomerTrackForm.cstmrlstvw1bsknchckrdbx1Click(
  Sender: TObject);
begin
   CustomerTrackForm.cstmrlstvw1btn1Click(nil);
end;

procedure TCustomerTrackForm.cstmrlstvw1bsknchckrdbx2Click(
  Sender: TObject);
begin
    CustomerTrackForm.cstmrlstvw1btn1Click(nil);
end;
 //修改
procedure TCustomerTrackForm.trckrcrdvw1btn2Click(Sender: TObject);
begin
  if tblTrack.FieldByName('khgj_bh').Text <> '' then
  begin
    tblTrack.Edit;
    CustomerTrackInfoViewForm.ShowModal;
   end;
end;
//
procedure TCustomerTrackForm.cntrctqryfrm1bsknchckrdbx1Click(
  Sender: TObject);
begin

end;
//高级查询
procedure TCustomerTrackForm.qryKhzyAfterScroll(DataSet: TDataSet);
begin
if qryKhzy.FieldByName('khzy_qz').Value='Y' then
   begin
       //bsknchckrdbx1
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
       //bsknchckrdbx1
       Self.DetailRequirementInfoView1.bsknchckrdbx2.Checked:=True;
   end
   else
   begin
       Self.DetailRequirementInfoView1.bsknchckrdbx2.Checked:=False;
       Self.DetailRequirementInfoView1.edt2.Text:='';
       Self.DetailRequirementInfoView1.edt4.Text:='';
   end;
end;

//增加客户跟进信息
procedure TCustomerTrackForm.trckrcrdvw1btn1Click(Sender: TObject);
begin
  if qryKhzy.FieldByName('khzy_bh').Text = '' then
  begin
    Exit;
  end;
    
  with tblTrack do
  begin
    Append;
    Randomize;
    FieldByName('khgj_bh').Value :=  RandomRange(10000000,99999999);
    FieldByName('khgj_date').Value := FormatDateTime('yyyy-mm-dd', Now);
    ParametersDataModule.qryTrackMethod.FindFirst;
    FieldByName('khgj_fs').Value := ParametersDataModule.qryTrackMethod.FieldByName('cs_mc').Value;
    FieldByName('khgj_czy').Value := 'admin'; // TODO: 如何取得当前操作员
    //FieldByName('khgj_khbh').Value := qryKhzy.FieldByName('khzy_bh').Value;
    FieldByName('khgj_datetx').Value := Now;
    FieldByName('khgj_txyn').Value:='N';
    FieldByName('khgj_txlx').Value := '当次提醒';
    CustomerTrackInfoViewForm.ShowModal;
  end;
end;

//高级查询
procedure TCustomerTrackForm.cstmrlstvw1btn1Click(Sender: TObject);
 var paramStr:string;
     param:Boolean;
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
  +'khzy_qy like '+'''%'+Self.cstmrlstvw1.edtCustomerSearch.Text+'%'''+' or '
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

//删除跟进记录信息
procedure TCustomerTrackForm.trckrcrdvw1btn3Click(Sender: TObject);
begin
  if tblTrack.FieldByName('khgj_bh').Text <> '' then
  begin
    if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后无法恢复，确定删除吗？', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
    begin
        Exit;
    end;
      tblTrack.Delete;
  end;
end;

procedure TCustomerTrackForm.qryKhzyCalcFields(DataSet: TDataSet);
begin
  qryKhzy.FieldByName('qzjg').Value :=  qryKhzy.FieldByName('khzy_zj1').AsString + '-' + qryKhzy.FieldByName('khzy_zj2').AsString;
  qryKhzy.FieldByName('qgjg').Value :=  qryKhzy.FieldByName('khzy_sj1').AsString + '-' + qryKhzy.FieldByName('khzy_sj1').AsString;
end;

//查询
procedure TCustomerTrackForm.btn4Click(Sender: TObject);
var sql:string;
begin
//
  sql:='select * from khgj';
  sql:=sql+' where khgj_date >= #'+edtBeginDate.Text+'# and khgj_date <=#'+edtEndDate.Text+'#';
  if edtSearch.Text <> '' then
  begin
   sql:=sql+'and '+' ('
   +'khgj_gjr like '+'''%'+edtSearch.Text+'%'' or '
   +'khgj_fs like '+'''%'+edtSearch.Text+'%'' or '
   +'khgj_ms like '+'''%'+edtSearch.Text+'%'' )';
  end;
  if bsknchckrdbxQz.Checked=True then
    begin
       sql:=sql+' and khgj_khbh in (select khzy_bh from khzy where khzy_qz=''Y'')';
    end;

    if bsknchckrdbxQg.Checked=True then
    begin
       sql:=sql+' and khgj_khbh in (select khzy_bh from khzy where khzy_qg=''Y'')';
    end;
  qryTrackAll.Close;
  qryTrackAll.SQL.Clear;
  qryTrackAll.SQL.Add(sql);
  qryTrackAll.Open;
  qryTrackAll.Active:=True;
end;
//只显示求租
procedure TCustomerTrackForm.bsknchckrdbxQzClick(Sender: TObject);
begin
  CustomerTrackForm.btn4Click(nil);
end;
//只显示求购物
procedure TCustomerTrackForm.bsknchckrdbxQgClick(Sender: TObject);
begin
 CustomerTrackForm.btn4Click(nil);
end;

//
procedure TCustomerTrackForm.trckrcrdvw1bskndbgrd1DblClick(
  Sender: TObject);
begin
//
  CustomerTrackForm.trckrcrdvw1btn2Click(nil);
end;

//PopMenuAdd
procedure TCustomerTrackForm.V1Click(Sender: TObject);
begin
CustomerTrackForm.trckrcrdvw1btn1Click(nil);
end;
//PopMenuEdit
procedure TCustomerTrackForm.W1Click(Sender: TObject);
begin
CustomerTrackForm.trckrcrdvw1btn2Click(nil);
end;
//PopMenuDelete
procedure TCustomerTrackForm.X1Click(Sender: TObject);
begin
 CustomerTrackForm.trckrcrdvw1btn3Click(nil);
end;

//高级查询
procedure TCustomerTrackForm.cstmrlstvw1btn2Click(Sender: TObject);
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

procedure TCustomerTrackForm.cstmrlstvw1bsknchckrdbx3Click(
  Sender: TObject);
begin
CustomerTrackForm.cstmrlstvw1btn1Click(nil);
end;

procedure TCustomerTrackForm.trckrcrdvw1btn4Click(Sender: TObject);
begin
 if self.frxReport1.PrepareReport  then
 begin
      self.frxReport1.ShowPreparedReport;
 end;
end;

end.
