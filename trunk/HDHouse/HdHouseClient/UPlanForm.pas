unit UPlanForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinBoxCtrls, bsdbctrls, bsSkinCtrls,
  StdCtrls, Mask, bsCalendar, bsSkinGrids, bsDBGrids, DB, ADODB;

type
  TPlanForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
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
    bsbsnsknfrm1: TbsBusinessSkinForm;
    btn10: TbsSkinSpeedButton;
    btn11: TbsSkinSpeedButton;
    bsknpnl2: TbsSkinPanel;
    bsknpnl3: TbsSkinPanel;
    bsknmnthclndr1: TbsSkinMonthCalendar;
    mmo1: TbsSkinMemo;
    bskndbgrd1: TbsSkinDBGrid;
    bskndbgrd2: TbsSkinDBGrid;
    btn14: TbsSkinSpeedButton;
    grp1: TGroupBox;
    btn12: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    qry_Plan: TADOQuery;
    ds_Plan: TDataSource;
    bsknpnl4: TbsSkinPanel;
    bsknscrlbr3: TbsSkinScrollBar;
    bsknscrlbr4: TbsSkinScrollBar;
    bsknpnl5: TbsSkinPanel;
    bsknscrlbr5: TbsSkinScrollBar;
    bsknscrlbr6: TbsSkinScrollBar;
    qry_Department: TADOQuery;
    ds_Department: TDataSource;
    ds_Employee: TDataSource;
    qry_Employee: TADOQuery;
    cbb1: TbsSkinComboBox;
    cbb2: TbsSkinComboBox;
    wdstrngfld_PlanDeptName: TWideStringField;
    wdstrngfld_PlanEmpName: TWideStringField;
    wdstrngfld_PlanPlanID: TWideStringField;
    wdstrngfld_PlanContent: TWideStringField;
    qry_PlanStartDate: TDateTimeField;
    qry_PlanEndDate: TDateTimeField;
    wdstrngfld_PlanEmpID: TWideStringField;
    qry_PlanModDate: TDateTimeField;
    qry_PlanFlagTrashed: TSmallintField;
    qry_PlanFlagDeleted: TSmallintField;
    qry_PlanExDate: TDateTimeField;
    qry_PlanFlagFinished: TSmallintField;
    strngfld_PlanFlagFinishedText: TStringField;
    procedure btn1Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure bskndbgrd1CellClick(Column: TbsColumn);
    procedure btn5Click(Sender: TObject);
    procedure bsknmnthclndr1DblClick(Sender: TObject);
    procedure edt3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure f_show();
      procedure f_showdata();
  private
      private StringList1:TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlanForm: TPlanForm;

implementation
            uses UHDHouseDataModule,UPlanSettingForm;
{$R *.dfm}
   procedure TPlanForm.f_showdata();
begin

      with ds_Plan.DataSet do
      begin
          First;
        while not Eof do
        begin

           if qry_Plan.FieldValues['FlagFinished']=1 then
           begin
              Edit;
            FieldValues['FlagFinishedText']:='是'

           end
           else
           begin
              Edit;
              FieldValues['FlagFinishedText']:='否'

           end;
              Next;
        end;

      end;


end;

procedure TPlanForm.f_show();
begin


      cbb1.Items.Clear;
      cbb1.Items.Add('(全部)');
        self.qry_Department.Active:=True;
        Self.qry_Employee.Active:=True;
        StringList1:=TStringList.Create;
                 StringList1.add('(全部)=0');
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
           cbb2.Items.Add('(全部)');
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

procedure TPlanForm.btn1Click(Sender: TObject);
begin

      if PlanSettingForm= nil  then
      begin
           PlanSettingForm:=TPlanSettingForm.Create(Self);
      end;
       PlanSettingForm.ParmEditorMode := 'ADD';
      PlanSettingForm.Visible:=False;
     PlanSettingForm.ShowModal;
      qry_Plan.Close;
       qry_Plan.Open;
        f_showdata;
        bsknlbl1.Caption:=IntToStr(qry_Plan.RecordCount);
end;

procedure TPlanForm.btn14Click(Sender: TObject);
begin
      if  bsknpnl2.Visible=True then
 begin
    bsknpnl2.Visible:=False;
 end
    else
        begin
             bsknpnl2.Visible:=True;
        end;

end;

procedure TPlanForm.btn12Click(Sender: TObject);
begin
      bsknpnl4.Visible:=True;
         bsknpnl5.Visible:=False;
          btn8.Enabled:=True;
            edt3.Enabled:=True;

end;

procedure TPlanForm.btn3Click(Sender: TObject);
begin
         bsknpnl5.Visible:=True;
           bsknpnl4.Visible:=False;
            btn8.Enabled:=False;
             edt3.Text:=EmptyStr;
            edt3.Enabled:=False;
            
end;

procedure TPlanForm.FormShow(Sender: TObject);
begin
      qry_Plan.Active:=True;
                   qry_Plan.Open;
       bskndbgrd2.Columns[1].Title.Caption:='日程'+FormatDateTime('yyyy年mm月dd日 ddd',bsknmnthclndr1.Date);
           f_showdata; 

       f_show;
end;

procedure TPlanForm.cbb1Change(Sender: TObject);
begin
            cbb2.Items.Clear;
          cbb2.Items.Add('(全部)');
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
end;

procedure TPlanForm.btn11Click(Sender: TObject);
begin
     if not qry_Plan.IsEmpty then
  begin

   if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后不能恢复！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;

       qry_Plan.Edit;
        qry_Plan.FieldByName('FlagDeleted').Value:=1;
         qry_Plan.FieldByName('ExDate').Value := FormatDateTime('yyyy-mm-dd',Now);
        qry_Plan.Post;
    end;
       qry_Plan.Close;
       qry_Plan.Open;
        f_showdata;
        bsknlbl1.Caption:=IntToStr(qry_Plan.RecordCount);

