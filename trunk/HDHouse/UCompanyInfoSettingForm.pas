unit UCompanyInfoSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls;

type
  TCompanyInfoSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CompanyInfoSettingForm: TCompanyInfoSettingForm;

implementation

{$R *.dfm}

end.
