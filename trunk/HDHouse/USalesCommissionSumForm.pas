unit USalesCommissionSumForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls,
  Mask, ExtCtrls;

type
  TSalesCommissionSumForm = class(TForm)
    bvl1: TBevel;
    lbl1: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    btn3: TbsSkinButtonLabel;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn4: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
    bskndbgrd2: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesCommissionSumForm: TSalesCommissionSumForm;

implementation

{$R *.dfm}

end.
