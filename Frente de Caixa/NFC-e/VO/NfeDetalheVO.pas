{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE] 
                                                                                
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
unit NfeDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  ProdutoVO,

  NfeDetEspecificoVeiculoVO, NfeDetEspecificoCombustivelVO,
  NfeDetalheImpostoIcmsVO, NfeDetalheImpostoIpiVO, NfeDetalheImpostoIiVO,
  NfeDetalheImpostoPisVO, NfeDetalheImpostoCofinsVO, NfeDetalheImpostoIssqnVO,

  NfeDeclaracaoImportacaoVO, NfeExportacaoVO, NfeDetEspecificoMedicamentoVO,
  NfeDetEspecificoArmamentoVO;

type
  [TEntity]
  [TTable('NFE_DETALHE')]
  TNfeDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_NFE_CABECALHO: Integer;
    FNUMERO_ITEM: Integer;
    FCODIGO_PRODUTO: String;
    FGTIN: String;
    FNOME_PRODUTO: String;
    FNCM: String;
    FNVE: String;
    FEX_TIPI: Integer;
    FCFOP: Integer;
    FUNIDADE_COMERCIAL: String;
    FQUANTIDADE_COMERCIAL: Extended;
    FVALOR_UNITARIO_COMERCIAL: Extended;
    FVALOR_BRUTO_PRODUTO: Extended;
    FGTIN_UNIDADE_TRIBUTAVEL: String;
    FUNIDADE_TRIBUTAVEL: String;
    FQUANTIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNITARIO_TRIBUTAVEL: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FENTRA_TOTAL: Integer;
    FVALOR_SUBTOTAL: Extended;
    FVALOR_TOTAL: Extended;
    FNUMERO_PEDIDO_COMPRA: String;
    FITEM_PEDIDO_COMPRA: Integer;
    FINFORMACOES_ADICIONAIS: String;
    FNUMERO_FCI: String;
    FNUMERO_RECOPI: String;
    FVALOR_TOTAL_TRIBUTOS: Extended;
    FPERCENTUAL_DEVOLVIDO: Extended;
    FVALOR_IPI_DEVOLVIDO: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;
    //Usado para verificar se o produto está cadastrado
    FCadastrado: String;

    FProdutoVO: TProdutoVO;


    // Grupo JA
    FNfeDetEspecificoVeiculoVO: TNfeDetEspecificoVeiculoVO; //0:1
    // Grupo LA
    FNfeDetEspecificoCombustivelVO: TNfeDetEspecificoCombustivelVO; //0:1
    // Grupo N
    FNfeDetalheImpostoIcmsVO: TNfeDetalheImpostoIcmsVO; //1:1
    // Grupo O
    FNfeDetalheImpostoIpiVO: TNfeDetalheImpostoIpiVO; //0:1
    // Grupo P
    FNfeDetalheImpostoIiVO: TNfeDetalheImpostoIiVO; //0:1
    // Grupo Q
    FNfeDetalheImpostoPisVO: TNfeDetalheImpostoPisVO; //0:1
    // Grupo S
    FNfeDetalheImpostoCofinsVO: TNfeDetalheImpostoCofinsVO; //0:1
    // Grupo U
    FNfeDetalheImpostoIssqnVO: TNfeDetalheImpostoIssqnVO; //0:1


    // Grupo I01
    FListaNfeDeclaracaoImportacaoVO: TObjectList<TNfeDeclaracaoImportacaoVO>; //0:100
    // Grupo I03
    FListaNfeExportacaoVO: TObjectList<TNfeExportacaoVO>; //0:500
    // Grupo K
    FListaNfeDetEspecificoMedicamentoVO: TObjectList<TNfeDetEspecificoMedicamentoVO>; //0:500
    // Grupo L
    FListaNfeDetEspecificoArmamentoVO: TObjectList<TNfeDetEspecificoArmamentoVO>; //0:500

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
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('NUMERO_ITEM', 'Numero Item', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroItem: Integer  read FNUMERO_ITEM write FNUMERO_ITEM;
    [TColumn('CODIGO_PRODUTO', 'Codigo Produto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoProduto: String  read FCODIGO_PRODUTO write FCODIGO_PRODUTO;
    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('NOME_PRODUTO', 'Nome Produto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    [TColumn('NCM', 'Ncm', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('NVE', 'Nve', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Nve: String  read FNVE write FNVE;
    [TColumn('EX_TIPI', 'Ex Tipi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ExTipi: Integer  read FEX_TIPI write FEX_TIPI;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('UNIDADE_COMERCIAL', 'Unidade Comercial', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property UnidadeComercial: String  read FUNIDADE_COMERCIAL write FUNIDADE_COMERCIAL;
    [TColumn('QUANTIDADE_COMERCIAL', 'Quantidade Comercial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeComercial: Extended  read FQUANTIDADE_COMERCIAL write FQUANTIDADE_COMERCIAL;
    [TColumn('VALOR_UNITARIO_COMERCIAL', 'Valor Unitario Comercial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitarioComercial: Extended  read FVALOR_UNITARIO_COMERCIAL write FVALOR_UNITARIO_COMERCIAL;
    [TColumn('VALOR_BRUTO_PRODUTO', 'Valor Bruto Produto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBrutoProduto: Extended  read FVALOR_BRUTO_PRODUTO write FVALOR_BRUTO_PRODUTO;
    [TColumn('GTIN_UNIDADE_TRIBUTAVEL', 'Gtin Unidade Tributavel', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property GtinUnidadeTributavel: String  read FGTIN_UNIDADE_TRIBUTAVEL write FGTIN_UNIDADE_TRIBUTAVEL;
    [TColumn('UNIDADE_TRIBUTAVEL', 'Unidade Tributavel', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property UnidadeTributavel: String  read FUNIDADE_TRIBUTAVEL write FUNIDADE_TRIBUTAVEL;
    [TColumn('QUANTIDADE_TRIBUTAVEL', 'Quantidade Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTributavel: Extended  read FQUANTIDADE_TRIBUTAVEL write FQUANTIDADE_TRIBUTAVEL;
    [TColumn('VALOR_UNITARIO_TRIBUTAVEL', 'Valor Unitario Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitarioTributavel: Extended  read FVALOR_UNITARIO_TRIBUTAVEL write FVALOR_UNITARIO_TRIBUTAVEL;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Valor Seguro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_OUTRAS_DESPESAS', 'Valor Outras Despesas', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    [TColumn('ENTRA_TOTAL', 'Entra Total', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EntraTotal: Integer  read FENTRA_TOTAL write FENTRA_TOTAL;
    [TColumn('VALOR_SUBTOTAL', 'Valor Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    [TColumn('VALOR_TOTAL', 'Valor Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('NUMERO_PEDIDO_COMPRA', 'Numero Pedido Compra', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroPedidoCompra: String  read FNUMERO_PEDIDO_COMPRA write FNUMERO_PEDIDO_COMPRA;
    [TColumn('ITEM_PEDIDO_COMPRA', 'Item Pedido Compra', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemPedidoCompra: Integer  read FITEM_PEDIDO_COMPRA write FITEM_PEDIDO_COMPRA;
    [TColumn('INFORMACOES_ADICIONAIS', 'Informacoes Adicionais', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property InformacoesAdicionais: String  read FINFORMACOES_ADICIONAIS write FINFORMACOES_ADICIONAIS;
    [TColumn('NUMERO_FCI', 'Numero Fci', 288, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroFci: String  read FNUMERO_FCI write FNUMERO_FCI;
    [TColumn('NUMERO_RECOPI', 'Numero Recopi', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroRecopi: String  read FNUMERO_RECOPI write FNUMERO_RECOPI;
    [TColumn('VALOR_TOTAL_TRIBUTOS', 'Valor Total Tributos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalTributos: Extended  read FVALOR_TOTAL_TRIBUTOS write FVALOR_TOTAL_TRIBUTOS;
    [TColumn('PERCENTUAL_DEVOLVIDO', 'Percentual Devolvido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualDevolvido: Extended  read FPERCENTUAL_DEVOLVIDO write FPERCENTUAL_DEVOLVIDO;
    [TColumn('VALOR_IPI_DEVOLVIDO', 'Valor Ipi Devolvido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpiDevolvido: Extended  read FVALOR_IPI_DEVOLVIDO write FVALOR_IPI_DEVOLVIDO;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

    [TColumn('CADASTRADO', 'Cadastrado', 60, [], True)]
    property Cadastrado: String  read FCadastrado write FCadastrado;


    [TAssociation('ID', 'ID_PRODUTO')]
    property ProdutoVO: TProdutoVO read FProdutoVO write FProdutoVO;


    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetEspecificoVeiculoVO: TNfeDetEspecificoVeiculoVO read FNfeDetEspecificoVeiculoVO write FNfeDetEspecificoVeiculoVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetEspecificoCombustivelVO: TNfeDetEspecificoCombustivelVO read FNfeDetEspecificoCombustivelVO write FNfeDetEspecificoCombustivelVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetalheImpostoIcmsVO: TNfeDetalheImpostoIcmsVO read FNfeDetalheImpostoIcmsVO write FNfeDetalheImpostoIcmsVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetalheImpostoIpiVO: TNfeDetalheImpostoIpiVO read FNfeDetalheImpostoIpiVO write FNfeDetalheImpostoIpiVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetalheImpostoIiVO: TNfeDetalheImpostoIiVO read FNfeDetalheImpostoIiVO write FNfeDetalheImpostoIiVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetalheImpostoPisVO: TNfeDetalheImpostoPisVO read FNfeDetalheImpostoPisVO write FNfeDetalheImpostoPisVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetalheImpostoCofinsVO: TNfeDetalheImpostoCofinsVO read FNfeDetalheImpostoCofinsVO write FNfeDetalheImpostoCofinsVO;

    [TAssociation('ID_NFE_DETALHE','ID')]
    property NfeDetalheImpostoIssqnVO: TNfeDetalheImpostoIssqnVO read FNfeDetalheImpostoIssqnVO write FNfeDetalheImpostoIssqnVO;


    [TManyValuedAssociation('ID_NFE_DETALHE','ID')]
    property ListaNfeDeclaracaoImportacaoVO: TObjectList<TNfeDeclaracaoImportacaoVO> read FListaNfeDeclaracaoImportacaoVO write FListaNfeDeclaracaoImportacaoVO;

    [TManyValuedAssociation('ID_NFE_DETALHE','ID')]
    property ListaNfeExportacaoVO: TObjectList<TNfeExportacaoVO> read FListaNfeExportacaoVO write FListaNfeExportacaoVO;

    [TManyValuedAssociation('ID_NFE_DETALHE','ID')]
    property ListaNfeDetEspecificoMedicamentoVO: TObjectList<TNfeDetEspecificoMedicamentoVO> read FListaNfeDetEspecificoMedicamentoVO write FListaNfeDetEspecificoMedicamentoVO;

    [TManyValuedAssociation('ID_NFE_DETALHE','ID')]
    property ListaNfeDetEspecificoArmamentoVO: TObjectList<TNfeDetEspecificoArmamentoVO> read FListaNfeDetEspecificoArmamentoVO write FListaNfeDetEspecificoArmamentoVO;

  end;

implementation

constructor TNfeDetalheVO.Create;
begin
  inherited;
  FProdutoVO := TProdutoVO.Create;

  FNfeDetEspecificoVeiculoVO := TNfeDetEspecificoVeiculoVO.Create;
  FNfeDetEspecificoCombustivelVO := TNfeDetEspecificoCombustivelVO.Create;
  FNfeDetalheImpostoIcmsVO := TNfeDetalheImpostoIcmsVO.Create;
  FNfeDetalheImpostoIpiVO := TNfeDetalheImpostoIpiVO.Create;
  FNfeDetalheImpostoIiVO := TNfeDetalheImpostoIiVO.Create;
  FNfeDetalheImpostoPisVO := TNfeDetalheImpostoPisVO.Create;
  FNfeDetalheImpostoCofinsVO := TNfeDetalheImpostoCofinsVO.Create;
  FNfeDetalheImpostoIssqnVO := TNfeDetalheImpostoIssqnVO.Create;

  FListaNfeDeclaracaoImportacaoVO := TObjectList<TNfeDeclaracaoImportacaoVO>.Create;
  FListaNfeExportacaoVO := TObjectList<TNfeExportacaoVO>.Create;
  FListaNfeDetEspecificoMedicamentoVO := TObjectList<TNfeDetEspecificoMedicamentoVO>.Create;
  FListaNfeDetEspecificoArmamentoVO := TObjectList<TNfeDetEspecificoArmamentoVO>.Create;
end;

destructor TNfeDetalheVO.Destroy;
begin
  FreeAndNil(FProdutoVO);

  FreeAndNil(FNfeDetEspecificoVeiculoVO);
  FreeAndNil(FNfeDetEspecificoCombustivelVO);
  FreeAndNil(FNfeDetalheImpostoIcmsVO);
  FreeAndNil(FNfeDetalheImpostoIpiVO);
  FreeAndNil(FNfeDetalheImpostoIiVO);
  FreeAndNil(FNfeDetalheImpostoPisVO);
  FreeAndNil(FNfeDetalheImpostoCofinsVO);
  FreeAndNil(FNfeDetalheImpostoIssqnVO);

  FreeAndNil(FListaNfeDeclaracaoImportacaoVO);
  FreeAndNil(FListaNfeExportacaoVO);
  FreeAndNil(FListaNfeDetEspecificoMedicamentoVO);
  FreeAndNil(FListaNfeDetEspecificoArmamentoVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TNfeDetalheVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheVO);

end.
