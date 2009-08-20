unit UContractSampleSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids;

type
  TContractSampleSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContractSampleSettingForm: TContractSampleSettingForm;

implementation

{$R *.dfm}

end.
