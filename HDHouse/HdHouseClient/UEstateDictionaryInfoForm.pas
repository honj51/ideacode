unit UEstateDictionaryInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, ComCtrls, bsSkinTabs, bsdbctrls,
  bsSkinBoxCtrls, Mask, BusinessSkinForm;

type
  TEstateDictionaryInfoForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bsknpntpnl1: TbsSkinPaintPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    grp1: TGroupBox;
    grp4: TGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
    edt6: TbsSkinDBEdit;
    edt7: TbsSkinDBEdit;
    cbb4: TbsSkinComboBox;
    cbb5: TbsSkinComboBox;
    cbb1: TbsSkinDBComboBox;
    cbb3: TbsSkinDBComboBox;
    edt8: TbsSkinCurrencyEdit;
    edt9: TbsSkinCurrencyEdit;
    lbl13: TbsSkinStdLabel;
    lbl14: TbsSkinStdLabel;
    mmo1: TbsSkinMemo;
    lbl15: TbsSkinStdLabel;
    lbl16: TbsSkinStdLabel;
    lbl17: TbsSkinStdLabel;
    lbl18: TbsSkinStdLabel;
    lbl19: TbsSkinStdLabel;
    lbl20: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    bsknchckrdbx5: TbsSkinCheckRadioBox;
    bsknchckrdbx6: TbsSkinCheckRadioBox;
    edt10: TbsSkinEdit;
    lbl21: TbsSkinStdLabel;
    cbb2: TbsSkinDBComboBox;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstateDictionaryInfoForm: TEstateDictionaryInfoForm;

implementation
             uses UHDHouseDataModule;

{$R *.dfm}

end.
