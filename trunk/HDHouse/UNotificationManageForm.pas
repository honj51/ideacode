unit UNotificationManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, bsSkinGrids, bsDBGrids,
  bsSkinCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, UDataOperateBarView, DB,
  ADODB, DBCtrls;

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
    ds1: TDataSource;
    tbl1: TADOTable;
    tbl1zdtx_bh: TWideStringField;
    tbl1zdtx_nr: TWideStringField;
    tbl1zdtx_lxm: TWideStringField;
    tbl1zdtx_lx: TWideStringField;
    tbl1zdtx_bj: TWideStringField;
    tbl1zdtx_rq: TWideStringField;
    tbl1zdtx_sj: TWideStringField;
    tbl1zdtx_date: TDateTimeField;
    tbl1zdtx_czy: TWideStringField;
    tbl1zdtx_dby: TDateTimeField;
    tbl1zdtx_xm: TWideStringField;
    tbl1zdtx_dh: TWideStringField;
    tbl1zdtx_ygbh: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure tbl1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificationManageForm: TNotificationManageForm;

implementation
uses
  UHDHouseDataModule, UNotificationInfoForm,Math;
{$R *.dfm}

procedure TNotificationManageForm.FormCreate(Sender: TObject);
begin
  cbb3.ItemIndex := 0;

end;

procedure TNotificationManageForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
  with tbl1 do
  begin
    Edit;
    NotificationInfoForm.ShowModal;
  end;
end;

procedure TNotificationManageForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
  with tbl1 do
  begin
    Append;
    Randomize;
    FieldByName('zdtx_bh').Value :=  RandomRange(10000000,99999999);
    FieldByName('zdtx_rq').Value := FormatDateTime('yyyy-mm-dd', Now);
    FieldByName('zdtx_sj').Value := Now;
    FieldByName('zdtx_lxm').Value := '当次提醒';
    FieldByName('zdtx_bj').Value := 'N';
    FieldByName('zdtx_czy').Value := 'admin'; // TODO: 如何取得当前操作员
    NotificationInfoForm.ShowModal;
  end;
end;

procedure TNotificationManageForm.dtprtbrvw1btn3Click(Sender: TObject);
begin
case Application.MessageBox('删除后无法恢复，确定删除吗？', '提示',
  MB_OKCANCEL + MB_ICONQUESTION) of
  IDOK:
    begin
      tbl1.Delete;
    end;
  IDCANCEL:
    begin

    end;
end;

end;

procedure TNotificationManageForm.btn4Click(Sender: TObject);
begin
  tbl1.Locate('zdtx_xm',edt1.Text, [loPartialKey]);
end;

procedure TNotificationManageForm.tbl1CalcFields(DataSet: TDataSet);
begin
  with tbl1 do
  begin
    FieldByName('test').Value := FieldByName('zdtx_xm').Value + ' - '+ FieldByName('zdtx_dh').Value;
  end;  
end;

end.
