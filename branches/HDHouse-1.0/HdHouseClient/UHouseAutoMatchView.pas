unit UHouseAutoMatchView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids;

type
  THouseAutoMatchView = class(TFrame)
    bskndbgrd1: TbsSkinDBGrid;
    HouseAutoMatchView: TbsSkinScrollBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
