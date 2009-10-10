unit UElectronicAttendanceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxpngimage, ExtCtrls, bsdbctrls, bsSkinBoxCtrls, StdCtrls,
  DBCtrls, bsSkinCtrls, Mask, BusinessSkinForm;

type
  TElectronicAttendanceInof = class(TForm)
    grp1: TGroupBox;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    lbl5: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    bsSkinDBComboBox1: TbsSkinDBComboBox;
    bsSkinDBComboBox2: TbsSkinDBComboBox;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDBEdit1: TbsSkinDBEdit;
    bsSkinDBComboBox3: TbsSkinDBComboBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    dbmmo1: TDBMemo;
    bsSkinDBTimeEdit1: TbsSkinDBTimeEdit;
    bsSkinDBTimeEdit2: TbsSkinDBTimeEdit;
    bsSkinDBDateEdit1: TbsSkinDBDateEdit;
    bsSkinDBDateEdit2: TbsSkinDBDateEdit;
    img1: TImage;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ElectronicAttendanceInof: TElectronicAttendanceInof;

implementation
   uses UHDHouseDataModule;
{$R *.dfm}

end.
