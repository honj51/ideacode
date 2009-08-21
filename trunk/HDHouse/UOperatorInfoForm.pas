unit UOperatorInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsdbctrls, StdCtrls, Mask, bsSkinCtrls,
  BusinessSkinForm;

type
  TOperatorInfoForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    edt3: TbsSkinEdit;
    edt4: TbsSkinEdit;
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
  OperatorInfoForm: TOperatorInfoForm;

implementation
          uses UHDHouseDataModule;
{$R *.dfm}

procedure TOperatorInfoForm.btn2Click(Sender: TObject);
begin
OperatorInfoForm.Close;
end;

end.
