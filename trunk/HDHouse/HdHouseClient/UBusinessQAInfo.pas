unit UBusinessQAInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsdbctrls, bsSkinCtrls, ExtCtrls, StdCtrls, bsSkinBoxCtrls, Mask,
  BusinessSkinForm, bsColorCtrls;

type
  TBusinessQAInfo = class(TForm)
    bsknpnl1: TbsSkinPanel;
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    bsSkinDBNavigator1: TbsSkinDBNavigator;
    bsknpnl2: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    bsSkinDBComboBox1: TbsSkinDBComboBox;
    bsSkinDBComboBox2: TbsSkinDBComboBox;
    lbl2: TbsSkinStdLabel;
    bsSkinEdit1: TbsSkinEdit;
    lbl3: TbsSkinStdLabel;
    bsSkinEdit2: TbsSkinEdit;
    lbl4: TbsSkinStdLabel;
    lbl5: TbsSkinStdLabel;
    bsSkinDBEdit1: TbsSkinDBEdit;
    bsSkinDBMemo1: TbsSkinDBMemo;
    dlgColor1: TColorDialog;
    img1: TImage;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    img2: TImage;
    procedure img1Click(Sender: TObject);
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure bsSkinSpeedButton2Click(Sender: TObject);
    procedure bsSkinSpeedButton3Click(Sender: TObject);
    procedure bsSkinButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BusinessQAInfo: TBusinessQAInfo;

implementation
    uses UHDHouseDataModule;
{$R *.dfm}

procedure TBusinessQAInfo.img1Click(Sender: TObject);
begin
 if self.dlgColor1.Execute then
 begin
    self.bsSkinDBEdit1.Font.Color:=self.dlgColor1.Color;
 end;
end;

procedure TBusinessQAInfo.bsSkinSpeedButton1Click(Sender: TObject);
begin
   self.bsSkinDBMemo1.Font.Size:=-11;
end;

procedure TBusinessQAInfo.bsSkinSpeedButton2Click(Sender: TObject);
begin
  self.bsSkinDBMemo1.Font.Size:=13;
end;

procedure TBusinessQAInfo.bsSkinSpeedButton3Click(Sender: TObject);
begin
self.bsSkinDBMemo1.Font.Size:=18;
end;

procedure TBusinessQAInfo.bsSkinButton2Click(Sender: TObject);
begin
 Close;
end;

end.
