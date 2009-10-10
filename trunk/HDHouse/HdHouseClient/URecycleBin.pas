unit URecycleBin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, StdCtrls, bsSkinCtrls, bsSkinBoxCtrls, Mask,
  ExtCtrls, bsSkinGrids, bsDBGrids, ComCtrls;

type
  TRecycleBin = class(TForm)
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinSpeedButton4: TbsSkinSpeedButton;
    bsSkinSpeedButton5: TbsSkinSpeedButton;
    bsSkinSpeedButton6: TbsSkinSpeedButton;
    bsSkinSpeedButton7: TbsSkinSpeedButton;
    bsSkinSpeedButton8: TbsSkinSpeedButton;
    grp1: TGroupBox;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    img1: TImage;
    lbl1: TbsSkinStdLabel;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    lbl2: TbsSkinStdLabel;
    bsSkinEdit1: TbsSkinEdit;
    bsSkinMenuButton1: TbsSkinMenuButton;
    bsSkinTreeView1: TbsSkinTreeView;
    bsSkinDBGrid1: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecycleBin: TRecycleBin;

implementation
   uses  UHDHouseDataModule;
{$R *.dfm}

end.
