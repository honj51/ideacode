unit UEmployeeManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, UDataOperateBarView, bsSkinGrids,
  bsDBGrids, Mask, bsSkinBoxCtrls, BusinessSkinForm, DB, ADODB, frxClass,
  frxExportXML, frxDBSet;

type
  TEmployeeManageForm = class(TForm)
    bskndbgrd1: TbsSkinDBGrid;
    bskntlbr1: TbsSkinToolBar;
    edt1: TbsSkinEdit;
    lbl1: TbsSkinStdLabel;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknscrlbr1: TbsSkinScrollBar;
    dtprtbrvw1: TDataOperateBarView;
    frxdbdtstygxx: TfrxDBDataset;
    frxrprtygxx: TfrxReport;
    frxmlxprt1: TfrxXMLExport;
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure edt1ButtonClick(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtprtbrvw1btn5Click(Sender: TObject);
    procedure dtprtbrvw1btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeeManageForm: TEmployeeManageForm;

implementation
   uses UHDHouseDataModule,UEmployeeInfoForm;
{$R *.dfm}

procedure TEmployeeManageForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
    inherited;
    Try
      EmployeeInfoForm.ParmEditorMode := 'ADD';
      EmployeeInfoForm.ShowModal;
    Finally

    End;
    HDHouseDataModule.qry_ygxx.Close;
    HDHouseDataModule.qry_ygxx.Open;
end;

procedure TEmployeeManageForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
  inherited;

  if not HDHouseDataModule.qry_ygxx.IsEmpty THEN
  Begin
    Try
      EmployeeInfoForm.ParmEditorMode := 'EDIT';
      EmployeeInfoForm.ParmId := HDHouseDataModule.qry_ygxx.fieldbyname('ygxx_bh').AsString;
      EmployeeInfoForm.ShowModal;
    Finally

    End;
     HDHouseDataModule.qry_ygxx.Close;
        HDHouseDataModule.qry_ygxx.Open;
  end;

end;

procedure TEmployeeManageForm.bskndbgrd1DblClick(Sender: TObject);
begin
     inherited;

  if not HDHouseDataModule.qry_ygxx.IsEmpty THEN
  Begin
    Try
      EmployeeInfoForm.ParmEditorMode := 'EDIT';
      EmployeeInfoForm.ParmId := HDHouseDataModule.qry_ygxx.fieldbyname('ygxx_bh').AsString;
      EmployeeInfoForm.ShowModal;
    Finally

    End;
     HDHouseDataModule.qry_ygxx.Close;
        HDHouseDataModule.qry_ygxx.Open;
  end;


   
end;

procedure TEmployeeManageForm.edt1ButtonClick(Sender: TObject);
begin
     inherited;
    //
    
    HDHouseDataModule.qry_ygxx.Filter:='';
      if not HDHouseDataModule.qry_ygxx.IsEmpty THEN
      begin
        if edt1.Text<>'' then
        begin
           HDHouseDataModule.qry_ygxx.Filter:= 'ygxx_bh like %'+edt1.Text+'%  ';
             HDHouseDataModule.qry_ygxx.Filtered:=True;
        end
         else
      begin
         HDHouseDataModule.qry_ygxx.Filtered:=False;
      end;
      end

end;

procedure TEmployeeManageForm.dtprtbrvw1btn3Click(Sender: TObject);
//var id:string;
begin
      inherited;
    //
    if not HDHouseDataModule.qry_ygxx.IsEmpty then
    begin
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后不能恢复！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;

            HDHouseDataModule.qry_ygxx.Delete;
    end;


end;

procedure TEmployeeManageForm.FormShow(Sender: TObject);
begin
      inherited;
    //
        HDHouseDataModule.qry_ygxx.Close;
        HDHouseDataModule.qry_ygxx.Open;
end;

procedure TEmployeeManageForm.dtprtbrvw1btn5Click(Sender: TObject);
begin
  if self.frxrprtygxx.PrepareReport then
  begin
      self.frxrprtygxx.ShowPreparedReport;
  end;
end;

procedure TEmployeeManageForm.dtprtbrvw1btn4Click(Sender: TObject);
begin
  if self.frxrprtygxx.PrepareReport then
  begin
      self.frxrprtygxx.Export(self.frxmlxprt1);
  end;
end;

end.
