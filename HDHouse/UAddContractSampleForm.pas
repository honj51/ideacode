unit UAddContractSampleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls,
  BusinessSkinForm;

type
  TAddContractSampleForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddContractSampleForm: TAddContractSampleForm;

implementation
       uses UHDHouseDataModule;
{$R *.dfm}

procedure TAddContractSampleForm.btn2Click(Sender: TObject);
begin
AddContractSampleForm.Close;
end;

end.
