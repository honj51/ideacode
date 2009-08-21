unit UChangePasswordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm;

type
  TChangePasswordForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinEdit;
    edt3: TbsSkinEdit;
    edt4: TbsSkinEdit;
    bsknpnl1: TbsSkinPanel;
    btn2: TbsSkinButton;
    btn1: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePasswordForm: TChangePasswordForm;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

procedure TChangePasswordForm.btn2Click(Sender: TObject);
begin
ChangePasswordForm.Close;
end;

end.
