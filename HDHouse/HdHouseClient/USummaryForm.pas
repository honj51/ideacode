unit USummaryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinBoxCtrls, bsdbctrls, StdCtrls, Mask,
  BusinessSkinForm, DB, ADODB, Grids, DBGrids, DBCtrls;

type
  TSummaryForm = class(TForm)
    grp1: TGroupBox;
    bsknpnl1: TbsSkinPanel;
    bsknlbl1: TbsSkinLabel;
    bsknlbl2: TbsSkinLabel;
    edtTitle: TbsSkinDBEdit;
    mmoContent: TbsSkinDBMemo;
    bsknlbl3: TbsSkinLabel;
    mmoSuggestion: TbsSkinDBMemo;
    bsknlbl4: TbsSkinLabel;
    bsknlbl5: TbsSkinLabel;
    edtReportDate: TbsSkinDBEdit;
    bsknlbl6: TbsSkinLabel;
    mmoComment: TbsSkinDBMemo;
    btnSave: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    dsDept: TDataSource;
    dsEmp: TDataSource;
    cbbDeptName: TbsSkinComboBox;
    cbbEmpName: TbsSkinComboBox;
    qryDept: TADOQuery;
    qryEmp: TADOQuery;

    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbDeptNameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    DeptName: string;
    EmpName: string;
    ViewMode: Boolean;
  end;

var
  SummaryForm: TSummaryForm;

implementation
uses UHDHouseDataModule, UWorkSummaryForm;
{$R *.dfm}

procedure TSummaryForm.btnSaveClick(Sender: TObject);
var
  empID: string;
begin
  ModalResult := mrOk;
  empID := TStringList(cbbEmpName.Items.Objects[cbbEmpName.ItemIndex])[0];
  WorkSummaryForm.qryReports.FieldByName('EmpID').Value := empID;
end;

procedure TSummaryForm.FormShow(Sender: TObject);
var
  deptID: TStringList;
begin
  with qryDept do
  begin
    First;
    cbbDeptName.Items.Clear;
    while not Eof do
    begin
      deptID := TStringList.Create;
      deptID.Add(FieldByName('DeptID').AsString);
      cbbDeptName.Items.AddObject(FieldByName('DeptName').AsString, deptID);
      Next;
    end;
    cbbDeptName.ItemIndex := cbbDeptName.Items.IndexOf(DeptName);
  end;

  if ViewMode then
  begin
    btnSave.Visible := False;
  end
  else
  begin
    btnSave.Visible := True;
  end;
end;

procedure TSummaryForm.cbbDeptNameChange(Sender: TObject);
var
  deptID: string;
  empID: TStringList;
begin
  // TODO: free objects in the combobox
  with qryEmp do
  begin
    Close;
    deptID := TStringList(cbbDeptName.Items.Objects[cbbDeptName.ItemIndex])[0];
    SQL.Text := 'select EmpName,EmpID from Employee where DeptID=' +
      QuotedStr(deptID);
    Open;

    First;
    Self.cbbEmpName.Items.Clear;
    while not Eof do
    begin
      empID := TStringList.Create;
      empID.Add(FieldByName('EmpID').AsString);
      Self.cbbEmpName.Items.AddObject(FieldByName('EmpName').AsString, empID);
      Next;
    end;
    cbbEmpName.ItemIndex := cbbEmpName.Items.IndexOf(EmpName);
  end;
end;

procedure TSummaryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // free objects in comboboxs
end;

end.

