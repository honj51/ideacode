unit UBusinessQA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, Grids, DBGrids, bsSkinCtrls, bsSkinBoxCtrls,
  StdCtrls, Mask, ExtCtrls, DB, ADODB, bsSkinGrids, bsDBGrids;

type
  TBusinessQA = class(TForm)
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinSpeedButton4: TbsSkinSpeedButton;
    bsSkinSpeedButton5: TbsSkinSpeedButton;
    bsSkinSpeedButton6: TbsSkinSpeedButton;
    bsSkinSpeedButton7: TbsSkinSpeedButton;
    bsSkinSpeedButton8: TbsSkinSpeedButton;
    grp1: TGroupBox;
    img1: TImage;
    lbl1: TbsSkinStdLabel;
    bsSkinComboBox1: TbsSkinComboBox;
    lbl2: TbsSkinStdLabel;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    bsSkinButton1: TbsSkinButton;
    lbl3: TbsSkinStdLabel;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    qryfqa: TADOQuery;
    dsfqa: TDataSource;
    bsSkinDBGrid1: TbsSkinDBGrid;
    qryd: TADOQuery;
    dsd: TDataSource;
    bsSkinComboBox2: TbsSkinComboBox;
    lbl5: TbsSkinStdLabel;
    bsSkinComboBox3: TbsSkinComboBox;
    lbl6: TbsSkinStdLabel;
    dsEmployee: TDataSource;
    tblEmployee: TADOTable;
    dspream: TDataSource;
    qrypream: TADOQuery;
    tbl1: TADOTable;
    lbl4: TbsSkinStdLabel;
    bsSkinEdit1: TbsSkinEdit;
    procedure FormShow(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    procedure bsSkinComboBox1Change(Sender: TObject);
    procedure bsSkinSpeedButton4Click(Sender: TObject);
    procedure bsSkinSpeedButton5Click(Sender: TObject);
    procedure bsSkinSpeedButton3Click(Sender: TObject);
    procedure bsSkinSpeedButton2Click(Sender: TObject);
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure bsSkinSpeedButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BusinessQA: TBusinessQA;

implementation
   uses UHDHouseDataModule,Common,Math,UBusinessQAInfo;
{$R *.dfm}

procedure TBusinessQA.FormShow(Sender: TObject);
begin
  self.qryfqa.Active:=true;
  self.qryd.Active:=true;
  self.qrypream.Active:=true;
  self.tblEmployee.Active:=true;
  bsSkinComboBox1.Items.Clear;
  bsSkinComboBox1.Items.Add('(全部)');
  with self.dsd.DataSet do
  begin
     First;
      while not Eof do
      begin
        self.bsSkinComboBox1.Items.Add(VarToStr(FieldValues['DeptName']));
        Next;
      end;
  end;
  self.bsSkinComboBox3.Items.Clear;
  with self.dspream.DataSet do
  begin
     First;
      while not Eof do
      begin
        self.bsSkinComboBox3.Items.Add(VarToStr(FieldValues['ItemValue']));
        Next;
      end;
  end;
 bsSkinComboBox3.ItemIndex:=0;
 bsSkinComboBox1.ItemIndex:=0;
 self.bsSkinDateEdit1.Date:=Now-30;
 self.bsSkinDateEdit2.Date:=Now;
 self.bsSkinEdit1.Text:='';
 self.bsSkinSpeedButton7.Caption:=IntToStr(self.qryfqa.Recordset.RecordCount);
end;
 //查询
procedure TBusinessQA.bsSkinButton1Click(Sender: TObject);
var strFilter:string;
begin
  if IsUsingAccess then  //时间
  begin
      strFilter := strFilter + ' RegDate >= #'+self.bsSkinDateEdit1.Text+'# AND ';
      strFilter := strFilter + ' RegDate <= #'+self.bsSkinDateEdit2.Text+'#';
  end
  else
  begin
      strFilter := strFilter + ' RegDate >= '+QuotedStr(self.bsSkinDateEdit1.Text) +' AND ';
      strFilter := strFilter + ' RegDate <= '+QuotedStr(self.bsSkinDateEdit2.Text);
  end;
  if not (self.bsSkinComboBox1.Text='(全部)') then  //部门
  begin
     strFilter := strFilter +' AND DeptName='+ QuotedStr(self.bsSkinComboBox1.Text);
  end;
  if not (self.bsSkinComboBox2.Text='(全部)') then //员工
  begin
     strFilter := strFilter +' AND EmpName='+ QuotedStr(self.bsSkinComboBox2.Text);
  end;
  if not (Trim(self.bsSkinComboBox3.Text)='') then  //类型
  begin
      strFilter := strFilter +' AND FaqType='+ QuotedStr(self.bsSkinComboBox3.Text);
  end;
  if not (Trim(self.bsSkinEdit1.Text)='') then  //类型
  begin
      strFilter := strFilter +' AND Question like ' + QuotedStr('%'+ bsSkinEdit1.Text+ '%');
  end;
  self.qryfqa.Filter:=strFilter;
  self.qryfqa.Filtered:=true;
  self.bsSkinSpeedButton7.Caption:=IntToStr(self.qryfqa.Recordset.RecordCount);
end;

procedure TBusinessQA.bsSkinComboBox1Change(Sender: TObject);
begin
   bsSkinComboBox2.Items.Clear;
   bsSkinComboBox2.Items.Add('(全部)');
  if not (self.bsSkinComboBox1.Text='(全部)') then
  begin
   self.qryd.Filter:='DeptName='+ QuotedStr(self.bsSkinComboBox1.Text);
   self.qryd.Filtered:=true;
   self.tblEmployee.Filter:= 'DeptID='+QuotedStr(qryd.FieldByName('DeptID').Value);
   self.tblEmployee.Filtered:=true;

   with self.dsEmployee.DataSet do
   begin
      First;
      while not Eof do
      begin
        bsSkinComboBox2.Items.Add(VarToStr(FieldValues['EmpName']));
       // bsSkinComboBox2.set
        Next;
      end;
   end;
   self.qryd.Filtered:=false;
   self.tblEmployee.Filtered:=false;
    end;
     bsSkinComboBox2.ItemIndex:=0;
end;

procedure TBusinessQA.bsSkinSpeedButton4Click(Sender: TObject);
begin
  if not self.qryfqa.Eof then
  begin
  qryfqa.Edit;
  qryfqa.FieldByName('FaqID').Value:= qryfqa.FieldByName('FaqID').Value;
  qryfqa.FieldByName('FlagDeleted').Value:=1;
  qryfqa.Post;
  bsSkinSpeedButton5Click(nil);
  end;
end;

procedure TBusinessQA.bsSkinSpeedButton5Click(Sender: TObject);
begin
 self.qryfqa.Close;
 self.qryfqa.Open
end;

procedure TBusinessQA.bsSkinSpeedButton3Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
       if BusinessQAInfo= nil  then
      begin
           BusinessQAInfo:=TBusinessQAInfo.Create(Self);
      end;
     BusinessQAInfo.ParmEditorMode:='EDIT';
     BusinessQAInfo.bsSkinButton1.Enabled:=true;
     BusinessQAInfo.ParmId:=self.qryfqa.FieldByName('FaqID').AsString;
     BusinessQAInfo.DName:=self.qryfqa.FieldByName('DeptName').AsString;
     BusinessQAInfo.EName:=self.qryfqa.FieldByName('EmpName').AsString;
     BusinessQAInfo.ShowModal;
     self.bsSkinSpeedButton5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TBusinessQA.bsSkinSpeedButton2Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
    if BusinessQAInfo= nil  then
      begin
           BusinessQAInfo:=TBusinessQAInfo.Create(Self);
      end;
     Randomize;//初始
     BusinessQAInfo.ParmEditorMode:='ADD';
      BusinessQAInfo.bsSkinButton1.Enabled:=true;
     BusinessQAInfo.ParmId:=FormatDateTime('yyyymmdd',Now)+IntToStr(RandomRange(10000000,99999999));
     BusinessQAInfo.ShowModal;
     self.bsSkinSpeedButton5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TBusinessQA.bsSkinSpeedButton1Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
    if BusinessQAInfo= nil  then
      begin
           BusinessQAInfo:=TBusinessQAInfo.Create(Self);
      end;
     BusinessQAInfo.ParmEditorMode:='EDIT';
     BusinessQAInfo.ParmId:=self.qryfqa.FieldByName('FaqID').AsString;
     BusinessQAInfo.DName:=self.qryfqa.FieldByName('DeptName').AsString;
     BusinessQAInfo.EName:=self.qryfqa.FieldByName('EmpName').AsString;
     BusinessQAInfo.bsSkinButton1.Enabled:=false;
     BusinessQAInfo.ShowModal;
     self.bsSkinSpeedButton5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TBusinessQA.bsSkinSpeedButton8Click(Sender: TObject);
begin
   Close;
end;

procedure TBusinessQA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
   BusinessQA := nil;
end;

end.
