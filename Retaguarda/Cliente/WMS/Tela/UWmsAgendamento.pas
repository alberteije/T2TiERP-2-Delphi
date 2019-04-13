{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Agendamentos do WMS

The MIT License

Copyright: Copyright (C) 2016 T2Ti.COM

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
t2ti.com@gmail.com</p>

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UWmsAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, WmsAgendamentoVO,
  WmsAgendamentoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, ActnList, ToolWin, ActnMan, ActnCtrls,
  PlatformDefaultStyleActnCtrls, Biblioteca, StrUtils, Controller;

type
  [TFormDescription(TConstantes.MODULO_PONTO_ELETRONICO, 'Ponto Parâmetros')]

  TFWmsAgendamento = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditQuantidadeVolume: TLabeledCalcEdit;
    EditHoraOperacao: TLabeledMaskEdit;
    EditPesoTotalVolume: TLabeledCalcEdit;
    EditDataOperacao: TLabeledDateEdit;
    EditLocalOperacao: TLabeledEdit;
    EditQuantidadePessoa: TLabeledCalcEdit;
    EditQuantidadeHora: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditPesoTotalVolumeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FWmsAgendamento: TFWmsAgendamento;

implementation

uses UDataModule, WmsParametroVO;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFWmsAgendamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TWmsAgendamentoVO;
  ObjetoController := TWmsAgendamentoController.Create;

  inherited;
end;

procedure TFWmsAgendamento.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFWmsAgendamento.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;

procedure TFWmsAgendamento.EditPesoTotalVolumeExit(Sender: TObject);
var
  ObjetoParametro: TWmsParametroVO;
begin
  inherited;
  ObjetoParametro := TWmsParametroVO(TController.BuscarObjeto('WmsParametroController.TWmsParametroController', 'ConsultaObjeto', ['ID=1'], 'GET'));
  //

  /// EXERCICIO
  ///  Verifique se os cálculos abaixo estão corretos. Pesquise para implementar
  ///  da maneira apropriada.
  EditQuantidadePessoa.AsInteger := ObjetoParametro.PessoaPorVolume * EditQuantidadeVolume.AsInteger;
  EditQuantidadeHora.AsInteger := ObjetoParametro.HoraPorVolume * EditQuantidadeVolume.AsInteger;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFWmsAgendamento.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataOperacao.SetFocus;
  end;
end;

function TFWmsAgendamento.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDataOperacao.SetFocus;
  end;
end;

function TFWmsAgendamento.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('WmsAgendamentoController.TWmsAgendamentoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      Result := TController.RetornoBoolean;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TController.ExecutarMetodo('WmsAgendamentoController.TWmsAgendamentoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFWmsAgendamento.DoSalvar: Boolean;
var
  i: Integer;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TWmsAgendamentoVO.Create;

      TWmsAgendamentoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TWmsAgendamentoVO(ObjetoVO).DataOperacao := EditDataOperacao.Date;
      TWmsAgendamentoVO(ObjetoVO).HoraOperacao := EditHoraOperacao.Text;
      TWmsAgendamentoVO(ObjetoVO).LocalOperacao := EditLocalOperacao.Text;
      TWmsAgendamentoVO(ObjetoVO).QuantidadeVolume := EditQuantidadeVolume.AsInteger;
      TWmsAgendamentoVO(ObjetoVO).PesoTotalVolume := EditPesoTotalVolume.Value;
      TWmsAgendamentoVO(ObjetoVO).QuantidadePessoa := EditQuantidadePessoa.AsInteger;
      TWmsAgendamentoVO(ObjetoVO).QuantidadeHora := EditQuantidadeHora.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('WmsAgendamentoController.TWmsAgendamentoController', 'Insere', [TWmsAgendamentoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TWmsAgendamentoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('WmsAgendamentoController.TWmsAgendamentoController', 'Altera', [TWmsAgendamentoVO(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFWmsAgendamento.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TWmsAgendamentoVO(TController.BuscarObjeto('WmsAgendamentoController.TWmsAgendamentoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDataOperacao.Date := TWmsAgendamentoVO(ObjetoVO).DataOperacao;
    EditHoraOperacao.Text := TWmsAgendamentoVO(ObjetoVO).HoraOperacao;
    EditLocalOperacao.Text := TWmsAgendamentoVO(ObjetoVO).LocalOperacao;
    EditQuantidadeVolume.AsInteger := TWmsAgendamentoVO(ObjetoVO).QuantidadeVolume;
    EditPesoTotalVolume.Value := TWmsAgendamentoVO(ObjetoVO).PesoTotalVolume;
    EditQuantidadePessoa.AsInteger := TWmsAgendamentoVO(ObjetoVO).QuantidadePessoa;
    EditQuantidadeHora.AsInteger := TWmsAgendamentoVO(ObjetoVO).QuantidadeHora;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
