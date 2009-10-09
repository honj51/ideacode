unit UCustomerTrackInfoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTrackInfoView, bsSkinCtrls, bsSkinBoxCtrls, bsdbctrls, Mask,
  StdCtrls;

type
  TCustomerTrackInfoViewForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bsknlbl1: TbsSkinLabel;
    bsknlbl3: TbsSkinLabel;
    bsknlbl7: TbsSkinLabel;
    mmokhgj_ms: TbsSkinDBMemo;
    edt2: TbsSkinDBEdit;
    bsknlbl2: TbsSkinLabel;
    bsknlbl4: TbsSkinLabel;
    edt6: TbsSkinDBDateEdit;
    edtkhgj_gjr: TbsSkinDBEdit;
    edt1: TbsSkinDBTimeEdit;
    bskngrpbx2: TbsSkinGroupBox;
    bsknlbl5: TbsSkinLabel;
    bsknlbl6: TbsSkinLabel;
    edt4: TbsSkinDBDateEdit;
    edt5: TbsSkinDBTimeEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    cbbkhgj_txlx: TbsSkinDBComboBox;
    cbbkhgj_fs: TbsSkinDBLookupComboBox;
    procedure trcknfvwCustomerTrackInfoViewbtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    paramId:string;
    paramMode:string;
    { Public declarations }
  end;

var
  CustomerTrackInfoViewForm: TCustomerTrackInfoViewForm;

implementation
uses UHDHouseDataModule, UParametersDataModule,UCustomerTrackForm;
{$R *.dfm}

procedure TCustomerTrackInfoViewForm.trcknfvwCustomerTrackInfoViewbtn2Click(
  Sender: TObject);
begin
    CustomerTrackInfoViewForm.Close;
end;

//显示事件
procedure TCustomerTrackInfoViewForm.FormShow(Sender: TObject);
begin
  if CustomerTrackForm.tblTrack.FieldByName('khgj_txyn').AsString ='Y' then
  begin
    bskngrpbx2.Checked:=True;
  end else
  begin
     bskngrpbx2.Checked:=False;
  end;
end;

//取消
procedure TCustomerTrackInfoViewForm.btn2Click(Sender: TObject);
begin
  CustomerTrackForm.dsTrack.DataSet.Cancel;
  Close;
end;

//保存
procedure TCustomerTrackInfoViewForm.btn1Click(Sender: TObject);
begin
  //验证
  if edtkhgj_gjr.Text = '' then
  begin
    Application.MessageBox('请选择跟进员工', '提示', MB_OK+ MB_iconexclamation);
    Exit;
  end;
  if mmokhgj_ms.Text = '' then
  begin
    Application.MessageBox('跟进内容不能为空', '提示', MB_OK+ MB_iconexclamation);
    mmokhgj_ms.SetFocus;
    Exit;
  end;
   //
  if bskngrpbx2.Checked=True then
      begin
        CustomerTrackForm.tblTrack.FieldByName('khgj_txyn').Value:='Y';
      end else
      begin
         CustomerTrackForm.tblTrack.FieldByName('khgj_txyn').Value:='N';
      end;

  if CustomerTrackForm.dsTrack.DataSet.Modified then
  begin
      CustomerTrackForm.dsTrack.DataSet.Post;
  end;
  Close;
end;

end.
