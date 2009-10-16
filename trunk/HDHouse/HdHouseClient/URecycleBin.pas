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
  if node.Text='回收站' then
  begin
    Exit;
  end;
  qry1.Active := False;
  qry1.SQL.Clear;
  if Node.Text = '房源记录' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '客源记录' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '经理占评' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '工作总结' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '新闻公告' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '业务问答' then
  begin
    sql :='SELECT f.FaqType as 问题类别 ,f.Question as 问题内容,e.EmpName as 登记人,f.RegDate as 登记日期 ,f.ModDate as 删除最后修改 ,f.FlagDeleted,f.FaqID FROM faq f,Employee e where f.EmpID=e.EmpID and f.FlagDeleted=1';
  end
  else if Node.Text = '部门记录' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '员工记录' then
  begin
    sql :='select * from fczy';
  end
  else if Node.Text = '楼盘字典' then
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
