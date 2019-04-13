{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_PARAMETRO] 
                                                                                
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
unit PontoParametroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PONTO_PARAMETRO')]
  TPontoParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FMES_ANO: String;
    FDIA_INICIAL_APURACAO: Integer;
    FHORA_NOTURNA_INICIO: String;
    FHORA_NOTURNA_FIM: String;
    FPERIODO_MINIMO_INTERJORNADA: String;
    FPERCENTUAL_HE_DIURNA: Extended;
    FPERCENTUAL_HE_NOTURNA: Extended;
    FDURACAO_HORA_NOTURNA: String;
    FTRATAMENTO_HORA_MAIS: String;
    FTRATAMENTO_HORA_MENOS: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('MES_ANO', 'Mes Ano', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property MesAno: String  read FMES_ANO write FMES_ANO;
    [TColumn('DIA_INICIAL_APURACAO', 'Dia Inicial Apuracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiaInicialApuracao: Integer  read FDIA_INICIAL_APURACAO write FDIA_INICIAL_APURACAO;
    [TColumn('HORA_NOTURNA_INICIO', 'Hora Noturna Inicio', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraNoturnaInicio: String  read FHORA_NOTURNA_INICIO write FHORA_NOTURNA_INICIO;
    [TColumn('HORA_NOTURNA_FIM', 'Hora Noturna Fim', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraNoturnaFim: String  read FHORA_NOTURNA_FIM write FHORA_NOTURNA_FIM;
    [TColumn('PERIODO_MINIMO_INTERJORNADA', 'Periodo Minimo Interjornada', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property PeriodoMinimoInterjornada: String  read FPERIODO_MINIMO_INTERJORNADA write FPERIODO_MINIMO_INTERJORNADA;
    [TColumn('PERCENTUAL_HE_DIURNA', 'Percentual He Diurna', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualHeDiurna: Extended  read FPERCENTUAL_HE_DIURNA write FPERCENTUAL_HE_DIURNA;
    [TColumn('PERCENTUAL_HE_NOTURNA', 'Percentual He Noturna', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualHeNoturna: Extended  read FPERCENTUAL_HE_NOTURNA write FPERCENTUAL_HE_NOTURNA;
    [TColumn('DURACAO_HORA_NOTURNA', 'Duracao Hora Noturna', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property DuracaoHoraNoturna: String  read FDURACAO_HORA_NOTURNA write FDURACAO_HORA_NOTURNA;
    [TColumn('TRATAMENTO_HORA_MAIS', 'Tratamento Hora Mais', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TratamentoHoraMais: String  read FTRATAMENTO_HORA_MAIS write FTRATAMENTO_HORA_MAIS;
    [TColumn('TRATAMENTO_HORA_MENOS', 'Tratamento Hora Menos', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TratamentoHoraMenos: String  read FTRATAMENTO_HORA_MENOS write FTRATAMENTO_HORA_MENOS;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TPontoParametroVO);

finalization
  Classes.UnRegisterClass(TPontoParametroVO);

end.
