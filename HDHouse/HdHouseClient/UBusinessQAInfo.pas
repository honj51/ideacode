unit UBusinessQAInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsdbctrls, bsSkinCtrls, ExtCtrls, StdCtrls, bsSkinBoxCtrls, Mask,
  BusinessSkinForm, bsColorCtrls, DB, ADODB;

type
  TBusinessQAInfo = class(TForm)
    bsknpnl1: TbsSkinPanel;
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    bsknpnl2: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsSkinDBEdit1: TbsSkinDBEdit;
    bsSkinDBMemo1: TbsSkinDBMemo;
    dlgColor1: TColorDialog;
    img1: TImage;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    img2: TImage;
    lbl6: TbsSkinStdLabel;
    qry1: TADOQuery;
    ds1: TDataSource;
    bsSkinDBEdit2: TbsSkinDBEdit;
    bsSkinDBEdit3: TbsSkinDBEdit;
    bsSkinComboBox1: TbsSkinComboBox;
    bsSkinComboBox2: TbsSkinComboBox;
    bsSkinDBComboBox1: TbsSkinDBComboBox;
    procedure img1Click(Sender: TObject);
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure bsSkinSpeedButton2Click(Sender: TObject);
    procedure bsSkinSpeedButton3Click(Sender: TObject);
    procedure bsSkinButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bsSkinComboBox1Change(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    DName:string;
    EName:string;
    { Public declarations }
  end;

var
  BusinessQAInfo: TBusinessQAInfo;

implementation
    uses UHDHouseDataModule,UBusinessQA;
{$R *.dfm}

procedure TBusinessQAInfo.img1Click(Sender: TObject);
begin
 if self.dlgColor1.Execute then
 begin
    self.bsSkinDBEdit1.Font.Color:=self.dlgColor1.Color;
 end;
end;

procedure TBusinessQAInfo.bsSkinSpeedButton1Click(Sender: TObject);
begin
   self.bsSkinDBMemo1.Font.Size:=-11;
end;

procedure TBusinessQAInfo.bsSkinSpeedButton2Click(Sender: TObject);
begin
  self.bsSkinDBMemo1.Font.Size:=13;
end;

procedure TBusinessQAInfo.bsSkinSpeedButton3Click(Sender: TObject);
begin
self.bsSkinDBMemo1.Font.Size:=18;
end;

procedure TBusinessQAInfo.bsSkinButton2Click(Sender: TObject);
begin
 Close;
end;
 //
procedure TBusinessQAInfo.FormShow(Sender: TObject);
begin
    BusinessQA.qryfqa.Active:=true;
    BusinessQA.qryd.Active:=true;
    BusinessQA.tblEmployee.Active:=true;
    self.qry1.Active:=true;
    self.bsSkinComboBox1.Items.Clear;
    with BusinessQA.dsd.DataSet do
    begin
      First;
      while not Eof do
      begin
        bsSkinComboBox1.Items.Add(VarToStr(FieldValues['DeptName']));
        Next;
      end;
    end;
    self.bsSkinComboBox2.Items.Clear;
    with BusinessQA.dsEmployee.DataSet do
    begin
      First;
      while not Eof do
      begin
        bsSkinComboBox2.Items.Add(VarToStr(FieldValues['EmpName']));
        Next;
      end;
    end;
    self.bsSkinDBComboBox1.Items.Clear;
    with BusinessQA.dspream.DataSet do
    begin
       First;
        while not Eof do
        begin
          self.bsSkinDBComboBox1.Items.Add(VarToStr(FieldValues['ItemValue']));
          Next;
        end;
    end;
    qry1.Close;
    qry1.Parameters.ParamByName('ID').Value := ParmId;
    qry1.Open;
    qry1.Edit;
    self.bsSkinDBEdit3.Enabled:=true;
    if( ParmEditorMode = 'ADD') then
    begin
        qry1.FieldByName('RegDate').AsString:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        self.bsSkinDBEdit3.Enabled:=false;
        qry1.FieldByName('FlagDeleted').Value:=0;
        qry1.FieldByName('FlagTrashed').Value:=0;
        self.bsSkinDBComboBox1.ItemIndex:=0;
    end;
    if( ParmEditorMode = 'EDIT') then
    begin
      self.bsSkinComboBox1.ItemIndex:=bsSkinComboBox1.Items.IndexOf(self.DName);
      self.bsSkinComboBox2.ItemIndex:=self.bsSkinComboBox2.Items.IndexOf(self.EName);
     // self.bsSkinDBEdit1.Font.Color:=
    end;

end;

procedure TBusinessQAInfo.bsSkinComboBox1Change(Sender: TObject);
begin
   BusinessQA.qryd.Filter:='DeptName='+ QuotedStr(self.bsSkinComboBox1.Text);
   BusinessQA.qryd.Filtered:=true;
   BusinessQA.tblEmployee.Filter:= 'DeptID='+QuotedStr(BusinessQA.qryd.FieldByName('DeptID').Value);
   BusinessQA.tblEmployee.Filtered:=true;
   self.bsSkinComboBox2.Items.Clear;
   with BusinessQA.dsEmployee.DataSet do
   begin
      First;
      while not Eof do
      begin
        bsSkinComboBox2.Items.Add(VarToStr(FieldValues['EmpName']));
        Next;
      end;
   end;
   BusinessQA.qryd.Filtered:=false;
   BusinessQA.tblEmployee.Filtered:=false;
   bsSkinComboBox2.ItemIndex:=0;
end;

procedure TBusinessQAInfo.bsSkinButton1Click(Sender: TObject);
begin
   BusinessQA.tblEmployee.Filter:= 'EmpName='+QuotedStr(self.bsSkinComboBox2.Text);
   BusinessQA.tblEmployee.Filtered:=true;
   qry1.FieldByName('EmpID').Value:=BusinessQA.tblEmployee.FieldByName('EmpID').Value ;
   BusinessQA.tblEmployee.Filtered:=false;
   qry1.FieldByName('FaqID').Value:=ParmId;
   qry1.Post;
   Close;
end;

end.
