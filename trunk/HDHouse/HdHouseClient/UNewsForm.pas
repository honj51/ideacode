unit UNewsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinGrids, bsDBGrids, bsSkinBoxCtrls,
  bsdbctrls, bsSkinCtrls, StdCtrls, Mask, DB, ADODB;

type
    TNewsForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
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
    bskndbgrd1: TbsSkinDBGrid;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    qry_News: TADOQuery;
    ds_News: TDataSource;
    tbl_Employee: TADOTable;
    qry_Department: TADOQuery;
    ds_Department: TDataSource;
    cbb1: TbsSkinComboBox;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
     procedure f_show();
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
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
  NewsForm: TNewsForm;

implementation

        uses UHDHouseDataModule,UNewsInfoForm;

{$R *.dfm}

procedure TNewsForm.f_show();
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

procedure TNewsForm.btn1Click(Sender: TObject);
begin
      if NewsInfoForm= nil  then
      begin
           NewsInfoForm:=TNewsInfoForm.Create(Self);
      end;
      NewsInfoForm.Visible:=False;
     NewsInfoForm.ShowModal;

end;

procedure TNewsForm.FormShow(Sender: TObject);
begin
    self.qry_News.Active:=True;
    self.qry_Department.Active:=True;
    Self.tbl_Employee.Active:=True;

    // 部门
    cbb1.Items.Clear;
    cbb1.Items.Add('(全部)');
     f_show;
      bsknlbl1.Caption:=IntToStr(qry_News.RecordCount);
end;

procedure TNewsForm.btn2Click(Sender: TObject);
begin
         if NewsInfoForm= nil  then
      begin
           NewsInfoForm:=TNewsInfoForm.Create(Self);
      end;
       NewsInfoForm.ParmEditorMode := 'ADD';
      NewsInfoForm.Visible:=False;
     NewsInfoForm.ShowModal;
      qry_News.Close;
       qry_News.Open;
        bsknlbl1.Caption:=IntToStr(qry_News.RecordCount);
end;

procedure TNewsForm.btn3Click(Sender: TObject);
begin
      if not qry_News.IsEmpty THEN
  Begin
    Try
       if NewsInfoForm= nil  then
      begin
           NewsInfoForm:=TNewsInfoForm.Create(Self);
      end;
        NewsInfoForm.ParmEditorMode := 'EDIT';
        NewsInfoForm.DName:=qry_News.fieldbyname('DeptName').AsString;
        NewsInfoForm.EName:=qry_News.fieldbyname('EmpName').AsString;
      NewsInfoForm.ParmId := qry_News.fieldbyname('NewsID').AsString;
      NewsInfoForm.Visible:=False;
     NewsInfoForm.ShowModal;
    Finally
      qry_News.Close;
       qry_News.Open;

    End;
  end;
end;

procedure TNewsForm.btn5Click(Sender: TObject);
begin
        qry_News.Filter:='';
      qry_News.Filtered:=True;
     qry_News.Close;
     qry_News.Open;
      bsknlbl1.Caption:=IntToStr(qry_News.RecordCount);
end;

procedure TNewsForm.btn8Click(Sender: TObject);
begin
     qry_News.Filter:= ' RegDate  > #'+edt1.Text+' '+'00:00:00'+'# And RegDate< #'+edt2.Text+' '+'23:59:59'+'#';
         if cbb1.ItemIndex>0 then
         begin
          qry_News.Filter:=qry_News.Filter+' and DeptName =#'+cbb1.Items[cbb1.ItemIndex]+'#';
          end;
          if edt3.Text<>EmptyStr then
          begin
              qry_News.Filter:=qry_News.Filter+' and Content like #%'+edt3.Text+'%#';
          end;
         qry_News.Filtered:=True;
         qry_News.Close;
         qry_News.Open;
         bsknlbl1.Caption:=IntToStr(qry_News.RecordCount);
end;

procedure TNewsForm.bskndbgrd1DblClick(Sender: TObject);
begin
         inherited;
  if not qry_News.IsEmpty THEN
  Begin
    Try
       if NewsInfoForm= nil  then
      begin
           NewsInfoForm:=TNewsInfoForm.Create(Self);
      end;
        NewsInfoForm.ParmEditorMode := 'EDIT';
        NewsInfoForm.DName:=qry_News.fieldbyname('DeptName').AsString;
        NewsInfoForm.EName:=qry_News.fieldbyname('EmpName').AsString;
      NewsInfoForm.ParmId := qry_News.fieldbyname('NewsID').AsString;
      NewsInfoForm.Visible:=False;
     NewsInfoForm.ShowModal;
    Finally
      qry_News.Close;
       qry_News.Open;

    End;
  end;
end;

procedure TNewsForm.btn4Click(Sender: TObject);
begin
    if not qry_News.IsEmpty then
  begin

   if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('确定要将选定的新闻放入回收站吗？！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;

       qry_News.Edit;
        qry_News.FieldByName('FlagDeleted').Value:=1;
        qry_News.Post;
    end;
       qry_News.Close;
       qry_News.Open;
        bsknlbl1.Caption:=IntToStr(qry_News.RecordCount);
end;

procedure TNewsForm.edt3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_RETURN then
        btn8.SetFocus;
end;

procedure TNewsForm.btn7Click(Sender: TObject);
begin
    Close;
end;

procedure TNewsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
      NewsForm := nil;
end;

end.
