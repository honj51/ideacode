unit UDatabaseInitialForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, StdCtrls, Mask, bsSkinCtrls, BusinessSkinForm;

type
  TDatabaseInitialForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    bsknchckrdbx5: TbsSkinCheckRadioBox;
    edt1: TbsSkinDateEdit;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinTimeEdit;
    edt4: TbsSkinTimeEdit;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseInitialForm: TDatabaseInitialForm;

implementation
uses UHDHouseDataModule,Common;
{$R *.dfm}

procedure TDatabaseInitialForm.btn2Click(Sender: TObject);
begin
  inherited;
  //
  HDHouseDataModule.qry_del.Close;
  Close;
end;

procedure TDatabaseInitialForm.btn1Click(Sender: TObject);
begin
  inherited;
  //
  if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('您确认要做此项目操作吗？(执行后删除数据将不能回复，建议您先坐好数据备份！)！', '提示信息', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;
      if
      (bsknchckrdbx1.Checked=False) and
      (bsknchckrdbx2.Checked=False) and
      (bsknchckrdbx3.Checked=False) and
      (bsknchckrdbx4.Checked=False) and
      (bsknchckrdbx5.Checked=False)
      then
      begin
      HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请选择要清除的记录！', '提示信息', nil, -1, [mbOK], 0);
            Exit;
          Close;
      end;
  with HDHouseDataModule.qry_del do
  begin
    Close;
    if bsknchckrdbx5.Checked then
    begin
      SQL.Clear;
      SQL.Add('delete from cjxx ');
      ExecSQL;
      SQL.Clear;
     SQL.Add(' delete from dayjob');
      ExecSQL;
      SQL.Clear;
       SQL.Add(' delete from fcgj');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' delete from fczy');
      ExecSQL;
      SQL.Clear;
       SQL.Add(' delete from khgj ');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' delete from khzy');
      ExecSQL;
      SQL.Clear;
     SQL.Add(' delete from ldxx');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' delete from tcxx');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' delete from tcxx_temp ');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' delete from xtxx');
      ExecSQL;
      SQL.Clear;
        SQL.Add(' delete from ygxx');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' delete from zdtx ');
      ExecSQL;
      SQL.Clear;
     SQL.Add('delete from cs where cs_yhlx<>''Y''');
      ExecSQL;
    end
    else
    begin
        if bsknchckrdbx1.Checked then
    begin
      SQL.Clear;
      SQL.Add('delete from fczy ');
      ExecSQL;

      SQL.Clear;
      SQL.Add(' delete from fcgj');
      ExecSQL;
    end;
    if bsknchckrdbx2.Checked then
    begin
      SQL.Clear;
      SQL.Add('delete from khzy');
      ExecSQL;
      SQL.Clear;
      SQL.Add('delete from khgj');
      ExecSQL;
    end;
    if bsknchckrdbx3.Checked then
    begin
      if IsUsingAccess then
      begin
          SQL.Clear;
          SQL.Add('delete from khgj where khgj_date between #' + edt1.Text + ' ' +
            edt3.Text + '# and #' + edt2.Text + ' ' + edt4.Text + '#');
          ExecSQL;
          SQL.Clear;
          SQL.Add('delete from khzy where khzy_djrq between #' + edt1.Text +
            '# and #' + edt2.Text + '#');
          ExecSQL;
      end
      else
      begin
          SQL.Clear;
          SQL.Add('delete from khgj where khgj_date between ' + QuotedStr(edt1.Text + ' ' +edt3.Text) + ' and '+ QuotedStr(edt2.Text + ' ' + edt4.Text));
          ExecSQL;
          SQL.Clear;
          SQL.Add('delete from khzy where khzy_djrq between ' + QuotedStr(edt1.Text) + ' and ' +QuotedStr(edt2.Text));
          ExecSQL;
      end;


    end;
    if bsknchckrdbx4.Checked then
    begin
      if IsUsingAccess then
      begin
          SQL.Clear;
          SQL.Add('delete from fcgj where fcgj_date between #' + edt1.Text + ' ' +
            edt3.Text + '# and #' + edt2.Text + ' ' + edt4.Text + '#');
          ExecSQL;

          SQL.Clear;
          SQL.Add('delete from fczy where fczy_djrq between #' + edt1.Text +
            '# and #' + edt2.Text + '#');
          ExecSQL;
      end
      else
      begin
          SQL.Clear;
          SQL.Add('delete from fcgj where fcgj_date between ' +QuotedStr( edt1.Text + ' ' +edt3.Text )+ ' and ' + QuotedStr(edt2.Text + ' ' + edt4.Text));
          ExecSQL;

          SQL.Clear;
          SQL.Add('delete from fczy where fczy_djrq between ' + QuotedStr(edt1.Text) + ' and ' + QuotedStr(edt2.Text));
          ExecSQL;
      end;

    end;
    end;

     if not IsEmpty  then
      begin
            HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('操作失败！', '提示信息', nil, -1, [mbOK], 0);
      end
      else
      begin
            HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('操作成功！', '提示信息', nil, -1, [mbOK], 0);

      end;
  end;

end;

end.

