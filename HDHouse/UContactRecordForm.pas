unit UContactRecordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  bsdbctrls, bsSkinGrids, bsDBGrids, UDataOperateBarView;

type
  TContactRecordForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bskngrpbx1: TbsSkinGroupBox;
    bsknscrlbr3: TbsSkinScrollBar;
    bskndbgrd1: TbsSkinDBGrid;
    bsSkinStdLabel1: TbsSkinStdLabel;
    cbb1: TbsSkinDBComboBox;
    cbb2: TbsSkinDBComboBox;
    bsSkinStdLabel2: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    btn4: TbsSkinButtonLabel;
    bvl1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContactRecordForm: TContactRecordForm;

implementation
{$R *.dfm}

end.
