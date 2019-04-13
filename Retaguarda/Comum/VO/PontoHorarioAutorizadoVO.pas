{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_HORARIO_AUTORIZADO] 
                                                                                
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
unit PontoHorarioAutorizadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO;

type
  [TEntity]
  [TTable('PONTO_HORARIO_AUTORIZADO')]
  TPontoHorarioAutorizadoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_HORARIO: TDateTime;
    FTIPO: String;
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
    FHORA_FECHAMENTO_DIA: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumnDisplay('COLABORADOR.NOME', 'Requisitante', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('DATA_HORARIO', 'Data Horario', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataHorario: TDateTime  read FDATA_HORARIO write FDATA_HORARIO;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
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
    [TColumn('HORA_FECHAMENTO_DIA', 'Hora Fechamento Dia', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraFechamentoDia: String  read FHORA_FECHAMENTO_DIA write FHORA_FECHAMENTO_DIA;

    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;



  end;

implementation

constructor TPontoHorarioAutorizadoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
end;

destructor TPontoHorarioAutorizadoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPontoHorarioAutorizadoVO);

finalization
  Classes.UnRegisterClass(TPontoHorarioAutorizadoVO);

end.