end;

procedure TPlanForm.btn10Click(Sender: TObject);
begin
      inherited;
      if bsknpnl4.Visible=False then
      begin
         HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('该功能适用于（普通视图）！', '提示', nil, -1, [mbOK], 0);
         Exit;
         Close;
     end ;
       if bskndbgrd1.SelectedIndex=0 then
      begin
             HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请选择要修改的日程？！', '提示', nil, -1, [mbOK], 0);
          Exit;
          Close;
      end;
  if not qry_Plan.IsEmpty THEN
  Begin
    Try
       if PlanSettingForm= nil  then
      begin
           PlanSettingForm:=TPlanSettingForm.Create(Self);
      end;
        PlanSettingForm.ParmEditorMode := 'EDIT';
        PlanSettingForm.DName:=qry_Plan.fieldbyname('DeptName').AsString;
        PlanSettingForm.EName:=qry_Plan.fieldbyname('EmpName').AsString;
      PlanSettingForm.ParmId := qry_Plan.fieldbyname('PlanID').AsString;
      PlanSettingForm.Visible:=False;
     PlanSettingForm.ShowModal;
    Finally
      qry_Plan.Close;
       qry_Plan.Open;
        f_showdata;
    End;
  end;
end;

procedure TPlanForm.bskndbgrd1DblClick(Sender: TObject);
begin
        inherited;

  if not qry_Plan.IsEmpty THEN
  Begin
    Try
       if PlanSettingForm= nil  then
      begin
           PlanSettingForm:=TPlanSettingForm.Create(Self);
      end;
        PlanSettingForm.ParmEditorMode := 'EDIT';
        PlanSettingForm.DName:=qry_Plan.fieldbyname('DeptName').AsString;
        PlanSettingForm.EName:=qry_Plan.fieldbyname('EmpName').AsString;
      PlanSettingForm.ParmId := qry_Plan.fieldbyname('PlanID').AsString;
      PlanSettingForm.Visible:=False;
     PlanSettingForm.ShowModal;
    Finally
      qry_Plan.Close;
       qry_Plan.Open;

    End;
  end;
end;

procedure TPlanForm.btn8Click(Sender: TObject);
begin

      qry_Plan.Filter:= ' StartDate  > #'+edt1.Text+' '+'00:00:00'+'# And StartDate< #'+edt2.Text+' '+'23:59:59'+'#';
         if cbb1.ItemIndex>0 then
         begin
               qry_Plan.Filter:=qry_Plan.Filter+' and DeptName =#'+cbb1.Items[cbb1.ItemIndex]+'#';
          end;
          if cbb2.ItemIndex>0 then
         begin
               qry_Plan.Filter:=qry_Plan.Filter+' and EmpName =#'+cbb2.Items[cbb2.ItemIndex]+'#';
          end;

          if edt3.Text<>EmptyStr then
          begin
              qry_Plan.Filter:=qry_Plan.Filter+' and Content like #%'+edt3.Text+'%#';
          end;
         qry_Plan.Filtered:=True;
         qry_Plan.Close;
         qry_Plan.Open;
          f_showdata;
         bsknlbl1.Caption:=IntToStr(qry_Plan.RecordCount);
end;

procedure TPlanForm.bskndbgrd1CellClick(Column: TbsColumn);
begin
      inherited;
  if not qry_Plan.IsEmpty THEN
  Begin
    Self.mmo1.Text:=qry_Plan.FieldValues['DeptName']+'  '+qry_Plan.FieldValues['EmpName']+'  '+FormatDateTime('yyyy-mm-dd hh:mm',qry_Plan.FieldValues['StartDate'])+'-'+FormatDateTime('hh:mm',qry_Plan.FieldValues['EndDate'])+#13+#10+#13+#10+qry_Plan.FieldValues['Content'];
  end;
end;

procedure TPlanForm.btn5Click(Sender: TObject);
begin
   qry_Plan.Filter:='';
      qry_Plan.Filtered:=True;
   qry_Plan.Close;
   qry_Plan.Open;
    f_showdata;
    bsknlbl1.Caption:=IntToStr(qry_Plan.RecordCount);
end;

procedure TPlanForm.bsknmnthclndr1DblClick(Sender: TObject);
begin
        bsknpnl5.Visible:=True;
           bsknpnl4.Visible:=False;
            btn8.Enabled:=False;
            edt3.Text:=EmptyStr;
            edt3.Enabled:=False;
            bskndbgrd2.Columns[1].Title.Caption:='日程'+FormatDateTime('yyyy年mm月dd日 ddd',bsknmnthclndr1.Date);
        qry_Plan.Filter:= ' StartDate  > #'+FormatDateTime('yyyy-mm-dd',bsknmnthclndr1.Date)+' '+'00:00:00'+'# And StartDate< #'+FormatDateTime('yyyy-mm-dd',bsknmnthclndr1.Date)+' '+'23:59:59'+'#';
        qry_Plan.Filtered:=True;
         qry_Plan.Close;
         qry_Plan.Open;
          bsknlbl1.Caption:=IntToStr(qry_Plan.RecordCount);
end;

procedure TPlanForm.edt3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if key = VK_RETURN then
        btn8.SetFocus;
end;

procedure TPlanForm.btn7Click(Sender: TObject);
begin
    Close;
end;

procedure TPlanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
   PlanForm := nil;
end;

end.
