unit UNewsInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls, bsdbctrls, Mask,
  BusinessSkinForm, DB, ADODB;

type
  TNewsInfoForm = class(TForm)
    bsknlbl1: TbsSkinLabel;
    bsknlbl2: TbsSkinLabel;
    edtTitle: TbsSkinDBEdit;
    mmoContent: TbsSkinDBMemo;
    grp1: TGroupBox;
    bsknpnl1: TbsSkinPanel;
    grp2: TGroupBox;
    bsknlbl3: TbsSkinLabel;
    bsknlbl4: TbsSkinLabel;
    bsknlbl5: TbsSkinLabel;
    bsknlbl6: TbsSkinLabel;
    cbb3: TbsSkinComboBox;
    edtSource: TbsSkinDBEdit;
    cbb1: TbsSkinComboBox;
    cbb2: TbsSkinComboBox;
    edtRegDate: TbsSkinDBEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    dlgColor1: TColorDialog;
    bskntlbr1: TbsSkinToolBar;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    ds_NewsInfo: TDataSource;
    qry_NewsInfo: TADOQuery;
    ds_Department: TDataSource;
    ds_Employee: TDataSource;
    qry_Employee: TADOQuery;
    qry_Department: TADOQuery;
    procedure edtTitleButtonClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
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
  NewsInfoForm: TNewsInfoForm;

implementation
            uses UHDHouseDataModule,UNewsForm,Math;

{$R *.dfm}

procedure TNewsInfoForm.f_show();
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

procedure TNewsInfoForm.edtTitleButtonClick(Sender: TObject);
begin
      if dlgColor1.Execute then
      begin
         Self.edtTitle.Font.Color:=Self.dlgColor1.Color;
      end;
end;

procedure TNewsInfoForm.btn3Click(Sender: TObject);
begin
Self.mmoContent.Font.Size:=-12;
end;

procedure TNewsInfoForm.btn4Click(Sender: TObject);
begin
Self.mmoContent.Font.Size:=12;
end;

procedure TNewsInfoForm.btn5Click(Sender: TObject);
begin
Self.mmoContent.Font.Size:=19;
end;

procedure TNewsInfoForm.FormShow(Sender: TObject);
begin
      inherited;

         with qry_NewsInfo do
  begin

    close;
    Parameters.ParamByName('id').Value := ParmId;
    open;
    //
    f_show;
     if ParmEditorMode = 'ADD' then
    begin
      cbb3.ItemIndex:=1;
          Append;
         Randomize;
         FieldByName('NewsID').Value:= FormatDateTime('yyyymmddhhmmss',Now)+IntToStr(RandomRange(10000000,99999999));
        FieldByName('RegDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        FieldByName('FlagDeleted').Value := 0;
        FieldByName('FlagTrashed').Value := 0;
    end;

     if ParmEditorMode = 'EDIT' then
       begin
          cbb3.ItemIndex:=cbb3.Items.IndexOf(FieldByName('NewsType').Value);
         cbb1.ItemIndex:=cbb1.Items.IndexOf(DName);
         cbb2.ItemIndex:=cbb2.Items.IndexOf(EName);
         dlgColor1.Color:= qry_NewsInfo.FieldByName('TitleColor').Value;
         edtTitle.Font.Color:=qry_NewsInfo.FieldByName('TitleColor').Value;
          Edit;
      FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
            //操作按钮

      // qry_NewsInfo.Edit;
  //qry_NewsInfo.FieldByName('ModDate').Value:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);

    //edtRegDate.Enabled:=False;
 
       end;
        end;


end;

procedure TNewsInfoForm.cbb1Change(Sender: TObject);
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

procedure TNewsInfoForm.btn2Click(Sender: TObject);
begin
 qry_NewsInfo.CancelBatch;
          qry_NewsInfo.close;
          Close;
end;

procedure TNewsInfoForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
         inherited;
      //  数据已更改
      if qry_NewsInfo.Modified then
      begin
        // 放弃修改
          btn2Click(nil);
      end;
end;

procedure TNewsInfoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      qry_NewsInfo.close;
          Close;
end;

procedure TNewsInfoForm.btn1Click(Sender: TObject);
begin
      if  mmoContent.Text=EmptyStr then
        begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请填写新闻内容！', '提示', nil, -1, [mbOK], 0);
          Exit;
          Close;
        end;
         if  edtTitle.Text=EmptyStr then
        begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('请填写标题内容！', '提示', nil, -1, [mbOK], 0);
          Exit;
          Close;
        end;
      qry_NewsInfo.Edit;
      qry_NewsInfo.FieldByName('EmpID').Value:=StringList1.ValueFromIndex[StringList1.IndexOfName(cbb2.Items[cbb2.itemIndex])];
       qry_NewsInfo.FieldByName('NewsType').Value:=cbb3.Text;
        qry_NewsInfo.FieldByName('TitleColor').Value:=dlgColor1.Color;

         if ParmEditorMode = 'ADD' then
        begin
          qry_NewsInfo.Post;

        end;

  HDHouseDataModule.con1.BeginTrans;
  try
    qry_NewsInfo.UpdateBatch;
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

end.
