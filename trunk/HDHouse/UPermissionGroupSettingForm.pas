unit UPermissionGroupSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  BusinessSkinForm;

type
  TPermissionGroupSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    tv1: TbsSkinTreeView;
    bsknpnl1: TbsSkinPanel;
    edt1: TbsSkinEdit;
    lbl1: TbsSkinStdLabel;
    bsknpnl2: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PermissionGroupSettingForm: TPermissionGroupSettingForm;

implementation
      uses UHDHouseDataModule;
{$R *.dfm}

end.
