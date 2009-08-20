unit UOperatePermissionSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls;

type
  TOperatePermissionSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    bskndbgrd1: TbsSkinDBGrid;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bskndbgrd2: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    btn4: TbsSkinButton;
    btn5: TbsSkinButton;
    btn6: TbsSkinButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperatePermissionSettingForm: TOperatePermissionSettingForm;

implementation

{$R *.dfm}

end.
