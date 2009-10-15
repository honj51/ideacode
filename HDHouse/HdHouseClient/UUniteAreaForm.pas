unit UUniteAreaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinGrids, bsDBGrids, Mask,
  bsSkinBoxCtrls, bsdbctrls, BusinessSkinForm;

type
  TUniteAreaForm = class(TForm)
    bsknpnl1: TbsSkinPanel;
    grp1: TGroupBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    bskndbgrd1: TbsSkinDBGrid;
    bsknpnl2: TbsSkinPanel;
    bsknscrlbr1: TbsSkinScrollBar;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    bsknpnl3: TbsSkinPanel;
    bskndbgrd2: TbsSkinDBGrid;
    bsknscrlbr2: TbsSkinScrollBar;
    bskndbgrd3: TbsSkinDBGrid;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UniteAreaForm: TUniteAreaForm;

implementation
            uses UHDHouseDataModule;
{$R *.dfm}

end.
