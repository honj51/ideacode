unit UHouseDealManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, bsSkinTabs, bsSkinCtrls, UHouseListView, ImgList,
  bsPngImageList, UInHouseListView, UHouseSecureInfoView,
  UHouseDetailInfoView, UTrackRecordView, UDealHouseListView,
  UContractQueryFrame;

type
  THouseDealManageForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht3: TbsSkinTabSheet;
    bskntbsht4: TbsSkinTabSheet;
    bskntbsht5: TbsSkinTabSheet;
    trckrcrdvw1: TTrackRecordView;
    hsdtlnfvw1: THouseDetailInfoView;
    hscrnfvw1: THouseSecureInfoView;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    cntrctqryfrm1: TContractQueryFrame;
    dlhslstvw1: TDealHouseListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseDealManageForm: THouseDealManageForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
