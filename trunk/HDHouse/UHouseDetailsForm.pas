unit UHouseDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinExCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  ComCtrls, bsSkinTabs, BusinessSkinForm, bsdbctrls, bsSkinData, ImgList,
  bsPngImageList;

type
  THouseDetailsForm = class(TForm)
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbsht12: TbsSkinTabSheet;
    bskntbshtEditsTabSheet: TbsSkinTabSheet;
    GroupBox: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnAddAdviser: TbsSkinSpeedButton;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    Label1: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bskndt1: TbsSkinData;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
    edt6: TbsSkinDBEdit;
    edt7: TbsSkinDBEdit;
    edt8: TbsSkinDBEdit;
    edt9: TbsSkinDBEdit;
    edt10: TbsSkinDBEdit;
    lbl23: TLabel;
    btnAddAdviser1: TbsSkinSpeedButton;
    btnAddAdviser2: TbsSkinSpeedButton;
    edt11: TbsSkinDBEdit;
    bsSkinDBComboBox1: TbsSkinDBComboBox;
    bsSkinDBComboBox2: TbsSkinDBComboBox;
    bsSkinDBComboBox3: TbsSkinDBComboBox;
    bsSkinDBComboBox4: TbsSkinDBComboBox;
    bsSkinDBComboBox5: TbsSkinDBComboBox;
    bsSkinDBComboBox6: TbsSkinDBComboBox;
    edt12: TbsSkinDBEdit;
    edt13: TbsSkinDBEdit;
    edt14: TbsSkinDBEdit;
    edt15: TbsSkinDBEdit;
    grp1: TGroupBox;
    bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox;
    lbl24: TLabel;
    edt16: TbsSkinDBEdit;
    edt17: TbsSkinDBEdit;
    lbl26: TLabel;
    lbl27: TLabel;
    edt18: TbsSkinDBEdit;
    edt19: TbsSkinDBEdit;
    lbl28: TLabel;
    lbl29: TLabel;
    bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox;
    grp2: TGroupBox;
    lbl25: TLabel;
    txtHouseInfo: TbsSkinDBMemo;
    bsPngImageList1: TbsPngImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HouseDetailsForm: THouseDetailsForm;

implementation

{$R *.dfm}

end.
