unit UDatabaseMantainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  ComCtrls, bsSkinTabs, BusinessSkinForm, bsSkinShellCtrls;

type
  TDatabaseMantainForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    lbl1: TbsSkinStdLabel;
    btn1: TbsSkinButton;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    edtbak_days: TbsSkinDBEdit;
    edtbak_blsl: TbsSkinDBEdit;
    btn3: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    btn2: TbsSkinButton;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edt3: TbsSkinFileEdit;
    edt2: TbsSkinFileEdit;
    edt1: TbsSkinEdit;
    bsknsvdlg1: TbsSkinSaveDialog;
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt1ButtonClick(Sender: TObject);
    procedure bsknsvdlg1Show(Sender: TObject);
    procedure bsknsvdlg1Close(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseMantainForm: TDatabaseMantainForm;

implementation
        uses UHDHouseDataModule;
{$R *.dfm}

procedure TDatabaseMantainForm.btn4Click(Sender: TObject);
begin
       inherited;
    //
    HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('压缩成功！', '提示', nil, -1, [mbOk], 0);

end;

procedure TDatabaseMantainForm.btn3Click(Sender: TObject);
begin
  inherited;
    //
    with HDHouseDataModule.qry_autobak do
    begin
         Edit;
         fieldbyname('bak_date').Value:=now;
         fieldbyname('bak_lj').AsString:=edt3.Text;
               if  bsknchckrdbx1.Checked then
               begin
                   fieldbyname('bak_qy').AsString:='Y'
               end
               else
               begin
                 fieldbyname('bak_qy').AsString:='N';
               end;
               end;
            HDHouseDataModule.con1.BeginTrans;
           try
            HDHouseDataModule.qry_autobak.UpdateBatch;
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

procedure TDatabaseMantainForm.FormShow(Sender: TObject);
begin
     inherited;
    //
      
      with HDHouseDataModule.qry_autobak do
    begin
      if fieldbyname('bak_qy').AsString='Y' then
      begin
          bsknchckrdbx1.Checked :=True;
      end
      else
      begin
         bsknchckrdbx1.Checked:=False;
      end;
        edt3.Text:=fieldbyname('bak_lj').AsString;
    end;
        edt1.Text:= GetCurrentDir+'\database\databak\'+FormatDateTime('yymmdd',Now)+'.dat' ;
end;

procedure TDatabaseMantainForm.btn1Click(Sender: TObject);
var NewDataFilePath,DataFilePath:string;
begin
       inherited;
    //
     DataFilePath := GetCurrentDir+'\database\hdhouse.mdb';
     NewDataFilePath:=edt1.Text;
    if  CopyFile(pChar(DataFilePath),pChar(NewDataFilePath),false) then  HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('备份成功！', '提示', nil, -1, [mbOk], 0)

     else HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('备份失败！', '提示', nil, -1, [mbOk], 0);
              ;
end;

procedure TDatabaseMantainForm.btn2Click(Sender: TObject);
var NewDataFilePath,DataFilePath:string;
begin
     inherited;
    //
       DataFilePath := edt2.Text;
        NewDataFilePath:= GetCurrentDir+'\database\hdhouse.mdb';
       if  CopyFile(pChar(DataFilePath),pChar(NewDataFilePath),false) then  HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('恢复成功！', '提示', nil, -1, [mbOk], 0)

     else HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('恢复失败！', '提示', nil, -1, [mbOk], 0);
              ;

end;
   procedure TDatabaseMantainForm.edt1ButtonClick(Sender: TObject);
begin
  inherited;
    //
    bsknsvdlg1.Execute;
end;

procedure TDatabaseMantainForm.bsknsvdlg1Show(Sender: TObject);
begin
  inherited;
    //
        Self.bsknsvdlg1.FileName:=GetCurrentDir+'\database\databak\'+FormatDateTime('yymmddhhmmss',Now)+'.dat' ;
end;

procedure TDatabaseMantainForm.bsknsvdlg1Close(Sender: TObject);
begin
       edt1.Text:= bsknsvdlg1.FileName;
end;



end.


