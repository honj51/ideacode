unit UWorkSummaryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls,
  bsdbctrls, bsSkinCtrls, StdCtrls, Mask, DB, ADODB, Grids, DBGrids;

type
  TWorkSummaryForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bsknlbl1: TbsSkinLabel;
    bsknpnl1: TbsSkinPanel;
    bsknlbl2: TbsSkinLabel;
    bsknlbl3: TbsSkinLabel;
    edt1: TbsSkinDateEdit;
    bsknlbl4: TbsSkinLabel;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn8: TbsSkinButton;
    btn9: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qryDepartmentLookup: TADOQuery;
    dsDepartmentLookup: TDataSource;
    cbbDepartments: TbsSkinComboBox;
    qryReports: TADOQuery;
    dsReports: TDataSource;
    wdstrngfldReportsReportID: TWideStringField;
    wdstrngfldReportsEmpID: TWideStringField;
    qryReportsReportDate: TDateTimeField;
    qryReportsCommentDate: TDateTimeField;
    qryReportsModDate: TDateTimeField;
    qryReportsFlagTrashed: TSmallintField;
    qryReportsFlagDeleted: TSmallintField;
    qryReportsExDate: TDateTimeField;
    qryEmployee: TADOQuery;
    wdstrngfldReportsTitle: TWideStringField;
    wdstrngfldReportsContent: TWideStringField;
    wdstrngfldReportsComment: TWideStringField;
    wdstrngfldReportsSuggestion: TWideStringField;
    dsEmployee: TDataSource;
    strngfldReportsDeptName: TStringField;
    qryAllDepts: TADOQuery;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryReportsCalcFields(DataSet: TDataSet);
    function GetDeptNameByID(DeptID: string): string;
    function GetEmpNameByID(EmpID: string): string;
    function GetDeptIDByEmpID(EmpID: string): string;
    procedure wdstrngfldReportsEmpIDGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WorkSummaryForm: TWorkSummaryForm;

implementation
uses UHDHouseDataModule, USummaryForm;
{$R *.dfm}

function TWorkSummaryForm.GetDeptIDByEmpID(EmpID: string): string;
begin
  qryEmployee.Close;
  qryEmployee.SQL.Text := 'select DeptID from Employee where EmpID=' +
    QuotedStr(EmpID);
  qryEmployee.Open;
  Result := qryEmployee.FieldByName('DeptID').AsString;
end;

function TWorkSummaryForm.GetDeptNameByID(DeptID: string): string;
begin
  //
  qryDepartmentLookup.Close;
  qryDepartmentLookup.SQL.Text :=
    'select DeptID,DeptName from Department where DeptID=' + QuotedStr(DeptID);
  qryDepartmentLookup.Open;
  Result := qryDepartmentLookup.FieldByName('DeptName').AsString;
end;

function TWorkSummaryForm.GetEmpNameByID(EmpID: string): string;
begin
  //
  qryEmployee.Close;
  qryEmployee.SQL.Text := 'select EmpID,EmpName from Employee where EmpID=' +
    QuotedStr(EmpID);
  qryEmployee.Open;
  Result := qryEmployee.FieldByName('EmpName').AsString;
end;

procedure TWorkSummaryForm.btn1Click(Sender: TObject);
begin
  if SummaryForm = nil then
  begin
    SummaryForm := TSummaryForm.Create(Self);
  end;
  SummaryForm.Visible := False;
  SummaryForm.EmpName :=
    GetEmpNameByID(qryReports.FieldByName('EmpID').AsString);
  SummaryForm.DeptName :=
    GetDeptNameByID(GetDeptIDByEmpID(qryReports.FieldByName('EmpID').AsString));
  SummaryForm.ViewMode := True;
  SummaryForm.ShowModal;
  SummaryForm.ViewMode := False;
end;

