unit UCustomeStatisticrQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bscalc, StdCtrls, Mask, bsSkinBoxCtrls, bsSkinCtrls, ExtCtrls,
  UHouseDetailInfoView, UCustomerSecureInfoView, ComCtrls, bsSkinTabs,
  bsdbctrls, bsSkinGrids, bsDBGrids;

type
  THouseStatisticQueryForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bskntbsht1: TbsSkinTabSheet;
    cstmrscrnfvw1: TCustomerSecureInfoView;
    hsdtlnfvw1: THouseDetailInfoView;
    bvl1: TBevel;
    lbl1: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    lbl2: TbsSkinStdLabel;
    cbb1: TbsSkinDBComboBox;
    lbl3: TbsSkinStdLabel;
    cbb2: TbsSkinDBComboBox;
    lbl4: TbsSkinStdLabel;
    cbb3: TbsSkinDBComboBox;
    lbl5: TbsSkinStdLabel;
    edt3: TbsSkinEdit;
    btn3: TbsSkinButtonLabel;
    btn4: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    btn5: TbsSkinButton;
    btn2: TbsSkinButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseStatisticQueryForm: THouseStatisticQueryForm;

implementation

{$R *.dfm}

end.
