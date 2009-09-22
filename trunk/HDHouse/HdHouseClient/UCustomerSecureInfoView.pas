unit UCustomerSecureInfoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls,
  BusinessSkinForm;

type
  TCustomerSecureInfoView = class(TFrame)
    bsSkinStdLabel1: TbsSkinStdLabel;
    edtName: TbsSkinDBEdit;
    bsSkinStdLabel2: TbsSkinStdLabel;
    edtPhone: TbsSkinDBEdit;
    bsSkinStdLabel3: TbsSkinStdLabel;
    edtHandset: TbsSkinDBEdit;
    bsSkinStdLabel4: TbsSkinStdLabel;
    edtAddress: TbsSkinDBEdit;
    bsSkinStdLabel5: TbsSkinStdLabel;
    mmoDescription: TbsSkinDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
