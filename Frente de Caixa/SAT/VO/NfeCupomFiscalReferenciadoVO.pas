{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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
unit NfeCupomFiscalReferenciadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CUPOM_FISCAL_REFERENCIADO')]
  TNfeCupomFiscalReferenciadoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FMODELO_DOCUMENTO_FISCAL: String;
    FNUMERO_ORDEM_ECF: Integer;
    FCOO: Integer;
    FDATA_EMISSAO_CUPOM: TDateTime;
    FNUMERO_CAIXA: Integer;
    FNUMERO_SERIE_ECF: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('MODELO_DOCUMENTO_FISCAL', 'Modelo Documento Fiscal', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    [TColumn('NUMERO_ORDEM_ECF', 'Numero Ordem Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroOrdemEcf: Integer  read FNUMERO_ORDEM_ECF write FNUMERO_ORDEM_ECF;
    [TColumn('COO', 'Coo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Coo: Integer  read FCOO write FCOO;
    [TColumn('DATA_EMISSAO_CUPOM', 'Data Emissao Cupom', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissaoCupom: TDateTime  read FDATA_EMISSAO_CUPOM write FDATA_EMISSAO_CUPOM;
    [TColumn('NUMERO_CAIXA', 'Numero Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroCaixa: Integer  read FNUMERO_CAIXA write FNUMERO_CAIXA;
    [TColumn('NUMERO_SERIE_ECF', 'Numero Serie Ecf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSerieEcf: String  read FNUMERO_SERIE_ECF write FNUMERO_SERIE_ECF;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeCupomFiscalReferenciadoVO);

finalization
  Classes.UnRegisterClass(TNfeCupomFiscalReferenciadoVO);

end.
