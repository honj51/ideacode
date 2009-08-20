unit UEmployeeManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, UDataOperatoBarView, bsSkinGrids,
  bsDBGrids, Mask, bsSkinBoxCtrls;

type
  TEmployeeManageForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bskntlbr1: TbsSkinToolBar;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeeManageForm: TEmployeeManageForm;

implementation

{$R *.dfm}

end.
