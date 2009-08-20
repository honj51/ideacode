unit UNotificationManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDataOperatoBarView, StdCtrls, ExtCtrls, bsSkinGrids, bsDBGrids,
  bsSkinCtrls, Mask, bsSkinBoxCtrls, bsdbctrls;

type
  TNotificationManageForm = class(TForm)
    bvl1: TBevel;
    dtprtbrvw1: TDataOperateBarView;
    btn4: TbsSkinButton;
    btn3: TbsSkinButtonLabel;
    cbb3: TbsSkinDBComboBox;
    lbl4: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    edt2: TbsSkinEdit;
    bskndbgrd1: TbsSkinDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificationManageForm: TNotificationManageForm;

implementation

{$R *.dfm}

end.
