{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFSE_DETALHE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit NfseDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFSE_DETALHE')]
  TNfseDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NFSE_LISTA_SERVICO: Integer;
    FID_NFSE_CABECALHO: Integer;
    FVALOR_SERVICOS: Extended;
    FVALOR_DEDUCOES: Extended;
    FVALOR_PIS: Extended;
    FVALOR_COFINS: Extended;
    FVALOR_INSS: Extended;
    FVALOR_IR: Extended;
    FVALOR_CSLL: Extended;
    FCODIGO_CNAE: String;
    FCODIGO_TRIBUTACAO_MUNICIPIO: String;
    FVALOR_BASE_CALCULO: Extended;
    FALIQUOTA: Extended;
    FVALOR_ISS: Extended;
    FVALOR_LIQUIDO: Extended;
    FOUTRAS_RETENCOES: Extended;
    FVALOR_CREDITO: Extended;
    FISS_RETIDO: String;
    FVALOR_ISS_RETIDO: Extended;
    FVALOR_DESCONTO_CONDICIONADO: Extended;
    FVALOR_DESCONTO_INCONDICIONADO: Extended;
    FDISCRIMINACAO: String;
    FMUNICIPIO_PRESTACAO: Integer;

    //Transientes
    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFSE_LISTA_SERVICO', 'Id Nfse Lista Servico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfseListaServico: Integer  read FID_NFSE_LISTA_SERVICO write FID_NFSE_LISTA_SERVICO;
    [TColumn('ID_NFSE_CABECALHO', 'Id Nfse Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfseCabecalho: Integer  read FID_NFSE_CABECALHO write FID_NFSE_CABECALHO;
    [TColumn('VALOR_SERVICOS', 'Valor Servicos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorServicos: Extended  read FVALOR_SERVICOS write FVALOR_SERVICOS;
    [TColumn('VALOR_DEDUCOES', 'Valor Deducoes', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDeducoes: Extended  read FVALOR_DEDUCOES write FVALOR_DEDUCOES;
    [TColumn('VALOR_PIS', 'Valor Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;
    [TColumn('VALOR_COFINS', 'Valor Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    [TColumn('VALOR_INSS', 'Valor Inss', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorInss: Extended  read FVALOR_INSS write FVALOR_INSS;
    [TColumn('VALOR_IR', 'Valor Ir', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIr: Extended  read FVALOR_IR write FVALOR_IR;
    [TColumn('VALOR_CSLL', 'Valor Csll', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCsll: Extended  read FVALOR_CSLL write FVALOR_CSLL;
    [TColumn('CODIGO_CNAE', 'Codigo Cnae', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoCnae: String  read FCODIGO_CNAE write FCODIGO_CNAE;
    [TColumn('CODIGO_TRIBUTACAO_MUNICIPIO', 'Codigo Tributacao Municipio', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoTributacaoMunicipio: String  read FCODIGO_TRIBUTACAO_MUNICIPIO write FCODIGO_TRIBUTACAO_MUNICIPIO;
    [TColumn('VALOR_BASE_CALCULO', 'Valor Base Calculo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculo: Extended  read FVALOR_BASE_CALCULO write FVALOR_BASE_CALCULO;
    [TColumn('ALIQUOTA', 'Aliquota', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Aliquota: Extended  read FALIQUOTA write FALIQUOTA;
    [TColumn('VALOR_ISS', 'Valor Iss', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIss: Extended  read FVALOR_ISS write FVALOR_ISS;
    [TColumn('VALOR_LIQUIDO', 'Valor Liquido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorLiquido: Extended  read FVALOR_LIQUIDO write FVALOR_LIQUIDO;
    [TColumn('OUTRAS_RETENCOES', 'Outras Retencoes', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property OutrasRetencoes: Extended  read FOUTRAS_RETENCOES write FOUTRAS_RETENCOES;
    [TColumn('VALOR_CREDITO', 'Valor Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCredito: Extended  read FVALOR_CREDITO write FVALOR_CREDITO;
    [TColumn('ISS_RETIDO', 'Iss Retido', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property IssRetido: String  read FISS_RETIDO write FISS_RETIDO;
    [TColumn('VALOR_ISS_RETIDO', 'Valor Iss Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIssRetido: Extended  read FVALOR_ISS_RETIDO write FVALOR_ISS_RETIDO;
    [TColumn('VALOR_DESCONTO_CONDICIONADO', 'Valor Desconto Condicionado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDescontoCondicionado: Extended  read FVALOR_DESCONTO_CONDICIONADO write FVALOR_DESCONTO_CONDICIONADO;
    [TColumn('VALOR_DESCONTO_INCONDICIONADO', 'Valor Desconto Incondicionado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDescontoIncondicionado: Extended  read FVALOR_DESCONTO_INCONDICIONADO write FVALOR_DESCONTO_INCONDICIONADO;
    [TColumn('DISCRIMINACAO', 'Discriminacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Discriminacao: String  read FDISCRIMINACAO write FDISCRIMINACAO;
    [TColumn('MUNICIPIO_PRESTACAO', 'Municipio Prestacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioPrestacao: Integer  read FMUNICIPIO_PRESTACAO write FMUNICIPIO_PRESTACAO;


    //Transientes
    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;



  end;

implementation


initialization
  Classes.RegisterClass(TNfseDetalheVO);

finalization
  Classes.UnRegisterClass(TNfseDetalheVO);

end.
