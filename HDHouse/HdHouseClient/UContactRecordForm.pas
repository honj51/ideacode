unit UContactRecordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  bsdbctrls, bsSkinGrids, bsDBGrids, UDataOperateBarView, DB, ADODB,
  DBCtrls, Menus;

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
    procedure btn4Click(Sender: TObject);
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
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
//来电记录查询
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

//添加
procedure TContactRecordForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
  ContactRecordDetailsForm.paramMode:='add';
  ContactRecordDetailsForm.ShowModal;
  //刷新数据
  with qryLd do
    begin
       Close;
       Open;
    end;
end;


//修改
procedure TContactRecordForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
//
if qryLd.FieldByName('ldxx_bh').Text <> '' then
begin
  ContactRecordDetailsForm.paramId:= qryLd.FieldByName('ldxx_bh').Text;
  ContactRecordDetailsForm.paramMode:='edit';
  ContactRecordDetailsForm.ShowModal;
  //刷新数据
  with qryLd do
    begin
       Close;
       Open;
    end;

end;

end;

//删除
procedure TContactRecordForm.dtprtbrvw1btn3Click(Sender: TObject);
begin
//
  if qryLd.FieldByName('ldxx_bh').Text <> '' then
  begin
     case Application.MessageBox('删除后无法恢复，确定删除吗？', '提示',MB_OKCANCEL + MB_ICONQUESTION) of
    IDOK:
     begin
        qryLd.Delete;
     end;
    IDCANCEL:
    begin

    end;
end;
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

end.
