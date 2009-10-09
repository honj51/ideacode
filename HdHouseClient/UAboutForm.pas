unit UAboutForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinExCtrls, StdCtrls, bsSkinCtrls, BusinessSkinForm;

type
  TAboutForm = class(TForm)
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinLinkLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation
         uses UHDHouseDataModule;
{$R *.dfm}

end.
