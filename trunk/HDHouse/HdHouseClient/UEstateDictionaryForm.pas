unit UEstateDictionaryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, ComCtrls, StdCtrls, Mask,
  bsSkinBoxCtrls, BusinessSkinForm;

type
  TEstateDictionaryForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bsknlbl1: TbsSkinLabel;
    bsknpnl1: TbsSkinPanel;
    bsknpnl2: TbsSkinPanel;
    tv1: TbsSkinTreeView;
    bsknscrlbr1: TbsSkinScrollBar;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknscrlbr3: TbsSkinScrollBar;
    btn8: TbsSkinSpeedButton;
    btn9: TbsSkinSpeedButton;
    btn10: TbsSkinSpeedButton;
    btn11: TbsSkinSpeedButton;
    btn12: TbsSkinSpeedButton;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    btn14: TbsSkinSpeedButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstateDictionaryForm: TEstateDictionaryForm;

implementation
           uses UHDHouseDataModule,UEstateDictionaryInfoForm;

{$R *.dfm}

procedure TEstateDictionaryForm.btn10Click(Sender: TObject);
begin
       if EstateDictionaryInfoForm= nil  then
      begin
           EstateDictionaryInfoForm:=TEstateDictionaryInfoForm.Create(Self);
      end;
      EstateDictionaryInfoForm.Visible:=False;
     EstateDictionaryInfoForm.ShowModal;
end;

procedure TEstateDictionaryForm.FormShow(Sender: TObject);
begin
     tv1.Items[0].Expanded:=True;
     tv1.Items[0].Item[0].Expanded:=True;
end;

end.
