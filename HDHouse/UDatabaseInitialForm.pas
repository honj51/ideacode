unit UDatabaseInitialForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, StdCtrls, Mask, bsSkinCtrls;

type
  TDatabaseInitialForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    bsknchckrdbx5: TbsSkinCheckRadioBox;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinTimeEdit;
    edt4: TbsSkinTimeEdit;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseInitialForm: TDatabaseInitialForm;

implementation

{$R *.dfm}

end.
