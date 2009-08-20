unit UEmployeeInfoFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  bsSkinExCtrls;

type
  TEmployeeInfoFrame = class(TFrame)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    btn1: TbsSkinXFormButton;
    btn2: TbsSkinXFormButton;
    mmo1: TbsSkinDBMemo;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
    edt6: TbsSkinDBEdit;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    cbb3: TbsSkinDBComboBox;
    edt7: TbsSkinDBDateEdit;
    edt9: TbsSkinDBDateEdit;
    lbl10: TbsSkinStdLabel;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    lbl13: TbsSkinStdLabel;
    lbl14: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl15: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
