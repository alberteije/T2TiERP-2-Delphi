{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PPP_FATOR_RISCO] 
                                                                                
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
unit FolhaPppFatorRiscoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FOLHA_PPP_FATOR_RISCO')]
  TFolhaPppFatorRiscoVO = class(TVO)
  private
    FID: Integer;
    FID_FOLHA_PPP: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FTIPO: String;
    FFATOR_RISCO: String;
    FINTENSIDADE: String;
    FTECNICA_UTILIZADA: String;
    FEPC_EFICAZ: String;
    FEPI_EFICAZ: String;
    FCA_EPI: Integer;
    FATENDIMENTO_NR06_1: String;
    FATENDIMENTO_NR06_2: String;
    FATENDIMENTO_NR06_3: String;
    FATENDIMENTO_NR06_4: String;
    FATENDIMENTO_NR06_5: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_FOLHA_PPP', 'Id Folha Ppp', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFolhaPpp: Integer  read FID_FOLHA_PPP write FID_FOLHA_PPP;
    [TColumn('DATA_INICIO', 'Data Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('DATA_FIM', 'Data Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('FATOR_RISCO', 'Fator Risco', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property FatorRisco: String  read FFATOR_RISCO write FFATOR_RISCO;
    [TColumn('INTENSIDADE', 'Intensidade', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property Intensidade: String  read FINTENSIDADE write FINTENSIDADE;
    [TColumn('TECNICA_UTILIZADA', 'Tecnica Utilizada', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property TecnicaUtilizada: String  read FTECNICA_UTILIZADA write FTECNICA_UTILIZADA;
    [TColumn('EPC_EFICAZ', 'Epc Eficaz', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EpcEficaz: String  read FEPC_EFICAZ write FEPC_EFICAZ;
    [TColumn('EPI_EFICAZ', 'Epi Eficaz', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EpiEficaz: String  read FEPI_EFICAZ write FEPI_EFICAZ;
    [TColumn('CA_EPI', 'Ca Epi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CaEpi: Integer  read FCA_EPI write FCA_EPI;
    [TColumn('ATENDIMENTO_NR06_1', 'Atendimento Nr06 1', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AtendimentoNr061: String  read FATENDIMENTO_NR06_1 write FATENDIMENTO_NR06_1;
    [TColumn('ATENDIMENTO_NR06_2', 'Atendimento Nr06 2', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AtendimentoNr062: String  read FATENDIMENTO_NR06_2 write FATENDIMENTO_NR06_2;
    [TColumn('ATENDIMENTO_NR06_3', 'Atendimento Nr06 3', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AtendimentoNr063: String  read FATENDIMENTO_NR06_3 write FATENDIMENTO_NR06_3;
    [TColumn('ATENDIMENTO_NR06_4', 'Atendimento Nr06 4', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AtendimentoNr064: String  read FATENDIMENTO_NR06_4 write FATENDIMENTO_NR06_4;
    [TColumn('ATENDIMENTO_NR06_5', 'Atendimento Nr06 5', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AtendimentoNr065: String  read FATENDIMENTO_NR06_5 write FATENDIMENTO_NR06_5;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFolhaPppFatorRiscoVO);

finalization
  Classes.UnRegisterClass(TFolhaPppFatorRiscoVO);

end.
