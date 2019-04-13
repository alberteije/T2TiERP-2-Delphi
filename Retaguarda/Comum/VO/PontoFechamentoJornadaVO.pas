{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
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
unit PontoFechamentoJornadaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PONTO_FECHAMENTO_JORNADA')]
  TPontoFechamentoJornadaVO = class(TVO)
  private
    FID: Integer;
    FID_PONTO_CLASSIFICACAO_JORNADA: Integer;
    FID_COLABORADOR: Integer;
    FDATA_FECHAMENTO: TDateTime;
    FDIA_SEMANA: String;
    FCODIGO_HORARIO: String;
    FCARGA_HORARIA_ESPERADA: String;
    FCARGA_HORARIA_DIURNA: String;
    FCARGA_HORARIA_NOTURNA: String;
    FCARGA_HORARIA_TOTAL: String;
    FENTRADA01: String;
    FSAIDA01: String;
    FENTRADA02: String;
    FSAIDA02: String;
    FENTRADA03: String;
    FSAIDA03: String;
    FENTRADA04: String;
    FSAIDA04: String;
    FENTRADA05: String;
    FSAIDA05: String;
    FHORA_INICIO_JORNADA: String;
    FHORA_FIM_JORNADA: String;
    FHORA_EXTRA01: String;
    FPERCENTUAL_HORA_EXTRA01: Extended;
    FMODALIDADE_HORA_EXTRA01: String;
    FHORA_EXTRA02: String;
    FPERCENTUAL_HORA_EXTRA02: Extended;
    FMODALIDADE_HORA_EXTRA02: String;
    FHORA_EXTRA03: String;
    FPERCENTUAL_HORA_EXTRA03: Extended;
    FMODALIDADE_HORA_EXTRA03: String;
    FHORA_EXTRA04: String;
    FPERCENTUAL_HORA_EXTRA04: Extended;
    FMODALIDADE_HORA_EXTRA04: String;
    FFALTA_ATRASO: String;
    FCOMPENSAR: String;
    FBANCO_HORAS: String;
    FOBSERVACAO: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PONTO_CLASSIFICACAO_JORNADA', 'Id Ponto Classificacao Jornada', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPontoClassificacaoJornada: Integer  read FID_PONTO_CLASSIFICACAO_JORNADA write FID_PONTO_CLASSIFICACAO_JORNADA;
    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumn('DATA_FECHAMENTO', 'Data Fechamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFechamento: TDateTime  read FDATA_FECHAMENTO write FDATA_FECHAMENTO;
    [TColumn('DIA_SEMANA', 'Dia Semana', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property DiaSemana: String  read FDIA_SEMANA write FDIA_SEMANA;
    [TColumn('CODIGO_HORARIO', 'Codigo Horario', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorario: String  read FCODIGO_HORARIO write FCODIGO_HORARIO;
    [TColumn('CARGA_HORARIA_ESPERADA', 'Carga Horaria Esperada', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaHorariaEsperada: String  read FCARGA_HORARIA_ESPERADA write FCARGA_HORARIA_ESPERADA;
    [TColumn('CARGA_HORARIA_DIURNA', 'Carga Horaria Diurna', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaHorariaDiurna: String  read FCARGA_HORARIA_DIURNA write FCARGA_HORARIA_DIURNA;
    [TColumn('CARGA_HORARIA_NOTURNA', 'Carga Horaria Noturna', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaHorariaNoturna: String  read FCARGA_HORARIA_NOTURNA write FCARGA_HORARIA_NOTURNA;
    [TColumn('CARGA_HORARIA_TOTAL', 'Carga Horaria Total', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaHorariaTotal: String  read FCARGA_HORARIA_TOTAL write FCARGA_HORARIA_TOTAL;
    [TColumn('ENTRADA01', 'Entrada01', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Entrada01: String  read FENTRADA01 write FENTRADA01;
    [TColumn('SAIDA01', 'Saida01', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Saida01: String  read FSAIDA01 write FSAIDA01;
    [TColumn('ENTRADA02', 'Entrada02', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Entrada02: String  read FENTRADA02 write FENTRADA02;
    [TColumn('SAIDA02', 'Saida02', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Saida02: String  read FSAIDA02 write FSAIDA02;
    [TColumn('ENTRADA03', 'Entrada03', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Entrada03: String  read FENTRADA03 write FENTRADA03;
    [TColumn('SAIDA03', 'Saida03', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Saida03: String  read FSAIDA03 write FSAIDA03;
    [TColumn('ENTRADA04', 'Entrada04', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Entrada04: String  read FENTRADA04 write FENTRADA04;
    [TColumn('SAIDA04', 'Saida04', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Saida04: String  read FSAIDA04 write FSAIDA04;
    [TColumn('ENTRADA05', 'Entrada05', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Entrada05: String  read FENTRADA05 write FENTRADA05;
    [TColumn('SAIDA05', 'Saida05', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Saida05: String  read FSAIDA05 write FSAIDA05;
    [TColumn('HORA_INICIO_JORNADA', 'Hora Inicio Jornada', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraInicioJornada: String  read FHORA_INICIO_JORNADA write FHORA_INICIO_JORNADA;
    [TColumn('HORA_FIM_JORNADA', 'Hora Fim Jornada', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraFimJornada: String  read FHORA_FIM_JORNADA write FHORA_FIM_JORNADA;
    [TColumn('HORA_EXTRA01', 'Hora Extra01', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraExtra01: String  read FHORA_EXTRA01 write FHORA_EXTRA01;
    [TColumn('PERCENTUAL_HORA_EXTRA01', 'Percentual Hora Extra01', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualHoraExtra01: Extended  read FPERCENTUAL_HORA_EXTRA01 write FPERCENTUAL_HORA_EXTRA01;
    [TColumn('MODALIDADE_HORA_EXTRA01', 'Modalidade Hora Extra01', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ModalidadeHoraExtra01: String  read FMODALIDADE_HORA_EXTRA01 write FMODALIDADE_HORA_EXTRA01;
    [TColumn('HORA_EXTRA02', 'Hora Extra02', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraExtra02: String  read FHORA_EXTRA02 write FHORA_EXTRA02;
    [TColumn('PERCENTUAL_HORA_EXTRA02', 'Percentual Hora Extra02', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualHoraExtra02: Extended  read FPERCENTUAL_HORA_EXTRA02 write FPERCENTUAL_HORA_EXTRA02;
    [TColumn('MODALIDADE_HORA_EXTRA02', 'Modalidade Hora Extra02', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ModalidadeHoraExtra02: String  read FMODALIDADE_HORA_EXTRA02 write FMODALIDADE_HORA_EXTRA02;
    [TColumn('HORA_EXTRA03', 'Hora Extra03', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraExtra03: String  read FHORA_EXTRA03 write FHORA_EXTRA03;
    [TColumn('PERCENTUAL_HORA_EXTRA03', 'Percentual Hora Extra03', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualHoraExtra03: Extended  read FPERCENTUAL_HORA_EXTRA03 write FPERCENTUAL_HORA_EXTRA03;
    [TColumn('MODALIDADE_HORA_EXTRA03', 'Modalidade Hora Extra03', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ModalidadeHoraExtra03: String  read FMODALIDADE_HORA_EXTRA03 write FMODALIDADE_HORA_EXTRA03;
    [TColumn('HORA_EXTRA04', 'Hora Extra04', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraExtra04: String  read FHORA_EXTRA04 write FHORA_EXTRA04;
    [TColumn('PERCENTUAL_HORA_EXTRA04', 'Percentual Hora Extra04', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualHoraExtra04: Extended  read FPERCENTUAL_HORA_EXTRA04 write FPERCENTUAL_HORA_EXTRA04;
    [TColumn('MODALIDADE_HORA_EXTRA04', 'Modalidade Hora Extra04', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ModalidadeHoraExtra04: String  read FMODALIDADE_HORA_EXTRA04 write FMODALIDADE_HORA_EXTRA04;
    [TColumn('FALTA_ATRASO', 'Falta Atraso', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property FaltaAtraso: String  read FFALTA_ATRASO write FFALTA_ATRASO;
    [TColumn('COMPENSAR', 'Compensar', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Compensar: String  read FCOMPENSAR write FCOMPENSAR;
    [TColumn('BANCO_HORAS', 'Banco Horas', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property BancoHoras: String  read FBANCO_HORAS write FBANCO_HORAS;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TPontoFechamentoJornadaVO);

finalization
  Classes.UnRegisterClass(TPontoFechamentoJornadaVO);

end.
