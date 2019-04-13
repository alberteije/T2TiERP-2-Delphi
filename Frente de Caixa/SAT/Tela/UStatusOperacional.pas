{ *******************************************************************************
Title: T2TiPDV
Description: Status Operacional do SAT.

The MIT License

Copyright: Copyright (C) 2015 T2Ti.COM

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
@version 1.0
******************************************************************************* }
unit UStatusOperacional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Buttons, JvExButtons, JvBitBtn, pngimage, ExtCtrls,
  JvEdit, JvValidateEdit, JvDBSearchEdit, DB, Provider, DBClient, FMTBcd,
  SqlExpr, JvEnterTab, JvComponentBase, Tipos, JvDBUltimGrid, Biblioteca, Controller,
  Vcl.Imaging.jpeg, LabeledCtrls;

type
  TCustomDBGridCracker = class(TCustomDBGrid);

  TFStatusOperacional = class(TFBase)
    Image1: TImage;
    botaoCancela: TJvImgBtn;
    DSNFCe: TDataSource;
    Label2: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    CDSNFCe: TClientDataSet;
    Image2: TImage;
    MemoStatus: TMemo;
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    Operacao: String;
    Confirmou: Boolean;
    { Public declarations }
  end;

var
  FStatusOperacional: TFStatusOperacional;

implementation

uses
  NFeCabecalhoVO, VendaController,
  UCaixa, UDataModule;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFStatusOperacional.FormActivate(Sender: TObject);
begin
  Color := StringToColor(Sessao.Configuracao.CorJanelasInternas);
  MemoStatus.Lines.Clear;
  FDataModule.ACBrSAT.ConsultarStatusOperacional;

  with FDataModule.ACBrSAT.Status do
  begin
    MemoStatus.Lines.Add('NSERIE.........: '+NSERIE);
    MemoStatus.Lines.Add('LAN_MAC........: '+LAN_MAC);
    MemoStatus.Lines.Add('STATUS_LAN.....: '+StatusLanToStr(STATUS_LAN));
    MemoStatus.Lines.Add('NIVEL_BATERIA..: '+NivelBateriaToStr(NIVEL_BATERIA));
    MemoStatus.Lines.Add('MT_TOTAL.......: '+MT_TOTAL);
    MemoStatus.Lines.Add('MT_USADA.......: '+MT_USADA);
    MemoStatus.Lines.Add('DH_ATUAL.......: '+DateTimeToStr(DH_ATUAL));
    MemoStatus.Lines.Add('VER_SB.........: '+VER_SB);
    MemoStatus.Lines.Add('VER_LAYOUT.....: '+VER_LAYOUT);
    MemoStatus.Lines.Add('ULTIMO_CFe.....: '+ULTIMO_CFe);
    MemoStatus.Lines.Add('LISTA_INICIAL..: '+LISTA_INICIAL);
    MemoStatus.Lines.Add('LISTA_FINAL....: '+LISTA_FINAL);
    MemoStatus.Lines.Add('DH_CFe.........: '+DateTimeToStr(DH_CFe));
    MemoStatus.Lines.Add('DH_ULTIMA......: '+DateTimeToStr(DH_CFe));
    MemoStatus.Lines.Add('CERT_EMISSAO...: '+DateToStr(CERT_EMISSAO));
    MemoStatus.Lines.Add('CERT_VENCIMENTO: '+DateToStr(CERT_VENCIMENTO));
    MemoStatus.Lines.Add('ESTADO_OPERACAO: '+EstadoOperacaoToStr(ESTADO_OPERACAO));
  end;
end;
{$ENDREGION 'Infra'}

end.
