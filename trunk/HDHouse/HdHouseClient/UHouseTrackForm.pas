unit UHouseTrackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContractQueryFrame, UHouseSecureInfoView, UHouseDetailInfoView,
  UTrackRecordView, UHouseListView, UDealHouseListView, ComCtrls,
  bsSkinTabs, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls,
  StdCtrls, Mask, BusinessSkinForm, frxClass, frxExportXML, frxDBSet,
  Menus, bsSkinMenus;

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
    dlhslstvw1: TDealHouseListView;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxReport2: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure dlhslstvw1bsknchckrdbx3Click(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx2Click(Sender: TObject);
    procedure dlhslstvw1btn1Click(Sender: TObject);
    procedure dlhslstvw1cbb1Change(Sender: TObject);
    procedure dlhslstvw1bsknchckrdbx1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
    procedure Search;
    procedure TrackSearch;
    procedure FormShow(Sender: TObject);
    procedure trckrcrdvw1btn1Click(Sender: TObject);
    procedure trckrcrdvw1btn2Click(Sender: TObject);
    procedure trckrcrdvw1btn3Click(Sender: TObject);
    procedure trckrcrdvw1bskndbgrd1DblClick(Sender: TObject);
    procedure dlhslstvw1btngaojibtn2Click(Sender: TObject);
    procedure trckrcrdvw1btn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest : string;
     Titem:Tlistitem;
    { Public declarations }
  end;

var
  HouseTrackForm: THouseTrackForm;

implementation
   uses UHDHouseDataModule,UHouseTrackInfoForm,Math,UHouseQueryForm,Common;
{$R *.dfm}
   //添加 房源跟进信息
procedure THouseTrackForm.dlhslstvw1bsknchckrdbx3Click(Sender: TObject);
begin
   self.Search;
end;
   //只显示出售信息
procedure THouseTrackForm.dlhslstvw1bsknchckrdbx2Click(Sender: TObject);
begin
  self.Search;
end;
     //只显示出租信息
procedure THouseTrackForm.dlhslstvw1btn1Click(Sender: TObject);
var strFilter,looktest : string;
begin
  self.Search;
end;

procedure THouseTrackForm.dlhslstvw1cbb1Change(Sender: TObject);
begin
   self.Search;
end;

procedure THouseTrackForm.dlhslstvw1bsknchckrdbx1Click(Sender: TObject);
begin
self.Search;
end;
//跟进查询
procedure THouseTrackForm.btn1Click(Sender: TObject);
begin
  self.TrackSearch;
end;
   //出租跟进
procedure THouseTrackForm.bsknchckrdbx1Click(Sender: TObject);
begin
   self.TrackSearch;
end;
   //出售跟进
procedure THouseTrackForm.bsknchckrdbx2Click(Sender: TObject);
begin
    self.TrackSearch;
end;
procedure THouseTrackForm.Search;
   var date:string;
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
       strFilter := strFilter + 'fczy_dqzt='+'''已经成交''';
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
         strFilter := strFilter + 'fczy_dqzt='+'''正常状态''';
      end;


      if trim(self.dlhslstvw1.edt1.Text) <>'' then
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
         looktest:= self.dlhslstvw1.edt1.Text;
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
       strFilter := strFilter + ' fczy_zs='+'''出租''';
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
       strFilter := strFilter + ' fczy_zs='+'''出售''';
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
         date:= FormatDateTime('yyyy-mm-dd',Now-StrToInt(self.dlhslstvw1.edt2.Text));
        if IsUsingAccess then
        begin
            strFilter := strFilter + ' fczy_djrq >= #'+date+'#'  ;
        end
        else
        begin
           strFilter := strFilter + ' fczy_djrq >= '+QuotedStr(date) ;
        end;

      end;
      HDHouseDataModule.qryfczy.SQL.Add(strFilter) ;
      HDHouseDataModule.qryfczy.Open;
   end;
procedure THouseTrackForm.FormShow(Sender: TObject);
begin
  self.dlhslstvw1.cbb1.ItemIndex:=0;
  self.edt2.Date:=Now-30;
  self.edt3.Date:=Now;
end;
 procedure ThouseTrackForm.TrackSearch;
 var isChange:bool;
 begin
   HDHouseDataModule.qryTrackQuery.Close;
   HDHouseDataModule.qryTrackQuery.SQL.Clear;
   strFilter := 'select * from fcgj ';
   ischange:=false;
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
              strFilter := strFilter + ' fcgj_date >= #'+self.edt2.Text+'#' +' AND ';
              strFilter := strFilter + ' fcgj_date <= #'+self.edt3.Text+'#';
          end
          else
          begin
              strFilter := strFilter + ' fcgj_date >= '+QuotedStr(self.edt2.Text) +' AND ';
              strFilter := strFilter + ' fcgj_date <= '+QuotedStr(self.edt3.Text);
          end;
     end
     else
     begin
          if IsUsingAccess then
          begin
             strFilter := strFilter + ' fcgj_date >= #'+self.edt2.Text+'#' +' AND ';
             strFilter := strFilter + ' fcgj_date <= #'+FormatDateTime('yyyy-mm-dd',(Now))+'#';
          end
          else
          begin
            strFilter := strFilter + ' fcgj_date >= '+QuotedStr(self.edt2.Text) +' AND ';
            strFilter := strFilter + ' fcgj_date <= '+QuotedStr(FormatDateTime('yyyy-mm-dd',(Now)));
          end;
     end;
   end;

   if(Trim(self.edt1.Text)<>'') then
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
       strFilter := strFilter + ' ((fcgj_bh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_ms like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_fs like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_gjr like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_czy like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_fybh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_txyn like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_txlx like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (fcgj_ygbh like '+'''%'+looktest+'%''))';
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
      strFilter := strFilter + ' fcgj_fybh in (select fczy_bh from fczy where fczy_cz=true)';
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
      strFilter := strFilter + ' fcgj_fybh in (select fczy_bh from fczy where fczy_cs=true)';
   end;
    HDHouseDataModule.qryTrackQuery.SQL.Add(strFilter) ;
     HDHouseDataModule.qryTrackQuery.Open;
 end;

 //显示信息
procedure THouseTrackForm.trckrcrdvw1btn1Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
        HouseTrackInfoForm.ParmEditorMode:= 'ADD';
        Randomize;//初始
        HouseTrackInfoForm.ParmId :=IntToStr(RandomRange(10000000,99999999)); //IntToStr(random(10));
        HouseTrackInfoForm.fybh := HDHouseDataModule.qryfczy.fieldbyname('fczy_bh').AsString;
        HouseTrackInfoForm.ShowModal;
        HDHouseDataModule.tblTrackRecords.Close;
        HDHouseDataModule.tblTrackRecords.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
  end;

procedure THouseTrackForm.trckrcrdvw1btn2Click(Sender: TObject);
begin
 inherited;
 if not HDHouseDataModule.tblTrackRecords.IsEmpty THEN
  Begin
    Try
        HouseTrackInfoForm.ParmEditorMode:= 'EDIT';
        HouseTrackInfoForm.ParmId := HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_bh').AsString;
        HouseTrackInfoForm.ShowModal;
        HDHouseDataModule.tblTrackRecords.Close;
        HDHouseDataModule.tblTrackRecords.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure THouseTrackForm.trckrcrdvw1btn3Click(Sender: TObject);
begin
    if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后无法恢复，确定删除吗？', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
    begin
        Exit;
    end;
   HDHouseDataModule.tblTrackRecords.Delete;
end;

procedure THouseTrackForm.trckrcrdvw1bskndbgrd1DblClick(Sender: TObject);
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

procedure THouseTrackForm.dlhslstvw1btngaojibtn2Click(Sender: TObject);
begin
  HouseQueryForm.ShowModal;
  HDHouseDataModule.qryfczy.Close;
  HDHouseDataModule.qryfczy.SQL.Clear;
  HDHouseDataModule.qryfczy.SQL.Add(HouseQueryForm.strFilter) ;
  HDHouseDataModule.qryfczy.Open;
end;

procedure THouseTrackForm.trckrcrdvw1btn4Click(Sender: TObject);
begin
 if self.frxReport2.PrepareReport then
 begin
   self.frxReport2.ShowPreparedReport;
 end;
end;
  //添加
procedure THouseTrackForm.N1Click(Sender: TObject);
begin
    trckrcrdvw1btn1Click(Sender);
end;
     //修改
procedure THouseTrackForm.N2Click(Sender: TObject);
begin
trckrcrdvw1btn2Click(Sender);
end;
  //删除
procedure THouseTrackForm.N3Click(Sender: TObject);
begin
trckrcrdvw1btn3Click(Sender);
end;
 //打印
procedure THouseTrackForm.N4Click(Sender: TObject);
begin
 trckrcrdvw1btn4Click(Sender);
end;

end.
