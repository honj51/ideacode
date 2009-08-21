unit UContractQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseSecureInfoView, UHouseDetailInfoView, UTrackRecordView,
  ComCtrls, bsSkinTabs, UContractQueryFrame, bsSkinCtrls, bsSkinGrids,
  bsDBGrids;

type
  TContractQueryForm = class(TForm)
    btn6: TbsSkinSpeedButton;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    cntrctqryfrm1: TContractQueryFrame;
    bsknpgcntrl2: TbsSkinPageControl;
    bskntbsht4: TbsSkinTabSheet;
    hsdtlnfvw1: THouseDetailInfoView;
    bskntbsht5: TbsSkinTabSheet;
    hscrnfvw1: THouseSecureInfoView;
    bskntbsht1: TbsSkinTabSheet;
    bskndbgrd1: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContractQueryForm: TContractQueryForm;

implementation

{$R *.dfm}

end.
