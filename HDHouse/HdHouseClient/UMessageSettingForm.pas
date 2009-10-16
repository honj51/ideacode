unit UMessageSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, bsdbctrls, StdCtrls,
  bsSkinBoxCtrls, Mask;

type
  TMessageSettingForm = class(TForm)
    bsknpnl1: TbsSkinPanel;
    bsknpnl2: TbsSkinPanel;
    bsknlbl1: TbsSkinLabel;
    bsknlbl2: TbsSkinLabel;
    bsknlbl3: TbsSkinLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    mmo1: TbsSkinDBMemo;
    bsknlbl4: TbsSkinLabel;
    bsknlbl5: TbsSkinLabel;
    bsknlbl6: TbsSkinLabel;
    bsknlbl7: TbsSkinLabel;
    cbb1: TbsSkinDBLookupComboBox;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    bsknlbl8: TbsSkinLabel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure edt1ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessageSettingForm: TMessageSettingForm;

implementation
            uses UHDHouseDataModule,URecipientsForm;

{$R *.dfm}

procedure TMessageSettingForm.edt1ButtonClick(Sender: TObject);
begin
       if RecipientsForm= nil  then
      begin
           RecipientsForm:=TRecipientsForm.Create(Self);
      end;
      RecipientsForm.Visible:=False;
      RecipientsForm.ShowModal;
end;

end.
