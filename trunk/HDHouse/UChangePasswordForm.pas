unit UChangePasswordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls;

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
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePasswordForm: TChangePasswordForm;

implementation

{$R *.dfm}

end.
