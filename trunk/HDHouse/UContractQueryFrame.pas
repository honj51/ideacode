unit UContractQueryFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, StdCtrls, bsSkinBoxCtrls,
  bsdbctrls, Mask, ExtCtrls;

type
  TContractQueryFrame = class(TFrame)
    edt1: TbsSkinDBEdit;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    btn1: TbsSkinButtonLabel;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bvl1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
