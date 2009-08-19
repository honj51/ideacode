unit UCustomerListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, StdCtrls,
  bsSkinGrids, bsDBGrids, ExtCtrls;

type
  TCustomerListView = class(TFrame)
    btn1: TbsSkinButtonLabel;
    bvl1: TBevel;
    bskndbgrd1: TbsSkinDBGrid;
    edt1: TEdit;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    btn2: TbsSkinButton;
    edt2: TbsSkinDBEdit;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
