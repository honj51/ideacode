unit UContractQueryFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, StdCtrls, bsSkinBoxCtrls,
  bsdbctrls, Mask, ExtCtrls, BusinessSkinForm;

type
  TContractQueryFrame = class(TFrame)
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    btn1: TbsSkinButtonLabel;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bvl1: TBevel;
    edtBeginDate: TbsSkinDateEdit;
    edtEndDate: TbsSkinDateEdit;
    edtSearch: TbsSkinMaskEdit;
    bsSkinFrame1: TbsSkinFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

end.
