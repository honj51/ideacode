unit UCustomerQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinExCtrls, bsSkinBoxCtrls, bsdbctrls,
  ExtCtrls, Mask;

type
  TCustomerQueryForm = class(TForm)
    grp1: TGroupBox;
    lbl12: TbsSkinStdLabel;
    edtdlwz: TbsSkinEdit;
    edtwymc: TbsSkinEdit;
    lbl11: TbsSkinStdLabel;
    bsknchckrdbxrq: TbsSkinCheckRadioBox;
    bsknchckrdbxnq: TbsSkinCheckRadioBox;
    bsknchckrdbxyx: TbsSkinCheckRadioBox;
    bsknchckrdbxkd: TbsSkinCheckRadioBox;
    bvl1: TBevel;
    lbl3: TbsSkinStdLabel;
    lbl10: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    lbl14: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    btn2: TbsSkinXFormButton;
    btn1: TbsSkinXFormButton;
    lbl5: TbsSkinStdLabel;
    cbbhxjg2: TbsSkinComboBox;
    lbl6: TbsSkinStdLabel;
    cbbhxjg1: TbsSkinComboBox;
    cbbjylx: TbsSkinComboBox;
    cbbqy: TbsSkinComboBox;
    edtjg1: TbsSkinNumericEdit;
    edtjg2: TbsSkinNumericEdit;
    edtmj1: TbsSkinNumericEdit;
    edtmj2: TbsSkinNumericEdit;
    procedure btn2Click(Sender: TObject);
    procedure grp1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     FilterString:string;
    { Public declarations }
  end;

var
  CustomerQueryForm: TCustomerQueryForm;

implementation
uses UParametersDataModule;
{$R *.dfm}

//ȡ��
procedure TCustomerQueryForm.btn2Click(Sender: TObject);
begin
  FilterString:='';
  CustomerQueryForm.Close;
end;

procedure TCustomerQueryForm.grp1Click(Sender: TObject);
begin

end;
//���崴��
procedure TCustomerQueryForm.FormCreate(Sender: TObject);
begin
  //

   cbbqy.Items.Clear;
   cbbqy.Items.Add('����');
    //with ParametersDataModule.dsHouseSource.DataSet do
    with ParametersDataModule.dsHouseRegion.DataSet do
    begin
      First;
      while not Eof do
      begin
        cbbqy.Items.Add(VarToStr(FieldValues['cs_mc']));
        Next;
      end;
    end;
    cbbqy.ItemIndex:=0;
end;

//ȷ��
procedure TCustomerQueryForm.btn1Click(Sender: TObject);
begin
//
 FilterString:='';
  if cbbjylx.Text='����' then
   begin
      FilterString:= FilterString+'khzy_qz=''Y''';
      if (edtjg1.Text <> '') and (edtjg1.Text <> '0')  then
      begin
         FilterString:= FilterString+' and khzy_zj1 >='+edtjg1.Text;
      end;

      if (edtjg2.Text <> '') and (edtjg2.Text <> '0') then
      begin
         FilterString:= FilterString+' and khzy_zj2 <='+edtjg2.Text;
      end;
   end else
   begin
      FilterString:= FilterString+'khzy_qg=''Y''';
      if edtjg1.Text <> '' then
      begin
         FilterString:= FilterString+' and khzy_sj1 >='+edtjg1.Text;
      end;

      if edtjg2.Text <> '' then
      begin
         FilterString:= FilterString+' and khzy_sj2 <='+edtjg2.Text;
      end;
   end;

   if cbbqy.Text <> '����' then
   begin
      FilterString:= FilterString+' and khzy_qy='''+cbbqy.Text+'''';
   end;

   if cbbhxjg1.Text <> '��' then
   begin
     FilterString:= FilterString+' and khzy_ws1='+cbbhxjg1.Text;
   end;

   
   if cbbhxjg2.Text <> '��' then
   begin
     FilterString:= FilterString+' and khzy_ws2='+cbbhxjg2.Text;
   end;

   if edtwymc.Text <> '' then
   begin
      FilterString:= FilterString+' and khzy_wymc like ''%'+edtwymc.Text+'%''';
   end;

   if edtdlwz.Text <> '' then
   begin
      FilterString:= FilterString+' and khzy_jtwz like ''%'+edtdlwz.Text+'%''';
   end;

   if bsknchckrdbxrq.Checked = True then
   begin
      FilterString:= FilterString+' and khzy_ptss1 like ''%ȼ��%''';
   end;

   if bsknchckrdbxnq.Checked = True then
   begin
      FilterString:= FilterString+' and khzy_ptss1 like ''%ů��%''';
   end;

   if bsknchckrdbxyx.Checked = True then
   begin
      FilterString:= FilterString+' and khzy_ptss1 like ''%����%''';
   end;

   if bsknchckrdbxkd.Checked = True then
   begin
      FilterString:= FilterString+' and khzy_ptss1 like ''%���%''';
   end;

   if (edtmj1.Text <> '') and (edtmj1.Text <> '0')  then
   begin
      FilterString:= FilterString+' and khzy_jzmj1 >='+edtmj1.Text;
   end;

   if (edtmj2.Text <> '') and (edtmj2.Text <> '0')  then
   begin
      FilterString:= FilterString+' and khzy_jzmj2 <='+edtmj2.Text;
   end;

   Close;
end;

end.
