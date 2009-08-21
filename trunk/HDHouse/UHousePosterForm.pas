unit UHousePosterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinGrids, bsDBGrids, bsSkinCtrls, StdCtrls, Mask,
  bsSkinBoxCtrls, bsdbctrls, ComCtrls;

type
  THousePosterForm = class(TForm)
    bsknpnl1: TbsSkinPanel;
    tv1: TbsSkinTreeView;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    btn6: TbsSkinSpeedButton;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    bsSkinStdLabel1: TbsSkinStdLabel;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    bsSkinStdLabel2: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    btn4: TbsSkinButtonLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bvl1: TBevel;
    bskngrpbx1: TbsSkinGroupBox;
    bsknscrlbr3: TbsSkinScrollBar;
    bskndbgrd1: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HousePosterForm: THousePosterForm;

implementation

{$R *.dfm}

end.
