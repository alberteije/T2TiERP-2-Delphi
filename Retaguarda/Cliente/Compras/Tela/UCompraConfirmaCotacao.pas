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
unit UCompraConfirmaCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, CompraCotacaoVO,
  CompraCotacaoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, Generics.Collections, Spin, JvSpin, CompraFornecedorCotacaoVO,
  PlatformDefaultStyleActnCtrls, ActnList, ActnMan, ActnCtrls, ToolWin, Biblioteca,
  System.Actions, Controller;

type
  [TFormDescription(TConstantes.MODULO_COMPRAS, 'Confirma Cotação')]

  TFCompraConfirmaCotacao = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditDescricao: TLabeledEdit;
    EditDataCotacao: TLabeledDateEdit;
    GroupBoxItensCotacao: TGroupBox;
    GridCompraCotacaoDetalhe: TJvDBUltimGrid;
    GroupBoxFornecedores: TGroupBox;
    GridCompraFornecedorCotacao: TJvDBUltimGrid;
    DSCompraFornecedorCotacao: TDataSource;
    DSCompraCotacaoDetalhe: TDataSource;
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
    CDSCompraCotacaoDetalhe: TClientDataSet;
    CDSCompraCotacaoDetalheID: TIntegerField;
    CDSCompraCotacaoDetalheID_COMPRA_FORNECEDOR_COTACAO: TIntegerField;
    CDSCompraCotacaoDetalheID_PRODUTO: TIntegerField;
    CDSCompraCotacaoDetalheQUANTIDADE: TFMTBCDField;
    CDSCompraCotacaoDetalheVALOR_UNITARIO: TFMTBCDField;
    CDSCompraCotacaoDetalheVALOR_SUBTOTAL: TFMTBCDField;
    CDSCompraCotacaoDetalheTAXA_DESCONTO: TFMTBCDField;
    CDSCompraCotacaoDetalheVALOR_DESCONTO: TFMTBCDField;
    CDSCompraCotacaoDetalheVALOR_TOTAL: TFMTBCDField;
    CDSCompraCotacaoDetalheQUANTIDADE_PEDIDA: TFMTBCDField;
    CDSCompraFornecedorCotacaoPERSISTE: TStringField;
    CDSCompraCotacaoDetalhePERSISTE: TStringField;
    CDSCompraCotacaoDetalhePRODUTONOME: TStringField;
    ActionToolBar3: TActionToolBar;
    ActionManager1: TActionManager;
    ActionGerarCsv: TAction;
    ActionLerCsvFornecedor: TAction;
    CDSCompraFornecedorCotacaoFORNECEDORNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CDSCompraFornecedorCotacaoAfterEdit(DataSet: TDataSet);
    procedure CDSCompraCotacaoDetalheAfterEdit(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure CDSCompraFornecedorCotacaoAfterPost(DataSet: TDataSet);
    procedure CDSCompraCotacaoDetalheAfterPost(DataSet: TDataSet);
    procedure ActionGerarCsvExecute(Sender: TObject);
    procedure ActionLerCsvFornecedorExecute(Sender: TObject);
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
  FCompraConfirmaCotacao: TFCompraConfirmaCotacao;

implementation

uses UDataModule, CompraCotacaoDetalheVO, CompraFornecedorCotacaoController,
CompraCotacaoDetalheController, Math, ViewCompraItemCotacaoVO, ViewCompraItemCotacaoController;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFCompraConfirmaCotacao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCompraCotacaoVO;
  ObjetoController := TCompraCotacaoController.Create;
  inherited;
end;

procedure TFCompraConfirmaCotacao.LimparCampos;
begin
  inherited;
  CDSCompraFornecedorCotacao.EmptyDataSet;
  CDSCompraCotacaoDetalhe.EmptyDataSet;
end;

procedure TFCompraConfirmaCotacao.ConfigurarLayoutTela;
begin
  if TCompraCotacaoVO(ObjetoVO).Situacao = 'F' then
  begin
    Application.MessageBox('Cotação já fechada. Os dados serão exibidos apenas para consulta.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    GridCompraFornecedorCotacao.ReadOnly := True;
    GridCompraCotacaoDetalhe.ReadOnly := True;
  end;
  EditDataCotacao.ReadOnly := True;
  EditDescricao.ReadOnly := True;
  PanelEdits.Enabled := True;
end;

procedure TFCompraConfirmaCotacao.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoExcluir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFCompraConfirmaCotacao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditDataCotacao.SetFocus;
  end;
end;

function TFCompraConfirmaCotacao.DoSalvar: Boolean;
var
  CompraFornecedorCotacao: TCompraFornecedorCotacaoVO;
  CompraCotacaoDetalhe: TCompraCotacaoDetalheVO;
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

          // Cotação Fornecedor e Seus Detalhes
          CDSCompraFornecedorCotacao.First;
          CDSCompraCotacaoDetalhe.DisableControls;
          while not CDSCompraFornecedorCotacao.Eof do
          begin
            if (CDSCompraFornecedorCotacaoPERSISTE.AsString = 'S') then
            begin
              DadosAlterados := True;

              CompraFornecedorCotacao := TCompraFornecedorCotacaoVO.Create;
              CompraFornecedorCotacao.Id := CDSCompraFornecedorCotacaoID.AsInteger;
              CompraFornecedorCotacao.IdFornecedor := CDSCompraFornecedorCotacaoID_FORNECEDOR.AsInteger;
              CompraFornecedorCotacao.IdCompraCotacao := TCompraCotacaoVO(ObjetoVO).Id;
              CompraFornecedorCotacao.PrazoEntrega := CDSCompraFornecedorCotacaoPRAZO_ENTREGA.AsString;
              CompraFornecedorCotacao.CondicoesPagamento := CDSCompraFornecedorCotacaoCONDICOES_PAGAMENTO.AsString;
              CompraFornecedorCotacao.ValorSubtotal := CDSCompraFornecedorCotacaoVALOR_SUBTOTAL.AsExtended;
              CompraFornecedorCotacao.TaxaDesconto := CDSCompraFornecedorCotacaoTAXA_DESCONTO.AsExtended;
              CompraFornecedorCotacao.ValorDesconto := CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended;
              CompraFornecedorCotacao.Total := CDSCompraFornecedorCotacaoTOTAL.AsExtended;

              //carrega os itens de cada fornecedor
              CompraFornecedorCotacao.ListaCompraCotacaoDetalhe := TObjectList<TCompraCotacaoDetalheVO>.Create;
              CDSCompraCotacaoDetalhe.First;
              while not CDSCompraCotacaoDetalhe.Eof do
              begin
                if (CDSCompraCotacaoDetalhePERSISTE.AsString = 'S') then
                begin
                  CompraCotacaoDetalhe := TCompraCotacaoDetalheVO.Create;
                  CompraCotacaoDetalhe.Id := CDSCompraCotacaoDetalheID.AsInteger;
                  CompraCotacaoDetalhe.IdCompraFornecedorCotacao := CompraFornecedorCotacao.Id;
                  CompraCotacaoDetalhe.IdProduto := CDSCompraCotacaoDetalheID_PRODUTO.AsInteger;
                  CompraCotacaoDetalhe.Quantidade := CDSCompraCotacaoDetalheQUANTIDADE.AsExtended;
                  CompraCotacaoDetalhe.ValorUnitario := CDSCompraCotacaoDetalheVALOR_UNITARIO.AsExtended;
                  CompraCotacaoDetalhe.ValorSubtotal := CDSCompraCotacaoDetalheVALOR_SUBTOTAL.AsExtended;
                  CompraCotacaoDetalhe.TaxaDesconto := CDSCompraCotacaoDetalheTAXA_DESCONTO.AsExtended;
                  CompraCotacaoDetalhe.ValorDesconto := CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended;
                  CompraCotacaoDetalhe.ValorTotal := CDSCompraCotacaoDetalheVALOR_TOTAL.AsExtended;
                  CompraFornecedorCotacao.ListaCompraCotacaoDetalhe.Add(CompraCotacaoDetalhe);
                end;
                CDSCompraCotacaoDetalhe.Next;
              end;
              TCompraCotacaoVO(ObjetoVO).ListaCompraFornecedorCotacao.Add(CompraFornecedorCotacao)
            end;
            CDSCompraFornecedorCotacao.Next;
          end;
          CDSCompraFornecedorCotacao.First;
          CDSCompraCotacaoDetalhe.First;
          CDSCompraCotacaoDetalhe.EnableControls;

          if DadosAlterados then
          begin
            TCompraCotacaoVO(ObjetoVO).Situacao := 'C';
            TController.ExecutarMetodo('CompraFornecedorCotacaoController.TCompraFornecedorCotacaoController', 'Altera', [TCompraCotacaoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFCompraConfirmaCotacao.GridParaEdits;
var
  Filtro: String;
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

    // Itens da Cotação - Baixa todos e controla o mestre/detalhe local através do ClientDataset
    Filtro := 'ID_COTACAO=' + QuotedStr(IntToStr(TCompraCotacaoVO(ObjetoVO).Id));
    TViewCompraItemCotacaoController.SetDataSet(CDSCompraCotacaoDetalhe);
    TController.ExecutarMetodo('ViewCompraItemCotacaoController.TViewCompraItemCotacaoController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');
  end;
end;

procedure TFCompraConfirmaCotacao.CDSCompraCotacaoDetalheAfterPost(DataSet: TDataSet);
begin
  if CDSCompraCotacaoDetalheID.AsInteger = 0 then
    CDSCompraCotacaoDetalhe.Delete;
  //Se alterar algum item, será necessário alterar seu cabeçalho
  CDSCompraFornecedorCotacao.Edit;
  CDSCompraFornecedorCotacaoPERSISTE.AsString := 'S';
  CDSCompraFornecedorCotacao.Post;
end;

procedure TFCompraConfirmaCotacao.CDSCompraFornecedorCotacaoAfterEdit(DataSet: TDataSet);
begin
  CDSCompraFornecedorCotacaoPERSISTE.AsString := 'S';
end;

procedure TFCompraConfirmaCotacao.CDSCompraFornecedorCotacaoAfterPost(DataSet: TDataSet);
begin
  if CDSCompraFornecedorCotacaoID.AsInteger = 0 then
    CDSCompraFornecedorCotacao.Delete;
end;

procedure TFCompraConfirmaCotacao.CDSCompraCotacaoDetalheAfterEdit(DataSet: TDataSet);
begin
  CDSCompraCotacaoDetalhePERSISTE.AsString := 'S';
end;

procedure TFCompraConfirmaCotacao.GridDblClick(Sender: TObject);
begin
  inherited;
  ConfigurarLayoutTela;
end;
{$ENDREGION}

{$REGION 'Actions'}
function TFCompraConfirmaCotacao.ValidarDadosInformados: Boolean;
var
  Mensagem: String;
  TotalDetalhe: Extended;
begin
  CDSCompraCotacaoDetalhe.DisableControls;
  CDSCompraFornecedorCotacao.First;
  while not CDSCompraFornecedorCotacao.Eof do
  begin
    if (CDSCompraFornecedorCotacaoTAXA_DESCONTO.AsExtended = 0) and (CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended <> 0) then
      Mensagem := Mensagem + #13 + 'Taxa do desconto não corresponde ao valor do desconto. Registro cabeçalho. [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
    if (CDSCompraFornecedorCotacaoTAXA_DESCONTO.AsExtended <> 0) and (CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended = 0) then
      Mensagem := Mensagem + #13 + 'Taxa do desconto não corresponde ao valor do desconto. Registro cabeçalho. [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
    if (CDSCompraFornecedorCotacaoTAXA_DESCONTO.AsExtended <> 0) and (CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended <> 0) then
      if FloatToStrF(CDSCompraFornecedorCotacaoVALOR_SUBTOTAL.AsExtended * CDSCompraFornecedorCotacaoTAXA_DESCONTO.AsExtended / 100, ffCurrency, 18, 2) <> FloatToStrF(CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended, ffCurrency, 18, 2) then
        Mensagem := Mensagem + #13 + 'Valor do desconto calculado de forma incorreta. Registro cabeçalho. [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
    if FloatToStrF(CDSCompraFornecedorCotacaoVALOR_SUBTOTAL.AsExtended - CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended, ffCurrency, 18, 2) <> FloatToStrF(CDSCompraFornecedorCotacaoTOTAL.AsExtended, ffCurrency, 18, 2) then
      Mensagem := Mensagem + #13 + 'Valor total calculado de forma incorreta (Total = SubTotal - Desconto). Registro cabeçalho. [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
    //
    TotalDetalhe := 0;
    CDSCompraCotacaoDetalhe.First;
    while not CDSCompraCotacaoDetalhe.Eof do
    begin
      if (CDSCompraCotacaoDetalheTAXA_DESCONTO.AsExtended = 0) and (CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended <> 0) then
        Mensagem := Mensagem + #13 + 'Taxa do desconto não corresponde ao valor do desconto. Registro detalhe. [Id Produto = ' + CDSCompraCotacaoDetalheID_PRODUTO.AsString + '] - [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
      if (CDSCompraCotacaoDetalheTAXA_DESCONTO.AsExtended <> 0) and (CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended = 0) then
        Mensagem := Mensagem + #13 + 'Taxa do desconto não corresponde ao valor do desconto. Registro detalhe. [Id Produto = ' + CDSCompraCotacaoDetalheID_PRODUTO.AsString + '] - [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
      if (CDSCompraCotacaoDetalheTAXA_DESCONTO.AsExtended <> 0) and (CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended <> 0) then
        if FloatToStrF(CDSCompraCotacaoDetalheVALOR_SUBTOTAL.AsExtended * CDSCompraCotacaoDetalheTAXA_DESCONTO.AsExtended / 100, ffCurrency, 18, 2) <> FloatToStrF(CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended, ffCurrency, 18, 2) then
          Mensagem := Mensagem + #13 + 'Valor do desconto calculado de forma incorreta. Registro detalhe. [Id Produto = ' + CDSCompraCotacaoDetalheID_PRODUTO.AsString + '] - [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
      if FloatToStrF(CDSCompraCotacaoDetalheQUANTIDADE.AsExtended * CDSCompraCotacaoDetalheVALOR_UNITARIO.AsExtended, ffCurrency, 18, 2) <> FloatToStrF(CDSCompraCotacaoDetalheVALOR_SUBTOTAL.AsExtended, ffCurrency, 18, 2) then
        Mensagem := Mensagem + #13 + 'Valor subtotal calculado de forma incorreta (SubTotal = Quantidade * Valor Unitário). Registro detalhe. [Id Produto = ' + CDSCompraCotacaoDetalheID_PRODUTO.AsString + '] - [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';
      if FloatToStrF(CDSCompraCotacaoDetalheVALOR_SUBTOTAL.AsExtended - CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended, ffCurrency, 18, 2) <> FloatToStrF(CDSCompraCotacaoDetalheVALOR_TOTAL.AsExtended, ffCurrency, 18, 2) then
        Mensagem := Mensagem + #13 + 'Valor total calculado de forma incorreta (Total = SubTotal - Desconto). Registro detalhe. [Id Produto = ' + CDSCompraCotacaoDetalheID_PRODUTO.AsString + '] - [Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + ']';

      TotalDetalhe := TotalDetalhe + CDSCompraCotacaoDetalheVALOR_TOTAL.AsExtended;

      CDSCompraCotacaoDetalhe.Next;
    end;

    if FloatToStrF(TotalDetalhe, ffCurrency, 18, 2) <> FloatToStrF(CDSCompraFornecedorCotacaoTOTAL.AsExtended, ffCurrency, 18, 2) then
      Mensagem := Mensagem + #13 + 'Soma dos itens não bate com o valor total. Registro cabeçalho. Id Fornecedor = ' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString;

    CDSCompraFornecedorCotacao.Next;
  end;
  CDSCompraFornecedorCotacao.First;
  CDSCompraCotacaoDetalhe.First;
  CDSCompraCotacaoDetalhe.EnableControls;
  //
  if Mensagem <> '' then
  begin
    Application.MessageBox(PChar('Ocorreram erros na validação dos dados informados. Lista de erros abaixo: ' + #13 + Mensagem), 'Erro do sistema', MB_OK + MB_ICONERROR);
    Result := False;
  end
  else
    Result := True;
end;

procedure TFCompraConfirmaCotacao.ActionGerarCsvExecute(Sender: TObject);
var
  NomeArquivo: String;
begin
  try
    CDSCompraFornecedorCotacao.DisableControls;
    CDSCompraFornecedorCotacao.First;
    while not CDSCompraFornecedorCotacao.Eof do
    begin
      NomeArquivo := 'FornecedorCotacao.' + IntToStr(TCompraCotacaoVO(ObjetoVO).Id) + '.' + CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString + '.csv';
      FDataModule.ExportarCSV.FileName := NomeArquivo;
      FDataModule.ExportarCSV.Grid := GridCompraCotacaoDetalhe;
      FDataModule.ExportarCSV.ExportGrid;
      CDSCompraFornecedorCotacao.Next;
    end;
    CDSCompraFornecedorCotacao.First;
    CDSCompraFornecedorCotacao.EnableControls;

    Application.MessageBox('Arquivos gerados com sucesso!', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a geração dos arquivos. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFCompraConfirmaCotacao.ActionLerCsvFornecedorExecute(Sender: TObject);
var
  OpcoesArquivo, ConteudoArquivo: TStringList;
  Arquivo: String;
  i: Integer;
  SubTotal, TotalDesconto, TotalGeral: Extended;
begin
  if FDataModule.OpenDialog.Execute then
  begin
    try
      try
        OpcoesArquivo := TStringList.Create;
        ConteudoArquivo := TStringList.Create;
        //
        Arquivo := ExtractFileName(FDataModule.OpenDialog.FileName);
        Split('.', Arquivo, OpcoesArquivo);

        if StrToInt(OpcoesArquivo[1]) <> TCompraCotacaoVO(ObjetoVO).Id then
        begin
          Application.MessageBox('O arquivo selecionado não pertence a cotação!', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        if OpcoesArquivo[2] <> CDSCompraFornecedorCotacaoID_FORNECEDOR.AsString then
        begin
          Application.MessageBox('O arquivo selecionado não pertence ao fornecedor!', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        ConteudoArquivo.LoadFromFile(Arquivo);

        SubTotal := 0;
        TotalDesconto := 0;
        TotalGeral := 0;
        //
        CDSCompraCotacaoDetalhe.DisableControls;
        for i := 1 to ConteudoArquivo.Count - 1 do
        begin
          OpcoesArquivo.Clear;
          ExtractStrings([';'],[], PChar(ConteudoArquivo[i]), OpcoesArquivo);

          {
            OpcoesArquivo[0] = Id Produto
            OpcoesArquivo[1] = Nome do Produto
            OpcoesArquivo[2] = Quantidade
            OpcoesArquivo[3] = Valor Unitário
            OpcoesArquivo[4] = Valor Subtotal
            OpcoesArquivo[5] = Taxa Desconto
            OpcoesArquivo[6] = Valor Desconto
            OpcoesArquivo[7] = Valor Total
          }
          CDSCompraCotacaoDetalhe.First;
          while not CDSCompraCotacaoDetalhe.Eof do
          begin
            if CDSCompraCotacaoDetalheID_PRODUTO.AsString = OpcoesArquivo[0] then
            begin
              CDSCompraCotacaoDetalhe.Edit;
              CDSCompraCotacaoDetalheVALOR_UNITARIO.AsString := OpcoesArquivo[3];
              CDSCompraCotacaoDetalheVALOR_SUBTOTAL.AsString := OpcoesArquivo[4];
              CDSCompraCotacaoDetalheTAXA_DESCONTO.AsString := OpcoesArquivo[5];
              CDSCompraCotacaoDetalheVALOR_DESCONTO.AsString := OpcoesArquivo[6];
              CDSCompraCotacaoDetalheVALOR_TOTAL.AsString := OpcoesArquivo[7];
              CDSCompraCotacaoDetalhe.Post;
              //
              SubTotal := SubTotal + CDSCompraCotacaoDetalheVALOR_SUBTOTAL.AsExtended;
              TotalDesconto := TotalDesconto + CDSCompraCotacaoDetalheVALOR_DESCONTO.AsExtended;
              TotalGeral := TotalGeral + CDSCompraCotacaoDetalheVALOR_TOTAL.AsExtended;
            end;
            CDSCompraCotacaoDetalhe.Next;
          end;

        end;
        CDSCompraCotacaoDetalhe.EnableControls;
        CDSCompraCotacaoDetalhe.First;

        // Atualiza cabeçalho
        CDSCompraFornecedorCotacao.Edit;
        CDSCompraFornecedorCotacaoVALOR_SUBTOTAL.AsExtended := SubTotal;
        CDSCompraFornecedorCotacaoVALOR_DESCONTO.AsExtended := TotalDesconto;
        CDSCompraFornecedorCotacaoTOTAL.AsExtended := TotalGeral;
        CDSCompraFornecedorCotacaoTAXA_DESCONTO.AsExtended := RoundTo(TotalDesconto / TotalGeral, -2) * 100;
        CDSCompraFornecedorCotacao.Post;

      except
        on E: Exception do
          Application.MessageBox(PChar('Ocorreu um erro durante a importação do arquivo. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
      end;
    finally
      OpcoesArquivo.Free;
      ConteudoArquivo.Free;
    end;
  end;
end;
{$ENDREGION}

end.
