unit UTrackQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTrackQueryFrame, ComCtrls, bsSkinTabs, BusinessSkinForm;

type
  TTrackQueryForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    trckqryfrm1: TTrackQueryFrame;
    trckqryfrm2: TTrackQueryFrame;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrackQueryForm: TTrackQueryForm;

implementation
         uses UHDHouseDataModule;
{$R *.dfm}

end.
