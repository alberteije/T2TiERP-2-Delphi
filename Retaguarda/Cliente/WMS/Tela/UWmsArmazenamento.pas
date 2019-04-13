{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Armazenamento do WMS

The MIT License

Copyright: Copyright (C) 2017 T2Ti.COM

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
unit UWmsArmazenamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, DB, DBClient, Generics.Collections,
  WideStrings, DBXMySql, FMTBcd, Provider, SqlExpr, StrUtils, System.Actions,
  Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Controller, Biblioteca;

type
  TFWmsArmazenamento = class(TFTelaCadastro)
    GroupBoxWmsRecebimentoDetalhe: TGroupBox;
    CDSWmsRecebimentoDetalhe: TClientDataSet;
    DSWmsRecebimentoDetalhe: TDataSource;
    BevelEdits: TBevel;
    EditIdWmsAgendamento: TLabeledCalcEdit;
    EditObservacao: TLabeledEdit;
    EditDataRecebimento: TLabeledDateEdit;
    ActionToolBar1: TActionToolBar;
    ActionManager: TActionManager;
    ActionIncluirItem: TAction;
    ActionExcluirItem: TAction;
    ActionArmazenar: TAction;
    EditHoraInicio: TLabeledMaskEdit;
    EditHoraFim: TLabeledMaskEdit;
    EditVolumeRecebido: TLabeledCalcEdit;
    EditPesoRecebido: TLabeledCalcEdit;
    ComboInconsistencia: TLabeledComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GridWmsRecebimentoDetalhe: TJvDBUltimGrid;
    GridArmazenamento: TJvDBUltimGrid;
    CDSWmsArmazenamento: TClientDataSet;
    DSWmsArmazenamento: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CDSWmsRecebimentoDetalheAfterEdit(DataSet: TDataSet);
    procedure GridWmsRecebimentoDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdWmsAgendamentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionIncluirItemExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure ActionArmazenarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FWmsArmazenamento: TFWmsArmazenamento;

implementation

uses WmsRecebimentoCabecalhoController, WmsRecebimentoCabecalhoVO,
  WmsRecebimentoDetalheVO, ULookup, WmsCaixaVO, WmsCaixaController,
  WmsAgendamentoVO, WmsAgendamentoController, WmsArmazenamentoVO, WmsArmazenamentoController,
  ProdutoVO, ProdutoController, WmsRecebimentoDetalheController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFWmsArmazenamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TWmsRecebimentoCabecalhoVO;
  ObjetoController := TWmsRecebimentoCabecalhoController.Create;

  inherited;

  // Configura a Grid dos itens
  ConfiguraCDSFromVO(CDSWmsRecebimentoDetalhe, TWmsRecebimentoDetalheVO);
  ConfiguraGridFromVO(GridWmsRecebimentoDetalhe, TWmsRecebimentoDetalheVO);

  ConfiguraCDSFromVO(CDSWmsArmazenamento, TWmsArmazenamentoVO);
  ConfiguraGridFromVO(GridArmazenamento, TWmsArmazenamentoVO);
end;

procedure TFWmsArmazenamento.LimparCampos;
begin
  inherited;
  CDSWmsRecebimentoDetalhe.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFWmsArmazenamento.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataRecebimento.SetFocus;
  end;
end;

function TFWmsArmazenamento.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDataRecebimento.SetFocus;
  end;
end;

function TFWmsArmazenamento.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('WmsRecebimentoCabecalhoController.TWmsRecebimentoCabecalhoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('WmsRecebimentoCabecalhoController.TWmsRecebimentoCabecalhoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFWmsArmazenamento.DoSalvar: Boolean;
var
  WmsRecebimentoDetalhe: TWmsRecebimentoDetalheVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TWmsRecebimentoCabecalhoVO.Create;

      TWmsRecebimentoCabecalhoVO(ObjetoVO).IdWmsAgendamento := EditIdWmsAgendamento.AsInteger;
      TWmsRecebimentoCabecalhoVO(ObjetoVO).DataRecebimento := EditDataRecebimento.Date;
      TWmsRecebimentoCabecalhoVO(ObjetoVO).HoraInicio := EditHoraInicio.Text;
      TWmsRecebimentoCabecalhoVO(ObjetoVO).HoraFim := EditHoraFim.Text;
      TWmsRecebimentoCabecalhoVO(ObjetoVO).VolumeRecebido := EditVolumeRecebido.AsInteger;
      TWmsRecebimentoCabecalhoVO(ObjetoVO).PesoRecebido := EditPesoRecebido.Value;
      TWmsRecebimentoCabecalhoVO(ObjetoVO).Inconsistencia := Copy(ComboInconsistencia.Text, 1, 1);
      TWmsRecebimentoCabecalhoVO(ObjetoVO).Observacao := EditObservacao.Text;

      // Itens
      TController.PreencherObjectListFromCDS<TWmsRecebimentoDetalheVO>(TWmsRecebimentoCabecalhoVO(ObjetoVO).ListaWmsRecebimentoDetalheVO, CDSWmsRecebimentoDetalhe);

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('WmsRecebimentoCabecalhoController.TWmsRecebimentoCabecalhoController', 'Insere', [TWmsRecebimentoCabecalhoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TWmsRecebimentoCabecalhoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('WmsRecebimentoCabecalhoController.TWmsRecebimentoCabecalhoController', 'Altera', [TWmsRecebimentoCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFWmsArmazenamento.GridWmsRecebimentoDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    ActionIncluirItem.Execute;
  end;
  If Key = VK_RETURN then
    EditDataRecebimento.SetFocus;
end;

procedure TFWmsArmazenamento.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TWmsRecebimentoCabecalhoVO(TController.BuscarObjeto('WmsRecebimentoCabecalhoController.TWmsRecebimentoCabecalhoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdWmsAgendamento.AsInteger := TWmsRecebimentoCabecalhoVO(ObjetoVO).IdWmsAgendamento;
    EditDataRecebimento.Date := TWmsRecebimentoCabecalhoVO(ObjetoVO).DataRecebimento;
    EditHoraInicio.Text := TWmsRecebimentoCabecalhoVO(ObjetoVO).HoraInicio;
    EditHoraFim.Text := TWmsRecebimentoCabecalhoVO(ObjetoVO).HoraFim;
    EditVolumeRecebido.AsInteger := TWmsRecebimentoCabecalhoVO(ObjetoVO).VolumeRecebido;
    EditPesoRecebido.Value := TWmsRecebimentoCabecalhoVO(ObjetoVO).PesoRecebido;
    EditObservacao.Text := TWmsRecebimentoCabecalhoVO(ObjetoVO).Observacao;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TWmsRecebimentoDetalheVO>(TWmsRecebimentoCabecalhoVO(ObjetoVO).ListaWmsRecebimentoDetalheVO, True, True, CDSWmsRecebimentoDetalhe);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TWmsRecebimentoCabecalhoVO(ObjetoVO).ListaWmsRecebimentoDetalheVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFWmsArmazenamento.CDSWmsRecebimentoDetalheAfterEdit(DataSet: TDataSet);
begin
  CDSWmsRecebimentoDetalhe.FieldByName('PERSISTE').AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFWmsArmazenamento.EditIdWmsAgendamentoKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdWmsAgendamento.Value <> 0 then
      Filtro := 'ID = ' + EditIdWmsAgendamento.Text
    else
      Filtro := 'ID=0';

    try
      EditIdWmsAgendamento.Clear;
      if not PopulaCamposTransientes(Filtro, TWmsAgendamentoVO, TWmsAgendamentoController) then
        PopulaCamposTransientesLookup(TWmsAgendamentoVO, TWmsAgendamentoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdWmsAgendamento.Text := CDSTransiente.FieldByName('ID').AsString;
      end
      else
      begin
        Exit;
        EditObservacao.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFWmsArmazenamento.ActionArmazenarExecute(Sender: TObject);
begin
  /// EXERCICIO
  ///  Como realizar o cálculo correto de armazenagem nas caixas sem os tamanhos
  ///  dos itens? Onde persistir esse dado?
  ///
  ///  Com base no tamanho do volume recebido, calcule quantos cabem nas
  ///  caixas e realize o armazenamento, fornecendo opção para o usuário
  ///  escolher Rua, Estante e Caixa (Endereço Completo)

  try
    PopulaCamposTransientesLookup(TWmsCaixaVO, TWmsCaixaController);
    if CDSTransiente.RecordCount > 0 then
    begin
      PageControl1.ActivePageIndex := 1;
      CDSWmsArmazenamento.Append;
      CDSWmsArmazenamento.FieldByName('ID_WMS_CAIXA').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
      CDSWmsArmazenamento.FieldByName('ID_WMS_RECEBIMENTO_DETALHE').AsInteger := CDSWmsRecebimentoDetalhe.FieldByName('ID').AsInteger;
      CDSWmsArmazenamento.FieldByName('QUANTIDADE').AsInteger := 10;
    end;
  finally
    CDSTransiente.Close;
  end;

end;

procedure TFWmsArmazenamento.ActionExcluirItemExecute(Sender: TObject);
begin
  if CDSWmsRecebimentoDetalhe.IsEmpty then
    Application.MessageBox('Não existe registro selecionado.', 'Erro', MB_OK + MB_ICONERROR)
  else
  begin
    if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if StatusTela = stInserindo then
        CDSWmsRecebimentoDetalhe.Delete
      else if StatusTela = stEditando then
      begin
        if TWmsRecebimentoDetalheController.Exclui(CDSWmsRecebimentoDetalhe.FieldByName('ID').AsInteger) then
          CDSWmsRecebimentoDetalhe.Delete;
      end;
    end;
  end;
end;

procedure TFWmsArmazenamento.ActionIncluirItemExecute(Sender: TObject);
begin
  try
    PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSWmsRecebimentoDetalhe.Append;
      CDSWmsRecebimentoDetalhe.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
//      CDSWmsRecebimentoDetalhe.FieldByName('PRODUTO.NOME').AsString := CDSTransiente.FieldByName('NOME').AsString;
    end;
  finally
    CDSTransiente.Close;
  end;
end;
{$ENDREGION}

end.
