unit UElectronicAttendanceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxpngimage, ExtCtrls, bsdbctrls, bsSkinBoxCtrls, StdCtrls,
  DBCtrls, bsSkinCtrls, Mask, BusinessSkinForm, DB, ADODB;

type
  TElectronicAttendanceInof = class(TForm)
    grp1: TGroupBox;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    lbl5: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    bsSkinDBEdit1: TbsSkinDBEdit;
    dbmmoRemark: TDBMemo;
    img1: TImage;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinDBComboBox3: TbsSkinDBComboBox;
    bsSkinDateEdit1: TbsSkinDateEdit;
    bsSkinDateEdit2: TbsSkinDateEdit;
    dsD: TDataSource;
    bsSkinDBDateEdit1: TbsSkinDBDateEdit;
    bsSkinTimeEdit1: TbsSkinTimeEdit;
    bsSkinTimeEdit2: TbsSkinTimeEdit;
    qry1: TADOQuery;
    ds1: TDataSource;
    bsSkinComboBox1: TbsSkinComboBox;
    bsSkinComboBox2: TbsSkinComboBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    procedure FormShow(Sender: TObject);
    procedure bsSkinDBDateEdit1Change(Sender: TObject);
    procedure bsSkinDBComboBox3Change(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    procedure bsSkinComboBox1Change(Sender: TObject);
    procedure bsSkinButton2Click(Sender: TObject);
  private
   private StringList1:TStringList;
    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    DName:string;
    EName:string;
    { Public declarations }
  end;

var
  ElectronicAttendanceInof: TElectronicAttendanceInof;

implementation
   uses UHDHouseDataModule,UElectronicAttendance;
{$R *.dfm}
 //��ʾ
procedure TElectronicAttendanceInof.FormShow(Sender: TObject);
begin
    ElectronicAttendance.qryDepartment.Active:=true;
    ElectronicAttendance.tblEmployee.Active:=true;
    self.bsSkinComboBox1.Items.Clear;
    with ElectronicAttendance.dsDepartment.DataSet do
    begin
      First;
      while not Eof do
      begin
        bsSkinComboBox1.Items.Add(VarToStr(FieldValues['DeptName']));
        Next;
      end;
    end;
    self.bsSkinComboBox2.Items.Clear;
    with ElectronicAttendance.dsEmployee.DataSet do
    begin
      First;
      while not Eof do
      begin
        bsSkinComboBox2.Items.Add(VarToStr(FieldValues['EmpName']));
        Next;
      end;
    end;
    qry1.Close;
    qry1.Parameters.ParamByName('ID').Value := ParmId;
    qry1.Open;
    self.qry1.Edit;
    if( ParmEditorMode = 'ADD') then
    begin
      bsSkinComboBox1.ItemIndex:=0;
      bsSkinComboBox2.ItemIndex:=0;
      bsSkinDBComboBox3.ItemIndex:=0;
      qry1.FieldByName('FlagDeleted').Value:=0;
      qry1.FieldByName('FlagTrashed').Value:=0;
      qry1.FieldByName('ExDate').Value:=Now;
    end;
    if( ParmEditorMode = 'EDIT') then
    begin
      self.bsSkinComboBox1.ItemIndex:=bsSkinComboBox1.Items.IndexOf(self.DName);
      self.bsSkinComboBox2.ItemIndex:=self.bsSkinComboBox2.Items.IndexOf(self.EName);
      self.bsSkinDateEdit1.Date:=self.qry1.FieldByName('RollIn0').Value;
      self.bsSkinDateEdit2.Date:=self.qry1.FieldByName('RollIn1').Value;
      self.bsSkinTimeEdit1.Time:=FormatDateTime('hh:mm:ss',self.qry1.FieldByName('RollIn0').AsDateTime);
      self.bsSkinTimeEdit2.Time:=FormatDateTime('hh:mm:ss',self.qry1.FieldByName('RollIn1').AsDateTime);
      if qry1.FieldByName('FlagReturn').Value=1 then
      begin
       bsknchckrdbx1.Checked:=true;
       end
      else
      begin
       bsknchckrdbx1.Checked:=false;
       end;
    end;

end;

procedure TElectronicAttendanceInof.bsSkinDBDateEdit1Change(
  Sender: TObject);
begin
    case  DayOfWeek(self.bsSkinDBDateEdit1.Date)   of
          1:self.bsSkinDBEdit1.Text:='������';
          2:bsSkinDBEdit1.Text:='����һ';
          3:bsSkinDBEdit1.Text:='���ڶ�';
          4:bsSkinDBEdit1.Text:='������';
          5:bsSkinDBEdit1.Text:='������';
          6:bsSkinDBEdit1.Text:='������';
          7:bsSkinDBEdit1.Text:='������';
      end;
end;

procedure TElectronicAttendanceInof.bsSkinDBComboBox3Change(
  Sender: TObject);
begin

  if self.bsSkinDBComboBox3.Text='����'then
  begin
    self.lbl4.Caption:='����ʱ��';
    self.lbl5.Caption:='����ʱ��';
    self.bsSkinDateEdit1.Date:=Now;
    self.bsSkinDateEdit2.Date:=Now;
    self.bsSkinTimeEdit1.Time:=TimeToStr(time);
    self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
  if self.bsSkinDBComboBox3.Text='����'then
  begin
     self.lbl4.Caption:='����ʱ��';
     self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
     exit;
  end;
  if self.bsSkinDBComboBox3.Text='����'then
  begin
   self.lbl4.Caption:='����ʱ��';
    self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);

    exit;
  end;
  if self.bsSkinDBComboBox3.Text='�ɵ�'then
  begin
    self.lbl4.Caption:='�ɵ�ʱ��';
     self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
  if self.bsSkinDBComboBox3.Text='��ѵ'then
  begin
    self.lbl4.Caption:='��ѵʱ��';
    self.lbl5.Caption:='����ʱ��';
      self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
  if self.bsSkinDBComboBox3.Text='�ϰ�'then
  begin
    self.lbl4.Caption:='�涨ʱ��';
    self.lbl5.Caption:='ʵ��ʱ��';
    exit;
  end;
  if self.bsSkinDBComboBox3.Text='�°�'then
  begin
    self.lbl4.Caption:='�涨ʱ��';
    self.lbl5.Caption:='ʵ��ʱ��';
    exit;
  end;
  if self.bsSkinDBComboBox3.Text='���°�'then
  begin
    self.lbl4.Caption:='�涨ʱ��';
    self.lbl5.Caption:='ʵ��ʱ��';
    exit;
  end;
