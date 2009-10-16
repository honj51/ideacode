unit UPlanSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, StdCtrls, Mask, bsSkinCtrls, BusinessSkinForm,
  DB, ADODB, bsdbctrls;

type
  TPlanSettingForm = class(TForm)
    bsknpnl1: TbsSkinPanel;
    grp1: TGroupBox;
    bsknlbl1: TbsSkinLabel;
    bsknlbl2: TbsSkinLabel;
    edt1: TbsSkinDateEdit;
    cbb3: TbsSkinComboBox;
    bsknlbl3: TbsSkinLabel;
    cbb4: TbsSkinComboBox;
    bsknlbl4: TbsSkinLabel;
    cbb1: TbsSkinComboBox;
    cbb2: TbsSkinComboBox;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    ds_Department: TDataSource;
    qry_PlanInfo: TADOQuery;
    ds_PlanInfo: TDataSource;
    ds_Employee: TDataSource;
    qry_Employee: TADOQuery;
    qry_Department: TADOQuery;
    mmoContent: TbsSkinDBMemo;
    procedure FormShow(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure cbb3Change(Sender: TObject);
  private
     procedure f_show();
      private StringList1:TStringList;
    { Private declarations }
  public
    ParmEditorMode:string;  // 参数：编辑器模式(ADD:新增,EDIT:修改)
    ParmId:string;
    DName:string;
    EName:string;
    { Public declarations }
  end;

var
  PlanSettingForm: TPlanSettingForm;

implementation
             uses UHDHouseDataModule,UPlanForm,Math;
{$R *.dfm}

procedure TPlanSettingForm.f_show();
begin
    cbb1.Items.Clear;
        self.qry_Department.Active:=True;
        Self.qry_Employee.Active:=True;
        StringList1:=TStringList.Create;

        with ds_Department.DataSet do
        begin
            First;
            while not Eof do
      begin
        cbb1.Items.Add(VarToStr(FieldValues['DeptName']));
       StringList1.add(fieldByName('DeptName').AsString+'='+fieldByName('DeptID').AsString);
        Next;
      end;
        end;
        cbb1.ItemIndex:=0;
          cbb2.Items.Clear;
        with qry_Employee do
        begin
               Open;
                 Filter:='DeptID = '+ StringList1.ValueFromIndex[StringList1.IndexOfName(cbb1.Items[cbb1.itemIndex])];
                Filtered:=True;
                  First;
            while not Eof do
      begin
        cbb2.Items.Add(VarToStr(FieldValues['EmpName']));
          StringList1.add(fieldByName('EmpName').AsString+'='+fieldByName('EmpID').AsString);
        Next;
        end;
        end;
             cbb2.ItemIndex:=0;
           
end;

procedure TPlanSettingForm.FormShow(Sender: TObject);
begin
    inherited;
          cbb3.ItemIndex:=0;
        cbb4.ItemIndex:=1;
         with qry_PlanInfo do
  begin

    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //
    f_show;
     if ParmEditorMode = 'ADD' then
    begin
          Append;
         Randomize;
         FieldByName('PlanID').Value:= FormatDateTime('yyyymmddhhmmss',Now)+IntToStr(RandomRange(10000000,99999999));
         FieldByName('StartDate').AsString:= FormatDateTime('yyyy-mm-dd',edt1.Date)+' '+cbb3.Items[cbb3.ItemIndex];
         FieldByName('EndDate').AsString:= FormatDateTime('yyyy-mm-dd',edt1.Date)+' '+cbb4.Items[cbb4.ItemIndex];
         FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
         FieldByName('FlagDeleted').Value := 0;
         FieldByName('FlagTrashed').Value := 0;
         FieldByName('FlagFinished').Value := 0;

    end;

     if ParmEditorMode = 'EDIT' then
       begin
           cbb3.ItemIndex:=cbb3.Items.IndexOf(FormatDateTime('hh:mm',FieldByName('StartDate').Value));
           cbb4.ItemIndex:=cbb4.Items.IndexOf(FormatDateTime('hh:mm',FieldByName('EndDate').Value));
           edt1.Text:=FormatDateTime('yyyy-mm-dd',FieldByName('StartDate').Value);

         if  FieldByName('FlagFinished').Value >0 then
         begin
          bsknchckrdbx1.Checked:= True;
         end
         else
         begin
         bsknchckrdbx1.Checked:= False;
         end;

         cbb1.ItemIndex:=cbb1.Items.IndexOf(DName);
         cbb2.ItemIndex:=cbb2.Items.IndexOf(EName);
       end;
        end;




  //操作按钮
  if ParmEditorMode='EDIT' then
  begin
       qry_PlanInfo.Edit;
  qry_PlanInfo.FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);

    //edtRegDate.Enabled:=False;
  end
  else
  begin
     //edtRegDate.Enabled:=True;
  end;
