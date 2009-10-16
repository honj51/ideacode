unit UElectronicAttendance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls, Mask,
  ExtCtrls, Grids, DBGrids, DB, ADODB, DBCtrls, bsSkinGrids, bsDBGrids,
  Menus, bsSkinMenus;

type
  TElectronicAttendance = class(TForm)
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinSpeedButton4: TbsSkinSpeedButton;
    bsSkinSpeedButton5: TbsSkinSpeedButton;
    bsSkinSpeedButton6: TbsSkinSpeedButton;
    bsSkinSpeedButton7: TbsSkinSpeedButton;
    bsSkinSpeedButton8: TbsSkinSpeedButton;
    bsSkinSpeedButton9: TbsSkinSpeedButton;
    grp1: TGroupBox;
    img1: TImage;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    bsSkinComboBox2: TbsSkinComboBox;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    lbl3: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsSkinComboBox4: TbsSkinComboBox;
    bsSkinButton1: TbsSkinButton;
    bsSkinToolBar2: TbsSkinToolBar;
    bsSkinSpeedButton10: TbsSkinSpeedButton;
    bsSkinSpeedButton11: TbsSkinSpeedButton;
    bsSkinSpeedButton12: TbsSkinSpeedButton;
    bsSkinSpeedButton13: TbsSkinSpeedButton;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    qry1: TADOQuery;
    qry1DeptName: TWideStringField;
    qry1EmpName: TWideStringField;
    qry1RollID: TWideStringField;
    qry1EmpID: TWideStringField;
    qry1RollDate: TDateTimeField;
    qry1WeekName: TWideStringField;
    qry1RollIn0: TDateTimeField;
    qry1RollIn1: TDateTimeField;
    qry1ModDate: TDateTimeField;
    qry1FlagTrashed: TSmallintField;
    qry1FlagDeleted: TSmallintField;
    qry1ExDate: TDateTimeField;
    qry1RollType: TWideStringField;
    qry1Remark: TWideStringField;
    qry1FlagReturn: TSmallintField;
    qry1Field: TIntegerField;
    qryDepartment: TADOQuery;
    dsDepartment: TDataSource;
    dsEmployee: TDataSource;
    bsSkinComboBox1: TbsSkinComboBox;
    tblEmployee: TADOTable;
    ds2: TDataSource;
    bsSkinDBGrid1: TbsSkinDBGrid;
    bsSkinDBGrid2: TbsSkinDBGrid;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure qry1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure bsSkinComboBox1Change(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    function SelectString():String;
    procedure bsSkinSpeedButton10Click(Sender: TObject);
    procedure bsSkinSpeedButton11Click(Sender: TObject);
    procedure bsSkinSpeedButton13Click(Sender: TObject);
    procedure bsSkinSpeedButton12Click(Sender: TObject);
    procedure bsSkinDateEdit2Change(Sender: TObject);
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure bsSkinSpeedButton2Click(Sender: TObject);
    procedure bsSkinSpeedButton3Click(Sender: TObject);
    procedure bsSkinSpeedButton5Click(Sender: TObject);
    procedure bsSkinSpeedButton9Click(Sender: TObject);
    procedure bsSkinSpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ElectronicAttendance: TElectronicAttendance;

implementation
  uses UHDHouseDataModule,Common,UElectronicAttendanceInfo,Math;
{$R *.dfm}

procedure TElectronicAttendance.qry1CalcFields(DataSet: TDataSet);
begin
   // qry1.FieldByName('时间差').Value:=trunc(qry1.FieldByName('RollIn1').Value)-trunc(qry1.FieldByName('RollIn0').Value);
   qry1.FieldByName('时间差').Value:=round(abs(qry1.FieldByName('RollIn1').Value-qry1.FieldByName('RollIn0').Value)*24*60*60);

end;

procedure TElectronicAttendance.FormShow(Sender: TObject);
begin
  self.qry1.Active:=True;
  self.qryDepartment.Active:=True;
  self.tblEmployee.Active:=true;
  // 部门
    bsSkinComboBox1.Items.Clear;
    bsSkinComboBox1.Items.Add('(全部)');
    with self.dsDepartment.DataSet do
    begin
      First;
      while not Eof do
      begin
        bsSkinComboBox1.Items.Add(VarToStr(FieldValues['DeptName']));
        Next;
      end;
    end;
    bsSkinComboBox1.ItemIndex:=0;
    self.bsSkinDateEdit1.Date:=Now;
    self.bsSkinDateEdit2.Date:=Now;
    bsSkinComboBox4.ItemIndex:=0;
    self.bsSkinSpeedButton8.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;

procedure TElectronicAttendance.bsSkinComboBox1Change(Sender: TObject);
begin
   bsSkinComboBox2.Items.Clear;
   bsSkinComboBox2.Items.Add('(全部)');
  if not (self.bsSkinComboBox1.Text='(全部)') then
  begin
   self.qryDepartment.Filter:='DeptName='+ QuotedStr(self.bsSkinComboBox1.Text);
   self.qryDepartment.Filtered:=true;
   self.tblEmployee.Filter:= 'DeptID='+QuotedStr(qryDepartment.FieldByName('DeptID').Value);
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
   self.qryDepartment.Filtered:=false;
   self.tblEmployee.Filtered:=false;
    end;
     bsSkinComboBox2.ItemIndex:=0;
end;
 //  查询
procedure TElectronicAttendance.bsSkinButton1Click(Sender: TObject);
begin
 self.qry1.Filter:=self.SelectString;
 self.qry1.Filtered:=true;
 self.bsSkinSpeedButton8.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
 end;
function TElectronicAttendance.SelectString():String;
var strFilter:string;
begin
  if IsUsingAccess then  //时间
  begin
      strFilter := strFilter + ' RollDate >= #'+self.bsSkinDateEdit1.Text+'# AND ';
      strFilter := strFilter + ' RollDate <= #'+self.bsSkinDateEdit2.Text+'#';
  end
  else
  begin
      strFilter := strFilter + ' RollDate >= '+QuotedStr(self.bsSkinDateEdit1.Text) +' AND ';
      strFilter := strFilter + ' RollDate <= '+QuotedStr(self.bsSkinDateEdit2.Text);
  end;
  if not (self.bsSkinComboBox1.Text='(全部)') then  //部门
  begin
     strFilter := strFilter +' AND DeptName='+ QuotedStr(self.bsSkinComboBox1.Text);
  end;
  if not (self.bsSkinComboBox2.Text='(全部)') then //员工
  begin
     strFilter := strFilter +' AND EmpName='+ QuotedStr(self.bsSkinComboBox2.Text);
  end;
  if not (self.bsSkinComboBox4.Text='(全部)') then  //类型
  begin
      strFilter := strFilter +' AND RollType='+ QuotedStr(self.bsSkinComboBox4.Text);
  end;
  Result := strFilter;
 end;
 //全
procedure TElectronicAttendance.bsSkinSpeedButton10Click(Sender: TObject);
var strFilter:string;
begin
   strFilter:= self.SelectString;
   self.qry1.Filter:= strFilter;
   self.qry1.Filtered:=true;
   self.bsSkinSpeedButton8.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;
 //上
procedure TElectronicAttendance.bsSkinSpeedButton11Click(Sender: TObject);
var strFilter:string;
begin
   strFilter:= self.SelectString;
   strFilter:=strFilter+' AND RollType=''上班''' ;
   self.qry1.Filter:= strFilter;
   self.qry1.Filtered:=true;
   self.bsSkinSpeedButton8.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;
//下
procedure TElectronicAttendance.bsSkinSpeedButton13Click(Sender: TObject);
var strFilter:string;
begin
   strFilter:= self.SelectString;
   strFilter:=strFilter+' AND RollType=''下班'''  ;
   self.qry1.Filter:= strFilter;
   self.qry1.Filtered:=true;
   self.bsSkinSpeedButton8.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;
 // 迟到
procedure TElectronicAttendance.bsSkinSpeedButton12Click(Sender: TObject);
var strFilter:string;
begin
   strFilter:= self.SelectString;
   strFilter:=strFilter+' AND Remark=''[迟到]'''  ;
   self.qry1.Filter:= strFilter;
   self.qry1.Filtered:=true;
   self.bsSkinSpeedButton8.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;
 //检查日期
procedure TElectronicAttendance.bsSkinDateEdit2Change(Sender: TObject);
begin
   if self.bsSkinDateEdit1.Date >self.bsSkinDateEdit2.Date then
   begin
      self.bsSkinDateEdit2.Date:= self.bsSkinDateEdit1.Date+1;
   end;
end;
 //登记考勤
procedure TElectronicAttendance.bsSkinSpeedButton1Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
      if ElectronicAttendanceInof= nil  then
      begin
           ElectronicAttendanceInof:=TElectronicAttendanceInof.Create(Self);
      end;
     Randomize;//初始
     ElectronicAttendanceInof.ParmEditorMode:='ADD';
     ElectronicAttendanceInof.ParmId:=FormatDateTime('yyyymmdd',Now)+IntToStr(RandomRange(10000000,99999999));
     ElectronicAttendanceInof.ShowModal;
     self.bsSkinSpeedButton5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;
procedure TElectronicAttendance.bsSkinSpeedButton2Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
      if ElectronicAttendanceInof= nil  then
      begin
           ElectronicAttendanceInof:=TElectronicAttendanceInof.Create(Self);
      end;
     ElectronicAttendanceInof.ParmEditorMode:='EDIT';
     ElectronicAttendanceInof.ParmId:=self.qry1.FieldByName('RollID').AsString;
     ElectronicAttendanceInof.DName:=self.qry1.FieldByName('DeptName').AsString;
     ElectronicAttendanceInof.EName:=self.qry1.FieldByName('EmpName').AsString;
     ElectronicAttendanceInof.ShowModal;
     self.bsSkinSpeedButton5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TElectronicAttendance.bsSkinSpeedButton3Click(Sender: TObject);
begin
  if not self.qry1.Eof then
  begin
  qry1.Edit;
  qry1.FieldByName('FlagDeleted').Value:=1;
  qry1.Post;
  self.bsSkinSpeedButton5Click(nil);
  end;
end;

procedure TElectronicAttendance.bsSkinSpeedButton5Click(Sender: TObject);
begin
  qry1.Close;
  qry1.Open;
end;

procedure TElectronicAttendance.bsSkinSpeedButton9Click(Sender: TObject);
begin
 Close;
end;
procedure TElectronicAttendance.bsSkinSpeedButton4Click(Sender: TObject);
begin
 self.qry1.Filtered:=false;
end;

procedure TElectronicAttendance.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
      ElectronicAttendance:=nil;
end;

end.
