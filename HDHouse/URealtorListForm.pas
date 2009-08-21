unit URealtorListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinExCtrls, bsSkinGrids, bsDBGrids, StdCtrls,
  bsSkinData, BusinessSkinForm;

type
  TRealtorListForm = class(TForm)
    grp1: TGroupBox;
    bsSkinDBGrid1: TbsSkinDBGrid;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bskndt1: TbsSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RealtorListForm: TRealtorListForm;

implementation

{$R *.dfm}

end.
