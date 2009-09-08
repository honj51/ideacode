unit USalesCommissionSumForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls,
  Mask, ExtCtrls, DB, ADODB;

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
    bskndbgrd1: TbsSkinDBGrid;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
    bskndbgrd2: TbsSkinDBGrid;
    ds1: TDataSource;
    ds2: TDataSource;
    tbl2: TADOTable;
    qry1: TADOQuery;
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesCommissionSumForm: TSalesCommissionSumForm;

implementation

uses UHDHouseDataModule;
{$R *.dfm}

procedure TSalesCommissionSumForm.btn4Click(Sender: TObject);
var sql : string;
begin
  sql := 'select * from tcxx where tcxx_tcdate >= #' + edt1.Text +'#' + ' and tcxx_tcdate <= #' + edt2.Text +'#';

  if Trim(edt3.Text) <> '' then
  begin
    sql := sql + ' and tcxx_ygbh = ' + QuotedStr(edt3.Text);
  end;

  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add(sql);
  qry1.Open;
end;

end.
