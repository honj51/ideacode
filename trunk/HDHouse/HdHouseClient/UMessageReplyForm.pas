unit UMessageReplyForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, bsSkinBoxCtrls, bsdbctrls, Mask,
  BusinessSkinForm;

type
  TMessageReplyForm = class(TForm)
    grp1: TGroupBox;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    lbl4: TbsSkinStdLabel;
    edt3: TbsSkinDBEdit;
    mmo1: TbsSkinDBMemo;
    bsbsnsknfrm1: TbsBusinessSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessageReplyForm: TMessageReplyForm;

implementation
             uses UHDHouseDataModule;
{$R *.dfm}

end.
