unit UHouseTrackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContractQueryFrame, UHouseSecureInfoView, UHouseDetailInfoView,
  UTrackRecordView, UHouseListView, UDealHouseListView, ComCtrls,
  bsSkinTabs;

type
  THouseTrackForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    dlhslstvwinhslstvw1: TDealHouseListView;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht3: TbsSkinTabSheet;
    trckrcrdvw1: TTrackRecordView;
    bskntbsht4: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    bskntbsht5: TbsSkinTabSheet;
    hscrnfvw1: THouseSecureInfoView;
    cntrctqryfrm1: TContractQueryFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseTrackForm: THouseTrackForm;

implementation

{$R *.dfm}

end.
