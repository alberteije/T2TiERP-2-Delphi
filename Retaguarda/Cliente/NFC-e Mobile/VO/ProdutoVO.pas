{*******************************************************************************
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit ProdutoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  UnidadeProdutoVO;

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
    FID_SUB_GRUPO: Integer;
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

    FUnidadeProdutoVO: TUnidadeProdutoVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('NOME', 'Nome', 300, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('VALOR_VENDA', 'Valor Venda', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorVenda: Extended  read FVALOR_VENDA write FVALOR_VENDA;
    [TColumn('QUANTIDADE_ESTOQUE', 'Quantidade Estoque', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeEstoque: Extended  read FQUANTIDADE_ESTOQUE write FQUANTIDADE_ESTOQUE;


    [TColumn('ID_TRIBUT_ICMS_CUSTOM_CAB', 'Id Tribut Icms Custom Cab', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTributIcmsCustomCab: Integer  read FID_TRIBUT_ICMS_CUSTOM_CAB write FID_TRIBUT_ICMS_CUSTOM_CAB;
    [TColumn('ID_UNIDADE_PRODUTO', 'Id Unidade Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdUnidadeProduto: Integer  read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    [TColumn('ID_ALMOXARIFADO', 'Id Almoxarifado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdAlmoxarifado: Integer  read FID_ALMOXARIFADO write FID_ALMOXARIFADO;
    [TColumn('ID_GRUPO_TRIBUTARIO', 'Id Grupo Tributario', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdGrupoTributario: Integer  read FID_GRUPO_TRIBUTARIO write FID_GRUPO_TRIBUTARIO;
    [TColumn('ID_MARCA_PRODUTO', 'Id Marca Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdMarcaProduto: Integer  read FID_MARCA_PRODUTO write FID_MARCA_PRODUTO;
    [TColumn('ID_SUB_GRUPO', 'Id Sub Grupo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSubGrupo: Integer  read FID_SUB_GRUPO write FID_SUB_GRUPO;
    [TColumn('CODIGO_INTERNO', 'Codigo Interno', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoInterno: String  read FCODIGO_INTERNO write FCODIGO_INTERNO;
    [TColumn('NCM', 'Ncm', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('DESCRICAO_PDV', 'Descricao Pdv', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoPdv: String  read FDESCRICAO_PDV write FDESCRICAO_PDV;
    [TColumn('VALOR_COMPRA', 'Valor Compra', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCompra: Extended  read FVALOR_COMPRA write FVALOR_COMPRA;
    [TColumn('PRECO_VENDA_MINIMO', 'Preco Venda Minimo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoVendaMinimo: Extended  read FPRECO_VENDA_MINIMO write FPRECO_VENDA_MINIMO;
    [TColumn('PRECO_SUGERIDO', 'Preco Sugerido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoSugerido: Extended  read FPRECO_SUGERIDO write FPRECO_SUGERIDO;
    [TColumn('CUSTO_MEDIO_LIQUIDO', 'Custo Medio Liquido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoMedioLiquido: Extended  read FCUSTO_MEDIO_LIQUIDO write FCUSTO_MEDIO_LIQUIDO;
    [TColumn('PRECO_LUCRO_ZERO', 'Preco Lucro Zero', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoLucroZero: Extended  read FPRECO_LUCRO_ZERO write FPRECO_LUCRO_ZERO;
    [TColumn('PRECO_LUCRO_MINIMO', 'Preco Lucro Minimo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoLucroMinimo: Extended  read FPRECO_LUCRO_MINIMO write FPRECO_LUCRO_MINIMO;
    [TColumn('PRECO_LUCRO_MAXIMO', 'Preco Lucro Maximo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoLucroMaximo: Extended  read FPRECO_LUCRO_MAXIMO write FPRECO_LUCRO_MAXIMO;
    [TColumn('MARKUP', 'Markup', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Markup: Extended  read FMARKUP write FMARKUP;
    [TColumn('QUANTIDADE_ESTOQUE_ANTERIOR', 'Quantidade Estoque Anterior', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeEstoqueAnterior: Extended  read FQUANTIDADE_ESTOQUE_ANTERIOR write FQUANTIDADE_ESTOQUE_ANTERIOR;
    [TColumn('ESTOQUE_MINIMO', 'Estoque Minimo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property EstoqueMinimo: Extended  read FESTOQUE_MINIMO write FESTOQUE_MINIMO;
    [TColumn('ESTOQUE_MAXIMO', 'Estoque Maximo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property EstoqueMaximo: Extended  read FESTOQUE_MAXIMO write FESTOQUE_MAXIMO;
    [TColumn('ESTOQUE_IDEAL', 'Estoque Ideal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property EstoqueIdeal: Extended  read FESTOQUE_IDEAL write FESTOQUE_IDEAL;
    [TColumn('EXCLUIDO', 'Excluido', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Excluido: String  read FEXCLUIDO write FEXCLUIDO;
    [TColumn('INATIVO', 'Inativo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Inativo: String  read FINATIVO write FINATIVO;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('FOTO_PRODUTO', 'Foto Produto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property FotoProduto: String  read FFOTO_PRODUTO write FFOTO_PRODUTO;
    [TColumn('EX_TIPI', 'Ex Tipi', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property ExTipi: String  read FEX_TIPI write FEX_TIPI;
    [TColumn('CODIGO_LST', 'Codigo Lst', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoLst: String  read FCODIGO_LST write FCODIGO_LST;
    [TColumn('CLASSE_ABC', 'Classe Abc', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ClasseAbc: String  read FCLASSE_ABC write FCLASSE_ABC;
    [TColumn('IAT', 'Iat', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Iat: String  read FIAT write FIAT;
    [TColumn('IPPT', 'Ippt', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Ippt: String  read FIPPT write FIPPT;
    [TColumn('TIPO_ITEM_SPED', 'Tipo Item Sped', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoItemSped: String  read FTIPO_ITEM_SPED write FTIPO_ITEM_SPED;
    [TColumn('PESO', 'Peso', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Peso: Extended  read FPESO write FPESO;
    [TColumn('PORCENTO_COMISSAO', 'Porcento Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PorcentoComissao: Extended  read FPORCENTO_COMISSAO write FPORCENTO_COMISSAO;
    [TColumn('PONTO_PEDIDO', 'Ponto Pedido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PontoPedido: Extended  read FPONTO_PEDIDO write FPONTO_PEDIDO;
    [TColumn('LOTE_ECONOMICO_COMPRA', 'Lote Economico Compra', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property LoteEconomicoCompra: Extended  read FLOTE_ECONOMICO_COMPRA write FLOTE_ECONOMICO_COMPRA;
    [TColumn('ALIQUOTA_ICMS_PAF', 'Aliquota Icms Paf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsPaf: Extended  read FALIQUOTA_ICMS_PAF write FALIQUOTA_ICMS_PAF;
    [TColumn('ALIQUOTA_ISSQN_PAF', 'Aliquota Issqn Paf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIssqnPaf: Extended  read FALIQUOTA_ISSQN_PAF write FALIQUOTA_ISSQN_PAF;
    [TColumn('TOTALIZADOR_PARCIAL', 'Totalizador Parcial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property TotalizadorParcial: String  read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    [TColumn('CODIGO_BALANCA', 'Codigo Balanca', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoBalanca: Integer  read FCODIGO_BALANCA write FCODIGO_BALANCA;
    [TColumn('DATA_ALTERACAO', 'Data Alteracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAlteracao: TDateTime  read FDATA_ALTERACAO write FDATA_ALTERACAO;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;


    [TAssociation('ID', 'ID_UNIDADE_PRODUTO')]
    property UnidadeProdutoVO: TUnidadeProdutoVO read FUnidadeProdutoVO write FUnidadeProdutoVO;

  end;

implementation

constructor TProdutoVO.Create;
begin
  inherited;
  FUnidadeProdutoVO := TUnidadeProdutoVO.Create;
end;

destructor TProdutoVO.Destroy;
begin
  FreeAndNil(FUnidadeProdutoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TProdutoVO);

finalization
  Classes.UnRegisterClass(TProdutoVO);

end.
