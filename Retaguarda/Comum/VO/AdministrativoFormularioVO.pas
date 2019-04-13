{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO transiente para tratar a lista de formulários e funções
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0                                                                    
*******************************************************************************}
unit AdministrativoformularioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, FuncaoVO;

type
  TAdministrativoFormularioVO = class(TVO)
  private
    FMODULO: String;
    FDESCRICAO: String;
    FNOME_FORMULARIO: String;

    FListaFuncaoVO: TObjectList<TFuncaoVO>;

  public
    constructor Create; overload; override;
    destructor Destroy; override;

    property Modulo: String  read FMODULO write FMODULO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property NomeFormulario: String  read FNOME_FORMULARIO write FNOME_FORMULARIO;

    property ListaFuncaoVO: TObjectList<TFuncaoVO> read FListaFuncaoVO write FListaFuncaoVO;
  end;

implementation

constructor TAdministrativoFormularioVO.Create;
begin
  inherited;
  FListaFuncaoVO := TObjectList<TFuncaoVO>.Create;
end;

destructor TAdministrativoFormularioVO.Destroy;
begin
  FreeAndNil(FListaFuncaoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TAdministrativoFormularioVO);

finalization
  Classes.UnRegisterClass(TAdministrativoFormularioVO);

end.
