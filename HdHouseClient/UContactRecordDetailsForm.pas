unit UContactRecordDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, StdCtrls, DB,
  ADODB;

type
  TContactRecordDetailsForm = class(TForm)
    bskngrpbxContactInfro: TbsSkinGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    mmokhzy_xxbz: TbsSkinDBMemo;
    edtCustomerName: TbsSkinDBEdit;
    edtCustomerTel: TbsSkinDBEdit;
    edtCustomerDate: TbsSkinDBEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    cbbCustomerType: TbsSkinDBComboBox;
    qryLdInfo: TADOQuery;
    dsLdinfo: TDataSource;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    paramId:string;
    paramMode:string;
    { Public declarations }
  end;

var
  ContactRecordDetailsForm: TContactRecordDetailsForm;

implementation
uses UHDHouseDataModule,Math;
{$R *.dfm}

//ȡ��
procedure TContactRecordDetailsForm.btn2Click(Sender: TObject);
begin
  qryLdInfo.Cancel;
      Close;
end;

//����
procedure TContactRecordDetailsForm.btn1Click(Sender: TObject);
begin
   //��֤
  if edtCustomerName.Text = '' then
  begin
    Application.MessageBox('�ͻ���������Ϊ��', '��ʾ', MB_OK+ MB_iconexclamation);
    edtCustomerName.SetFocus;
    Exit;
  end;
     if paramMode = 'add' then
      begin
  qryLdInfo.Post;
  end ;

  HDHouseDataModule.con1.BeginTrans;
  try
    qryLdInfo.UpdateBatch;
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
    MessageBox(handle,'���ݱ���ʧ�ܣ�','����',MB_OK);
    exit;
  end;

  MessageBox(handle,'���ݱ���ɹ���','��ʾ',MB_OK+MB_ICONINFORMATION);
  Close;
end;
//show
procedure TContactRecordDetailsForm.FormShow(Sender: TObject);
begin
      //
       qryLdInfo.Close;
       qryLdInfo.Parameters.ParamByName('id').Value:=paramId;
       qryLdInfo.Open;
      if paramMode = 'add' then
      begin
      with qryLdInfo do
      begin
        Append;
        Randomize;
        FieldByName('ldxx_bh').Value :=  RandomRange(10000000,99999999);
        FieldByName('ldxx_czy').Value := 'admin'; // TODO: ���ȡ�õ�ǰ����Ա
        FieldByName('ldxx_date').Value := Now;
        FieldByName('ldxx_lx').Value := '��Դҵ��';
      end;
      end;
end;

end.
