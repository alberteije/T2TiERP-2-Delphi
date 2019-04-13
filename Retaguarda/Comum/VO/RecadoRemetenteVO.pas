{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [RECADO_REMETENTE] 
                                                                                
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
unit RecadoRemetenteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  RecadoDestinatarioVO;

type
  [TEntity]
  [TTable('RECADO_REMETENTE')]
  TRecadoRemetenteVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_ENVIO: TDateTime;
    FHORA_ENVIO: String;
    FASSUNTO: String;
    FTEXTO: String;

    //Transientes
    FRecadoDestinatarioVO: TRecadoDestinatarioVO;



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
    [TColumn('DATA_ENVIO', 'Data Envio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEnvio: TDateTime  read FDATA_ENVIO write FDATA_ENVIO;
    [TColumn('HORA_ENVIO', 'Hora Envio', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraEnvio: String  read FHORA_ENVIO write FHORA_ENVIO;
    [TColumn('ASSUNTO', 'Assunto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Assunto: String  read FASSUNTO write FASSUNTO;
    [TColumn('TEXTO', 'Texto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Texto: String  read FTEXTO write FTEXTO;


    //Transientes
    [TAssociation('ID_RECADO_REMETENTE', 'ID')]
    property RecadoDestinatarioVO: TRecadoDestinatarioVO read FRecadoDestinatarioVO write FRecadoDestinatarioVO;



  end;

implementation

constructor TRecadoRemetenteVO.Create;
begin
  inherited;

  FRecadoDestinatarioVO := TRecadoDestinatarioVO.Create;
end;

destructor TRecadoRemetenteVO.Destroy;
begin
  FreeAndNil(FRecadoDestinatarioVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TRecadoRemetenteVO);

finalization
  Classes.UnRegisterClass(TRecadoRemetenteVO);

end.
