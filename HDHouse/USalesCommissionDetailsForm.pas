unit USalesCommissionDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls, StdCtrls,
  Mask, UCustomerSecureInfoView, UHouseDetailInfoView, ComCtrls,
  bsSkinTabs, ExtCtrls;

type
  TSalesCommissionDetailsForm = class(TForm)
    bvl1: TBevel;
    lbl1: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    btn3: TbsSkinButtonLabel;
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    bskntbsht1: TbsSkinTabSheet;
    cstmrscrnfvw1: TCustomerSecureInfoView;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn4: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bskntbsht2: TbsSkinTabSheet;
    bskndbgrd2: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesCommissionDetailsForm: TSalesCommissionDetailsForm;

implementation

{$R *.dfm}

end.
