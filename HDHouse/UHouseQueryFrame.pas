unit UHouseQueryFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, ExtCtrls,
  bsSkinExCtrls;

type
  THouseQueryFrame = class(TFrame)
    GroupBox1: TGroupBox;
    edt1: TbsSkinEdit;
    edt2: TbsSkinEdit;
    edt3: TbsSkinEdit;
    edt4: TbsSkinEdit;
    bvl1: TBevel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    edt5: TbsSkinEdit;
    edt6: TbsSkinEdit;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    lbl14: TbsSkinStdLabel;
    btn1: TbsSkinXFormButton;
    btn2: TbsSkinXFormButton;
    cbb5: TbsSkinComboBox;
    cbb6: TbsSkinComboBox;
    cbb1: TbsSkinComboBox;
    cbb2: TbsSkinComboBox;
    cbb3: TbsSkinComboBox;
    cbb4: TbsSkinComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
