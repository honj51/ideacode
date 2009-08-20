unit UDatabaseMantainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  ComCtrls, bsSkinTabs;

type
  TDatabaseMantainForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    bskntbsht4: TbsSkinTabSheet;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    btn1: TbsSkinButton;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht5: TbsSkinTabSheet;
    lbl2: TbsSkinStdLabel;
    btn2: TbsSkinButton;
    bskntbsht6: TbsSkinTabSheet;
    bskntbsht7: TbsSkinTabSheet;
    bskntbsht8: TbsSkinTabSheet;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    edt2: TbsSkinEdit;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
    btn3: TbsSkinButton;
    lbl10: TbsSkinStdLabel;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    lbl13: TbsSkinStdLabel;
    btn4: TbsSkinButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseMantainForm: TDatabaseMantainForm;

implementation

{$R *.dfm}

end.
