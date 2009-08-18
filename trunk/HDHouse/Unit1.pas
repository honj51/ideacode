unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, BusinessSkinForm, bsSkinData, bsSkinGrids,
  bsDBGrids;

type
  TFrame1 = class(TFrame)
    btn1: TbsSkinButton;
    bsknlbl1: TbsSkinLabel;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    bsSkinData1: TbsSkinData;
    bsknfrm1: TbsSkinFrame;
    bskndbgrd1: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
