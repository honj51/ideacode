unit UStatisticForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinCtrls, bsSkinShellCtrls, bsSkinGrids, bsDBGrids,
  StdCtrls, Mask, bsSkinBoxCtrls, ExtCtrls, TeeProcs, TeEngine, Chart;

type
  TStatisticForm = class(TForm)
    GroupBox1: TGroupBox;
    grp1: TGroupBox;
    btn3: TbsSkinButtonLabel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinDateEdit1: TbsSkinDateEdit;
    lbl10: TbsSkinStdLabel;
    bsSkinDateEdit2: TbsSkinDateEdit;
    btn4: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    cht1: TChart;
    tv1: TbsSkinTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatisticForm: TStatisticForm;

implementation

{$R *.dfm}

end.
