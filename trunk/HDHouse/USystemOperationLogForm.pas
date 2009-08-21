unit USystemOperationLogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsSkinGrids,
  bsDBGrids, BusinessSkinForm;

type
  TSystemOperationLogForm = class(TForm)
    bskndbgrd1: TbsSkinDBGrid;
    bsknpnl1: TbsSkinPanel;
    edt1: TbsSkinDateEdit;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edt2: TbsSkinDateEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemOperationLogForm: TSystemOperationLogForm;

implementation
      uses UHDHouseDataModule;
{$R *.dfm}

end.
