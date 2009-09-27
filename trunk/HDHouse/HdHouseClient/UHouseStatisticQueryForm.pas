unit UHouseStatisticQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bscalc, StdCtrls, Mask, bsSkinBoxCtrls, bsSkinCtrls, ExtCtrls,
  UHouseDetailInfoView, UCustomerSecureInfoView, ComCtrls, bsSkinTabs,
  bsdbctrls, bsSkinGrids, bsDBGrids, DB, ADODB, Grids, DBGrids, RpDefine,
  RpRave, frxClass, frxDBSet, frxExportXLS, XPMan, frxExportXML, GridsEh,
  DBGridEh, BusinessSkinForm;

type
  THouseStatisticQueryForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bskntbsht1: TbsSkinTabSheet;
    cstmrscrnfvw1: TCustomerSecureInfoView;
    hsdtlnfvw1: THouseDetailInfoView;
    bvl1: TBevel;
    lbl1: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    edt3: TbsSkinEdit;
    btn3: TbsSkinButtonLabel;
    btn4: TbsSkinButton;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
    ds1: TDataSource;
    qry1: TADOQuery;
    cbb3: TbsSkinComboBox;
    cbb1: TbsSkinComboBox;
    cbb2: TbsSkinComboBox;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn6: TbsSkinButton;
    bskndbgrd2: TbsSkinDBGrid;
    bsknlbl1: TbsSkinLabel;
    edt4: TbsSkinEdit;
    ds2: TDataSource;
    qry2: TADOQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    za: TXPManifest;
    frxXMLExport1: TfrxXMLExport;
    DBGridEh1: TDBGridEh;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure edt4Change(Sender: TObject);
    procedure bskndbgrd2CellClick(Column: TbsColumn);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
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
  HouseStatisticQueryForm: THouseStatisticQueryForm;

implementation
uses UHDHouseDataModule, UParametersDataModule;

{$R *.dfm}

procedure THouseStatisticQueryForm.btn4Click(Sender: TObject);
var sql : string;
begin
  sql := 'select * from fczy where fczy_djrq >= #' + edt1.Text +'#' + ' and fczy_djrq <= #' + edt2.Text +'#';
  if Trim(cbb3.Text) <> '所有' then
  begin
    sql := sql + ' and fczy_ly = ' + QuotedStr(cbb3.Text);
  end;

  if Trim(cbb1.Text) <> '所有' then
  begin
    sql := sql + ' and fczy_dqzt = ' + QuotedStr(cbb1.Text);
  end;

  if Trim(cbb2.Text) <> '所有' then
  begin
    sql := sql + ' and fczy_zs = ' + QuotedStr(cbb2.Text);
  end;

  if Trim(edt3.Text) <> '' then
  begin
    sql := sql + ' and (';
    sql := sql + ' (fczy_fwly like '+'''%'+ edt3.Text +'%'')'+' OR ';
    sql := sql + ' (fczy_wymc like '+'''%'+ edt3.Text +'%'')';
    sql := sql + ')';
  end;

  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add(sql);
  qry1.Open;
end;

procedure THouseStatisticQueryForm.FormCreate(Sender: TObject);
begin
  self.qry2.Active:=true;
  self.qry1.Active:=true;
  ParametersDataModule.qryHouseSource.Active:=True;
  ParametersDataModule.qryHouseStatus.Active:=True;

  try
    // 房产来源
    cbb3.Items.Clear;
    cbb3.Items.Add('所有');
    with ParametersDataModule.dsHouseSource.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbb3.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
    end;
    // 房源状态
    cbb1.Items.Clear;
    cbb1.Items.Add('所有');
    with ParametersDataModule.dsHouseStatus.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbb1.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
    end;
  finally
    ParametersDataModule.dsHouseSource.DataSet.First;
    ParametersDataModule.dsHouseStatus.DataSet.First;
    cbb3.ItemIndex := 0;
    cbb1.ItemIndex := 0;
    cbb2.ItemIndex := 0;
  end;
  edt1.Date := Now - 30;
  bsknpnl1.Visible := False;
end;

procedure THouseStatisticQueryForm.btn1Click(Sender: TObject);
begin
  bsknpnl1.Visible := False;
  edt3.Text := VarToStr(qry2.FieldByName('ygxx_xm').Value);
end;

procedure THouseStatisticQueryForm.btn6Click(Sender: TObject);
begin
  bsknpnl1.Visible := False;
end;

procedure THouseStatisticQueryForm.btn3Click(Sender: TObject);
begin
  bsknpnl1.Visible := True;
  bsknpnl1.BringToFront;
end;

procedure THouseStatisticQueryForm.edt4Change(Sender: TObject);
begin
  if not qry2.Locate('ygxx_bh',edt4.Text,[loPartialKey]) then
  begin
    qry2.Locate('ygxx_xm',edt4.Text,[loPartialKey])
  end;

end;

procedure THouseStatisticQueryForm.bskndbgrd2CellClick(Column: TbsColumn);
begin
  bsknpnl1.Visible := False;
  edt3.Text := VarToStr(qry2.FieldByName('ygxx_xm').Value);
end;

procedure THouseStatisticQueryForm.btn5Click(Sender: TObject);
begin
  if frxReport1.PrepareReport then
  begin
    frxReport1.ShowPreparedReport;
  end;
end;

procedure THouseStatisticQueryForm.btn2Click(Sender: TObject);
begin
  if frxReport1.PrepareReport then
  begin
    //frxReport1.Export(frxXLSExport1);
    frxReport1.Export(frxXMLExport1);
  end;
end;

procedure THouseStatisticQueryForm.DBGridEh1GetFooterParams(
  Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState;
  var Text: String);
begin
  if Column.Field.FieldName = 'fczy_bh' then
  begin
    Text := '共' + Text + '条记录';
  end;  
end;

end.