if self.bsSkinDBComboBox3.Text='���°�'then
  begin
    self.lbl4.Caption:='�涨ʱ��';
    self.lbl5.Caption:='ʵ��ʱ��';
    exit;
  end;
if self.bsSkinDBComboBox3.Text='���'then
  begin
     self.lbl4.Caption:='���ʱ��';
     self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
if self.bsSkinDBComboBox3.Text='���'then
  begin
     self.lbl4.Caption:='���ʱ��';
     self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
if self.bsSkinDBComboBox3.Text='���'then
   begin
     self.lbl4.Caption:='���ʱ��';
     self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
if self.bsSkinDBComboBox3.Text='���'then
  begin
    self.lbl4.Caption:='���ʱ��';
    self.lbl5.Caption:='����ʱ��';
    self.bsSkinDateEdit1.Date:=Now;
    self.bsSkinDateEdit2.Date:=Now;
    self.bsSkinTimeEdit1.Time:=TimeToStr(time);
    self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
if self.bsSkinDBComboBox3.Text='���'then
  begin
    self.lbl4.Caption:='���ʱ��';
    self.lbl5.Caption:='����ʱ��';
    self.bsSkinDateEdit1.Date:=Now;
    self.bsSkinDateEdit2.Date:=Now;
    self.bsSkinTimeEdit1.Time:=TimeToStr(time);
    self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
if self.bsSkinDBComboBox3.Text='����'then
  begin
    self.lbl4.Caption:='����ʱ��';
    self.lbl5.Caption:='����ʱ��';
     self.bsSkinDateEdit1.Date:=Now;
     self.bsSkinDateEdit2.Date:=Now;
     self.bsSkinTimeEdit1.Time:=TimeToStr(time);
     self.bsSkinTimeEdit2.Time:=TimeToStr(time + 1/(60*60*24)*60*60);
    exit;
  end;
end;

procedure TElectronicAttendanceInof.bsSkinButton1Click(Sender: TObject);
begin
   if self.bsSkinComboBox1.Text =''then
   begin
      Application.MessageBox('����Ա������Ϊ��', 'vcxz', MB_OK);
      self.bsSkinComboBox1.SetFocus;
      Exit;
   end;
   ElectronicAttendance.tblEmployee.Filter:= 'EmpName='+QuotedStr(self.bsSkinComboBox2.Text);
   ElectronicAttendance.tblEmployee.Filtered:=true;
   qry1.FieldByName('EmpID').Value:=ElectronicAttendance.tblEmployee.FieldByName('EmpID').Value ;
   ElectronicAttendance.tblEmployee.Filtered:=false;
   qry1.FieldByName('RollID').Value:=ParmId;
   qry1.FieldByName('ModDate').Value:=Now;
  if  bsknchckrdbx1.Checked then
  begin
    qry1.FieldByName('FlagReturn').Value:=1;
   end
  else
  begin
    qry1.FieldByName('FlagReturn').Value:=0;
   end;
  qry1.FieldByName('RollIn0').Value :=self.bsSkinDateEdit1.Text+' '+self.bsSkinTimeEdit1.Text;
  qry1.FieldByName('RollIn1').Value :=self.bsSkinDateEdit2.Text+' '+self.bsSkinTimeEdit2.Text;
  qry1.Post;
  Close;
end;

procedure TElectronicAttendanceInof.bsSkinComboBox1Change(Sender: TObject);
begin
   ElectronicAttendance.qryDepartment.Filter:='DeptName='+ QuotedStr(self.bsSkinComboBox1.Text);
   ElectronicAttendance.qryDepartment.Filtered:=true;
   ElectronicAttendance.tblEmployee.Filter:= 'DeptID='+QuotedStr(ElectronicAttendance.qryDepartment.FieldByName('DeptID').Value);
   ElectronicAttendance.tblEmployee.Filtered:=true;
   self.bsSkinComboBox2.Items.Clear;
   with ElectronicAttendance.dsEmployee.DataSet do
   begin
      First;
      while not Eof do
      begin
       // bsSkinComboBox2.Items.Add(VarToStr(FieldValues['EmpName']));
      //  StringList1.add(VarToStr(FieldValues['EmpName'])+'='+VarToStr(FieldValues['EmpID']));
        bsSkinComboBox2.Items.Add(VarToStr(FieldValues['EmpName']));
        //bsSkinComboBox2.Items.AddObject(VarToStr(FieldValues['EmpName']),TObject(VarToStr(FieldValues['EmpID'])));
        Next;
      end;
   end;
   ElectronicAttendance.qryDepartment.Filtered:=false;
   ElectronicAttendance.tblEmployee.Filtered:=false;
   bsSkinComboBox2.ItemIndex:=0;
end;

procedure TElectronicAttendanceInof.bsSkinButton2Click(Sender: TObject);
begin
Close;
end;

end.
