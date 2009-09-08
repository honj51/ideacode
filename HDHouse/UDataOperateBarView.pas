unit UDataOperateBarView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, bsPngImageList, bsSkinCtrls, BusinessSkinForm;

type
  TDataOperateBarView = class(TFrame)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    bsknfrm1: TbsSkinFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

end.
