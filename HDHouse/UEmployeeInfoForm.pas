unit UEmployeeInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsdbctrls, Mask, StdCtrls, bsSkinCtrls,
  bsSkinExCtrls, BusinessSkinForm, DB, ADODB;

type
  TEmployeeInfoForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bsknpnl1: TbsSkinPanel;
    btn1: TbsSkinXFormButton;
    btn2: TbsSkinXFormButton;
    mmoygxx_bz: TbsSkinDBMemo;
    lbl3: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edtygxx_dz: TbsSkinDBEdit;
    edtygxx_jg: TbsSkinDBEdit;
    lbl1: TbsSkinStdLabel;
    lbl14: TbsSkinStdLabel;
    lbl13: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    lbl11: TbsSkinStdLabel;
    edtygxx_bh: TbsSkinDBEdit;
    edtygxx_xm: TbsSkinDBEdit;
    edtygxx_sfz: TbsSkinDBEdit;
    edtygxx_lxdh: TbsSkinDBEdit;
    lbl9: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    cbbygxx_xb: TbsSkinDBComboBox;
    cbbygxx_xl: TbsSkinDBComboBox;
    cbbygxx_hy: TbsSkinDBComboBox;
    edtygxx_csdate: TbsSkinDBDateEdit;
    edtygxx_jzdate: TbsSkinDBDateEdit;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry_ygxxxx: TADOQuery;
    ds_ygxxxx: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
   function f_CheckValue:Boolean;
    { Private declarations }
  public
    ParmEditorMode:string;  // �������༭��ģʽ(ADD:����,EDIT:�޸�)
    ParmId:string;
    { Public declarations }
  end;

var
  EmployeeInfoForm: TEmployeeInfoForm;

implementation
       uses UHDHouseDataModule;
{$R *.dfm}
{-------------------------------------------
            �������¼�����Ч��
-------------------------------------------}
function TEmployeeInfoForm.f_CheckValue:Boolean;
begin

  //
  if edtygxx_bh.text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('�������ţ�', '��ʾ', nil, -1, [mbOk], 0);
    edtygxx_bh.SetFocus;
    Result :=False;
    Exit;
  end;
  //
  if edtygxx_xm.Text='' then
  begin
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('������������', '��ʾ', nil, -1, [mbOk], 0);
    edtygxx_xm.SetFocus;
    Result :=False;
    Exit;
  end;
  //
    if edtygxx_lxdh.Text='' then
    begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('��������ϵ�绰��', '��ʾ', nil, -1, [mbOk], 0);
      edtygxx_lxdh.SetFocus;
      Result :=False;
      Exit;
    end;
    //
    if edtygxx_sfz.Text='' then
    begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('���������֤��', '��ʾ', nil, -1, [mbOk], 0);
      edtygxx_sfz.SetFocus;
      Result :=False;
      Exit;
    end;
    //
    if edtygxx_dz.Text='' then
    begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('�������ַ��', '��ʾ', nil, -1, [mbOk], 0);
      edtygxx_dz.SetFocus;
      Result :=False;
      Exit;
    end;
  //
   if edtygxx_jg.Text='' then
    begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('�����뼮�ᣡ', '��ʾ', nil, -1, [mbOk], 0);
      edtygxx_jg.SetFocus;
      Result :=False;
      Exit;
    end;
    //

  result:=True;
end;

procedure TEmployeeInfoForm.FormCreate(Sender: TObject);
begin
        inherited;
        //
end;

procedure TEmployeeInfoForm.FormShow(Sender: TObject);
begin
      inherited;
        //
  with qry_ygxxxx do
  begin
    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //
  if ParmEditorMode = 'ADD' then
    begin
     append;
      FieldByName('ygxx_xl').AsString:='����';
      FieldByName('ygxx_xb').AsString:='��';
      FieldByName('ygxx_hy').AsString:='δ��';
      FieldByName('ygxx_csdate').AsString:=FormatDateTime('yyyy-mm-dd',Now);
      FieldByName('ygxx_jzdate').AsString:=FormatDateTime('yyyy-mm-dd',Now);

    end;
  end;

  //������ť
  if ParmEditorMode='EDIT' then
  begin
    edtygxx_bh.Enabled:=False;
  end
  else
  begin
     edtygxx_bh.Enabled:=True;
  end;
end;

procedure TEmployeeInfoForm.btn2Click(Sender: TObject);
begin
inherited;
        //
         qry_ygxxxx.CancelBatch;
          qry_ygxxxx.close;

          Close;
end;

procedure TEmployeeInfoForm.btn1Click(Sender: TObject);
begin

  inherited;
  if f_CheckValue()=False then  exit;
            // ���ݱ��洦��
            qry_ygxxxx.Post;
  HDHouseDataModule.con1.BeginTrans;
  try
    qry_ygxxxx.UpdateBatch;
    //
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('���ݱ���ʧ�ܣ�', '��ʾ', nil, -1, [mbOk], 0);
    exit;
  end;
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('���ݱ���ɹ���', '��ʾ', nil, -1, [mbOk], 0);
    Close;

end;
procedure TEmployeeInfoForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
      inherited;
      //  �����Ѹ���
      if qry_ygxxxx.Modified then
      begin
        // �����޸�
          btn2Click(nil);
      end;
end;

end.
