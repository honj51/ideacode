unit UNotificationInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinBoxCtrls, bsdbctrls, Mask, ComCtrls,
  BusinessSkinForm, DB, ADODB, ImgList, bsPngImageList;

type
  TNotificationInfoForm = class(TForm)
    bsbsnsknfrm1: TbsBusinessSkinForm;
    ds1: TDataSource;
    qry1: TADOQuery;
    bskngrpbx1: TbsSkinGroupBox;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    mmozdtx_nr: TbsSkinDBMemo;
    edtzdtx_dh: TbsSkinDBEdit;
    edtzdtx_date: TbsSkinDBDateEdit;
    cbbzdtx_lx: TbsSkinDBComboBox;
    bsSkinDBTimeEdit1: TbsSkinDBTimeEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    edtzdtx_xm: TbsSkinDBEdit;
    btn3: TbsSkinSpeedButton;
    bspngmglst1: TbsPngImageList;
    procedure btnygxxClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
     ParmEditorMode,ParmId:string;
     { Public declarations }
  end;

var
  NotificationInfoForm: TNotificationInfoForm;

implementation
uses UNotificationManageForm,UHDHouseDataModule,Math,Common,URealtorListForm;

{$R *.dfm}

procedure TNotificationInfoForm.btnygxxClick(Sender: TObject);
begin
  if self.edtzdtx_xm.Text = '' then
  begin
    Application.MessageBox('��ѡ�����Ѷ���', '��ʾ', MB_OK
      + MB_ICONSTOP);
    Exit;
  end;

  if edtzdtx_dh.Text = '' then
  begin
     Application.MessageBox('������绰��', '��ʾ', MB_OK
      + MB_ICONSTOP);
     Exit;
  end;

    if mmozdtx_nr.Text = '' then
    begin
       Application.MessageBox('�������������ݣ�', '��ʾ', MB_OK
        + MB_ICONSTOP);
       Exit;
    end;
   if self.ds1.DataSet.Modified then
   begin
    self.qry1.FieldByName('zdtx_dby').Value:= StrToDateTime(self.edtzdtx_date.Text+' '+self.bsSkinDBTimeEdit1.Text);
    ds1.DataSet.Post;
   end;
   Close;
end;

procedure TNotificationInfoForm.btn2Click(Sender: TObject);
begin
  NotificationManageForm.ds1.DataSet.Cancel;
  close;
end;

procedure TNotificationInfoForm.FormShow(Sender: TObject);
begin
   with self.qry1 do
   begin
    self.qry1.Active:=true;
    self.qry1.Close;
    Parameters.ParamByName('id').Value :=ParmId;
    self.qry1.Open;
    self.qry1.Edit;
    if self.ParmEditorMode ='ADD'then
    begin
      Randomize;
      FieldByName('zdtx_bh').Value :=  RandomRange(10000000,99999999);
      FieldByName('zdtx_rq').Value := FormatDateTime('yyyy-mm-dd', Now);//�������
      FieldByName('zdtx_date').Value := Now;  //���ʱ��
      FieldByName('zdtx_sj').Value := Now; //���ʱ��
      FieldByName('zdtx_lxm').Value := '��������';
      FieldByName('zdtx_bj').Value := 'N';
      FieldByName('zdtx_lx').Value := 'C';//����TDOO:
      FieldByName('zdtx_czy').Value := gs_login_username; // TODO: ���ȡ�õ�ǰ����Ա
    end;
    end;
end;

procedure TNotificationInfoForm.btn3Click(Sender: TObject);
var ygxm:string;
begin
   RealtorListForm.ygxm :=self.edtzdtx_xm.Text;
   RealtorListForm.ShowModal;
   self.qry1.Edit;
   self.edtzdtx_xm.Text:=RealtorListForm.ygxm;
   self.qry1.FieldByName('zdtx_ygbh').Value:= RealtorListForm.ygbh;
end;
end.
