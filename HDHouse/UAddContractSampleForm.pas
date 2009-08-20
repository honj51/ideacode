unit UAddContractSampleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls;

type
  TAddContractSampleForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddContractSampleForm: TAddContractSampleForm;

implementation

{$R *.dfm}

end.
