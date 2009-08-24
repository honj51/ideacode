unit UHouseManageForm;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinShellCtrls,
  bsColorCtrls, bsSkinCtrls, ComCtrls, bsSkinBoxCtrls, bsSkinGrids,
  StdCtrls, bsCalendar, bscalc, Mask, bsButtonGroup, bsCategoryButtons,
  bsSkinExCtrls, bsSkinTabs, UHouseSecureInfoView, UHouseDetailInfoView,
  UCustomerAutoMatchView, UDataOperateBarView;

type
  THouseManageForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    hscrnfvw1: THouseSecureInfoView;
    cstmrtmtchvw1: TCustomerAutoMatchView;
    hsdtlnfvw1: THouseDetailInfoView;
    hslstvw1: THouseListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseManageForm: THouseManageForm;

implementation

uses UHDHouseDataModule;

{$R *.dfm}

end.
