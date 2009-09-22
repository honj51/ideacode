unit USalesCommissionSumForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls,
  Mask, ExtCtrls, DB, ADODB, BusinessSkinForm, frxClass, frxExportXML,
  frxDBSet, GridsEh, DBGridEh;

type
  TSalesCommissionSumForm = class(TForm)
    bvl1: TBevel;
    lbl1: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    btn3: TbsSkinButtonLabel;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn4: TbsSkinButton;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
    bskndbgrd2: TbsSkinDBGrid;
    ds1: TDataSource;
    ds2: TDataSource;
    tbl2: TADOTable;
    qry1: TADOQuery;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxdbdtsttczh: TfrxDBDataset;
    frxrprttczh: TfrxReport;
    tczh: TfrxXMLExport;
    dbgrdh1: TDBGridEh;
    wdstrngfldqry1tcxx_zygw: TWideStringField;
    intgrfldqry1DSDesigner: TIntegerField;
    fltfldqry1DSDesigner2: TFloatField;
    fltfldqry1DSDesigner3: TFloatField;
    intgrfldqry1DSDesigner4: TIntegerField;
    fltfldqry1DSDesigner5: TFloatField;
    fltfldqry1DSDesigner6: TFloatField;
    intgrfldqry1Field: TIntegerField;
    intgrfldqry1Field1: TIntegerField;
    intgrfldqry1Field2: TIntegerField;
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure qry1CalcFields(DataSet: TDataSet);
    procedure dbgrdh1GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesCommissionSumForm: TSalesCommissionSumForm;

implementation

uses UHDHouseDataModule,URealtorListForm;
{$R *.dfm}

procedure TSalesCommissionSumForm.btn4Click(Sender: TObject);
var sql : string;
begin
  sql:='select a.tcxx_zygw ,b.出售数量,b.出售佣金,b.出售提成,a.出租数量,a.出租佣金 ,a.出租提成 from '+
  '(select tcxx_zygw, count(*) as 出租数量,sum(tcxx_yj)as 出租佣金,sum (tcxx_tcje)as 出租提成 from tcxx where tcxx_jylx=''出租'' and tcxx_tcdate >= #' + edt1.Text +'#' + ' and tcxx_tcdate <= #' + edt2.Text +'#'+' group by tcxx_zygw)'+
  'a, (select tcxx_zygw, count(*) as 出售数量,sum(tcxx_yj)as 出售佣金, sum (tcxx_tcje)as 出售提成 from tcxx where tcxx_jylx=''出售'' and tcxx_tcdate >= #' + edt1.Text +'#' + ' and tcxx_tcdate <= #' + edt2.Text +'#'+' group by tcxx_zygw) '+
  ' b where a.tcxx_zygw=b.tcxx_zygw  ';
  if Trim(edt3.Text) <> '' then
  begin
    sql := sql + ' and a.tcxx_zygw = ' + QuotedStr(edt3.Text);
  end;
  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add(sql);
  qry1.Open;
end;

procedure TSalesCommissionSumForm.btn3Click(Sender: TObject);
var ygxm:string;
begin
   RealtorListForm.ygxm :=self.edt3.Text;
   RealtorListForm.ShowModal;
   self.edt3.Text:=RealtorListForm.ygxm;
end;
  //计算字段
procedure TSalesCommissionSumForm.qry1CalcFields(DataSet: TDataSet);
begin
  self.qry1.FieldByName('交易总数量').Value:= self.qry1.FieldByName('出租数量').Value+self.qry1.FieldByName('出售数量').Value;//总交易数量
  self.qry1.FieldByName('总佣金').Value:= self.qry1.FieldByName('出租佣金').Value+self.qry1.FieldByName('出售佣金').Value;// 总佣金
  self.qry1.FieldByName('总提成').Value:= self.qry1.FieldByName('出租提成').Value+self.qry1.FieldByName('出售提成').Value;// 总提成
end;
  //foot统计
procedure TSalesCommissionSumForm.dbgrdh1GetFooterParams(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState;
  var Text: String);
begin
  if Column.Field.FieldName = 'tcxx_zygw' then
  begin
    Text := '合计' + Text;
  end;
end;

procedure TSalesCommissionSumForm.btn5Click(Sender: TObject);
begin
    if self.frxrprttczh.PrepareReport then
    begin
        self.frxrprttczh.ShowPreparedReport;
    end;
end;

procedure TSalesCommissionSumForm.btn2Click(Sender: TObject);
begin
     if self.frxrprttczh.PrepareReport then
    begin
        self.frxrprttczh.Export(self.tczh);
    end;
end;

end.
