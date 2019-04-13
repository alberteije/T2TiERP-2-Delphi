{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [AIDF_AIMDF] 
                                                                                
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
unit AidfAimdfVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('AIDF_AIMDF')]
  TAidfAimdfVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNUMERO: Integer;
    FDATA_VALIDADE: TDateTime;
    FDATA_AUTORIZACAO: TDateTime;
    FNUMERO_AUTORIZACAO: String;
    FFORMULARIO_DISPONIVEL: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Numero: Integer  read FNUMERO write FNUMERO;
    [TColumn('DATA_VALIDADE', 'Data Validade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    [TColumn('DATA_AUTORIZACAO', 'Data Autorizacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAutorizacao: TDateTime  read FDATA_AUTORIZACAO write FDATA_AUTORIZACAO;
    [TColumn('NUMERO_AUTORIZACAO', 'Numero Autorizacao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroAutorizacao: String  read FNUMERO_AUTORIZACAO write FNUMERO_AUTORIZACAO;
    [TColumn('FORMULARIO_DISPONIVEL', 'Formulario Disponivel', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormularioDisponivel: String  read FFORMULARIO_DISPONIVEL write FFORMULARIO_DISPONIVEL;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TAidfAimdfVO);

finalization
  Classes.UnRegisterClass(TAidfAimdfVO);

end.
