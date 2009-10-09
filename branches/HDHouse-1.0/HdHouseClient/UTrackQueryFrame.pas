unit UTrackQueryFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsSkinCtrls, bsSkinGrids,
  bsDBGrids, BusinessSkinForm;

type
  TTrackQueryFrame = class(TFrame)
    bsknpnl1: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinDateEdit;
    lbl3: TLabel;
    lbl4: TbsSkinStdLabel;
    edt6: TbsSkinEdit;
    btn1: TbsSkinButtonLabel;
    edt5: TbsSkinDateEdit;
    btn2: TbsSkinButtonLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknfrm1: TbsSkinFrame;
    bskndbgrd1: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
       uses UHDHouseDataModule;
{$R *.dfm}

end.
