{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [EMPRESA_CNAE] 
                                                                                
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
unit EmpresaCnaeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('EMPRESA_CNAE')]
  TEmpresaCnaeVO = class(TVO)
  private
    FID: Integer;
    FID_CNAE: Integer;
    FID_EMPRESA: Integer;
    FPRINCIPAL: String;
    FRAMO_ATIVIDADE: String;
    FOBJETO_SOCIAL: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CNAE', 'Id Cnae', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCnae: Integer  read FID_CNAE write FID_CNAE;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('PRINCIPAL', 'Principal', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Principal: String  read FPRINCIPAL write FPRINCIPAL;
    [TColumn('RAMO_ATIVIDADE', 'Ramo Atividade', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property RamoAtividade: String  read FRAMO_ATIVIDADE write FRAMO_ATIVIDADE;
    [TColumn('OBJETO_SOCIAL', 'Objeto Social', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ObjetoSocial: String  read FOBJETO_SOCIAL write FOBJETO_SOCIAL;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TEmpresaCnaeVO);

finalization
  Classes.UnRegisterClass(TEmpresaCnaeVO);

end.
