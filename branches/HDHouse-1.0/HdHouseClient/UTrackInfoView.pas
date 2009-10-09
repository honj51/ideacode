unit UTrackInfoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls, Mask, bsdbctrls, ImgList,
  bsPngImageList, DBCtrls, BusinessSkinForm;

type
  TTrackInfoView = class(TFrame)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    mmo2: TbsSkinDBMemo;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinStdLabel6: TbsSkinStdLabel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    dblkcbbgxfs: TDBLookupComboBox;
    cbb1: TbsSkinDBComboBox;
    edt3: TbsSkinDBEdit;
    bspngmglst1: TbsPngImageList;
    edt2: TbsSkinEdit;
    btnAddAdviser1: TbsSkinSpeedButton;
    edt6: TbsSkinDateEdit;
    edt1: TbsSkinDateEdit;
    edt4: TbsSkinTimeEdit;
    edt5: TbsSkinTimeEdit;
    bsSkinFrame1: TbsSkinFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
      uses UHDHouseDataModule;
{$R *.dfm}

end.
