unit UCustomerAutoMatchView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids;

type
  TCustomerAutoMatchView = class(TFrame)
    bskndbgrd1: TbsSkinDBGrid;
    bsSkinScrollBar1: TbsSkinScrollBar;
    bsknscrlbr1: TbsSkinScrollBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
