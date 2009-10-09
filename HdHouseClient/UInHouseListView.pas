unit UInHouseListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseListView, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls, Mask,
  StdCtrls, bsSkinGrids, bsDBGrids, ExtCtrls;

type
  TInHouseListView = class(THouseListView)
    i: TbsSkinStdLabel;
    cbb1: TbsSkinDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InHouseListView: TInHouseListView;

implementation

{$R *.dfm}

end.
