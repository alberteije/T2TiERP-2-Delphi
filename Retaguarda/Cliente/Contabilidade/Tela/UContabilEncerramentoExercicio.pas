{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Encerramento do Exercício para o módulo Contabilidade

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
unit UContabilEncerramentoExercicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilEncerramentoExeCabVO,
  ContabilEncerramentoExeCabController, Tipos, Atributos, Constantes, LabeledCtrls, JvToolEdit,
  Mask, JvExMask, JvBaseEdits, Math, StrUtils, ActnList, Generics.Collections,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, Controller;

type
  [TFormDescription(TConstantes.MODULO_CONTABILIDADE, 'Encerramento do Exercício')]

  TFContabilEncerramentoExercicio = class(TFTelaCadastro)
    DSContabilEncerramentoExercicioDetalhe: TDataSource;
    CDSContabilEncerramentoExercicioDetalhe: TClientDataSet;
    PanelMestre: TPanel;
    PageControlItens: TPageControl;
    tsItens: TTabSheet;
    PanelItens: TPanel;
    GridDetalhe: TJvDBUltimGrid;
    EditDataInicio: TLabeledDateEdit;
    EditDataInclusao: TLabeledDateEdit;
    EditMotivo: TLabeledEdit;
    EditDataFim: TLabeledDateEdit;
    CDSContabilEncerramentoExercicioDetalheID: TIntegerField;
    CDSContabilEncerramentoExercicioDetalheID_CONTABIL_CONTA: TIntegerField;
    CDSContabilEncerramentoExercicioDetalheID_CONTABIL_ENCERRAMENTO_EXE: TIntegerField;
    CDSContabilEncerramentoExercicioDetalheSALDO_ANTERIOR: TFMTBCDField;
    CDSContabilEncerramentoExercicioDetalheVALOR_DEBITO: TFMTBCDField;
    CDSContabilEncerramentoExercicioDetalheVALOR_CREDITO: TFMTBCDField;
    CDSContabilEncerramentoExercicioDetalheSALDO: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FContabilEncerramentoExercicio: TFContabilEncerramentoExercicio;

implementation

uses ULookup, Biblioteca, UDataModule, ContabilEncerramentoExeDetVO;
{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFContabilEncerramentoExercicio.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilEncerramentoExeCabVO;
  ObjetoController := TContabilEncerramentoExeCabController.Create;

  inherited;
end;

procedure TFContabilEncerramentoExercicio.LimparCampos;
begin
  inherited;
  CDSContabilEncerramentoExercicioDetalhe.EmptyDataSet;
end;

procedure TFContabilEncerramentoExercicio.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;

  if StatusTela = stNavegandoEdits then
  begin
    PanelMestre.Enabled := False;
    PanelItens.Enabled := False;
  end
  else
  begin
    PanelMestre.Enabled := True;
    PanelItens.Enabled := True;
  end;
end;

procedure TFContabilEncerramentoExercicio.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFContabilEncerramentoExercicio.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContabilEncerramentoExercicio.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditMotivo.SetFocus;
  end;
end;

function TFContabilEncerramentoExercicio.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditMotivo.SetFocus;
  end;
end;

function TFContabilEncerramentoExercicio.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('ContabilEncerramentoExeCabController.TContabilEncerramentoExeCabController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('ContabilEncerramentoExeCabController.TContabilEncerramentoExeCabController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFContabilEncerramentoExercicio.DoSalvar: Boolean;
var
  ContabilEncerramentoExercicioDetalhe: TContabilEncerramentoExeDetVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TContabilEncerramentoExeCabVO.Create;

      TContabilEncerramentoExeCabVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TContabilEncerramentoExeCabVO(ObjetoVO).Motivo := EditMotivo.Text;
      TContabilEncerramentoExeCabVO(ObjetoVO).DataInicio := EditDataInicio.Date;
      TContabilEncerramentoExeCabVO(ObjetoVO).DataFim := EditDataFim.Date;
      TContabilEncerramentoExeCabVO(ObjetoVO).DataInclusao := EditDataInclusao.Date;

      // Detalhes
      TContabilEncerramentoExeCabVO(ObjetoVO).ListaContabilEncerramentoExeDetVO := TObjectList<TContabilEncerramentoExeDetVO>.Create;
      CDSContabilEncerramentoExercicioDetalhe.DisableControls;
      CDSContabilEncerramentoExercicioDetalhe.First;
      while not CDSContabilEncerramentoExercicioDetalhe.Eof do
      begin
        ContabilEncerramentoExercicioDetalhe := TContabilEncerramentoExeDetVO.Create;
        ContabilEncerramentoExercicioDetalhe.Id := CDSContabilEncerramentoExercicioDetalheID.AsInteger;
        ContabilEncerramentoExercicioDetalhe.IdContabilEncerramentoExe := TContabilEncerramentoExeCabVO(ObjetoVO).Id;
        ContabilEncerramentoExercicioDetalhe.IdContabilConta := CDSContabilEncerramentoExercicioDetalheID_CONTABIL_CONTA.AsInteger;
        ContabilEncerramentoExercicioDetalhe.SaldoAnterior := CDSContabilEncerramentoExercicioDetalheSALDO_ANTERIOR.AsExtended;
        ContabilEncerramentoExercicioDetalhe.ValorDebito := CDSContabilEncerramentoExercicioDetalheVALOR_DEBITO.AsExtended;
        ContabilEncerramentoExercicioDetalhe.ValorCredito := CDSContabilEncerramentoExercicioDetalheVALOR_CREDITO.AsExtended;
        ContabilEncerramentoExercicioDetalhe.Saldo := CDSContabilEncerramentoExercicioDetalheSALDO.AsExtended;
        TContabilEncerramentoExeCabVO(ObjetoVO).ListaContabilEncerramentoExeDetVO.Add(ContabilEncerramentoExercicioDetalhe);
        CDSContabilEncerramentoExercicioDetalhe.Next;
      end;
      CDSContabilEncerramentoExercicioDetalhe.EnableControls;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('ContabilEncerramentoExeCabController.TContabilEncerramentoExeCabController', 'Insere', [TContabilEncerramentoExeCabVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TContabilEncerramentoExeCabVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('ContabilEncerramentoExeCabController.TContabilEncerramentoExeCabController', 'Altera', [TContabilEncerramentoExeCabVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFContabilEncerramentoExercicio.GridDblClick(Sender: TObject);
begin
  inherited;
  ConfigurarLayoutTela;
end;

procedure TFContabilEncerramentoExercicio.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TContabilEncerramentoExeCabVO(TController.BuscarObjeto('ContabilEncerramentoExeCabController.TContabilEncerramentoExeCabController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditMotivo.Text := TContabilEncerramentoExeCabVO(ObjetoVO).Motivo;
    EditDataInicio.Date := TContabilEncerramentoExeCabVO(ObjetoVO).DataInicio;
    EditDataFim.Date := TContabilEncerramentoExeCabVO(ObjetoVO).DataFim;
    EditDataInclusao.Date := TContabilEncerramentoExeCabVO(ObjetoVO).DataInclusao;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TContabilEncerramentoExeDetVO>(TContabilEncerramentoExeCabVO(ObjetoVO).ListaContabilEncerramentoExeDetVO, True, True, CDSContabilEncerramentoExercicioDetalhe);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TContabilEncerramentoExeCabVO(ObjetoVO).ListaContabilEncerramentoExeDetVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';

  end;

  ConfigurarLayoutTela;
end;
{$ENDREGION}

/// EXERCICIO
///  Implemente as rotinas automáticas no sistema

end.