procedure TWorkSummaryForm.btn2Click(Sender: TObject);
begin
  if SummaryForm = nil then
  begin
    SummaryForm := TSummaryForm.Create(Self);
  end;
  SummaryForm.Visible := False;

  qryReports.Append;
  Randomize; //每次随机数就不一样
  qryReports.FieldByName('ReportID').Value := random(100000000);
  qryReports.FieldByName('FlagDeleted').Value := 0;
  qryReports.FieldByName('ReportDate').Value := Now;
  if SummaryForm.ShowModal = mrOk then
  begin
    qryReports.Post;
  end
  else
  begin
    qryReports.Cancel;
  end;
end;

procedure TWorkSummaryForm.btn3Click(Sender: TObject);
begin
  if SummaryForm = nil then
  begin
    SummaryForm := TSummaryForm.Create(Self);
  end;
  SummaryForm.Visible := False;
  SummaryForm.EmpName :=
    GetEmpNameByID(qryReports.FieldByName('EmpID').AsString);
  SummaryForm.DeptName :=
    GetDeptNameByID(GetDeptIDByEmpID(qryReports.FieldByName('EmpID').AsString));
  qryReports.Edit;
  if SummaryForm.ShowModal = mrOk then
  begin
    qryReports.Post;
  end
  else
  begin
    qryReports.Cancel;
  end;

end;

procedure TWorkSummaryForm.FormShow(Sender: TObject);
var
  deptID: TStringList;
begin
  cbbDepartments.Items.AddObject('全部', nil);
  qryAllDepts.Open;
  with qryAllDepts do
  begin
    First;
    while not Eof do
    begin
      deptID := TStringList.Create;
      deptID.Add(FieldByName('DeptID').AsString);
      cbbDepartments.Items.AddObject(FieldByName('DeptName').AsString, deptID
        );
      Next;
    end;
  end;
  cbbDepartments.ItemIndex := 0;
end;

procedure TWorkSummaryForm.qryReportsCalcFields(DataSet: TDataSet);
var
  DeptName: string;
begin
  qryReports.Open;
  qryEmployee.Open;
  qryDepartmentLookup.Open;
  with qryReports do
  begin
    if qryReports.FieldByName('EmpID').Value = null then
      Exit;
    DeptName :=
      GetDeptNameByID(GetDeptIDByEmpID(qryReports.FieldByName('EmpID').AsString));
    FieldByName('DeptName').Value := DeptName;
  end;
end;

procedure TWorkSummaryForm.wdstrngfldReportsEmpIDGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  v: string;
begin
  v := Sender.AsString;
  Text := GetEmpNameByID(v);
end;

procedure TWorkSummaryForm.btn4Click(Sender: TObject);
begin
  if not qryReports.IsEmpty then
  begin
    if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后不能恢复！',
      '提示', nil, -1, [mbOK, mbCancel], 0) = 2 then
    begin
      Exit;
      Close;
    end;
    qryReports.Edit;

    qryReports.FieldByName('FlagDeleted').Value := 1;
    qryReports.Post;
  end;
  qryReports.Close;
  qryReports.Open;
end;

procedure TWorkSummaryForm.btn5Click(Sender: TObject);
begin
  qryReports.Close;
  qryReports.Open;
end;

procedure TWorkSummaryForm.btn8Click(Sender: TObject);
var
  sql: string;
begin
{  sql := 'select * from Report where ReportDate  > #' + edt1.Text + ' ' + '00:00:00' +
    '# And ReportDate< #' + edt2.Text + ' ' + '23:59:59' + '#';
    }
    sql := 'select * from Report where FlagDeleted=0';

  if cbbDepartments.ItemIndex > 0 then
  begin
    sql := sql + ' and EmpID in (select EmpID from Employee where DeptId= (select DeptID from Department where DeptName=' +
      QuotedStr(cbbDepartments.Items[cbbDepartments.ItemIndex]) + '))';
  end;
  
  if edt3.Text <> EmptyStr then
  begin
    sql := sql + ' and Content like #%' + edt3.Text +
      '%#';
  end;

  qryReports.SQL.Clear;
  qryReports.SQL.Add(sql);
  qryReports.Close;
  qryReports.Open;
end;

end.

