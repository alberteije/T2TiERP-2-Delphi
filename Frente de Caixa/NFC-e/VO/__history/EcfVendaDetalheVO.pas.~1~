{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_VENDA_DETALHE] 
                                                                                
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
           t2ti.com@gmail.com

@author Albert Eije (t2ti.com@gmail.com)
@version 1.0
*******************************************************************************}
unit EcfVendaDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, EcfProdutoVO;

type
  [TEntity]
  [TTable('ECF_VENDA_DETALHE')]
  TEcfVendaDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_ECF_PRODUTO: Integer;
    FID_ECF_VENDA_CABECALHO: Integer;
    FCFOP: Integer;
    FGTIN: String;
    FCCF: Integer;
    FCOO: Integer;
    FSERIE_ECF: String;
    FITEM: Integer;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_TOTAL: Extended;
    FTOTAL_ITEM: Extended;
    FBASE_ICMS: Extended;
    FTAXA_ICMS: Extended;
    FICMS: Extended;
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
    FACRESCIMO_RATEIO: Extended;
    FDESCONTO_RATEIO: Extended;
    FTOTALIZADOR_PARCIAL: String;
    FCST: String;
    FCANCELADO: String;
    FMOVIMENTA_ESTOQUE: String;
    FECF_ICMS_ST: String;
    FLOGSS: String;

    FEcfProdutoVO: TEcfProdutoVO;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_ECF_PRODUTO', 'Id Ecf Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfProduto: Integer  read FID_ECF_PRODUTO write FID_ECF_PRODUTO;
    [TColumn('ID_ECF_VENDA_CABECALHO', 'Id Ecf Venda Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfVendaCabecalho: Integer  read FID_ECF_VENDA_CABECALHO write FID_ECF_VENDA_CABECALHO;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('CCF', 'Ccf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ccf: Integer  read FCCF write FCCF;
    [TColumn('COO', 'Coo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Coo: Integer  read FCOO write FCOO;
    [TColumn('SERIE_ECF', 'Serie Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property SerieEcf: String  read FSERIE_ECF write FSERIE_ECF;
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
    [TColumn('TOTAL_ITEM', 'Total Item', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalItem: Extended  read FTOTAL_ITEM write FTOTAL_ITEM;
    [TColumn('BASE_ICMS', 'Base Icms', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseIcms: Extended  read FBASE_ICMS write FBASE_ICMS;
    [TColumn('TAXA_ICMS', 'Taxa Icms', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaIcms: Extended  read FTAXA_ICMS write FTAXA_ICMS;
    [TColumn('ICMS', 'Icms', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Icms: Extended  read FICMS write FICMS;
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
    [TColumn('ACRESCIMO_RATEIO', 'Acrescimo Rateio', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AcrescimoRateio: Extended  read FACRESCIMO_RATEIO write FACRESCIMO_RATEIO;
    [TColumn('DESCONTO_RATEIO', 'Desconto Rateio', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoRateio: Extended  read FDESCONTO_RATEIO write FDESCONTO_RATEIO;
    [TColumn('TOTALIZADOR_PARCIAL', 'Totalizador Parcial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property TotalizadorParcial: String  read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    [TColumn('CST', 'Cst', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Cst: String  read FCST write FCST;
    [TColumn('CANCELADO', 'Cancelado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Cancelado: String  read FCANCELADO write FCANCELADO;
    [TColumn('MOVIMENTA_ESTOQUE', 'Movimenta Estoque', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MovimentaEstoque: String  read FMOVIMENTA_ESTOQUE write FMOVIMENTA_ESTOQUE;
    [TColumn('ECF_ICMS_ST', 'Ecf Icms St', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property EcfIcmsSt: String  read FECF_ICMS_ST write FECF_ICMS_ST;
    [TColumn('LOGSS', 'Log', 8, [], False)]
    property HashRegistro: String  read FLOGSS write FLOGSS;

    [TAssociation('ID', 'ID_ECF_PRODUTO')]
    property EcfProdutoVO: TEcfProdutoVO read FEcfProdutoVO write FEcfProdutoVO;
  end;


implementation

constructor TEcfVendaDetalheVO.Create;
begin
  inherited;
  FEcfProdutoVO := TEcfProdutoVO.Create;
end;

destructor TEcfVendaDetalheVO.Destroy;
begin
  FreeAndNil(FEcfProdutoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TEcfVendaDetalheVO);

finalization
  Classes.UnRegisterClass(TEcfVendaDetalheVO);

end.
