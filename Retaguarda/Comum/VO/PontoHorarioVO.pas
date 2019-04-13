{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_HORARIO] 
                                                                                
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
unit PontoHorarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PONTO_HORARIO')]
  TPontoHorarioVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FTIPO: String;
    FCODIGO: String;
    FNOME: String;
    FTIPO_TRABALHO: String;
    FCARGA_HORARIA: String;
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

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('CODIGO', 'Codigo', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('NOME', 'Nome', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('TIPO_TRABALHO', 'Tipo Trabalho', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoTrabalho: String  read FTIPO_TRABALHO write FTIPO_TRABALHO;
    [TColumn('CARGA_HORARIA', 'Carga Horaria', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaHoraria: String  read FCARGA_HORARIA write FCARGA_HORARIA;
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


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TPontoHorarioVO);

finalization
  Classes.UnRegisterClass(TPontoHorarioVO);

end.
