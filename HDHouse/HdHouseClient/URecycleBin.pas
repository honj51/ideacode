unit URecycleBin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, StdCtrls, bsSkinCtrls, bsSkinBoxCtrls, Mask,
  ExtCtrls, bsSkinGrids, bsDBGrids, ComCtrls, DB, ADODB;

type
  TRecycleBin = class(TForm)
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinSpeedButton4: TbsSkinSpeedButton;
    bsSkinSpeedButton5: TbsSkinSpeedButton;
    bsSkinSpeedButton7: TbsSkinSpeedButton;
    bsSkinSpeedButton8: TbsSkinSpeedButton;
    grp1: TGroupBox;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    img1: TImage;
    lbl1: TbsSkinStdLabel;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    lbl2: TbsSkinStdLabel;
    bsSkinEdit1: TbsSkinEdit;
    bsSkinMenuButton1: TbsSkinMenuButton;
    bsSkinDBGrid1: TbsSkinDBGrid;
    tv1: TbsSkinTreeView;
    qry1: TADOQuery;
    ds1: TDataSource;
    bsSkinSpeedButton6: TbsSkinSpeedButton;
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure bsSkinSpeedButton2Click(Sender: TObject);
    procedure bsSkinSpeedButton4Click(Sender: TObject);
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure bsSkinSpeedButton3Click(Sender: TObject);
    procedure bsSkinSpeedButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecycleBin: TRecycleBin;

implementation
   uses  UHDHouseDataModule;
{$R *.dfm}

procedure TRecycleBin.tv1Change(Sender: TObject; Node: TTreeNode);
var
  sql : string;
begin
  if node.Text='����վ' then
  begin
    Exit;
  end;
  qry1.Active := False;
  qry1.SQL.Clear;
  if Node.Text = '��Դ��¼' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '��Դ��¼' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '����ռ��' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '�����ܽ�' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '���Ź���' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = 'ҵ���ʴ�' then
  begin
    sql :='SELECT f.FaqType as ������� ,f.Question as ��������,e.EmpName as �Ǽ���,f.RegDate as �Ǽ����� ,f.ModDate as ɾ������޸� ,f.FlagDeleted,f.FaqID FROM faq f,Employee e where f.EmpID=e.EmpID and f.FlagDeleted=1';
  end
  else if Node.Text = '���ż�¼' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = 'Ա����¼' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '¥���ֵ�' then
  begin
    sql :='select * from fczy';
  end;
  self.qry1.SQL.Add(sql);
  self.qry1.Active:=true;
  self.bsSkinSpeedButton7.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;

procedure TRecycleBin.bsSkinSpeedButton2Click(Sender: TObject);
begin
  if not self.qry1.Eof then
  begin
    self.qry1.Delete;
    self.bsSkinSpeedButton4Click(nil);
  end;
end;

procedure TRecycleBin.bsSkinSpeedButton4Click(Sender: TObject);
begin
 qry1.Close;
 qry1.Open;
end;

procedure TRecycleBin.bsSkinSpeedButton1Click(Sender: TObject);
begin
  if not self.qry1.Eof then
  begin
  qry1.Edit;
  qry1.FieldByName('FlagDeleted').Value:=0;
  qry1.Post;
  self.bsSkinSpeedButton4Click(nil);
  end;
end;

procedure TRecycleBin.bsSkinSpeedButton3Click(Sender: TObject);
begin
  if not self.qry1.Eof then
  begin
    qry1.DeleteRecords(arall);
    self.bsSkinSpeedButton4Click(nil);
  end;
end;

procedure TRecycleBin.bsSkinSpeedButton8Click(Sender: TObject);
begin
Close;
end;

procedure TRecycleBin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   RecycleBin := nil;
end;

end.
