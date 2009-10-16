unit URecipientsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, BusinessSkinForm, bsSkinBoxCtrls, bsdbctrls,
  StdCtrls;

type
  TRecipientsForm = class(TForm)
    bsknpnl2: TbsSkinPanel;
    grp1: TGroupBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    cbb3: TbsSkinDBComboBox;
    cbb4: TbsSkinDBComboBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecipientsForm: TRecipientsForm;

implementation
              uses UHDHouseDataModule;
{$R *.dfm}

end.
