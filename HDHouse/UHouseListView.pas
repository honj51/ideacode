unit UHouseListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, StdCtrls,
  bsSkinGrids, bsDBGrids, ExtCtrls;

type
  THouseListView = class(TFrame)
    bskndbgrd1: TbsSkinDBGrid;
    btn1: TbsSkinButtonLabel;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    btn2: TbsSkinButton;
    bvl1: TBevel;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    edt2: TbsSkinMaskEdit;
    edt1: TbsSkinMaskEdit;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
