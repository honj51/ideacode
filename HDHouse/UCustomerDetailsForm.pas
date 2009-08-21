unit UCustomerDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseAutoMatchView, UCustomerSecureInfoView,
  UDetailRequirementInfoView, UCustomerListView, ComCtrls, bsSkinTabs,
  UDataOperatoBarView;

type
  TCustomerDetailsForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    cstmrlstvw1: TCustomerListView;
    DetailRequirementInfoView1: TDetailRequirementInfoView;
    CustomerSecureInfoView1: TCustomerSecureInfoView;
    HouseAutoMatchView1: THouseAutoMatchView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerDetailsForm: TCustomerDetailsForm;

implementation

{$R *.dfm}

end.
