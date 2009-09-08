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

  if AnsiStartsStr('��',Node.Text) then
  begin
    Exit;
  end;

  //bskndbgrd1.Columns[0].Title.Caption := Node.Text;
  dbcht1.Title.Text.Text := Node.Text;
  qry1.Active := False;
  qry1.SQL.Clear;
  {����Դͳ��}
  if Node.Text = '������Դ' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_fwly AS '+ node.Text + ', COUNT(*) AS ���� FROM fczy GROUP BY fczy_fwly';
  end
  else if Node.Text = '��Դ״̬' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_dqzt AS '+ node.Text + ', COUNT(*) AS ���� FROM fczy GROUP BY fczy_dqzt';
  end
  else if Node.Text = '��ҵ��;' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_wyyt AS '+ node.Text + ', COUNT(*) AS ���� FROM fczy GROUP BY fczy_wyyt';
  end
  else if Node.Text = '��ҵ���' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_wylb AS '+ node.Text + ', COUNT(*) AS ���� FROM fczy GROUP BY fczy_wylb';
  end
  else if Node.Text = '��������' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_qy AS '+ node.Text + ', COUNT(*) AS ���� FROM fczy GROUP BY fczy_qy';
  end
  else if Node.Text = '�������' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_zs AS '+ node.Text + ', COUNT(*) AS ���� FROM fczy GROUP BY fczy_zs';
  end
    {����Դͳ��}
  else if Node.Text = '�ͻ���Դ' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_ly AS '+ node.Text + ', COUNT(*) AS ���� FROM khzy GROUP BY khzy_ly';
  end
  else if Node.Text = '�ͻ�״̬' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_dqzt AS '+ node.Text + ', COUNT(*) AS ���� FROM khzy GROUP BY khzy_dqzt';
  end
  else if Node.Text = '������;' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_wyyt AS '+ node.Text + ', COUNT(*) AS ���� FROM khzy GROUP BY khzy_wyyt';
  end
  else if Node.Text = '�������' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_wylb AS '+ node.Text + ', COUNT(*) AS ���� FROM khzy GROUP BY khzy_wylb';
  end
  else if Node.Text = '��������' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_qy AS '+ node.Text + ', COUNT(*) AS ���� FROM khzy GROUP BY khzy_qy';
  end
  else if Node.Text = '������' then
  begin
    brsrsSeries1.XLabelsSource := node.Text;
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_zg AS '+ node.Text + ', COUNT(*) AS ���� FROM khzy GROUP BY khzy_zg';
  end
    {��Ա��ͳ��}
  else if Node.Text = '��Դ����' then
  begin
    brsrsSeries1.XLabelsSource := 'Ա��';
    brsrsSeries1.YValues.ValueSource := '��Դ����';
    sql := 'select fczy_ygbh AS Ա��, COUNT(*) AS ��Դ���� FROM fczy GROUP BY fczy_ygbh';
  end
  else if Node.Text = '��Դ����' then
  begin
    brsrsSeries1.XLabelsSource := 'Ա��';
    brsrsSeries1.YValues.ValueSource := '��Դ����';
    sql := 'select khzy_fwly AS Ա��, COUNT(*) AS ��Դ���� FROM khzy GROUP BY khzy_fwly';
  end
  else if Node.Text = '�ɽ�����' then
  begin
    brsrsSeries1.XLabelsSource := 'Ա��';
    brsrsSeries1.YValues.ValueSource := '�ɽ�����';
    sql := 'select cjxx_zygw AS Ա��, COUNT(*) AS �ɽ����� FROM cjxx GROUP BY cjxx_zygw';
  end
    {��ʱ��ͳ��}
  else if Node.Text = '������Դ' then
  begin
    brsrsSeries1.XLabelsSource := '�Ǽ�����';
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select fczy_djrq AS �Ǽ�����, COUNT(*) AS ���� FROM fczy GROUP BY fczy_djrq';
  end
  else if Node.Text = '������Դ' then
  begin
    brsrsSeries1.XLabelsSource := '�Ǽ��·�';
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'SELECT fczy_sby AS �Ǽ��·�, COUNT(*) AS ���� FROM fczy GROUP BY fczy_sby';
  end
  else if Node.Text = '������Դ' then
  begin
    brsrsSeries1.XLabelsSource := '�Ǽ�����';
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_djrq AS �Ǽ�����, COUNT(*) AS ���� FROM khzy GROUP BY khzy_djrq';

  end
  else if Node.Text = '������Դ' then
  begin
    brsrsSeries1.XLabelsSource := '�Ǽ��·�';
    brsrsSeries1.YValues.ValueSource := '����';
    sql := 'select khzy_sby AS �Ǽ��·�, COUNT(*) AS ���� FROM khzy GROUP BY khzy_sby';
  end
    {��Ӫҵ��ͳ��}
  else if Node.Text = '��Ӫҵ��' then
  begin
  brsrsSeries1.XLabelsSource := '����';
  brsrsSeries1.YValues.ValueSource := '���';
  sql := 'select cjxx_date AS ����, SUM(cjxx_yjze) AS ��� FROM cjxx GROUP BY cjxx_date';

  end
  else if Node.Text = '��Ӫҵ��' then
  begin
  brsrsSeries1.XLabelsSource := '�·�';
  brsrsSeries1.YValues.ValueSource := '���';
  sql := 'select cjxx_sby AS �·�, SUM(cjxx_yjze) AS ��� FROM cjxx GROUP BY cjxx_sby';

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
  Text := Text + '����¼';
end;

end.

