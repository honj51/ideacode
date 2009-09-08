unit UCustomerListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  bsSkinGrids, bsDBGrids;

type
  TCustomerListForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskndbgrd1: TbsSkinDBGrid;
    bsSkinStdLabel1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    btn5: TbsSkinButton;
    btn4: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure edt1Change(Sender: TObject);
  private
    { Private declarations }
  public
     strFilter,looktest : string;
    { Public declarations }
  end;

var
  CustomerListForm: TCustomerListForm;

implementation
     uses UHDHouseDataModule,UContractInfo;
{$R *.dfm}

procedure TCustomerListForm.btn4Click(Sender: TObject);
begin
  self.ModalResult := mrOK;

end;

procedure TCustomerListForm.btn5Click(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TCustomerListForm.bskndbgrd1DblClick(Sender: TObject);
begin
   btn4Click(Sender);
end;
 //文本改变
procedure TCustomerListForm.edt1Change(Sender: TObject);
begin
      ContractInfo.qrykhzy.Close;
      ContractInfo.qrykhzy.SQL.Clear;
      strFilter := 'select * from khzy ';
      if  trim(self.edt1.Text) <>'' then
      begin
         strFilter := strFilter +' where ';
         looktest:= self.edt1.Text;
         strFilter := strFilter + ' (khzy_bh like '+'''%'+looktest+'%'')'+' OR ';
         strFilter := strFilter + ' (khzy_dqzt like '+'''%'+looktest+'%'')'+' OR ';
         strFilter := strFilter + ' (khzy_fwly like '+'''%'+looktest+'%'')'+' OR ';
         strFilter := strFilter + ' (khzy_jtwz like '+'''%'+looktest+'%'')'+' OR ';
         strFilter := strFilter + ' (khzy_yzxm like '+'''%'+looktest+'%'')';
      end;
       ContractInfo.qrykhzy.SQL.Add(strFilter);
       ContractInfo.qrykhzy.Open;
end;

end.
