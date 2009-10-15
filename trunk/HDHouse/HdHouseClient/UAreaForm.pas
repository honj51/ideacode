unit UAreaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm;

type
  TAreaForm = class(TForm)
    grp1: TGroupBox;
    bsknpnl1: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AreaForm: TAreaForm;

implementation
             uses UHDHouseDataModule;
{$R *.dfm}

end.
