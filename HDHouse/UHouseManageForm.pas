unit UHouseManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDataOperatoBarView, UHouseListView, bsSkinShellCtrls,
  bsColorCtrls, bsSkinCtrls, ComCtrls, bsSkinBoxCtrls, bsSkinGrids,
  StdCtrls, bsCalendar, bscalc, Mask, bsButtonGroup, bsCategoryButtons,
  bsSkinExCtrls, bsSkinTabs, UHouseSecureInfoView, UHouseDetailInfoView,
  UCustomerAutoMatchView;

type
  THouseManageForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    hslstvw1: THouseListView;
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    hscrnfvw1: THouseSecureInfoView;
    cstmrtmtchvw1: TCustomerAutoMatchView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseManageForm: THouseManageForm;

implementation

{$R *.dfm}

end.
