{ *******************************************************************************
Title: T2Ti ERP
Description: Janela para confirmar a Cotação de Compra

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
t2ti.com@gmail.com</p>

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UCompraMapaComparativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, CompraCotacaoVO,
  CompraCotacaoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, Generics.Collections, Spin, JvSpin,
  PlatformDefaultStyleActnCtrls, ActnList, ActnMan, ActnCtrls, ToolWin,
  System.Actions, Controller;

type
  [TFormDescription(TConstantes.MODULO_COMPRAS, 'Mapa Comparativo')]

  TFCompraMapaComparativo = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditDescricao: TLabeledEdit;
    EditDataCotacao: TLabeledDateEdit;
    GroupBoxItensCotacao: TGroupBox;
    GridCompraMapaComparativo: TJvDBUltimGrid;
    GroupBoxFornecedores: TGroupBox;
    GridCompraFornecedorCotacao: TJvDBUltimGrid;
    DSCompraFornecedorCotacao: TDataSource;
    DSCompraMapaComparativo: TDataSource;
    CDSCompraFornecedorCotacao: TClientDataSet;
    CDSCompraFornecedorCotacaoID: TIntegerField;
    CDSCompraFornecedorCotacaoID_FORNECEDOR: TIntegerField;
    CDSCompraFornecedorCotacaoID_COMPRA_COTACAO: TIntegerField;
    CDSCompraFornecedorCotacaoPRAZO_ENTREGA: TStringField;
    CDSCompraFornecedorCotacaoCONDICOES_PAGAMENTO: TStringField;
    CDSCompraFornecedorCotacaoVALOR_SUBTOTAL: TFMTBCDField;
    CDSCompraFornecedorCotacaoTAXA_DESCONTO: TFMTBCDField;
    CDSCompraFornecedorCotacaoVALOR_DESCONTO: TFMTBCDField;
    CDSCompraFornecedorCotacaoTOTAL: TFMTBCDField;
    CDSCompraMapaComparativo: TClientDataSet;
    CDSCompraFornecedorCotacaoPERSISTE: TStringField;
    ActionManager1: TActionManager;
    CDSCompraMapaComparativoID_COMPRA_COTACAO: TIntegerField;
    CDSCompraMapaComparativoID_COMPRA_FORNECEDOR_COTACAO: TIntegerField;
    CDSCompraMapaComparativoID_COMPRA_COTACAO_DETALHE: TIntegerField;
    CDSCompraMapaComparativoID_PRODUTO: TIntegerField;
    CDSCompraMapaComparativoPRODUTO_NOME: TStringField;
    CDSCompraMapaComparativoFORNECEDOR_NOME: TStringField;
    CDSCompraMapaComparativoQUANTIDADE: TFMTBCDField;
    CDSCompraMapaComparativoQUANTIDADE_PEDIDA: TFMTBCDField;
    CDSCompraMapaComparativoVALOR_UNITARIO: TFMTBCDField;
    CDSCompraMapaComparativoVALOR_SUBTOTAL: TFMTBCDField;
    CDSCompraMapaComparativoTAXA_DESCONTO: TFMTBCDField;
    CDSCompraMapaComparativoVALOR_DESCONTO: TFMTBCDField;
    CDSCompraMapaComparativoVALOR_TOTAL: TFMTBCDField;
    CDSCompraMapaComparativoPERSISTE: TStringField;
    CDSCompraMapaComparativoID_FORNECEDOR: TIntegerField;
    CDSCompraFornecedorCotacaoFORNECEDORNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CDSCompraMapaComparativoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    function ValidarDadosInformados: Boolean;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;
    procedure ControlaBotoes; override;

    // Controles CRUD
    function DoEditar: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FCompraMapaComparativo: TFCompraMapaComparativo;

implementation

uses UDataModule, ViewCompraMapaComparativoVO, ViewCompraMapaComparativoController,
CompraFornecedorCotacaoController;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFCompraMapaComparativo.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCompraCotacaoVO;
  ObjetoController := TCompraCotacaoController.Create;
  inherited;
end;

procedure TFCompraMapaComparativo.LimparCampos;
begin
  inherited;
  CDSCompraFornecedorCotacao.EmptyDataSet;
  CDSCompraMapaComparativo.EmptyDataSet;
end;

procedure TFCompraMapaComparativo.ConfigurarLayoutTela;
begin
  if TCompraCotacaoVO(ObjetoVO).Situacao = 'F' then
  begin
    Application.MessageBox('Cotação já fechada. Os dados serão exibidos apenas para consulta.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    GridCompraMapaComparativo.ReadOnly := True;
  end;
  EditDataCotacao.ReadOnly := True;
  EditDescricao.ReadOnly := True;
  PanelEdits.Enabled := True;
end;

procedure TFCompraMapaComparativo.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoExcluir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFCompraMapaComparativo.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditDataCotacao.SetFocus;
  end;
end;

function TFCompraMapaComparativo.DoSalvar: Boolean;
var
 CompraMapaComparativo: TViewCompraMapaComparativoVO;
 DadosAlterados: Boolean;
begin
  if TCompraCotacaoVO(ObjetoVO).Situacao <> 'F' then
  begin
    if ValidarDadosInformados then
    begin
      DadosAlterados := False;
      Result := inherited DoSalvar;

      if Result then
      begin
        try

          // Carrega os itens do mapa comparativo numa lista
          CDSCompraMapaComparativo.DisableControls;
          CDSCompraMapaComparativo.First;
          while not CDSCompraMapaComparativo.Eof do
          begin
            if CDSCompraMapaComparativoQUANTIDADE_PEDIDA.AsExtended > 0 then
            begin
              DadosAlterados := True;

              CompraMapaComparativo := TViewCompraMapaComparativoVO.Create;
              CompraMapaComparativo.IdCompraCotacao := CDSCompraMapaComparativoID_COMPRA_COTACAO.AsInteger;
              CompraMapaComparativo.IdCompraFornecedorCotacao := CDSCompraMapaComparativoID_COMPRA_FORNECEDOR_COTACAO.AsInteger;
              CompraMapaComparativo.IdCompraCotacaoDetalhe := CDSCompraMapaComparativoID_COMPRA_COTACAO_DETALHE.AsInteger;
              CompraMapaComparativo.IdProduto := CDSCompraMapaComparativoID_PRODUTO.AsInteger;
              CompraMapaComparativo.IdFornecedor := CDSCompraMapaComparativoID_FORNECEDOR.AsInteger;
              CompraMapaComparativo.ProdutoNome := CDSCompraMapaComparativoPRODUTO_NOME.AsString;
              CompraMapaComparativo.FornecedorNome := CDSCompraMapaComparativoFORNECEDOR_NOME.AsString;
              CompraMapaComparativo.Quantidade := CDSCompraMapaComparativoQUANTIDADE.AsExtended;
              CompraMapaComparativo.QuantidadePedida := CDSCompraMapaComparativoQUANTIDADE_PEDIDA.AsExtended;
              CompraMapaComparativo.ValorUnitario := CDSCompraMapaComparativoVALOR_UNITARIO.AsExtended;
              CompraMapaComparativo.ValorSubtotal := CDSCompraMapaComparativoVALOR_SUBTOTAL.AsExtended;
              CompraMapaComparativo.TaxaDesconto := CDSCompraMapaComparativoTAXA_DESCONTO.AsExtended;
              CompraMapaComparativo.ValorDesconto := CDSCompraMapaComparativoVALOR_DESCONTO.AsExtended;
              CompraMapaComparativo.ValorTotal := CDSCompraMapaComparativoVALOR_TOTAL.AsExtended;
              TCompraCotacaoVO(ObjetoVO).ListaMapaComparativo.Add(CompraMapaComparativo);
            end;
            CDSCompraMapaComparativo.Next;
          end;
          CDSCompraMapaComparativo.First;
          CDSCompraMapaComparativo.EnableControls;

          if DadosAlterados then
          begin
            TController.ExecutarMetodo('ViewCompraMapaComparativoController.TViewCompraMapaComparativoController', 'GerarPedidos', [TCompraCotacaoVO(ObjetoVO)], 'POST', 'Boolean');
          end
          else
            Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
        except
          Result := False;
        end;
      end;
    end
    else
      Exit(False);
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFCompraMapaComparativo.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TCompraCotacaoVO(TController.BuscarObjeto('CompraCotacaoController.TCompraCotacaoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDataCotacao.Date := TCompraCotacaoVO(ObjetoVO).DataCotacao;
    EditDescricao.Text := TCompraCotacaoVO(ObjetoVO).Descricao;

    // Fornecedores da Cotação
    Filtro := 'ID_COMPRA_COTACAO=' + QuotedStr(IntToStr(TCompraCotacaoVO(ObjetoVO).Id));
    TCompraFornecedorCotacaoController.SetDataSet(CDSCompraFornecedorCotacao);
    TController.ExecutarMetodo('CompraFornecedorCotacaoController.TCompraFornecedorCotacaoController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');

    // Itens do mapa comparativo
    Filtro := 'ID_COMPRA_COTACAO=' + QuotedStr(IntToStr(TCompraCotacaoVO(ObjetoVO).Id));
    TViewCompraMapaComparativoController.SetDataSet(CDSCompraMapaComparativo);
    TController.ExecutarMetodo('ViewCompraMapaComparativoController.TViewCompraMapaComparativoController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');
  end;
end;

procedure TFCompraMapaComparativo.CDSCompraMapaComparativoAfterPost(DataSet: TDataSet);
begin
  if CDSCompraMapaComparativoID_COMPRA_COTACAO.AsInteger = 0 then
    CDSCompraMapaComparativo.Delete;
end;

procedure TFCompraMapaComparativo.GridDblClick(Sender: TObject);
begin
  inherited;
  ConfigurarLayoutTela;
end;
{$ENDREGION}

{$REGION 'Actions'}
function TFCompraMapaComparativo.ValidarDadosInformados: Boolean;
var
  Mensagem: String;
  Quantidade, SomaQuantidadePedida: Extended;
  ProdutoAtual: Integer;
begin
  SomaQuantidadePedida := 0;
  //
  CDSCompraMapaComparativo.DisableControls;
  CDSCompraMapaComparativo.First;
  //
  ProdutoAtual := CDSCompraMapaComparativoID_PRODUTO.AsInteger;
  Quantidade := CDSCompraMapaComparativoQUANTIDADE.AsExtended;
  while not CDSCompraMapaComparativo.Eof do
  begin
    if CDSCompraMapaComparativoQUANTIDADE_PEDIDA.AsExtended  > CDSCompraMapaComparativoQUANTIDADE.AsExtended then
      Mensagem := Mensagem + #13 + 'A quantidade pedida é maior que a quantidade cotada. [Id Produto = ' + CDSCompraMapaComparativoID_PRODUTO.AsString + '] - [Cotada: ' + CDSCompraMapaComparativoQUANTIDADE.AsString + '] - [Pedida: ' + CDSCompraMapaComparativoQUANTIDADE_PEDIDA.AsString + ']';

    SomaQuantidadePedida := SomaQuantidadePedida + CDSCompraMapaComparativoQUANTIDADE_PEDIDA.AsExtended;

    CDSCompraMapaComparativo.Next;

    if CDSCompraMapaComparativoID_PRODUTO.AsInteger <> ProdutoAtual then
    begin
      if Quantidade <> SomaQuantidadePedida then
        Mensagem := Mensagem + #13 + 'A soma das quantidades pedidas é maior do que a quantidade cotada. [Id Produto = ' + IntToStr(ProdutoAtual) + '] - [Cotada: ' + FloatToStr(Quantidade) + '] - [Soma Pedida: ' + FloatToStr(SomaQuantidadePedida) + ']';
      //
      ProdutoAtual := CDSCompraMapaComparativoID_PRODUTO.AsInteger;
      Quantidade := CDSCompraMapaComparativoQUANTIDADE.AsExtended;
      SomaQuantidadePedida := 0;
    end;
  end;
  // Teste deve ser realizado aqui novamente para o último produto da lista
  if Quantidade <> SomaQuantidadePedida then
    Mensagem := Mensagem + #13 + 'A soma das quantidades pedidas é maior do que a quantidade cotada. [Id Produto = ' + IntToStr(ProdutoAtual) + '] - [Cotada: ' + FloatToStr(Quantidade) + '] - [Soma Pedida: ' + FloatToStr(SomaQuantidadePedida) + ']';

  CDSCompraMapaComparativo.First;
  CDSCompraMapaComparativo.EnableControls;
  //
  if Mensagem <> '' then
  begin
    Application.MessageBox(PChar('Ocorreram erros na validação dos dados informados. Lista de erros abaixo: ' + #13 + Mensagem), 'Erro do sistema', MB_OK + MB_ICONERROR);
    Result := False;
  end
  else
    Result := True;
end;
{$ENDREGION}

end.
