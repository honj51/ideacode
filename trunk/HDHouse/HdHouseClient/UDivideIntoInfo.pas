unit UDivideIntoInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, ImgList, bsPngImageList,
  bsSkinBoxCtrls, bsdbctrls, StdCtrls, Mask;

type
  TDivideIntoInfo = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    edttcxx_bh: TbsSkinDBEdit;
    cbbtcxx_tcsm: TbsSkinDBComboBox;
    bsSkinStdLabel4: TbsSkinStdLabel;
    btn5: TbsSkinButton;
    btn4: TbsSkinButton;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bspngmglst1: TbsPngImageList;
    btnAddAdviser1: TbsSkinSpeedButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsSkinNumericEdit1: TbsSkinNumericEdit;
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnAddAdviser1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    ygbh:string;
    ParmEditorMode:string;
    { Public declarations }
  end;

var
  DivideIntoInfo: TDivideIntoInfo;

implementation
    uses UHDHouseDataModule,UContractInfo,URealtorListForm,Math;
{$R *.dfm}

procedure TDivideIntoInfo.btn5Click(Sender: TObject);
begin
     ContractInfo.qry2.Cancel;
     Close;
end;
 //±£´æ
procedure TDivideIntoInfo.btn4Click(Sender: TObject);
begin
  //ContractInfo.qry2.FieldByName('tcxx_tcje').Value := ContractInfo.qry1.FieldByName('cjxx_tcje').Value;
  ContractInfo.qry2.FieldByName('tcxx_tcje').Value := '100';
  ContractInfo.qry2.FieldByName('tcxx_blmc').Value := bsSkinNumericEdit1.Text+'%';
  ContractInfo.qry2.FieldByName('tcxx_tcbl').Value := StrToInt(bsSkinNumericEdit1.Text)/100;
Close;
end;

procedure TDivideIntoInfo.btnAddAdviser1Click(Sender: TObject);
begin
   RealtorListForm.ygxm := self.edttcxx_bh.Text;
   RealtorListForm.ShowModal;
   self.edttcxx_bh.Text := RealtorListForm.ygxm;
   ContractInfo.qry2.FieldByName('tcxx_ygbh').Value := RealtorListForm.ygbh;
end;
procedure TDivideIntoInfo.FormShow(Sender: TObject);
begin
    bsSkinNumericEdit1.Text:=FloatToStr(StrToFloat(ContractInfo.qry2.FieldByName('tcxx_tcbl').Value*100));
end;

end.
