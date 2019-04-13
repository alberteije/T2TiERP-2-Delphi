{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_AEREO] 
                                                                                
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
unit CteAereoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_AEREO')]
  TCteAereoVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FNUMERO_MINUTA: Integer;
    FNUMERO_CONHECIMENTO: Integer;
    FDATA_PREVISTA_ENTREGA: TDateTime;
    FID_EMISSOR: String;
    FID_INTERNA_TOMADOR: String;
    FTARIFA_CLASSE: String;
    FTARIFA_CODIGO: String;
    FTARIFA_VALOR: Extended;
    FCARGA_DIMENSAO: String;
    FCARGA_INFORMACAO_MANUSEIO: Integer;
    FCARGA_ESPECIAL: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_CABECALHO', 'Id Cte Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    [TColumn('NUMERO_MINUTA', 'Numero Minuta', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroMinuta: Integer  read FNUMERO_MINUTA write FNUMERO_MINUTA;
    [TColumn('NUMERO_CONHECIMENTO', 'Numero Conhecimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroConhecimento: Integer  read FNUMERO_CONHECIMENTO write FNUMERO_CONHECIMENTO;
    [TColumn('DATA_PREVISTA_ENTREGA', 'Data Prevista Entrega', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrevistaEntrega: TDateTime  read FDATA_PREVISTA_ENTREGA write FDATA_PREVISTA_ENTREGA;
    [TColumn('ID_EMISSOR', 'Id Emissor', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property IdEmissor: String  read FID_EMISSOR write FID_EMISSOR;
    [TColumn('ID_INTERNA_TOMADOR', 'Id Interna Tomador', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property IdInternaTomador: String  read FID_INTERNA_TOMADOR write FID_INTERNA_TOMADOR;
    [TColumn('TARIFA_CLASSE', 'Tarifa Classe', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TarifaClasse: String  read FTARIFA_CLASSE write FTARIFA_CLASSE;
    [TColumn('TARIFA_CODIGO', 'Tarifa Codigo', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property TarifaCodigo: String  read FTARIFA_CODIGO write FTARIFA_CODIGO;
    [TColumn('TARIFA_VALOR', 'Tarifa Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TarifaValor: Extended  read FTARIFA_VALOR write FTARIFA_VALOR;
    [TColumn('CARGA_DIMENSAO', 'Carga Dimensao', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaDimensao: String  read FCARGA_DIMENSAO write FCARGA_DIMENSAO;
    [TColumn('CARGA_INFORMACAO_MANUSEIO', 'Carga Informacao Manuseio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CargaInformacaoManuseio: Integer  read FCARGA_INFORMACAO_MANUSEIO write FCARGA_INFORMACAO_MANUSEIO;
    [TColumn('CARGA_ESPECIAL', 'Carga Especial', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaEspecial: String  read FCARGA_ESPECIAL write FCARGA_ESPECIAL;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteAereoVO);

finalization
  Classes.UnRegisterClass(TCteAereoVO);

end.
