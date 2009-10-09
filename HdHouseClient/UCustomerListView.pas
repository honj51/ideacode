unit UCustomerListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, StdCtrls,
  bsSkinGrids, bsDBGrids, ExtCtrls, BusinessSkinForm;

type
  TCustomerListView = class(TFrame)
    bvl1: TBevel;
    bsknpnl1: TbsSkinPanel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    edtCustomerSearch: TEdit;
    btn1: TbsSkinButtonLabel;
    btn2: TbsSkinButton;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsknpnl2: TbsSkinPanel;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbrCustomerDown: TbsSkinScrollBar;
    bsknscrlbrCustomerRight: TbsSkinScrollBar;
    edtDate: TbsSkinNumericEdit;
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
