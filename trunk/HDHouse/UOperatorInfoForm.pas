unit UOperatorInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsdbctrls, StdCtrls, Mask, bsSkinCtrls;

type
  TOperatorInfoForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    edt3: TbsSkinEdit;
    edt4: TbsSkinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperatorInfoForm: TOperatorInfoForm;

implementation

{$R *.dfm}

end.
