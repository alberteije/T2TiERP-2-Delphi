{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [OS_EVOLUCAO] 
                                                                                
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
unit OsEvolucaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('OS_EVOLUCAO')]
  TOsEvolucaoVO = class(TVO)
  private
    FID: Integer;
    FID_OS_ABERTURA: Integer;
    FDATA_REGISTRO: TDateTime;
    FHORA_REGISTRO: String;
    FOBSERVACAO: String;
    FENVIAR_EMAIL: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_OS_ABERTURA', 'Os Abertura Id', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOsAbertura: Integer  read FID_OS_ABERTURA write FID_OS_ABERTURA;
    [TColumn('DATA_REGISTRO', 'Data Registro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataRegistro: TDateTime  read FDATA_REGISTRO write FDATA_REGISTRO;
    [TColumn('HORA_REGISTRO', 'Hora Registro', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraRegistro: String  read FHORA_REGISTRO write FHORA_REGISTRO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('ENVIAR_EMAIL', 'Enviar Email', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EnviarEmail: String  read FENVIAR_EMAIL write FENVIAR_EMAIL;


    //Transientes
    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;



  end;

implementation


initialization
  Classes.RegisterClass(TOsEvolucaoVO);

finalization
  Classes.UnRegisterClass(TOsEvolucaoVO);

end.
