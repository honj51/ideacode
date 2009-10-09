unit UHouseSecureInfoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, bsSkinBoxCtrls, bsdbctrls, Mask, bsSkinCtrls,
  BusinessSkinForm;

type
  THouseSecureInfoView = class(TFrame)
    bsknpnl1: TbsSkinPanel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    edtfczy_yzxm: TbsSkinDBEdit;
    edtfczy_yzxm1: TbsSkinDBEdit;
    edtfczy_yzxm2: TbsSkinDBEdit;
    edtfczy_yzxm3: TbsSkinDBEdit;
    mmofczy_yzxm: TbsSkinDBMemo;
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
