unit UBusinessQA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, Grids, DBGrids, bsSkinCtrls, bsSkinBoxCtrls,
  StdCtrls, Mask, ExtCtrls;

type
  TBusinessQA = class(TForm)
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
    img1: TImage;
    lbl1: TbsSkinStdLabel;
    bsSkinComboBox1: TbsSkinComboBox;
    lbl2: TbsSkinStdLabel;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    bsSkinEdit1: TbsSkinEdit;
    bsSkinButton1: TbsSkinButton;
    lbl3: TbsSkinStdLabel;
    dbgrd1: TDBGrid;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BusinessQA: TBusinessQA;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

end.
