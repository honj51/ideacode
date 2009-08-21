unit UDatabaseInitialForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, StdCtrls, Mask, bsSkinCtrls, BusinessSkinForm;

type
  TDatabaseInitialForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    bsknchckrdbx5: TbsSkinCheckRadioBox;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinTimeEdit;
    edt4: TbsSkinTimeEdit;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseInitialForm: TDatabaseInitialForm;

implementation
       uses UHDHouseDataModule;
{$R *.dfm}

procedure TDatabaseInitialForm.btn2Click(Sender: TObject);
begin
DatabaseInitialForm.Close;
end;

end.
