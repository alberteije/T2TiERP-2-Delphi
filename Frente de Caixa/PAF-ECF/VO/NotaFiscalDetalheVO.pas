{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NOTA_FISCAL_DETALHE] 
                                                                                
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
unit NotaFiscalDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, DB, SysUtils,
  EcfProdutoVO;

type
  [TEntity]
  [TTable('NOTA_FISCAL_DETALHE')]
  TNotaFiscalDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NF_CABECALHO: Integer;
    FID_PRODUTO: Integer;
    FCFOP: Integer;
    FITEM: Integer;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_TOTAL: Extended;
    FBASE_ICMS: Extended;
    FTAXA_ICMS: Extended;
    FICMS: Extended;
    FICMS_OUTRAS: Extended;
    FICMS_ISENTO: Extended;
    FTAXA_DESCONTO: Extended;
    FDESCONTO: Extended;
    FTAXA_ISSQN: Extended;
    FISSQN: Extended;
    FTAXA_PIS: Extended;
    FPIS: Extended;
    FTAXA_COFINS: Extended;
    FCOFINS: Extended;
    FTAXA_ACRESCIMO: Extended;
    FACRESCIMO: Extended;
    FTAXA_IPI: Extended;
    FIPI: Extended;
    FCANCELADO: String;
    FCST: String;
    FMOVIMENTA_ESTOQUE: String;
    FECF_ICMS_ST: String;

    FEcfProdutoVO: TEcfProdutoVO;

    FProdutoGtin: String;
    FProdutoDescricaoPdv: String;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NF_CABECALHO', 'Id Nf Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfCabecalho: Integer  read FID_NF_CABECALHO write FID_NF_CABECALHO;
    [TColumn('ID_PRODUTO', 'Id Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;

    [TColumnDisplay('PRODUTO.GTIN', 'Gtin', 150, [ldGrid, ldLookup], ftString, 'EcfProdutoVO.TEcfProdutoVO', True)]
    property ProdutoGtin: String read FProdutoGtin write FProdutoGtin;

    [TColumnDisplay('PRODUTO.DESCRICAO_PDV', 'Descrição PDV', 150, [ldGrid, ldLookup], ftString, 'EcfProdutoVO.TEcfProdutoVO', True)]
    property ProdutoDescricaoPdv: String read FProdutoDescricaoPdv write FProdutoDescricaoPdv;

    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('ITEM', 'Item', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Item: Integer  read FITEM write FITEM;
    [TColumn('QUANTIDADE', 'Quantidade', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('VALOR_UNITARIO', 'Valor Unitario', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    [TColumn('VALOR_TOTAL', 'Valor Total', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('BASE_ICMS', 'Base Icms', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseIcms: Extended  read FBASE_ICMS write FBASE_ICMS;
    [TColumn('TAXA_ICMS', 'Taxa Icms', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaIcms: Extended  read FTAXA_ICMS write FTAXA_ICMS;
    [TColumn('ICMS', 'Icms', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Icms: Extended  read FICMS write FICMS;
    [TColumn('ICMS_OUTRAS', 'Icms Outras', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property IcmsOutras: Extended  read FICMS_OUTRAS write FICMS_OUTRAS;
    [TColumn('ICMS_ISENTO', 'Icms Isento', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property IcmsIsento: Extended  read FICMS_ISENTO write FICMS_ISENTO;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('DESCONTO', 'Desconto', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    [TColumn('TAXA_ISSQN', 'Taxa Issqn', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaIssqn: Extended  read FTAXA_ISSQN write FTAXA_ISSQN;
    [TColumn('ISSQN', 'Issqn', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Issqn: Extended  read FISSQN write FISSQN;
    [TColumn('TAXA_PIS', 'Taxa Pis', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaPis: Extended  read FTAXA_PIS write FTAXA_PIS;
    [TColumn('PIS', 'Pis', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Pis: Extended  read FPIS write FPIS;
    [TColumn('TAXA_COFINS', 'Taxa Cofins', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaCofins: Extended  read FTAXA_COFINS write FTAXA_COFINS;
    [TColumn('COFINS', 'Cofins', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Cofins: Extended  read FCOFINS write FCOFINS;
    [TColumn('TAXA_ACRESCIMO', 'Taxa Acrescimo', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;
    [TColumn('ACRESCIMO', 'Acrescimo', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
    [TColumn('TAXA_IPI', 'Taxa Ipi', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaIpi: Extended  read FTAXA_IPI write FTAXA_IPI;
    [TColumn('IPI', 'Ipi', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Ipi: Extended  read FIPI write FIPI;
    [TColumn('CANCELADO', 'Cancelado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Cancelado: String  read FCANCELADO write FCANCELADO;
    [TColumn('CST', 'Cst', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Cst: String  read FCST write FCST;
    [TColumn('MOVIMENTA_ESTOQUE', 'Movimenta Estoque', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MovimentaEstoque: String  read FMOVIMENTA_ESTOQUE write FMOVIMENTA_ESTOQUE;
    [TColumn('ECF_ICMS_ST', 'Ecf Icms St', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property EcfIcmsSt: String  read FECF_ICMS_ST write FECF_ICMS_ST;

    [TAssociation('ID', 'ID_PRODUTO')]
    property EcfProdutoVO: TEcfProdutoVO read FEcfProdutoVO write FEcfProdutoVO;


  end;

implementation

constructor TNotaFiscalDetalheVO.Create;
begin
  inherited;
  FEcfProdutoVO := TEcfProdutoVO.Create;
end;

destructor TNotaFiscalDetalheVO.Destroy;
begin
  FreeAndNil(FEcfProdutoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNotaFiscalDetalheVO);

finalization
  Classes.UnRegisterClass(TNotaFiscalDetalheVO);

end.
