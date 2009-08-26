unit HouseListFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinExCtrls, ImgList, bsPngImageList,
  IWControl, IWHTMLControls, IdBaseComponent, IdThreadComponent, ExtCtrls,
  bsdbctrls, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinTabs, bsSkinBoxCtrls,
  bsSkinData, BusinessSkinForm;

type
  TframeHouseList = class(TFrame)
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinTabSheet2: TbsSkinTabSheet;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    mmo1: TbsSkinDBMemo;
    mmo2: TbsSkinDBMemo;
    bskndbgrd2: TbsSkinDBGrid;
    bsknfrm1: TbsSkinFrame;
    bskndbgrd1: TbsSkinDBGrid;
    bsSkinDBGrid1: TbsSkinDBGrid;
    bvl1: TBevel;
    Edit1: TEdit;
    lbl1: TbsSkinStdLabel;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    bsSkinButton3: TbsSkinButton;
    bsSkinButton4: TbsSkinButton;
    bsSkinCheckRadioBox1: TbsSkinCheckRadioBox;
    bsSkinCheckRadioBox2: TbsSkinCheckRadioBox;
    bsSkinCheckRadioBox3: TbsSkinCheckRadioBox;
    bsSkinButtonLabel2: TbsSkinButtonLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
