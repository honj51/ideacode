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
    Edit1: TEdit;
    bsSkinButtonLabel2: TbsSkinButtonLabel;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    bsSkinButton3: TbsSkinButton;
    bsSkinButton4: TbsSkinButton;
    bvl1: TBevel;
    bsSkinCheckRadioBox1: TbsSkinCheckRadioBox;
    bsSkinCheckRadioBox2: TbsSkinCheckRadioBox;
    bsSkinCheckRadioBox3: TbsSkinCheckRadioBox;
    bsSkinDBGrid1: TbsSkinDBGrid;
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinTabSheet2: TbsSkinTabSheet;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    mmo1: TbsSkinDBMemo;
    mmo2: TbsSkinDBMemo;
    bskndbgrd1: TbsSkinDBGrid;
    bskndbgrd2: TbsSkinDBGrid;
    bsknfrm1: TbsSkinFrame;
    bsSkinData1: TbsSkinData;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    lbl1: TbsSkinStdLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
