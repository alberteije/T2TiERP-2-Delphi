{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_OP_DETALHE]

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

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
*******************************************************************************}
unit PcpOpDetalheVO;

interface

uses
  Data.DB,
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, ProdutoVO, PcpServicoVO;

type
  [TEntity]
  [TTable('PCP_OP_DETALHE')]
  TPcpOpDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_PCP_OP_CABECALHO: Integer;
    FQUANTIDADE_PRODUZIR: Extended;
    FQUANTIDADE_PRODUZIDA: Extended;
    FQUANTIDADE_ENTREGUE: Extended;
    FCUSTO_PREVISTO: Extended;
    FCUSTO_REALIZADO: Extended;

    FProdutoNome: string;
    FProdutoUnidade: string;

    FProduto: TProdutoVO;

    FListaPcpServicoVO: TObjectList<TPcpServicoVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PRODUTO', 'Id Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_PCP_OP_CABECALHO', 'Id Pcp Op Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPcpOpCabecalho: Integer  read FID_PCP_OP_CABECALHO write FID_PCP_OP_CABECALHO;
    [TColumn('QUANTIDADE_PRODUZIR', 'Quantidade Produzir', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeProduzir: Extended  read FQUANTIDADE_PRODUZIR write FQUANTIDADE_PRODUZIR;
    [TColumn('QUANTIDADE_PRODUZIDA', 'Quantidade Produzida', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeProduzida: Extended  read FQUANTIDADE_PRODUZIDA write FQUANTIDADE_PRODUZIDA;
    [TColumn('QUANTIDADE_ENTREGUE', 'Quantidade Entregue', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeEntregue: Extended  read FQUANTIDADE_ENTREGUE write FQUANTIDADE_ENTREGUE;
    [TColumn('CUSTO_PREVISTO', 'Custo Previsto', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoPrevisto: Extended  read FCUSTO_PREVISTO write FCUSTO_PREVISTO;
    [TColumn('CUSTO_REALIZADO', 'Custo Realizado', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoRealizado: Extended  read FCUSTO_REALIZADO write FCUSTO_REALIZADO;

    [TColumnDisplay('PRODUTO.NOME', 'Nome', 80, [ldGrid, ldLookup, ldCombobox], ftString, 'ProdutoVO.TProdutoVO', True)]
    property ProdutoNome: string  read FProdutoNome write FProdutoNome;
    [TColumnDisplay('PRODUTO.UNIDADE.DESCRICAO', 'Unidade', 80, [ldGrid, ldLookup, ldCombobox], ftString, 'ProdutoVO.TProdutoVO', True)]
    property ProdutoUnidade: string  read FProdutoUnidade write FProdutoUnidade;

    [TAssociation('ID', 'ID_PRODUTO')]
    property Produto: TProdutoVO read FProduto write FProduto;

    [TManyValuedAssociation('ID_PCP_OP_DETALHE', 'ID')]
    property ListaPcpServicoVO: TObjectList<TPcpServicoVO> read FListaPcpServicoVO write FListaPcpServicoVO;

  end;

implementation

{ TPcpOpDetalheVO }

constructor TPcpOpDetalheVO.Create;
begin
  inherited;
  FProduto := TProdutoVO.Create;
  FListaPcpServicoVO := TObjectList<TPcpServicoVO>.Create;
end;

destructor TPcpOpDetalheVO.Destroy;
begin
  FreeAndNil(FProduto);
  FreeAndNil(FListaPcpServicoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpOpDetalheVO);

finalization
  Classes.UnRegisterClass(TPcpOpDetalheVO);

end.

