{ *******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PRODUTO]

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
t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit ProdutoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, DB, SysUtils,
  UnidadeProdutoVO, ProdutoSubGrupoVO, AlmoxarifadoVO, TributGrupoTributarioVO,
  ProdutoMarcaVO, TributIcmsCustomCabVO, ProdutoGrupoVO, FichaTecnicaVO;

type
  [TEntity]
  [TTable('PRODUTO')]

  TProdutoVO = class(TVO)
  private
    FID: Integer;
    FID_TRIBUT_ICMS_CUSTOM_CAB: Integer;
    FID_UNIDADE_PRODUTO: Integer;
    FID_ALMOXARIFADO: Integer;
    FID_GRUPO_TRIBUTARIO: Integer;
    FID_MARCA_PRODUTO: Integer;
    FID_SUBGRUPO: Integer;
    FGTIN: String;
    FCODIGO_INTERNO: String;
    FNCM: String;
    FNOME: String;
    FDESCRICAO: String;
    FDESCRICAO_PDV: String;
    FVALOR_COMPRA: Extended;
    FVALOR_VENDA: Extended;
    FPRECO_VENDA_MINIMO: Extended;
    FPRECO_SUGERIDO: Extended;

    FCUSTO_UNITARIO: Extended;
    FCUSTO_PRODUCAO: Extended;

    FCUSTO_MEDIO_LIQUIDO: Extended;
    FPRECO_LUCRO_ZERO: Extended;
    FPRECO_LUCRO_MINIMO: Extended;
    FPRECO_LUCRO_MAXIMO: Extended;
    FMARKUP: Extended;
    FQUANTIDADE_ESTOQUE: Extended;
    FQUANTIDADE_ESTOQUE_ANTERIOR: Extended;
    FESTOQUE_MINIMO: Extended;
    FESTOQUE_MAXIMO: Extended;
    FESTOQUE_IDEAL: Extended;
    FEXCLUIDO: String;
    FINATIVO: String;
    FDATA_CADASTRO: TDateTime;
    FFOTO_PRODUTO: String;
    FEX_TIPI: String;
    FCODIGO_LST: String;
    FCLASSE_ABC: String;
    FIAT: String;
    FIPPT: String;
    FTIPO_ITEM_SPED: String;
    FPESO: Extended;
    FPORCENTO_COMISSAO: Extended;
    FPONTO_PEDIDO: Extended;
    FLOTE_ECONOMICO_COMPRA: Extended;
    FALIQUOTA_ICMS_PAF: Extended;
    FALIQUOTA_ISSQN_PAF: Extended;
    FTOTALIZADOR_PARCIAL: String;
    FCODIGO_BALANCA: Integer;
    FDATA_ALTERACAO: TDateTime;
    FTIPO: String;

    FUnidadeProdutoSigla: String;
    FAlmoxarifadoNome: String;
    FTributIcmsCustomCabDescricao: String;
    FTributGrupoTributarioDescricao: String;
    FProdutoMarcaNome: String;
    FProdutoGrupoNome: String;
    FProdutoSubGrupoNome: String;

    FImagem: String;
    FTipoImagem: String;

    FUnidadeProdutoVO: TUnidadeProdutoVO;
    FAlmoxarifadoVO: TAlmoxarifadoVO;
    FTributIcmsCustomCabVO: TTributIcmsCustomCabVO;
    FGrupoTributarioVO: TTributGrupoTributarioVO;
    FProdutoMarcaVO: TProdutoMarcaVO;
    FProdutoSubGrupoVO: TProdutoSubGrupoVO;

    FListaFichaTecnicaVO: TObjectList<TFichaTecnicaVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    property Id: Integer read FID write FID;
    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldComboBox], False)]
    property Gtin: String read FGTIN write FGTIN;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup], False)]
    property Nome: String read FNOME write FNOME;

    [TColumn('ID_UNIDADE_PRODUTO', 'Id Unidade', 70, [], False)]
    property IdUnidade: Integer read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    [TColumnDisplay('UNIDADE_PRODUTO.SIGLA', 'Unidade', 150, [ldGrid, ldLookup], ftString, 'UnidadeProdutoVO.TUnidadeProdutoVO', True)]
    property UnidadeProdutoSigla: String read FUnidadeProdutoSigla write FUnidadeProdutoSigla;

    [TColumn('ID_ALMOXARIFADO', 'Id Almoxarifado', 80, [], False)]
    property IdAlmoxarifado: Integer read FID_ALMOXARIFADO write FID_ALMOXARIFADO;
    [TColumnDisplay('ALMOXARIFADO.NOME', 'Almoxarifado', 150, [ldGrid, ldLookup], ftString, 'AlmoxarifadoVO.TAlmoxarifadoVO', True)]
    property AlmoxarifadoNome: String read FAlmoxarifadoNome write FAlmoxarifadoNome;

    [TColumn('ID_TRIBUT_ICMS_CUSTOM_CAB', 'Id Icms Customizado', 120, [ldLookup], False)]
    property IdIcmsCustomizado: Integer read FID_TRIBUT_ICMS_CUSTOM_CAB write FID_TRIBUT_ICMS_CUSTOM_CAB;
    [TColumnDisplay('TRIBUT_ICMS_CUSTOM_CAB.DESCRICAO', 'ICMS Customizado', 150, [ldGrid, ldLookup], ftString, 'TributIcmsCustomCabVO.TTributIcmsCustomCabVO', True)]
    property TributIcmsCustomCabDescricao: String read FTributIcmsCustomCabDescricao write FTributIcmsCustomCabDescricao;

    [TColumn('ID_GRUPO_TRIBUTARIO', 'Id Grupo Tributário', 120, [ldLookup], False)]
    property IdGrupoTributario: Integer read FID_GRUPO_TRIBUTARIO write FID_GRUPO_TRIBUTARIO;
    [TColumnDisplay('TRIBUT_GRUPO_TRIBUTARIO.DESCRICAO', 'Grupo Tributário', 150, [ldGrid, ldLookup], ftString, 'TributGrupoTributarioVO.TTributGrupoTributarioVO', True)]
    property TributGrupoTributarioDescricao: String read FTributGrupoTributarioDescricao write FTributGrupoTributarioDescricao;

    [TColumn('ID_MARCA_PRODUTO', 'Id Marca', 70, [], False)]
    property IdProdutoMarca: Integer read FID_MARCA_PRODUTO write FID_MARCA_PRODUTO;
    [TColumnDisplay('PRODUTO_MARCA.NOME', 'Marca', 150, [ldGrid, ldLookup], ftString, 'ProdutoMarcaVO.TProdutoMarcaVO', True)]
    property ProdutoMarcaNome: String read FProdutoMarcaNome write FProdutoMarcaNome;

    [TColumn('ID_SUBGRUPO', 'Id Subgrupo', 70, [], False)]
    property IdSubGrupo: Integer read FID_SUBGRUPO write FID_SUBGRUPO;
    [TColumnDisplay('PRODUTO_GRUPO.NOME', 'Grupo', 150, [ldGrid, ldLookup], ftString, 'ProdutoGrupoVO.TProdutoGrupoVO', True)]
    property ProdutoGrupoNome: String read FProdutoGrupoNome write FProdutoGrupoNome;
    [TColumnDisplay('PRODUTO_SUBGRUPO.NOME', 'SubGrupo', 150, [ldGrid, ldLookup], ftString, 'ProdutoSubGrupoVO.TProdutoSubGrupoVO', True)]
    property ProdutoSubGrupoNome: String read FProdutoSubGrupoNome write FProdutoSubGrupoNome;

    [TColumn('CODIGO_INTERNO', 'Código Interno', 450, [ldGrid, ldLookup, ldComboBox], False)]
    property CodigoInterno: String read FCODIGO_INTERNO write FCODIGO_INTERNO;
    [TColumn('NCM', 'Ncm', 64, [ldGrid, ldLookup, ldComboBox], False)]
    property Ncm: String read FNCM write FNCM;
    [TColumn('DESCRICAO', 'Descrição', 450, [ldGrid, ldLookup, ldComboBox], False)]
    property Descricao: String read FDESCRICAO write FDESCRICAO;
    [TColumn('DESCRICAO_PDV', 'Descrição Pdv', 240, [ldGrid, ldLookup], False)]
    property DescricaoPdv: String read FDESCRICAO_PDV write FDESCRICAO_PDV;
    [TColumn('VALOR_COMPRA', 'Valor Compra', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCompra: Extended read FVALOR_COMPRA write FVALOR_COMPRA;
    [TColumn('VALOR_VENDA', 'Valor Venda', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorVenda: Extended read FVALOR_VENDA write FVALOR_VENDA;
    [TColumn('PRECO_VENDA_MINIMO', 'Preço Venda Mínimo', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoVendaMinimo: Extended read FPRECO_VENDA_MINIMO write FPRECO_VENDA_MINIMO;

    [TColumn('PRECO_SUGERIDO', 'Preço Sugerido', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoSugerido: Extended read FPRECO_SUGERIDO write FPRECO_SUGERIDO;

    [TColumn('CUSTO_UNITARIO', 'Custo Unitário', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoUnitario: Extended read FCUSTO_UNITARIO write FCUSTO_UNITARIO;
    [TColumn('CUSTO_PRODUCAO', 'Custo Produção', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoProducao: Extended read FCUSTO_PRODUCAO write FCUSTO_PRODUCAO;

    [TColumn('CUSTO_MEDIO_LIQUIDO', 'Custo Médio Líquido', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoMedioLiquido: Extended read FCUSTO_MEDIO_LIQUIDO write FCUSTO_MEDIO_LIQUIDO;
    [TColumn('PRECO_LUCRO_ZERO', 'Preço Lucro Zero', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoLucroZero: Extended read FPRECO_LUCRO_ZERO write FPRECO_LUCRO_ZERO;
    [TColumn('PRECO_LUCRO_MINIMO', 'Preço Lucro Mínimo', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoLucroMinimo: Extended read FPRECO_LUCRO_MINIMO write FPRECO_LUCRO_MINIMO;
    [TColumn('PRECO_LUCRO_MAXIMO', 'Preço Lucro Máximo', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoLucroMaximo: Extended read FPRECO_LUCRO_MAXIMO write FPRECO_LUCRO_MAXIMO;
    [TColumn('MARKUP', 'Markup', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Markup: Extended read FMARKUP write FMARKUP;
    [TColumn('QUANTIDADE_ESTOQUE', 'Qtde Estoque', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeEstoque: Extended read FQUANTIDADE_ESTOQUE write FQUANTIDADE_ESTOQUE;
    [TColumn('QUANTIDADE_ESTOQUE_ANTERIOR', 'Qtde Estoque Anterior', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeEstoqueAnterior: Extended read FQUANTIDADE_ESTOQUE_ANTERIOR write FQUANTIDADE_ESTOQUE_ANTERIOR;
    [TColumn('ESTOQUE_MINIMO', 'Estoque Mínimo', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property EstoqueMinimo: Extended read FESTOQUE_MINIMO write FESTOQUE_MINIMO;
    [TColumn('ESTOQUE_MAXIMO', 'Estoque Máximo', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property EstoqueMaximo: Extended read FESTOQUE_MAXIMO write FESTOQUE_MAXIMO;
    [TColumn('ESTOQUE_IDEAL', 'Estoque Ideal', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property EstoqueIdeal: Extended read FESTOQUE_IDEAL write FESTOQUE_IDEAL;
    [TColumn('EXCLUIDO', 'Excluido', 8, [], False)]
    property Excluido: String read FEXCLUIDO write FEXCLUIDO;
    [TColumn('INATIVO', 'Inativo', 50, [ldGrid, ldLookup], False)]
    property Inativo: String read FINATIVO write FINATIVO;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldComboBox], False)]
    property DataCadastro: TDateTime read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('FOTO_PRODUTO', 'Foto Produto', 450, [ldGrid, ldLookup], False)]
    property FotoProduto: String read FFOTO_PRODUTO write FFOTO_PRODUTO;
    [TColumn('EX_TIPI', 'Ex Tipi', 50, [ldGrid, ldLookup], False)]
    property ExTipi: String read FEX_TIPI write FEX_TIPI;
    [TColumn('CODIGO_LST', 'Código Lst', 80, [ldGrid, ldLookup], False)]
    property CodigoLst: String read FCODIGO_LST write FCODIGO_LST;
    [TColumn('CLASSE_ABC', 'Classe ABC', 80, [ldGrid, ldLookup], False)]
    property ClasseAbc: String read FCLASSE_ABC write FCLASSE_ABC;
    [TColumn('IAT', 'Iat', 50, [ldGrid, ldLookup], False)]
    property Iat: String read FIAT write FIAT;
    [TColumn('IPPT', 'Ippt', 50, [ldGrid, ldLookup], False)]
    property Ippt: String read FIPPT write FIPPT;
    [TColumn('TIPO_ITEM_SPED', 'Tipo Item Sped', 100, [ldGrid, ldLookup], False)]
    property TipoItemSped: String read FTIPO_ITEM_SPED write FTIPO_ITEM_SPED;
    [TColumn('PESO', 'Peso', 168, [ldGrid, ldLookup], False)]
    property Peso: Extended read FPESO write FPESO;
    [TColumn('PORCENTO_COMISSAO', 'Porcento Comissão', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PorcentoComissao: Extended read FPORCENTO_COMISSAO write FPORCENTO_COMISSAO;
    [TColumn('PONTO_PEDIDO', 'Ponto Pedido', 168, [ldGrid, ldLookup], False)]
    property PontoPedido: Extended read FPONTO_PEDIDO write FPONTO_PEDIDO;
    [TColumn('LOTE_ECONOMICO_COMPRA', 'Lote Econômico Compra', 168, [ldGrid, ldLookup], False)]
    property LoteEconomicoCompra: Extended read FLOTE_ECONOMICO_COMPRA write FLOTE_ECONOMICO_COMPRA;
    [TColumn('ALIQUOTA_ICMS_PAF', 'Alíquota ICMS PAF', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsPaf: Extended read FALIQUOTA_ICMS_PAF write FALIQUOTA_ICMS_PAF;
    [TColumn('ALIQUOTA_ISSQN_PAF', 'Alíquota ISS PAF', 168, [ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIssqnPaf: Extended read FALIQUOTA_ISSQN_PAF write FALIQUOTA_ISSQN_PAF;
    [TColumn('TOTALIZADOR_PARCIAL', 'Totalizador Parcial', 100, [ldGrid, ldLookup], False)]
    property TotalizadorParcial: String read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    [TColumn('CODIGO_BALANCA', 'Código Balança', 100, [ldGrid, ldLookup], False)]
    property CodigoBalanca: Integer read FCODIGO_BALANCA write FCODIGO_BALANCA;
    [TColumn('DATA_ALTERACAO', 'Data Alteração', 80, [ldGrid, ldLookup], False)]
    property DataAlteracao: TDateTime read FDATA_ALTERACAO write FDATA_ALTERACAO;
    [TColumn('TIPO', 'Tipo', 100, [ldGrid, ldLookup], False)]
    property Tipo: String read FTIPO write FTIPO;

    [TColumn('IMAGEM', 'Imagem', 80, [], True)]
    property Imagem: String read FImagem write FImagem;
    [TColumn('TIPO_IMAGEM', 'Tipo Imagem', 80, [], True)]
    property TipoImagem: String read FTipoImagem write FTipoImagem;

    [TAssociation('ID', 'ID_SUBGRUPO')]
    property ProdutoSubGrupoVO: TProdutoSubGrupoVO read FProdutoSubGrupoVO write FProdutoSubGrupoVO;

    [TAssociation('ID', 'ID_UNIDADE_PRODUTO')]
    property UnidadeProdutoVO: TUnidadeProdutoVO read FUnidadeProdutoVO write FUnidadeProdutoVO;

    [TAssociation('ID', 'ID_ALMOXARIFADO')]
    property AlmoxarifadoVO: TAlmoxarifadoVO read FAlmoxarifadoVO write FAlmoxarifadoVO;

    [TAssociation('ID', 'ID_TRIBUT_ICMS_CUSTOM_CAB')]
    property TributIcmsCustomCabVO: TTributIcmsCustomCabVO read FTributIcmsCustomCabVO write FTributIcmsCustomCabVO;

    [TAssociation('ID', 'ID_GRUPO_TRIBUTARIO')]
    property GrupoTributarioVO: TTributGrupoTributarioVO read FGrupoTributarioVO write FGrupoTributarioVO;

    [TAssociation('ID', 'ID_MARCA_PRODUTO')]
    property ProdutoMarcaVO: TProdutoMarcaVO read FProdutoMarcaVO write FProdutoMarcaVO;

    [TManyValuedAssociation('ID_PRODUTO', 'ID')]
    property ListaFichaTecnicaVO: TObjectList<TFichaTecnicaVO> read FListaFichaTecnicaVO write FListaFichaTecnicaVO;

  end;

implementation

constructor TProdutoVO.Create;
begin
  inherited;

  FUnidadeProdutoVO := TUnidadeProdutoVO.Create;
  FAlmoxarifadoVO := TAlmoxarifadoVO.Create;
  FTributIcmsCustomCabVO := TTributIcmsCustomCabVO.Create;
  FGrupoTributarioVO := TTributGrupoTributarioVO.Create;
  FProdutoMarcaVO := TProdutoMarcaVO.Create;
  FProdutoSubGrupoVO := TProdutoSubGrupoVO.Create;

  FListaFIchaTecnicaVO := TObjectList<TFichaTecnicaVO>.Create;
end;

destructor TProdutoVO.Destroy;
begin
  FreeAndNil(FUnidadeProdutoVO);
  FreeAndNil(FAlmoxarifadoVO);
  FreeAndNil(FTributIcmsCustomCabVO);
  FreeAndNil(FGrupoTributarioVO);
  FreeAndNil(FProdutoMarcaVO);
  FreeAndNil(FProdutoSubGrupoVO);
  FreeAndNil(FListaFichaTecnicaVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TProdutoVO);

finalization
  Classes.UnRegisterClass(TProdutoVO);

end.
