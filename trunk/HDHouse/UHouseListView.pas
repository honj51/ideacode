unit UHouseListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, StdCtrls,
  bsSkinGrids, bsDBGrids, ExtCtrls;

type
  THouseListView = class(TFrame)
    bskndbgrd1: TbsSkinDBGrid;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TbsSkinButtonLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    btn2: TbsSkinButton;
    edt2: TbsSkinDBEdit;
    lbl2: TLabel;
    bvl1: TBevel;
    bsknscrlbr1: TbsSkinScrollBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
