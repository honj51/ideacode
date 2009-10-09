unit UMortgageCalculatorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ShockwaveFlashObjects_TLB, BusinessSkinForm;

type
  TMortgageCalculatorForm = class(TForm)
    shckwvflsh1: TShockwaveFlash;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MortgageCalculatorForm: TMortgageCalculatorForm;

implementation
uses
  UHDHouseDataModule;
{$R *.dfm}

end.
