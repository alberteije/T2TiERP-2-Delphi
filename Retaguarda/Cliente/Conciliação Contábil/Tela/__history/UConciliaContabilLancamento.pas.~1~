{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela de conciliação de lançamentos contábeis

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
unit UConciliaContabilLancamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilLancamentoCabecalhoVO,
  ContabilLancamentoCabecalhoController, Tipos, Atributos, Constantes, LabeledCtrls, JvToolEdit,
  Mask, JvExMask, JvBaseEdits, Math, StrUtils, ActnList, Generics.Collections,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  PlatformDefaultStyleActnCtrls;

type
  [TFormDescription(TConstantes.MODULO_CONCILIACAO_CONTABIL, 'Concilia Lançamento Contábil')]

  TFConciliaContabilLancamento = class(TFTelaCadastro)
    DSContabilLancamentoDetalhe: TDataSource;
    CDSContabilLancamentoDetalhe: TClientDataSet;
    PanelMestre: TPanel;
    EditIdLote: TLabeledCalcEdit;
    EditLote: TLabeledEdit;
    PageControlItens: TPageControl;
    tsItens: TTabSheet;
    PanelItens: TPanel;
    GridDetalhe: TJvDBUltimGrid;
    ComboBoxTipo: TLabeledComboBox;
    CDSContabilLancamentoDetalheID: TIntegerField;
    CDSContabilLancamentoDetalheID_CONTABIL_CONTA: TIntegerField;
    CDSContabilLancamentoDetalheID_CONTABIL_HISTORICO: TIntegerField;
    CDSContabilLancamentoDetalheID_CONTABIL_LANCAMENTO_CAB: TIntegerField;
    CDSContabilLancamentoDetalheHISTORICO: TStringField;
    CDSContabilLancamentoDetalheTIPO: TStringField;
    CDSContabilLancamentoDetalheVALOR: TFMTBCDField;
    EditDataLancamento: TLabeledDateEdit;
    EditDataInclusao: TLabeledDateEdit;
    ComboBoxLiberado: TLabeledComboBox;
    ActionManager1: TActionManager;
    ActionConciliacao: TAction;
    ActionToolBar1: TActionToolBar;
    CDSContabilLancamentoDetalheCONCILIADO: TStringField;
    ActionEstorno: TAction;
    Transferência: TAction;
    ActionComplementacao: TAction;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure ActionConciliacaoExecute(Sender: TObject);
    procedure ActionEstornoExecute(Sender: TObject);
    procedure TransferênciaExecute(Sender: TObject);
    procedure ActionComplementacaoExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
    procedure LimparCampos; override;
  end;

var
  FConciliaContabilLancamento: TFConciliaContabilLancamento;

implementation

uses ULookup, Biblioteca, UDataModule, ContabilLancamentoDetalheVO, ContabilLoteVO;
{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFConciliaContabilLancamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilLancamentoCabecalhoVO;
  ObjetoController := TContabilLancamentoCabecalhoController.Create;

  inherited;
end;

procedure TFConciliaContabilLancamento.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoAlterar.Visible := False;
  BotaoExcluir.Visible := False;
  BotaoSalvar.Visible := False;
end;

procedure TFConciliaContabilLancamento.LimparCampos;
begin
  inherited;
  CDSContabilLancamentoDetalhe.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFConciliaContabilLancamento.GridParaEdits;
var
  ContabilLancamentoDetalheEnumerator: TEnumerator<TContabilLancamentoDetalheVO>;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TContabilLancamentoCabecalhoVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdLote.AsInteger := TContabilLancamentoCabecalhoVO(ObjetoVO).IdContabilLote;
    EditLote.Text := TContabilLancamentoCabecalhoVO(ObjetoVO).LoteDescricao;
    EditDataLancamento.Date := TContabilLancamentoCabecalhoVO(ObjetoVO).DataLancamento;
    EditDataInclusao.Date := TContabilLancamentoCabecalhoVO(ObjetoVO).DataInclusao;
    ComboBoxLiberado.ItemIndex := IfThen(TContabilLancamentoCabecalhoVO(ObjetoVO).Liberado = 'S', 0, 1);

    case AnsiIndexStr(TContabilLancamentoCabecalhoVO(ObjetoVO).Tipo, ['UDVC', 'UCVD', 'UDUC', 'VDVC']) of
      0:
        ComboBoxTipo.ItemIndex := 0;
      1:
        ComboBoxTipo.ItemIndex := 1;
      2:
        ComboBoxTipo.ItemIndex := 2;
      3:
        ComboBoxTipo.ItemIndex := 3;
    end;

    // Detalhes
    ContabilLancamentoDetalheEnumerator := TContabilLancamentoCabecalhoVO(ObjetoVO).ListaContabilLancamentoDetalheVO.GetEnumerator;
    try
      with ContabilLancamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          CDSContabilLancamentoDetalhe.Append;
          CDSContabilLancamentoDetalheID.AsInteger := Current.id;
          CDSContabilLancamentoDetalheID_CONTABIL_LANCAMENTO_CAB.AsInteger := Current.IdContabilLancamentoCab;
          CDSContabilLancamentoDetalheID_CONTABIL_CONTA.AsInteger := Current.IdContabilConta;
          CDSContabilLancamentoDetalheID_CONTABIL_HISTORICO.AsInteger := Current.IdContabilHistorico;
          CDSContabilLancamentoDetalheHISTORICO.AsString := Current.Historico;
          CDSContabilLancamentoDetalheTIPO.AsString := Current.Tipo;
          CDSContabilLancamentoDetalheVALOR.AsExtended := Current.Valor;
          CDSContabilLancamentoDetalhe.Post;
        end;
      end;
    finally
      ContabilLancamentoDetalheEnumerator.Free;
    end;

    TContabilLancamentoCabecalhoVO(ObjetoVO).ListaContabilLancamentoDetalheVO := Nil;
    if Assigned(TContabilLancamentoCabecalhoVO(ObjetoOldVO)) then
      TContabilLancamentoCabecalhoVO(ObjetoOldVO).ListaContabilLancamentoDetalheVO := Nil;
  end;
end;

procedure TFConciliaContabilLancamento.GridDblClick(Sender: TObject);
begin
  inherited;
  PanelEdits.Enabled := True;
  EditIdLote.SetFocus;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFConciliaContabilLancamento.ActionConciliacaoExecute(Sender: TObject);
var
  TotalDebitos, TotalCreditos: Double;
begin
  TotalDebitos := 0;
  TotalCreditos := 0;
  //
  CDSContabilLancamentoDetalhe.DisableControls;
  CDSContabilLancamentoDetalhe.First;
  while not CDSContabilLancamentoDetalhe.Eof do
  begin
    if CDSContabilLancamentoDetalheTIPO.AsString = 'C' then
      TotalCreditos := TotalCreditos + CDSContabilLancamentoDetalheVALOR.AsFloat
    else if CDSContabilLancamentoDetalheTIPO.AsString = 'D' then
      TotalDebitos := TotalDebitos + CDSContabilLancamentoDetalheVALOR.AsFloat;
    CDSContabilLancamentoDetalhe.Next;
  end;

  CDSContabilLancamentoDetalhe.First;
  while not CDSContabilLancamentoDetalhe.Eof do
  begin
    CDSContabilLancamentoDetalhe.Edit;
    if TotalCreditos = TotalDebitos then
      CDSContabilLancamentoDetalheCONCILIADO.AsString := 'S'
    else
      CDSContabilLancamentoDetalheCONCILIADO.AsString := 'N';
    CDSContabilLancamentoDetalhe.Post;
    CDSContabilLancamentoDetalhe.Next;
  end;

  CDSContabilLancamentoDetalhe.First;
  CDSContabilLancamentoDetalhe.EnableControls;
end;

procedure TFConciliaContabilLancamento.ActionEstornoExecute(Sender: TObject);
begin
  { Implementado a critério do Participante do T2Ti ERP }
  CDSContabilLancamentoDetalhe.Edit;
  CDSContabilLancamentoDetalheCONCILIADO.AsString := 'E';
  CDSContabilLancamentoDetalhe.Post;
end;

procedure TFConciliaContabilLancamento.TransferênciaExecute(Sender: TObject);
begin
  { Implementado a critério do Participante do T2Ti ERP }
  CDSContabilLancamentoDetalhe.Edit;
  CDSContabilLancamentoDetalheCONCILIADO.AsString := 'T';
  CDSContabilLancamentoDetalhe.Post;
end;

procedure TFConciliaContabilLancamento.ActionComplementacaoExecute(Sender: TObject);
begin
  { Implementado a critério do Participante do T2Ti ERP }
  CDSContabilLancamentoDetalhe.Edit;
  CDSContabilLancamentoDetalheCONCILIADO.AsString := 'C';
  CDSContabilLancamentoDetalhe.Post;
end;
{$ENDREGION}

end.
