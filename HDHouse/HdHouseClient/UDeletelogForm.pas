unit UDeletelogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, Mask, bsSkinBoxCtrls, BusinessSkinForm;

type
  TDeletelogForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    lbl2: TbsSkinStdLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeletelogForm: TDeletelogForm;

implementation
         uses UHDHouseDataModule,Common;
{$R *.dfm}

procedure TDeletelogForm.btn2Click(Sender: TObject);
begin
  inherited;
    //
  Close;
end;

procedure TDeletelogForm.btn1Click(Sender: TObject);
begin
inherited;
    //
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('当前时间段内的日志将被删除，确定删除吗？！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;
        with HDHouseDataModule.qry_del do
        begin
              Close;
              SQL.Clear;
              if IsUsingAccess then
              begin
                   SQL.Add('delete from dayjob where dayjob_date Between #'+edt1.Text+'# and #'+edt2.Text+'#');
              end
              else
              begin
                    SQL.Add('delete from dayjob where dayjob_date Between '+QuotedStr(edt1.Text)+' and '+QuotedStr(edt2.Text));
              end;

              ExecSQL;
        end;
        Close;
end;

end.
