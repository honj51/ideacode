unit UTrackInfoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls, Mask, bsdbctrls;

type
  TTrackInfoView = class(TFrame)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    bsknlbl1: TbsSkinLabel;
    bsknlbl2: TbsSkinLabel;
    bsknlbl3: TbsSkinLabel;
    bsknlbl4: TbsSkinLabel;
    bsknlbl5: TbsSkinLabel;
    bsknlbl6: TbsSkinLabel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsknlbl7: TbsSkinLabel;
    cbb1: TbsSkinDBComboBox;
    mmo2: TbsSkinDBMemo;
    edt6: TbsSkinDBDateEdit;
    edt1: TbsSkinDBTimeEdit;
    cbb2: TbsSkinDBComboBox;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBDateEdit;
    edt5: TbsSkinDBTimeEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
