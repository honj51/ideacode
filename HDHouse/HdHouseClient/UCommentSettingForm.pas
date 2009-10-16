unit UCommentSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinBoxCtrls, bsdbctrls, Mask, bsSkinCtrls,
  BusinessSkinForm, DB, ADODB;

type
  TCommentSettingForm = class(TForm)
    grp1: TGroupBox;
    bsknpnl1: TbsSkinPanel;
    bsknlbl1: TbsSkinLabel;
    bsknlbl2: TbsSkinLabel;
    bsknlbl3: TbsSkinLabel;
    edtRegDate: TbsSkinDBEdit;
    mmoContent: TbsSkinDBMemo;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry_CommentInfo: TADOQuery;
    ds_CommentInfo: TDataSource;
    ds_Department: TDataSource;
    ds_Employee: TDataSource;
    cbb1: TbsSkinComboBox;
    cbb2: TbsSkinComboBox;
    qry_Employee: TADOQuery;
    qry_Department: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  CommentSettingForm: TCommentSettingForm;

implementation
            uses UHDHouseDataModule,UCommentForm,Math;
{$R *.dfm}

procedure TCommentSettingForm.f_show();
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

procedure TCommentSettingForm.FormShow(Sender: TObject);
begin
       inherited;
         with qry_CommentInfo do
  begin

    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //
    f_show;
     if ParmEditorMode = 'ADD' then
    begin
         edtRegDate.Text:='（系统时间）';
              Append;
                 Randomize;
        qry_CommentInfo.FieldByName('CommentID').Value :=FormatDateTime('yyyymmddhhmmss',Now)+IntToStr(RandomRange(10000000,99999999));
         qry_CommentInfo.FieldByName('RegDate').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
         qry_CommentInfo.FieldByName('FlagDeleted').Value := 0;
          qry_CommentInfo.FieldByName('FlagTrashed').Value := 0;
    end;
        end;
        if ParmEditorMode = 'EDIT' then
       begin
         cbb1.ItemIndex:=cbb1.Items.IndexOf(DName); 
         cbb2.ItemIndex:=cbb2.Items.IndexOf(EName);
       end;



  //操作按钮
  if ParmEditorMode='EDIT' then
  begin
       qry_CommentInfo.Edit;
  qry_CommentInfo.FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);

    edtRegDate.Enabled:=False;
  end
  else
  begin
     edtRegDate.Enabled:=True;
  end;
end;

procedure TCommentSettingForm.cbb1Change(Sender: TObject);
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


end;

procedure TCommentSettingForm.btn1Click(Sender: TObject);
begin

      if Self.mmoContent.Text=EmptyStr  then
      begin
        HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请填写点评内容！', '提示', nil, -1, [mbOK], 0);
          Exit;
          Close;
      end;
       qry_CommentInfo.Edit;
      qry_CommentInfo.FieldByName('EmpID').Value:=StringList1.ValueFromIndex[StringList1.IndexOfName(cbb2.Items[cbb2.itemIndex])];
      
         if ParmEditorMode = 'ADD' then
        begin
          qry_CommentInfo.Post;
        end;

  HDHouseDataModule.con1.BeginTrans;
  try
    qry_CommentInfo.UpdateBatch;
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

procedure TCommentSettingForm.btn2Click(Sender: TObject);
begin
       qry_CommentInfo.CancelBatch;
          qry_CommentInfo.close;
          Close;
end;

procedure TCommentSettingForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     inherited;
      //  数据已更改
      if qry_CommentInfo.Modified then
      begin
        // 放弃修改
          btn2Click(nil);
      end;
end;

procedure TCommentSettingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      qry_CommentInfo.close;
          Close;
end;

end.
