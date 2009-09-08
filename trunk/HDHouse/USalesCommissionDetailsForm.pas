unit USalesCommissionDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls, StdCtrls,
  Mask, UCustomerSecureInfoView, UHouseDetailInfoView, ComCtrls,
  bsSkinTabs, ExtCtrls, ADODB, DB;

type
  TSalesCommissionDetailsForm = class(TForm)
    bvl1: TBevel;
    lbl1: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    btn3: TbsSkinButtonLabel;
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    bskntbsht1: TbsSkinTabSheet;
    cstmrscrnfvw1: TCustomerSecureInfoView;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn4: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bskntbsht2: TbsSkinTabSheet;
    bskndbgrd2: TbsSkinDBGrid;
    ds1: TDataSource;
    ds2: TDataSource;
    tbl2: TADOTable;
    qry1: TADOQuery;
    procedure doQuery;
    procedure btn4Click(Sender: TObject);
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesCommissionDetailsForm: TSalesCommissionDetailsForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

procedure TSalesCommissionDetailsForm.doQuery;
var sql : string;
begin
  sql := 'select * from cjxx where cjxx_date >= #' + edt1.Text +'#' + ' and cjxx_date <= #' + edt2.Text +'#';

  if Trim(edt3.Text) <> '' then
  begin
    sql := sql + ' and cjxx_ygbh = ' + QuotedStr(Trim(edt3.Text));
  end;

  if bsknchckrdbx1.Checked then
  begin
    sql := sql + ' and cjxx_czxs = ' + QuotedStr('Z');
  end;

  if bsknchckrdbx2.Checked then
  begin
    sql := sql + ' and cjxx_czxs = ' + QuotedStr('S');;
  end;


  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add(sql);
  qry1.Open;
end;

procedure TSalesCommissionDetailsForm.btn4Click(Sender: TObject);
begin
  Self.doQuery;
end;

procedure TSalesCommissionDetailsForm.bsknchckrdbx1Click(Sender: TObject);
begin
    Self.doQuery;
end;

procedure TSalesCommissionDetailsForm.bsknchckrdbx2Click(Sender: TObject);
begin
    Self.doQuery;
end;

end.
