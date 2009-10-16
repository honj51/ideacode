unit UMessageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, ComCtrls, bsSkinCtrls, BusinessSkinForm,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask;

type
  TMessageForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bsknlbl1: TbsSkinLabel;
    bsknpnl1: TbsSkinPanel;
    bsknlbl2: TbsSkinLabel;
    edt1: TbsSkinDateEdit;
    bsknlbl4: TbsSkinLabel;
    edt2: TbsSkinDateEdit;
    edt3: TbsSkinEdit;
    btn8: TbsSkinButton;
    btn9: TbsSkinButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    tv1: TbsSkinTreeView;
    bsknpnl2: TbsSkinPanel;
    cbb1: TbsSkinComboBox;
    bsknpnl3: TbsSkinPanel;
    bskndbgrd2: TbsSkinDBGrid;
    btn10: TbsSkinButton;
    btn11: TbsSkinButton;
    btn12: TbsSkinButton;
    btn13: TbsSkinButton;
    bsknpnl4: TbsSkinPanel;
    mmo1: TbsSkinMemo;
    bsknpnl5: TbsSkinPanel;
    bsknpnl6: TbsSkinPanel;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknscrlbr3: TbsSkinScrollBar;
    bsknpnl7: TbsSkinPanel;
    bsknscrlbr4: TbsSkinScrollBar;
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessageForm: TMessageForm;

implementation
             uses UHDHouseDataModule,UMessageSettingForm;
{$R *.dfm}

procedure TMessageForm.tv1Change(Sender: TObject; Node: TTreeNode);
begin
                if tv1.Selected.Text='¡Ù—‘' then
                begin
                    bsknpnl3.Visible:=False;
                    bsknpnl4.Visible:=True;
                end
                else
                begin
                     bsknpnl3.Visible:=True;
                    bsknpnl4.Visible:=False;
                end;   
end;

procedure TMessageForm.btn2Click(Sender: TObject);
begin
      if MessageSettingForm= nil  then
      begin
           MessageSettingForm:=TMessageSettingForm.Create(Self);
      end;
      MessageSettingForm.Visible:=False;
     MessageSettingForm.ShowModal;


end;

procedure TMessageForm.btn3Click(Sender: TObject);
begin
        if MessageSettingForm= nil  then
      begin
           MessageSettingForm:=TMessageSettingForm.Create(Self);
      end;
      MessageSettingForm.Visible:=False;
     MessageSettingForm.ShowModal;
end;

procedure TMessageForm.btn1Click(Sender: TObject);
begin
         if MessageSettingForm= nil  then
      begin
           MessageSettingForm:=TMessageSettingForm.Create(Self);
      end;
      MessageSettingForm.Visible:=False;
     MessageSettingForm.ShowModal;
end;

procedure TMessageForm.FormShow(Sender: TObject);
begin
          if tv1<>nil then
          begin
              tv1.Items[0].Expanded:=True;
          end;

end;

end.
