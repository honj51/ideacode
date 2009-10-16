unit UEstateDictionaryInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, ComCtrls, bsSkinTabs, bsdbctrls,
  bsSkinBoxCtrls, Mask, BusinessSkinForm, DB, ADODB, bscalc;

type
  TEstateDictionaryInfoForm = class(TForm)
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bsknpntpnl1: TbsSkinPaintPanel;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    grp1: TGroupBox;
    grp4: TGroupBox;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    lbl6: TbsSkinStdLabel;
    lbl7: TbsSkinStdLabel;
    lbl8: TbsSkinStdLabel;
    lbl9: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl11: TbsSkinStdLabel;
    lbl12: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    edt5: TbsSkinDBEdit;
    edt6: TbsSkinDBEdit;
    edt7: TbsSkinDBEdit;
    cbb3: TbsSkinDBComboBox;
    lbl13: TbsSkinStdLabel;
    lbl14: TbsSkinStdLabel;
    lbl15: TbsSkinStdLabel;
    lbl16: TbsSkinStdLabel;
    lbl17: TbsSkinStdLabel;
    lbl18: TbsSkinStdLabel;
    lbl19: TbsSkinStdLabel;
    lbl20: TbsSkinStdLabel;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    bsknchckrdbx3: TbsSkinCheckRadioBox;
    bsknchckrdbx4: TbsSkinCheckRadioBox;
    bsknchckrdbx5: TbsSkinCheckRadioBox;
    bsknchckrdbx6: TbsSkinCheckRadioBox;
    edt10: TbsSkinEdit;
    lbl21: TbsSkinStdLabel;
    cbb2: TbsSkinDBComboBox;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry1: TADOQuery;
    qrypream1: TADOQuery;
    qryArea: TADOQuery;
    dsArea: TDataSource;
    qrypream2: TADOQuery;
    dspream1: TDataSource;
    dspream2: TDataSource;
    ds1: TDataSource;
    bsSkinDBComboBox1: TbsSkinDBComboBox;
    bsSkinDBComboBox2: TbsSkinDBComboBox;
    bsSkinDBMemo1: TbsSkinDBMemo;
    bsSkinComboBox1: TbsSkinComboBox;
    bsSkinDBCurrencyEdit1: TbsSkinDBCurrencyEdit;
    bsSkinDBCurrencyEdit2: TbsSkinDBCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private

    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    CityName:string;
    DistrictName:string;
    AreaName:string;
    { Public declarations }
  end;

var
  EstateDictionaryInfoForm: TEstateDictionaryInfoForm;
implementation

  uses UHDHouseDataModule;

{$R *.dfm}

procedure TEstateDictionaryInfoForm.FormShow(Sender: TObject);
var year,i:Integer;
begin
  self.qryArea.Active:=true;
  self.qrypream1.Active:=true;
  self.qrypream2.Active:=true;
  self.qry1.Active:=true;
  self.edt1.Enabled:=false;
  self.edt2.Enabled:=false;
  self.bsSkinDBComboBox1.Items.Clear;
  year:=StrToInt(formatDateTime('yyyy',date));
  for   i:=1930  to  year+5   do
  begin
    self.bsSkinDBComboBox1.Items.Add(IntToStr(i));
  end;
  self.bsSkinDBComboBox1.Items.Add('2000后');
  self.bsSkinDBComboBox1.Items.Add('90年代');
  self.bsSkinDBComboBox1.Items.Add('80年代');
  self.bsSkinDBComboBox1.Items.Add('70年代');
  self.bsSkinDBComboBox1.Items.Add('60年代');
  self.bsSkinDBComboBox1.Items.Add('50年代');
  self.bsSkinDBComboBox1.ItemIndex:=0;
  self.qryArea.Close;
  self.qryArea.Parameters.ParamByName('City').Value := CityName;
  self.qryArea.Parameters.ParamByName('District').Value := DistrictName;
  self.qryArea.Open;
  bsSkinComboBox1.Items.Clear;
  with self.dsArea.DataSet do
  begin
    First;
    while not Eof do
    begin
      bsSkinComboBox1.Items.Add(VarToStr(FieldValues['AreaName']));
      Next;
    end;
  end;
  //物来用途
  cbb2.Items.Clear;
  with self.dspream1.DataSet do
  begin
    First;
    while not Eof do
    begin
      cbb2.Items.Add(VarToStr(FieldValues['ItemValue']));
      Next;
    end;
  end;
  //物业类别
  cbb3.Items.Clear;
  with self.dspream2.DataSet do
  begin
    First;
    while not Eof do
    begin
      cbb3.Items.Add(VarToStr(FieldValues['ItemValue']));
      Next;
    end;
  end;
  self.qry1.Close;
  self.qry1.Parameters.ParamByName('ID').Value:= ParmId;
  self.qry1.Open;
  
  self.qry1.Edit;
  if( ParmEditorMode = 'ADD') then
  begin
      self.qry1.FieldByName('CityName').Value:=CityName;
      self.qry1.FieldByName('DistrictName').Value:=DistrictName;
      if not (AreaName='') then
      begin
         self.bsSkinComboBox1.ItemIndex:=bsSkinComboBox1.Items.IndexOf(self.AreaName);
      end
      else
      begin
         self.bsSkinComboBox1.ItemIndex:=0;
      end;
      self.bsSkinDBComboBox1.ItemIndex:=0;
      self.bsSkinDBComboBox2.ItemIndex:=0;
      cbb2.ItemIndex:=0;
      cbb3.ItemIndex:=0;
  end;
  if( ParmEditorMode = 'EDIT') then
  begin
    self.bsSkinComboBox1.ItemIndex:=bsSkinComboBox1.Items.IndexOf(self.AreaName);
  end;

end;

procedure TEstateDictionaryInfoForm.btn1Click(Sender: TObject);
begin
   if  edt3.Text =''then
   begin
     Application.MessageBox('楼盘名称不能为空', 'vcxz', MB_OK);
     edt3.SetFocus;
     Exit;
   end;
   if edt4.Text='' then
   begin
     Application.MessageBox('拼音缩写不能为空', 'vcxz', MB_OK);
     edt4.SetFocus;
     Exit;
   end;
   if (edt5.Text='') and (edt6.Text='') then
   begin
     Application.MessageBox('地址至少填写一个', 'vcxz', MB_OK);
     edt5.SetFocus;
     Exit;
   end;
   qryArea.Filter:= 'AreaName='+QuotedStr(self.bsSkinComboBox1.Text);
   qryArea.Filtered:=true;
   qry1.FieldByName('Areaid').Value:=qryArea.FieldByName('Areaid').Value ;
   qryArea.Filtered:=false;
   qry1.FieldByName('EstateID').Value:=ParmId;
   qry1.Post;
   Close;
end;

procedure TEstateDictionaryInfoForm.btn2Click(Sender: TObject);
begin
Close;
end;

end.
