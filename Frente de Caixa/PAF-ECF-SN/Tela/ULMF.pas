{ *******************************************************************************
Title: T2TiPDV
Description: Leitura da memória fiscal completa e simplificada.

The MIT License

Copyright: Copyright (C) 2014 T2Ti.COM

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

The author may be contacted at:
t2ti.com@gmail.com

@author Albert Eije
@version 2.0
******************************************************************************* }
unit ULMF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, JvExDBGrids, StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Buttons, JvExButtons, JvBitBtn, pngimage, ExtCtrls, Mask,
  JvEdit, JvValidateEdit, JvEnterTab, JvComponentBase, JvExControls,
  LabeledCtrls;

type
  TFLMF = class(TFBase)
    Image1: TImage;
    RadioGroup2: TRadioGroup;
    panPeriodo: TPanel;
    mkeDataIni: TMaskEdit;
    Label1: TLabel;
    mkeDataFim: TMaskEdit;
    Label2: TLabel;
    panCRZ: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    editInicio: TJvValidateEdit;
    editFim: TJvValidateEdit;
    botaoConfirma: TJvBitBtn;
    botaoCancela: TJvImgBtn;
    JvEnterAsTab1: TJvEnterAsTab;
    ComboboxTipo: TLabeledComboBox;
    procedure Confirma;
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure botaoConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLMF: TFLMF;


implementation

Uses
  UDataModule;

{$R *.dfm}

{$Region 'Infra'}
procedure TFLMF.FormActivate(Sender: TObject);
begin
  Color := StringToColor(Sessao.Configuracao.CorJanelasInternas);
  mkeDataIni.Text := DateToStr(Now);
  mkeDataFim.Text := DateToStr(Now);
end;

procedure TFLMF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFLMF.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
  begin;
    panCRZ.Enabled := False;
    panCRZ.BevelOuter := bvLowered;
    panPeriodo.Enabled := True;
    panPeriodo.BevelOuter := bvRaised;
  end
  else
  begin
    panCRZ.Enabled := True;
    panCRZ.BevelOuter := bvRaised;
    panPeriodo.Enabled := False;
    panPeriodo.BevelOuter := bvLowered;
  end;
end;

procedure TFLMF.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F12 then
    Confirma;
end;

procedure TFLMF.botaoConfirmaClick(Sender: TObject);
begin
  Confirma;
end;
{$EndRegion 'Infra'}

{$Region 'Confirmação'}
procedure TFLMF.Confirma;
var
  Linhas: TStringList;
  Mensagem: String;
begin
  // Completa
  if ComboboxTipo.ItemIndex = 0 then
  begin
    if Application.MessageBox('Deseja imprimir a LMFC - Leitura Memória Fiscal Completa?', 'Pergunta do Sistema', Mb_YesNo + Mb_IconQuestion) = IdYes then
    begin
      // por data
      if RadioGroup2.ItemIndex = 0 then
        FDataModule.ACBrECF.LeituraMemoriaFiscal(StrToDateTime(mkeDataIni.Text), StrToDateTime(mkeDataFim.Text))
        // por reducao
      else if RadioGroup2.ItemIndex = 1 then
        FDataModule.ACBrECF.LeituraMemoriaFiscal(StrToInt(editInicio.Text), StrToInt(editFim.Text));
    end;
  end

  // Simplificada
  else if ComboboxTipo.ItemIndex = 1 then
  begin
    if Application.MessageBox('Deseja imprimir a LMFS - Leitura Memória Fiscal Simplificada?', 'Pergunta do Sistema', Mb_YesNo + Mb_IconQuestion) = IdYes then
    begin
      // por data
      if RadioGroup2.ItemIndex = 0 then
        FDataModule.ACBrECF.LeituraMemoriaFiscal(StrToDateTime(mkeDataIni.Text), StrToDateTime(mkeDataFim.Text), True)
        // por reducao
      else if RadioGroup2.ItemIndex = 1 then
        FDataModule.ACBrECF.LeituraMemoriaFiscal(StrToInt(editInicio.Text), StrToInt(editFim.Text), True);
    end;
  end;
end;
{$EndRegion 'Confirmação'}

end.