end;

procedure TPlanSettingForm.cbb1Change(Sender: TObject);
begin
    cbb2.Items.Clear;
        with qry_Employee do
        begin
               Open;
               Filter:='DeptID = '+StringList1.ValueFromIndex[StringList1.IndexOfName(cbb1.Items[cbb1.itemIndex])];
                Filtered:=True;
                  First;
            while not Eof do
      begin
        cbb2.Items.Add(VarToStr(FieldValues['EmpName']));
          StringList1.add(fieldByName('EmpName').AsString+'='+fieldByName('EmpID').AsString);
        Next;
        end;
        end;
             cbb2.ItemIndex:=0;
                   if Self.ParmEditorMode='Edit' then
                   begin
                      cbb1.ItemIndex:=cbb1.Items.IndexOf(DName);
                   end;

end;

procedure TPlanSettingForm.btn2Click(Sender: TObject);
begin
     qry_PlanInfo.CancelBatch;
          qry_PlanInfo.close;
          Close;
end;

procedure TPlanSettingForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
          inherited;
      //  数据已更改
      if qry_PlanInfo.Modified then
      begin
        // 放弃修改
          btn2Click(nil);
      end;
end;

procedure TPlanSettingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        qry_PlanInfo.close;
          Close;
end;

procedure TPlanSettingForm.btn1Click(Sender: TObject);
begin
        if  mmoContent.Text=EmptyStr then
        begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请填写日程内容！', '提示', nil, -1, [mbOK], 0);
          Exit;
          Close;
        end;
       qry_PlanInfo.Edit;
        if bsknchckrdbx1.Checked then
         begin
         qry_PlanInfo.FieldByName('FlagFinished').Value :=1;
         end
         else
         begin
          qry_PlanInfo.FieldByName('FlagFinished').Value :=0;
         end;
      qry_PlanInfo.FieldByName('EmpID').Value:=StringList1.ValueFromIndex[StringList1.IndexOfName(cbb2.Items[cbb2.itemIndex])];
      qry_PlanInfo.FieldByName('StartDate').AsString:= FormatDateTime('yyyy-mm-dd',edt1.Date)+' '+cbb3.Items[cbb3.ItemIndex];
       qry_PlanInfo.FieldByName('EndDate').AsString:= FormatDateTime('yyyy-mm-dd',edt1.Date)+' '+cbb4.Items[cbb4.ItemIndex];
         
         if ParmEditorMode = 'ADD' then
        begin
          qry_PlanInfo.Post;

        end;

  HDHouseDataModule.con1.BeginTrans;
  try
    qry_PlanInfo.UpdateBatch;
    //
    HDHouseDataModule.con1.CommitTrans;
  except
    HDHouseDataModule.con1.RollbackTrans;
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存失败！', '提示', nil, -1, [mbOk], 0);
    exit;
  end;
     HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('数据保存成功！', '提示', nil, -1, [mbOk], 0);
  Close;
end;

procedure TPlanSettingForm.cbb3Change(Sender: TObject);
begin
  cbb4.ItemIndex:= cbb4.Items.IndexOf(cbb3.Items[cbb3.ItemIndex+1]);

end;

end.
