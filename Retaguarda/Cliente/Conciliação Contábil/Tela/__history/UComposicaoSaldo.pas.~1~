{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Composição do Saldo - módulo Conciliação Contábil

  The MIT License

  Copyright: Copyright (C) 2010 T2Ti.COM

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
  @version 1.0
  ******************************************************************************* }
unit UComposicaoSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilContaVO,
  ContabilContaController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, Math, StrUtils, JvBaseEdits, ToolWin, ActnMan,
  ActnCtrls, ActnList, PlatformDefaultStyleActnCtrls;

type
  [TFormDescription(TConstantes.MODULO_CONCILIACAO_CONTABIL, 'Composição do Saldo')]

  TFComposicaoSaldo = class(TFTelaCadastro)
    EditPlanoConta: TLabeledEdit;
    EditClassificacao: TLabeledEdit;
    EditDescricao: TLabeledEdit;
    BevelEdits: TBevel;
    EditPlanoContaRefSped: TLabeledEdit;
    EditIdPlanoConta: TLabeledCalcEdit;
    EditIdPlanoContaRefSped: TLabeledCalcEdit;
    EditIdContaPai: TLabeledCalcEdit;
    EditContaPai: TLabeledEdit;
    ComboBoxTipo: TLabeledComboBox;
    GroupBox4: TGroupBox;
    ActionManager1: TActionManager;
    ActionListarLancamentos: TAction;
    ActionToolBar1: TActionToolBar;
    ActionImpressao: TAction;
    LabelSaldo: TLabel;
    GridDetalhe: TJvDBUltimGrid;
    CDSLancamentoExtrato: TClientDataSet;
    CDSLancamentoExtratoID: TIntegerField;
    CDSLancamentoExtratoID_CONTA_CAIXA: TIntegerField;
    CDSLancamentoExtratoMES: TStringField;
    CDSLancamentoExtratoANO: TStringField;
    CDSLancamentoExtratoDATA_MOVIMENTO: TDateField;
    CDSLancamentoExtratoDATA_BALANCETE: TDateField;
    CDSLancamentoExtratoHISTORICO: TStringField;
    CDSLancamentoExtratoVALOR: TFMTBCDField;
    DSLancamentoExtrato: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure ActionListarLancamentosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
    procedure LimparCampos; override;
  end;

var
  FComposicaoSaldo: TFComposicaoSaldo;

implementation

uses ULookup, Biblioteca, UDataModule, FinExtratoContaBancoController;
{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFComposicaoSaldo.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilContaVO;
  ObjetoController := TContabilContaController.Create;

  inherited;
end;

procedure TFComposicaoSaldo.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoAlterar.Visible := False;
  BotaoExcluir.Visible := False;
  BotaoSalvar.Visible := False;
end;

procedure TFComposicaoSaldo.LimparCampos;
begin
  inherited;
  CDSLancamentoExtrato.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFComposicaoSaldo.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TContabilContaVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin

    EditIdPlanoConta.AsInteger := TContabilContaVO(ObjetoVO).IdPlanoConta;
    EditPlanoConta.Text := TContabilContaVO(ObjetoVO).PlanoContaNome;
    EditIdPlanoContaRefSped.AsInteger := TContabilContaVO(ObjetoVO).IdPlanoContaRefSped;
    EditPlanoContaRefSped.Text := TContabilContaVO(ObjetoVO).PlanoContaSpedDescricao;
    EditIdContaPai.AsInteger:= TContabilContaVO(ObjetoVO).IdContabilConta;
    EditClassificacao.Text := TContabilContaVO(ObjetoVO).Classificacao;
    // S=Sintética | A=Analítica
    ComboBoxTipo.ItemIndex := IfThen(TContabilContaVO(ObjetoVO).Tipo = 'S', 0, 1);
    EditDescricao.Text := TContabilContaVO(ObjetoVO).Descricao;
  end;
end;

procedure TFComposicaoSaldo.GridDblClick(Sender: TObject);
begin
  inherited;
  PanelEdits.Enabled := True;
  EditIdPlanoConta.SetFocus;
end;
{$ENDREGION}

{$REGION 'Actions'}
{
Manual de Orientação e de Procedimentos para as Organizações Contábeis
9 - CONCILIAÇÃO CONTÁBIL E COMPOSIÇÃO DE SALDOS
}
procedure TFComposicaoSaldo.ActionListarLancamentosExecute(Sender: TObject);
var
  Valor: Double;
begin
  Valor := 0;
  //
  TFinExtratoContaBancoController.SetDataSet(CDSLancamentoExtrato);
  TFinExtratoContaBancoController.Consulta('ID > 0', 0);

  CDSLancamentoExtrato.DisableControls;
  CDSLancamentoExtrato.First;
  while not CDSLancamentoExtrato.Eof do
  begin
    Valor := Valor + CDSLancamentoExtratoVALOR.AsFloat;
    CDSLancamentoExtrato.Next;
  end;
  CDSLancamentoExtrato.First;
  CDSLancamentoExtrato.EnableControls;

  LabelSaldo.Caption := 'Saldo da Conta: ' + FloatToStrF(Valor, ffCurrency, 10, 2);
end;
{$ENDREGION}

end.
