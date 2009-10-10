unit UElectronicAttendance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls, Mask,
  ExtCtrls, Grids, DBGrids;

type
  TElectronicAttendance = class(TForm)
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinSpeedButton4: TbsSkinSpeedButton;
    bsSkinSpeedButton5: TbsSkinSpeedButton;
    bsSkinSpeedButton6: TbsSkinSpeedButton;
    bsSkinSpeedButton7: TbsSkinSpeedButton;
    bsSkinSpeedButton8: TbsSkinSpeedButton;
    bsSkinSpeedButton9: TbsSkinSpeedButton;
    grp1: TGroupBox;
    img1: TImage;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    bsSkinComboBox1: TbsSkinComboBox;
    bsSkinComboBox2: TbsSkinComboBox;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsSkinComboBox3: TbsSkinComboBox;
    bsSkinComboBox4: TbsSkinComboBox;
    bsSkinEdit1: TbsSkinEdit;
    bsSkinButton1: TbsSkinButton;
    bsSkinToolBar2: TbsSkinToolBar;
    bsSkinSpeedButton10: TbsSkinSpeedButton;
    bsSkinSpeedButton11: TbsSkinSpeedButton;
    bsSkinSpeedButton12: TbsSkinSpeedButton;
    bsSkinSpeedButton13: TbsSkinSpeedButton;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    dbgrd1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ElectronicAttendance: TElectronicAttendance;

implementation
  uses UHDHouseDataModule;
{$R *.dfm}

end.
