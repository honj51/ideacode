unit UDealHouseListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, Mask,
  StdCtrls, bsSkinGrids, bsDBGrids, ExtCtrls;

type
  TDealHouseListView = class(THouseListView)
    i: TbsSkinStdLabel;
    cbb1: TbsSkinDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DealHouseListView: TDealHouseListView;

implementation
{$R *.dfm}

end.
