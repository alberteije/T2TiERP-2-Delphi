{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [AGENDA_COMPROMISSO] 
                                                                                
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
unit AgendaCompromissoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('AGENDA_COMPROMISSO')]
  TAgendaCompromissoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_AGENDA_CATEGORIA_COMPROMISSO: Integer;
    FDATA_COMPROMISSO: TDateTime;
    FHORA: TDateTime;
    FDURACAO: TDateTime;
    FONDE: String;
    FDESCRICAO: String;
    FTIPO: Integer;
    FKEYFIELD: String;

    //Transientes



  public
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumn('ID_AGENDA_CATEGORIA_COMPROMISSO', 'Id Agenda Categoria Compromisso', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdAgendaCategoriaCompromisso: Integer  read FID_AGENDA_CATEGORIA_COMPROMISSO write FID_AGENDA_CATEGORIA_COMPROMISSO;
    [TColumn('DATA_COMPROMISSO', 'Data Compromisso', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCompromisso: TDateTime  read FDATA_COMPROMISSO write FDATA_COMPROMISSO;
    [TColumn('HORA', 'Hora', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Hora: TDateTime  read FHORA write FHORA;
    [TColumn('DURACAO', 'Duracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Duracao: TDateTime  read FDURACAO write FDURACAO;
    [TColumn('ONDE', 'Onde', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Onde: String  read FONDE write FONDE;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('TIPO', 'Tipo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Tipo: Integer  read FTIPO write FTIPO;
    [TColumn('KEYFIELD', 'Chave', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Chave: String  read FKEYFIELD write FKEYFIELD;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TAgendaCompromissoVO);

finalization
  Classes.UnRegisterClass(TAgendaCompromissoVO);

end.
