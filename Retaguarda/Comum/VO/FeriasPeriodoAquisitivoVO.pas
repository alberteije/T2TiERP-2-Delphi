{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FERIAS_PERIODO_AQUISITIVO] 
                                                                                
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
unit FeriasPeriodoAquisitivoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FERIAS_PERIODO_AQUISITIVO')]
  TFeriasPeriodoAquisitivoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FSITUACAO: String;
    FLIMITE_PARA_GOZO: TDateTime;
    FDESCONTAR_FALTAS: String;
    FDESCONSIDERAR_AFASTAMENTO: String;
    FAFASTAMENTO_PREVIDENCIA: Integer;
    FAFASTAMENTO_SEM_REMUN: Integer;
    FAFASTAMENTO_COM_REMUN: Integer;
    FDIAS_DIREITO: Integer;
    FDIAS_GOZADOS: Integer;
    FDIAS_FALTAS: Integer;
    FDIAS_RESTANTES: Integer;

    //Transientes


    /// EXERCICIO
    ///  Inclua o nome do colaborador


  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumn('DATA_INICIO', 'Data Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('DATA_FIM', 'Data Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    [TColumn('SITUACAO', 'Situacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;
    [TColumn('LIMITE_PARA_GOZO', 'Limite Para Gozo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property LimiteParaGozo: TDateTime  read FLIMITE_PARA_GOZO write FLIMITE_PARA_GOZO;
    [TColumn('DESCONTAR_FALTAS', 'Descontar Faltas', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property DescontarFaltas: String  read FDESCONTAR_FALTAS write FDESCONTAR_FALTAS;
    [TColumn('DESCONSIDERAR_AFASTAMENTO', 'Desconsiderar Afastamento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property DesconsiderarAfastamento: String  read FDESCONSIDERAR_AFASTAMENTO write FDESCONSIDERAR_AFASTAMENTO;
    [TColumn('AFASTAMENTO_PREVIDENCIA', 'Afastamento Previdencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property AfastamentoPrevidencia: Integer  read FAFASTAMENTO_PREVIDENCIA write FAFASTAMENTO_PREVIDENCIA;
    [TColumn('AFASTAMENTO_SEM_REMUN', 'Afastamento Sem Remun', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property AfastamentoSemRemun: Integer  read FAFASTAMENTO_SEM_REMUN write FAFASTAMENTO_SEM_REMUN;
    [TColumn('AFASTAMENTO_COM_REMUN', 'Afastamento Com Remun', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property AfastamentoComRemun: Integer  read FAFASTAMENTO_COM_REMUN write FAFASTAMENTO_COM_REMUN;
    [TColumn('DIAS_DIREITO', 'Dias Direito', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasDireito: Integer  read FDIAS_DIREITO write FDIAS_DIREITO;
    [TColumn('DIAS_GOZADOS', 'Dias Gozados', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasGozados: Integer  read FDIAS_GOZADOS write FDIAS_GOZADOS;
    [TColumn('DIAS_FALTAS', 'Dias Faltas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasFaltas: Integer  read FDIAS_FALTAS write FDIAS_FALTAS;
    [TColumn('DIAS_RESTANTES', 'Dias Restantes', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasRestantes: Integer  read FDIAS_RESTANTES write FDIAS_RESTANTES;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFeriasPeriodoAquisitivoVO);

finalization
  Classes.UnRegisterClass(TFeriasPeriodoAquisitivoVO);

end.
