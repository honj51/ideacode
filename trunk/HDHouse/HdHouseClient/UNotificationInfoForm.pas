unit UNotificationInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinBoxCtrls, bsdbctrls, Mask, ComCtrls;

type
  TNotificationInfoForm = class(TForm)
    mmozdtx_nr: TbsSkinDBMemo;
    edtzdtx_xm: TbsSkinDBEdit;
    edtzdtx_dh: TbsSkinDBEdit;
    edtzdtx_date: TbsSkinDBDateEdit;
    cbbzdtx_lx: TbsSkinDBComboBox;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinDBTimeEdit1: TbsSkinDBTimeEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificationInfoForm: TNotificationInfoForm;

implementation
uses UNotificationManageForm;

{$R *.dfm}

procedure TNotificationInfoForm.btn1Click(Sender: TObject);
begin
  if edtzdtx_xm.Text = '' then
  begin
    Application.MessageBox('请选择提醒对象！', '提示', MB_OK
      + MB_ICONSTOP);
    Exit;
  end;

  if edtzdtx_dh.Text = '' then
  begin
     Application.MessageBox('请输入电话！', '提示', MB_OK
      + MB_ICONSTOP);
     Exit;
  end;

    if mmozdtx_nr.Text = '' then
    begin
       Application.MessageBox('请输入提醒内容！', '提示', MB_OK
        + MB_ICONSTOP);
       Exit;
    end;


  if NotificationManageForm.ds1.DataSet.Modified then
  begin
    NotificationManageForm.ds1.DataSet.Post;
  end;
  Close;
end;

procedure TNotificationInfoForm.btn2Click(Sender: TObject);
begin
  NotificationManageForm.ds1.DataSet.Cancel;
  close;
end;

end.
