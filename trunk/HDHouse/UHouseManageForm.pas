unit UHouseManageForm;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinShellCtrls,
  bsColorCtrls, bsSkinCtrls, ComCtrls, bsSkinBoxCtrls, bsSkinGrids,
  StdCtrls, bsCalendar, bscalc, Mask, bsButtonGroup, bsCategoryButtons,
  bsSkinExCtrls, bsSkinTabs, UHouseSecureInfoView, UHouseDetailInfoView,
  UCustomerAutoMatchView, UDataOperateBarView, DB, ADODB;

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
  private
    { Private declarations }
  public
    strFilter,looktest : string;
    isno:string;
  end;

var
  HouseManageForm: THouseManageForm;

implementation

uses UHDHouseDataModule, UHouseDetailsForm,UHouseQueryForm;

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
         strFilter := strFilter + ' fczy_djrq >= #'+date+'#'  ;
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

end.
