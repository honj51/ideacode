unit UTrackQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTrackQueryFrame, ComCtrls, bsSkinTabs, BusinessSkinForm, DB,
  ADODB;

type
  TTrackQueryForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    trckqryfrm1: TTrackQueryFrame;
    trckqryfrm2: TTrackQueryFrame;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qryTrackAll: TADOQuery;
    dsTrackAll: TDataSource;
    procedure trckqryfrm2btn1Click(Sender: TObject);
    procedure TrackSearch;
    procedure KHTrackSearch;
    procedure FormShow(Sender: TObject);
    procedure trckqryfrm2bsknchckrdbx1Click(Sender: TObject);
    procedure trckqryfrm2bsknchckrdbx2Click(Sender: TObject);
    procedure trckqryfrm1btn1Click(Sender: TObject);
    procedure trckqryfrm1bsknchckrdbx1Click(Sender: TObject);
    procedure trckqryfrm1bsknchckrdbx2Click(Sender: TObject);
    procedure trckqryfrm2btn2Click(Sender: TObject);
    procedure trckqryfrm1btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest : string;
     Titem:Tlistitem;
    { Public declarations }
  end;

var
  TrackQueryForm: TTrackQueryForm;

implementation
         uses UHDHouseDataModule;
{$R *.dfm}
  //房源跟进查询
procedure TTrackQueryForm.trckqryfrm2btn1Click(Sender: TObject);
begin
   self.TrackSearch;
end;
 procedure TTrackQueryForm.TrackSearch;
 var isChange:bool;
 begin
   HDHouseDataModule.qryTrackQuery.Close;
   HDHouseDataModule.qryTrackQuery.SQL.Clear;
   strFilter := 'select * from fcgj ';
   ischange:=false;
   if(self.trckqryfrm2.edt1.Date <> 0)then
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
     if(self.trckqryfrm2.edt5.Date <> 0)then
     begin
          strFilter := strFilter + ' fcgj_date >= #'+self.trckqryfrm2.edt1.Text+'#' +' AND ';
          strFilter := strFilter + ' fcgj_date <= #'+self.trckqryfrm2.edt5.Text+'#';
     end
     else
     begin
          strFilter := strFilter + ' fcgj_date >= #'+self.trckqryfrm2.edt1.Text+'#' +' AND ';
          strFilter := strFilter + ' fcgj_date <= #'+FormatDateTime('yyyy-mm-dd',(Now))+'#';
     end;
   end;

   if(Trim(self.trckqryfrm2.edt6.Text)<>'') then
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
       looktest:= self.trckqryfrm2.edt6.Text;
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
 if(self.trckqryfrm2.bsknchckrdbx1.Checked)then
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
   if(self.trckqryfrm2.bsknchckrdbx2.Checked)then
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
  procedure TTrackQueryForm.KHTrackSearch;
 var isChange:bool;
 begin
   self.qryTrackAll.Close;
   self.qryTrackAll.SQL.Clear;
   strFilter := 'select * from khgj ';
   ischange:=false;
   if(self.trckqryfrm1.edt1.Date <> 0)then
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
     if(self.trckqryfrm1.edt5.Date <> 0)then
     begin
          strFilter := strFilter + ' khgj_date >= #'+self.trckqryfrm1.edt1.Text+'#' +' AND ';
          strFilter := strFilter + ' khgj_date <= #'+self.trckqryfrm1.edt5.Text+'#';
     end
     else
     begin
          strFilter := strFilter + ' khgj_date >= #'+self.trckqryfrm1.edt1.Text+'#' +' AND ';
          strFilter := strFilter + ' khgj_date <= #'+FormatDateTime('yyyy-mm-dd',(Now))+'#';
     end;
   end;

   if(Trim(self.trckqryfrm1.edt6.Text)<>'') then
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
       looktest:= self.trckqryfrm1.edt6.Text;
       strFilter := strFilter + ' ((khgj_bh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_ms like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_fs like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_gjr like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_czy like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_fybh like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_txyn like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_txlx like '+'''%'+looktest+'%'')'+' OR ';
       strFilter := strFilter + ' (khgj_ygbh like '+'''%'+looktest+'%''))';
   end;
 if(self.trckqryfrm1.bsknchckrdbx1.Checked)then
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
      strFilter := strFilter + ' khgj_khbh in (select khzy_bh from khzy where khzy_qz=''Y'')';
   end;
   if(self.trckqryfrm1.bsknchckrdbx2.Checked)then
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
      strFilter := strFilter + ' khgj_khbh in (select khzy_bh from khzy where khzy_qg=''Y'')';
   end;
     self.qryTrackAll.SQL.Add(strFilter) ;
     self.qryTrackAll.Open;
 end;
procedure TTrackQueryForm.FormShow(Sender: TObject);
begin
self.trckqryfrm1.edt1.Date:=Now-30;
self.trckqryfrm1.edt5.Date:=Now;
self.trckqryfrm1.edt6.Text:='';
self.trckqryfrm2.edt1.Date:=Now-30;
self.trckqryfrm2.edt5.Date:=Now;
self.trckqryfrm2.edt6.Text:='';
self.qryTrackAll.Active:=true;
HDHouseDataModule.qryTrackQuery.Active:=true;
end;

procedure TTrackQueryForm.trckqryfrm2bsknchckrdbx1Click(Sender: TObject);
begin
 self.TrackSearch;
end;

procedure TTrackQueryForm.trckqryfrm2bsknchckrdbx2Click(Sender: TObject);
begin
 self.TrackSearch;
end;

procedure TTrackQueryForm.trckqryfrm1btn1Click(Sender: TObject);
begin
  self.KHTrackSearch;
end;

procedure TTrackQueryForm.trckqryfrm1bsknchckrdbx1Click(Sender: TObject);
begin
self.KHTrackSearch;
end;

procedure TTrackQueryForm.trckqryfrm1bsknchckrdbx2Click(Sender: TObject);
begin
self.KHTrackSearch;
end;
 //房源打印
procedure TTrackQueryForm.trckqryfrm2btn2Click(Sender: TObject);
begin
   //
end;
   //客源打印
procedure TTrackQueryForm.trckqryfrm1btn2Click(Sender: TObject);
begin
   //
end;

end.
