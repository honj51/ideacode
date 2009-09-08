unit UContractQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseSecureInfoView, UHouseDetailInfoView, UTrackRecordView,
  ComCtrls, bsSkinTabs, UContractQueryFrame, bsSkinCtrls, bsSkinGrids,
  bsDBGrids, ADODB, DB, Menus;

type
  TContractQueryForm = class(TForm)
    btn6: TbsSkinSpeedButton;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    cntrctqryfrm1: TContractQueryFrame;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht4: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    bskntbsht5: TbsSkinTabSheet;
    hscrnfvw1: THouseSecureInfoView;
    bskntbsht1: TbsSkinTabSheet;
    bskndbgrd1: TbsSkinDBGrid;
    qryCjxx: TADOQuery;
    dsCjxx: TDataSource;
    tblFyxxxx: TADOTable;
    dsFyxxxx: TDataSource;
    tblFygj: TADOTable;
    dsFygj: TDataSource;
    pmContract: TPopupMenu;
    V1: TMenuItem;
    W1: TMenuItem;
    X1: TMenuItem;
    procedure cntrctqryfrm1btn1Click(Sender: TObject);
    procedure cntrctqryfrm1bsknchckrdbx1Click(Sender: TObject);
    procedure cntrctqryfrm1bsknchckrdbx2Click(Sender: TObject);
    procedure dsFyxxxxDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContractQueryForm: TContractQueryForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}
//签约查询
procedure TContractQueryForm.cntrctqryfrm1btn1Click(Sender: TObject);
begin
 if Self.cntrctqryfrm1.edtSearch.Text <> ''
  then begin
 qryCjxx.Filter:='cjxx_date >= '+Self.cntrctqryfrm1.edtBeginDate.Text+' and '
+'cjxx_date <='+Self.cntrctqryfrm1.edtEndDate.Text+' or '
+'cjxx_htbh like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_czssqk like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_fybh like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_wymc like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_yzxm like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_khbh like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_khxm like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%'+' or '
+'cjxx_zygw like '+'%'+Self.cntrctqryfrm1.edtSearch.Text+'%';
qryCjxx.Filtered:=True;
end else
begin
qryCjxx.Filtered:=False;;
end
end;

//显示出租成交
procedure TContractQueryForm.cntrctqryfrm1bsknchckrdbx1Click(
  Sender: TObject);
begin
     qryCjxx.Filter:='cjxx_czxs='+'''Z''';
     qryCjxx.Filtered:=True;
end;

//显示出售成交
procedure TContractQueryForm.cntrctqryfrm1bsknchckrdbx2Click(
  Sender: TObject);
begin
     qryCjxx.Filter:='cjxx_czxs='+'''S''';
     qryCjxx.Filtered:=True;

end;

procedure TContractQueryForm.dsFyxxxxDataChange(Sender: TObject;
  Field: TField);
begin
if tblFyxxxx.FieldByName('fczy_cz').Text= 'Y' then
begin
   //Self.hsdtlnfvw1.bsknchckrdbx1.Checked:=True;
end else
begin
   //Self.hsdtlnfvw1. bsknchckrdbx1.Checked:=False;
end;
if tblFyxxxx.FieldByName('fczy_cs').Text= 'Y' then
begin
    //Self.hsdtlnfvw1. bsknchckrdbx2.Checked:=True;
end else
begin
  // Self.hsdtlnfvw1. bsknchckrdbx2.Checked:=True;
end;

end;

end.
