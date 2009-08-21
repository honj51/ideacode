unit UBaseFacilitiesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsSkinData, BusinessSkinForm, bsSkinCtrls;

type
  TBaseFacilitiesForm = class(TForm)
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
  BaseFacilitiesForm: TBaseFacilitiesForm;

implementation

{$R *.dfm}

end.
