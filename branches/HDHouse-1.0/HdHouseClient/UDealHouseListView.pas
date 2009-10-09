unit UDealHouseListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, Mask,
  StdCtrls, bsSkinGrids, bsDBGrids, ExtCtrls, BusinessSkinForm;

type
  TDealHouseListView = class(THouseListView)
    i: TbsSkinStdLabel;
    cbb1: TbsSkinComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DealHouseListView: TDealHouseListView;

implementation
uses UHDHouseDataModule;
{$R *.dfm}

end.
