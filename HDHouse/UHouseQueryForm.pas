unit UHouseQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseQueryFrame;

type
  THouseQueryForm = class(TForm)
    hsqryfrm1: THouseQueryFrame;
    procedure hsqryfrm1btn1Click(Sender: TObject);
    function isno():Boolean;
    procedure hsqryfrm1btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest : string;
     isChange:Boolean;
    { Public declarations }
  end;

var
  HouseQueryForm: THouseQueryForm;

implementation
    uses UParametersDataModule;
{$R *.dfm}
 //查询
procedure THouseQueryForm.hsqryfrm1btn1Click(Sender: TObject);
var jylx,jcsb:string;
begin
    ischange:=false;
    strFilter := 'select * from fczy ';
  //交易类型
    if self.hsqryfrm1.cbb5.Text='出租'then
    begin
        jylx:='fczy_zj';
    end
    else
    begin
        jylx:='fczy_sj';
    end;
     //区域
    if not (self.hsqryfrm1.cbb6.Text='不限') then
    begin
        self.isno;
        strFilter := strFilter +' fczy_qy='''+self.hsqryfrm1.cbb6.Text+'''';
    end;
    //面积
    if not (self.hsqryfrm1.edt1.Text='') then
    begin
        self.isno;
        strFilter := strFilter +' fczy_jzmj>='+self.hsqryfrm1.edt1.Text;
    end;
    if not (self.hsqryfrm1.edt2.Text='')then
    begin
         self.isno;
         strFilter := strFilter +' fczy_jzmj<='+self.hsqryfrm1.edt2.Text;
    end;
    //卧室
    if not (self.hsqryfrm1.cbb1.Text='不限')then
    begin
         self.isno;
         strFilter := strFilter +' fczy_ws='+self.hsqryfrm1.cbb1.Text;
    end;
    // 客厅
    if not (self.hsqryfrm1.cbb2.Text='不限')then
    begin
         self.isno;
         strFilter := strFilter +' fczy_kt='+self.hsqryfrm1.cbb2.Text;
    end;
    // 卫生间
    if not (self.hsqryfrm1.cbb3.Text='不限')then
    begin
         self.isno;
         strFilter := strFilter +' fczy_wc='+self.hsqryfrm1.cbb3.Text;
    end;
      //阳台
    if not (self.hsqryfrm1.cbb4.Text='不限')then
    begin
         self.isno;
         strFilter := strFilter +' fczy_yt='+self.hsqryfrm1.cbb4.Text;
    end;
    //价格
    if not (self.hsqryfrm1.edt3.Text='')then
    begin
        self.isno;
        strFilter := strFilter +' '+jylx+'>='+self.hsqryfrm1.edt3.Text;
    end;
    if not (self.hsqryfrm1.edt4.Text='')then
    begin
        strFilter := strFilter +' '+jylx+'<='+self.hsqryfrm1.edt4.Text;
    end;
    //基础设备
    if (self.hsqryfrm1.bsknchckrdbx1.Checked or self.hsqryfrm1.bsknchckrdbx2.Checked or self.hsqryfrm1.bsknchckrdbx3.Checked or self.hsqryfrm1.bsknchckrdbx4.Checked)then
    begin
       self.isno;
       jcsb:='%' ;
       if(self.hsqryfrm1.bsknchckrdbx1.Checked)then
       begin
           jcsb:=jcsb+'燃气%';
       end;
       if(self.hsqryfrm1.bsknchckrdbx2.Checked)then
       begin
           jcsb:=jcsb+'暧气%';
       end;
       if(self.hsqryfrm1.bsknchckrdbx3.Checked)then
       begin
           jcsb:=jcsb+'有线%';
       end;
       if(self.hsqryfrm1.bsknchckrdbx4.Checked)then
       begin
           jcsb:=jcsb+'宽带%';
       end;
        strFilter := strFilter + ' fczy_ptss1 like ''' +jcsb+'''';
    end;
    if not (self.hsqryfrm1.edt5.Text='') then
    begin
        self.isno;
        strFilter := strFilter +' fczy_wymc ='''+self.hsqryfrm1.edt5.Text+'''';
    end;
    if not (self.hsqryfrm1.edt6.Text='') then
    begin
        self.isno;
        strFilter := strFilter +'fczy_jtdz ='''+self.hsqryfrm1.edt5.Text+'''';
    end;
   Close;
end;
function   THouseQueryForm.isno():Boolean;
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
end;
procedure THouseQueryForm.hsqryfrm1btn2Click(Sender: TObject);
begin
Close;
end;
 //
procedure THouseQueryForm.FormShow(Sender: TObject);
begin
    self.hsqryfrm1.cbb6.Items.Clear;
    self.hsqryfrm1.cbb6.Items.Add('不限');
    with ParametersDataModule.dsHouseRegion.DataSet do
    begin
      First;
      while not Eof do
      begin
        self.hsqryfrm1.cbb6.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
    end;
    self.hsqryfrm1.cbb6.ItemIndex:=0;
end;

end.
