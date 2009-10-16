unit UCommentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinCtrls, bsSkinBoxCtrls, StdCtrls, Mask,
  bsdbctrls, bsSkinGrids, bsDBGrids, DB, ADODB;

type
  TCommentForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    bsknlbl1: TbsSkinLabel;
    btn7: TbsSkinSpeedButton;
    bsknpnl1: TbsSkinPanel;
    bsknlbl2: TbsSkinLabel;
    bsknlbl3: TbsSkinLabel;
    edt1: TbsSkinDateEdit;
    bsknlbl4: TbsSkinLabel;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn8: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    qry_Comment: TADOQuery;
    ds_Comment: TDataSource;
    qry_Department: TADOQuery;
    ds_Department: TDataSource;
    cbb1: TbsSkinComboBox;
    tbl_Employee: TADOTable;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    procedure FormShow(Sender: TObject);
    procedure f_show();
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CommentForm: TCommentForm;

implementation
              uses UHDHouseDataModule,UCommentSettingForm;

{$R *.dfm}

procedure TCommentForm.f_show();
begin
  cbb1.Items.Clear;
    cbb1.Items.Add('(全部)');
      with self.ds_Department.DataSet do
    begin
      First;
      while not Eof do
      begin

        cbb1.Items.Add(VarToStr(FieldValues['DeptName']));
        Next;
      end;
    end;
       cbb1.ItemIndex:=0;

end;

procedure TCommentForm.FormShow(Sender: TObject);
begin
 self.qry_Comment.Active:=True;
  self.qry_Department.Active:=True;
  //Self.tbl_Employee.Active:=True;

  // 部门
    cbb1.Items.Clear;
    cbb1.Items.Add('(全部)');
     f_show;
      bsknlbl1.Caption:=IntToStr(qry_Comment.RecordCount);
end;

procedure TCommentForm.bskndbgrd1DblClick(Sender: TObject);
begin
    inherited;
  if not qry_Comment.IsEmpty THEN
  Begin
    Try
       if CommentSettingForm= nil  then
      begin
           CommentSettingForm:=TCommentSettingForm.Create(Self);
      end;
        CommentSettingForm.ParmEditorMode := 'EDIT';
        CommentSettingForm.DName:=qry_Comment.fieldbyname('DeptName').AsString;
        CommentSettingForm.EName:=qry_Comment.fieldbyname('EmpName').AsString;
      CommentSettingForm.ParmId := qry_Comment.fieldbyname('CommentID').AsString;
      CommentSettingForm.Visible:=False;
     CommentSettingForm.ShowModal;
    Finally
      qry_Comment.Close;
       qry_Comment.Open;

    End;
  end;
end;


procedure TCommentForm.btn2Click(Sender: TObject);
begin
      if CommentSettingForm= nil  then
      begin
           CommentSettingForm:=TCommentSettingForm.Create(Self);
      end;
       CommentSettingForm.ParmEditorMode := 'ADD';
      CommentSettingForm.Visible:=False;
     CommentSettingForm.ShowModal;
     
      qry_Comment.Close;
       qry_Comment.Open;
        bsknlbl1.Caption:=IntToStr(qry_Comment.RecordCount);
end;

procedure TCommentForm.btn3Click(Sender: TObject);
begin
      inherited;
  if not qry_Comment.IsEmpty THEN
  Begin
    Try
       if CommentSettingForm= nil  then
      begin
           CommentSettingForm:=TCommentSettingForm.Create(Self);
      end;
        CommentSettingForm.ParmEditorMode := 'EDIT';
        CommentSettingForm.DName:=qry_Comment.fieldbyname('DeptName').AsString;
        CommentSettingForm.EName:=qry_Comment.fieldbyname('EmpName').AsString;
      CommentSettingForm.ParmId := qry_Comment.fieldbyname('CommentID').AsString;
      CommentSettingForm.Visible:=False;
     CommentSettingForm.ShowModal;
    Finally
      qry_Comment.Close;
       qry_Comment.Open;

    End;
  end;
end;

procedure TCommentForm.btn4Click(Sender: TObject);
begin
          inherited;
    //
    if not qry_Comment.IsEmpty then
    begin
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('确定要将选定点评放入回收站吗？！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;
            qry_Comment.Edit;
            
        qry_Comment.FieldByName('FlagDeleted').Value:=1;
        qry_Comment.Post;
    end;
       qry_Comment.Close;
       qry_Comment.Open;
        bsknlbl1.Caption:=IntToStr(qry_Comment.RecordCount);
end;

procedure TCommentForm.btn8Click(Sender: TObject);
begin

        qry_Comment.Filter:= ' RegDate  > #'+edt1.Text+' '+'00:00:00'+'# And RegDate< #'+edt2.Text+' '+'23:59:59'+'#';

         if cbb1.ItemIndex>0 then
         begin
               qry_Comment.Filter:=qry_Comment.Filter+' and DeptName =#'+cbb1.Items[cbb1.ItemIndex]+'#';
          end;
          if edt3.Text<>EmptyStr then
          begin
              qry_Comment.Filter:=qry_Comment.Filter+' and Content like #%'+edt3.Text+'%#';
          end;
         qry_Comment.Filtered:=True;
         qry_Comment.Close;
         qry_Comment.Open;
          bsknlbl1.Caption:=IntToStr(qry_Comment.RecordCount);
end;

procedure TCommentForm.btn5Click(Sender: TObject);
begin

      qry_Comment.Filter:='';
      qry_Comment.Filtered:=True;
     qry_Comment.Close;
     qry_Comment.Open;
     bsknlbl1.Caption:=IntToStr(qry_Comment.RecordCount);
end;

procedure TCommentForm.edt3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if key = VK_RETURN then
        btn8.SetFocus;
end;

procedure TCommentForm.btn7Click(Sender: TObject);
begin
       Close;
end;

procedure TCommentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   CommentForm := nil;
end;

end.
