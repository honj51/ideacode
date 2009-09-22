unit UTrackRecordView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, bsPngImageList, bsSkinCtrls, bsSkinGrids, bsDBGrids,
  BusinessSkinForm;

type
  TTrackRecordView = class(TFrame)
    bskntlbr1: TbsSkinToolBar;
    bskndbgrd1: TbsSkinDBGrid;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    bspngmglst24: TbsPngImageList;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    bsSkinFrame1: TbsSkinFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
    uses UHDHouseDataModule;
{$R *.dfm}

end.
