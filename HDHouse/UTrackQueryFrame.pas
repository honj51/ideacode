unit UTrackQueryFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsSkinCtrls, bsSkinGrids,
  bsDBGrids;

type
  TTrackQueryFrame = class(TFrame)
    edt1: TbsSkinDateEdit;
    lbl3: TLabel;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinDateEdit;
    edt4: TbsSkinDateEdit;
    edt5: TbsSkinDateEdit;
    edt6: TbsSkinEdit;
    btn1: TbsSkinButtonLabel;
    btn2: TbsSkinButtonLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsSkinDBGrid1: TbsSkinDBGrid;
    lbl1: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
