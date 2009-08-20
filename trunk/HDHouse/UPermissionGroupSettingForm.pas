unit UPermissionGroupSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls;

type
  TPermissionGroupSettingForm = class(TForm)
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    bskngrpbx1: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    tv1: TbsSkinTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PermissionGroupSettingForm: TPermissionGroupSettingForm;

implementation

{$R *.dfm}

end.
