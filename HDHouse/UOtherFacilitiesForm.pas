unit UOtherFacilitiesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsSkinData, BusinessSkinForm, bsSkinCtrls;

type
  TOtherFacilitiesForm = class(TForm)
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bskndt1: TbsSkinData;
    lst1: TbsSkinCheckListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OtherFacilitiesForm: TOtherFacilitiesForm;

implementation

{$R *.dfm}

end.
