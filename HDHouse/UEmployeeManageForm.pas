unit UEmployeeManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, UDataOperateBarView, bsSkinGrids,
  bsDBGrids, Mask, bsSkinBoxCtrls, BusinessSkinForm;

type
  TEmployeeManageForm = class(TForm)
    bskndbgrd1: TbsSkinDBGrid;
    bskntlbr1: TbsSkinToolBar;
    edt1: TbsSkinEdit;
    lbl1: TbsSkinStdLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknscrlbr1: TbsSkinScrollBar;
    dtprtbrvw1: TDataOperateBarView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeeManageForm: TEmployeeManageForm;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

end.
