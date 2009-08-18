unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit1, BusinessSkinForm, bsSkinData;

type
  TForm1 = class(TForm)
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
