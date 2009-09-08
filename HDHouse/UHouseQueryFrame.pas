unit UHouseQueryFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, ExtCtrls,
  bsSkinExCtrls, BusinessSkinForm;

type
  THouseQueryFrame = class(TFrame)
    btn1: TbsSkinXFormButton;
    btn2: TbsSkinXFormButton;
    bsSkinFrame1: TbsSkinFrame;
    bskngrpbx1: TbsSkinGroupBox;
    lbl14: TbsSkinStdLabel;
    cbb5: TbsSkinComboBox;
    lbl1: TbsSkinStdLabel;
    cbb6: TbsSkinComboBox;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    cbb4: TbsSkinComboBox;
    cbb3: TbsSkinComboBox;
    lbl7: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    cbb2: TbsSkinComboBox;
    cbb1: TbsSkinComboBox;
    lbl5: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    edt5: TbsSkinEdit;
    edt6: TbsSkinEdit;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    bvl1: TBevel;
    edt1: TbsSkinNumericEdit;
    edt2: TbsSkinNumericEdit;
    edt3: TbsSkinNumericEdit;
    edt4: TbsSkinNumericEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

end.
