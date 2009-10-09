unit UContactRecordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  bsdbctrls, bsSkinGrids, bsDBGrids, UDataOperateBarView, DB, ADODB,
  DBCtrls, Menus, BusinessSkinForm, frxClass, frxExportXML, frxDBSet;

type
  TContactRecordForm = class(TForm)
    dtprtbrvw1: TDataOperateBarView;
    bskngrpbx1: TbsSkinGroupBox;
    bsknscrlbr3: TbsSkinScrollBar;
    bskndbgrd1: TbsSkinDBGrid;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    btn4: TbsSkinButtonLabel;
    bvl1: TBevel;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinDateEdit;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    dsLd: TDataSource;
    qryLd: TADOQuery;
    pmLd: TPopupMenu;
    V1: TMenuItem;
    W1: TMenuItem;
    X1: TMenuItem;
    Y1: TMenuItem;
    Z1: TMenuItem;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxDBDatasetld: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxXMLExport1: TfrxXMLExport;
    procedure btn4Click(Sender: TObject);
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure dtprtbrvw1btn5Click(Sender: TObject);
    procedure dtprtbrvw1btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContactRecordForm: TContactRecordForm;

implementation
uses UHDHouseDataModule,UContactRecordDetailsForm,Math;
{$R *.dfm}
//�����¼��ѯ
procedure TContactRecordForm.btn4Click(Sender: TObject);
begin
  if edt1.Text <> ''
  then
  begin
   qryLd.Filter:='ldxx_date >='+edt2.Text+' and ldxx_date<='+edt3.Text+' and  '
      +'ldxx_lx like '+'%'+edt1.Text+'%'+' or '
      +'ldxx_xm like '+'%'+edt1.Text+'%'+' or '
      +'ldxx_dh like '+'%'+edt1.Text+'%'+' or '
      +'ldxx_czy like '+'%'+edt1.Text+'%'+' or '
      +'ldxx_nr like '+'%'+edt1.Text+'%'+' ';
      qryLd.Filtered:=True;
   end else
   begin
      qryLd.Filtered:=False;
   end;

end;

//���
procedure TContactRecordForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
  ContactRecordDetailsForm.paramMode:='add';
  ContactRecordDetailsForm.ShowModal;
  self.qryLd.Close;
  self.qryLd.Open;
  //ˢ������
  with qryLd do
    begin
       Close;
       Open;
    end;
end;


//�޸�
procedure TContactRecordForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
//
if qryLd.FieldByName('ldxx_bh').Text <> '' then
begin
  ContactRecordDetailsForm.paramId:= qryLd.FieldByName('ldxx_bh').Text;
  ContactRecordDetailsForm.paramMode:='edit';
  ContactRecordDetailsForm.ShowModal;
  //ˢ������
  with qryLd do
    begin
       Close;
       Open;
    end;

end;

end;

//ɾ��
procedure TContactRecordForm.dtprtbrvw1btn3Click(Sender: TObject);
begin
//
  if qryLd.FieldByName('ldxx_bh').Text <> '' then
  begin

    if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ɾ�����޷��ָ���ȷ��ɾ����', '��ʾ', nil, -1, [mbOK,mbCancel], 0)=2 then
    begin
        Exit;
    end;
        qryLd.Delete;
  end;
end;
//
procedure TContactRecordForm.bskndbgrd1DblClick(Sender: TObject);
begin
//
ContactRecordForm.dtprtbrvw1btn2Click(nil);
end;

//PopMenuAdd
procedure TContactRecordForm.V1Click(Sender: TObject);
begin
ContactRecordForm.dtprtbrvw1btn1Click(nil);
end;

//PopMenuEdit
procedure TContactRecordForm.W1Click(Sender: TObject);
begin
ContactRecordForm.dtprtbrvw1btn2Click(nil);
end;
 //PopMenuDelete
procedure TContactRecordForm.X1Click(Sender: TObject);
begin
ContactRecordForm.dtprtbrvw1btn3Click(nil);
end;

procedure TContactRecordForm.dtprtbrvw1btn5Click(Sender: TObject);
begin
 if self.frxReport1.PrepareReport then
 begin
      self.frxReport1.ShowPreparedReport;
 end;
end;

procedure TContactRecordForm.dtprtbrvw1btn4Click(Sender: TObject);
begin
    if self.frxReport1.PrepareReport then
    begin
        self.frxReport1.Export(self.frxXMLExport1);
    end;
end;

end.
