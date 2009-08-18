unit HouseListFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinExCtrls, ImgList, bsPngImageList,
  IWControl, IWHTMLControls, IdBaseComponent, IdThreadComponent, ExtCtrls,
  bsdbctrls, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinTabs, bsSkinBoxCtrls;

type
  TframeHouseList = class(TFrame)
    Edit1: TEdit;
    Label1: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
