unit UOperatePermissionSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, BusinessSkinForm;

type
  TOperatePermissionSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    btn4: TbsSkinButton;
    btn5: TbsSkinButton;
    btn6: TbsSkinButton;
    bsknpnl1: TbsSkinPanel;
    bskndbgrd2: TbsSkinDBGrid;
    bsknscrlbr3: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknpnl2: TbsSkinPanel;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr4: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperatePermissionSettingForm: TOperatePermissionSettingForm;

implementation
     uses UHDHouseDataModule;
{$R *.dfm}

end.
