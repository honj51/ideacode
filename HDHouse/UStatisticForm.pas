unit UStatisticForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinCtrls, bsSkinShellCtrls, bsSkinGrids, bsDBGrids,
  StdCtrls, Mask, bsSkinBoxCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, DB,
  ADODB, Series, DbChart, GridsEh, DBGridEh;

type
  TStatisticForm = class(TForm)
    GroupBox1: TGroupBox;
    grp1: TGroupBox;
    btn3: TbsSkinButtonLabel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinDateEdit1: TbsSkinDateEdit;
    lbl10: TbsSkinStdLabel;
    bsSkinDateEdit2: TbsSkinDateEdit;
    btn4: TbsSkinButton;
    tv1: TbsSkinTreeView;
    ds1: TDataSource;
    qry1: TADOQuery;
    bsSkinDBGrid1: TbsSkinDBGrid;
    dbcht1: TDBChart;
    brsrsSeries1: TBarSeries;
    DBGridEh1: TDBGridEh;
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatisticForm: TStatisticForm;

implementation
uses
  UHDHouseDataModule,StrUtils;
{$R *.dfm}


procedure TStatisticForm.tv1Change(Sender: TObject; Node: TTreeNode);
var
  msg: string;
  sql : string;
begin
  msg := Node.Text;

  if AnsiStartsStr('按',Node.Text) then
  begin
    Exit;
  end;

  //bskndbgrd1.Columns[0].Title.Caption := Node.Text;
  dbcht1.Title.Text.Text := Node.Text;
  qry1.Active := False;
  qry1.SQL.Clear;
  {按房源统计}
  if Node.Text = '房屋来源' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_fwly AS '+ node.Text + ', COUNT(*) AS 数量 FROM fczy GROUP BY fczy_fwly';
  end
  else if Node.Text = '房源状态' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_dqzt AS '+ node.Text + ', COUNT(*) AS 数量 FROM fczy GROUP BY fczy_dqzt';
  end
  else if Node.Text = '物业用途' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_wyyt AS '+ node.Text + ', COUNT(*) AS 数量 FROM fczy GROUP BY fczy_wyyt';
  end
  else if Node.Text = '物业类别' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_wylb AS '+ node.Text + ', COUNT(*) AS 数量 FROM fczy GROUP BY fczy_wylb';
  end
  else if Node.Text = '所处区域' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_qy AS '+ node.Text + ', COUNT(*) AS 数量 FROM fczy GROUP BY fczy_qy';
  end
  else if Node.Text = '出租出售' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_zs AS '+ node.Text + ', COUNT(*) AS 数量 FROM fczy GROUP BY fczy_zs';
  end
    {按客源统计}
  else if Node.Text = '客户来源' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_ly AS '+ node.Text + ', COUNT(*) AS 数量 FROM khzy GROUP BY khzy_ly';
  end
  else if Node.Text = '客户状态' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_dqzt AS '+ node.Text + ', COUNT(*) AS 数量 FROM khzy GROUP BY khzy_dqzt';
  end
  else if Node.Text = '需求用途' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_wyyt AS '+ node.Text + ', COUNT(*) AS 数量 FROM khzy GROUP BY khzy_wyyt';
  end
  else if Node.Text = '需求类别' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_wylb AS '+ node.Text + ', COUNT(*) AS 数量 FROM khzy GROUP BY khzy_wylb';
  end
  else if Node.Text = '需求区域' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_qy AS '+ node.Text + ', COUNT(*) AS 数量 FROM khzy GROUP BY khzy_qy';
  end
  else if Node.Text = '求租求购' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_zg AS '+ node.Text + ', COUNT(*) AS 数量 FROM khzy GROUP BY khzy_zg';
  end
    {按员工统计}
  else if Node.Text = '房源数量' then
  begin
    brsrsSeries1.XLabelsSource := '员工';
    brsrsSeries1.YValues.ValueSource := '房源数量';
    sql := 'select fczy_ygbh AS 员工, COUNT(*) AS 房源数量 FROM fczy GROUP BY fczy_ygbh';
  end
  else if Node.Text = '客源数量' then
  begin
    brsrsSeries1.XLabelsSource := '员工';
    brsrsSeries1.YValues.ValueSource := '客源数量';
    sql := 'select khzy_fwly AS 员工, COUNT(*) AS 客源数量 FROM khzy GROUP BY khzy_fwly';
  end
  else if Node.Text = '成交数量' then
  begin
    brsrsSeries1.XLabelsSource := '员工';
    brsrsSeries1.YValues.ValueSource := '成交数量';
    sql := 'select cjxx_zygw AS 员工, COUNT(*) AS 成交数量 FROM cjxx GROUP BY cjxx_zygw';
  end
    {按时间统计}
  else if Node.Text = '日增房源' then
  begin
    brsrsSeries1.XLabelsSource := '登记日期';
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select fczy_djrq AS 登记日期, COUNT(*) AS 数量 FROM fczy GROUP BY fczy_djrq';
  end
  else if Node.Text = '月增房源' then
  begin
    brsrsSeries1.XLabelsSource := '登记月份';
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'SELECT fczy_sby AS 登记月份, COUNT(*) AS 数量 FROM fczy GROUP BY fczy_sby';
  end
  else if Node.Text = '日增客源' then
  begin
    brsrsSeries1.XLabelsSource := '登记日期';
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_djrq AS 登记日期, COUNT(*) AS 数量 FROM khzy GROUP BY khzy_djrq';

  end
  else if Node.Text = '月增客源' then
  begin
    brsrsSeries1.XLabelsSource := '登记月份';
    brsrsSeries1.YValues.ValueSource := '数量';
    sql := 'select khzy_sby AS 登记月份, COUNT(*) AS 数量 FROM khzy GROUP BY khzy_sby';
  end
    {按营业额统计}
  else if Node.Text = '日营业额' then
  begin
  brsrsSeries1.XLabelsSource := '日期';
  brsrsSeries1.YValues.ValueSource := '金额';
  sql := 'select cjxx_date AS 日期, SUM(cjxx_yjze) AS 金额 FROM cjxx GROUP BY cjxx_date';

  end
  else if Node.Text = '月营业额' then
  begin
  brsrsSeries1.XLabelsSource := '月份';
  brsrsSeries1.YValues.ValueSource := '金额';
  sql := 'select cjxx_sby AS 月份, SUM(cjxx_yjze) AS 金额 FROM cjxx GROUP BY cjxx_sby';

  end
  else
  begin
    sql := null;
  end;

  if sql <> null then
  begin

    qry1.SQL.Add(sql);
    qry1.Active := True;

  end;
end;

procedure TStatisticForm.FormCreate(Sender: TObject);
var i:Integer;
begin
    bsSkinDateEdit1.Date := Now - 90;
    tv1.FullExpand;
    tv1.Select(tv1.Items[1]);
end;

procedure TStatisticForm.DBGridEh1GetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  Text := Text + '条记录';
end;

end.

