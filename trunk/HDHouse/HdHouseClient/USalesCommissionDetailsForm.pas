unit USalesCommissionDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls, StdCtrls,
  Mask, UCustomerSecureInfoView, UHouseDetailInfoView, ComCtrls,
  bsSkinTabs, ExtCtrls, ADODB, DB, BusinessSkinForm, frxClass, frxDBSet,
  frxExportXML;

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
    bsbsnsknfrm1: TbsBusinessSkinForm;
    dsTrackRecords: TDataSource;
    tblTrackRecords: TADOTable;
    frxXMLExport1: TfrxXMLExport;
    frxrprt1: TfrxReport;
    frxDBDatasettcmx: TfrxDBDataset;
    qrytcxx: TADOQuery;
    procedure doQuery;
    procedure btn4Click(Sender: TObject);
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure bsknchckrdbx2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesCommissionDetailsForm: TSalesCommissionDetailsForm;

implementation
uses UHDHouseDataModule,URealtorListForm,Common;
{$R *.dfm}

procedure TSalesCommissionDetailsForm.doQuery;
var sql : string;
begin
    if IsUsingAccess then
    begin
       sql := 'select * from tcxx where tcxx_tcdate >= #' + edt1.Text +'#' + ' and tcxx_tcdate <= #' + edt2.Text +'#';
    end
    else
    begin
       sql := 'select * from tcxx where tcxx_tcdate >= ' + QuotedStr(edt1.Text)  + ' and tcxx_tcdate <= ' +QuotedStr( edt2.Text) ;
    end;
  if Trim(edt3.Text) <> '' then
  begin
    sql := sql + ' and tcxx_zygw = ' + QuotedStr(Trim(edt3.Text));
  end;

  if bsknchckrdbx1.Checked then
  begin
    sql := sql + ' and tcxx_jylx = ' + QuotedStr('³ö×â');
  end;

  if bsknchckrdbx2.Checked then
  begin
    sql := sql + ' and tcxx_jylx = ' + QuotedStr('³öÊÛ');;
  end;
  self.qrytcxx.Close;
  qrytcxx.SQL.Clear;
  qrytcxx.SQL.Add(sql);
  qrytcxx.Open;
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

procedure TSalesCommissionDetailsForm.btn3Click(Sender: TObject);
var ygxm:string;
begin
   RealtorListForm.ygxm :=self.edt3.Text;
   RealtorListForm.ShowModal;
   self.edt3.Text:=RealtorListForm.ygxm;
    Self.doQuery;
end;

procedure TSalesCommissionDetailsForm.btn5Click(Sender: TObject);
begin
 if self.frxrprt1.PrepareReport then
 begin
    self.frxrprt1.ShowPreparedReport;
 end;
end;

procedure TSalesCommissionDetailsForm.btn2Click(Sender: TObject);
begin
    if self.frxrprt1.PrepareReport then
 begin
    self.frxrprt1.Export(self.frxXMLExport1);
 end;
end;

end.
