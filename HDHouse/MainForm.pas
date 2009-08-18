unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit1, BusinessSkinForm, bsSkinData, StdCtrls, bsSkinCtrls,
  ImgList, bsPngImageList, ComCtrls, bsSkinTabs, HouseListFrame;

type
  TformMain = class(TForm)
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

end.
