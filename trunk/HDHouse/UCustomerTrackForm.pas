unit UCustomerTrackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContractQueryFrame, UTrackRecordView, UCustomerSecureInfoView,
  UDetailRequirementInfoView, UCustomerListView, ComCtrls, bsSkinTabs;

type
  TCustomerTrackForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    cstmrlstvw1: TCustomerListView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht4: TbsSkinTabSheet;
    DetailRequirementInfoView1: TDetailRequirementInfoView;
    bskntbsht5: TbsSkinTabSheet;
    CustomerSecureInfoView1: TCustomerSecureInfoView;
    bskntbsht3: TbsSkinTabSheet;
    trckrcrdvw1: TTrackRecordView;
    cntrctqryfrm1: TContractQueryFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerTrackForm: TCustomerTrackForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
