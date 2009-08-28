unit UCustomerDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseAutoMatchView, UCustomerSecureInfoView,
  UDetailRequirementInfoView, UCustomerListView, ComCtrls, bsSkinTabs,
  UDataOperateBarView;

type
  TCustomerDetailsForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerDetailsForm: TCustomerDetailsForm;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
