unit UParametersSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, ComCtrls;

type
  TParametersSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    tv1: TbsSkinTreeView;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParametersSettingForm: TParametersSettingForm;

implementation

{$R *.dfm}

end.
