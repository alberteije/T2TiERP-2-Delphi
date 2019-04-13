{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_OPERADOR] 
                                                                                
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
unit EcfOperadorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, EcfFuncionarioVO;

type
  [TEntity]
  [TTable('ECF_OPERADOR')]
  TEcfOperadorVO = class(TVO)
  private
    FID: Integer;
    FID_ECF_FUNCIONARIO: Integer;
    FLOGIN: String;
    FSENHA: String;

    FEcfFuncionarioVO: TEcfFuncionarioVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_ECF_FUNCIONARIO', 'Id Ecf Funcionario', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfFuncionario: Integer  read FID_ECF_FUNCIONARIO write FID_ECF_FUNCIONARIO;
    [TColumn('LOGIN', 'Login', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Login: String  read FLOGIN write FLOGIN;
    [TColumn('SENHA', 'Senha', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Senha: String  read FSENHA write FSENHA;

    [TAssociation('ID', 'ID_ECF_FUNCIONARIO')]
    property EcfFuncionarioVO: TEcfFuncionarioVO read FEcfFuncionarioVO write FEcfFuncionarioVO;

  end;

implementation

constructor TEcfOperadorVO.Create;
begin
  inherited;
  FEcfFuncionarioVO := TEcfFuncionarioVO.Create;
end;

destructor TEcfOperadorVO.Destroy;
begin
  FreeAndNil(FEcfFuncionarioVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TEcfOperadorVO);

finalization
  Classes.UnRegisterClass(TEcfOperadorVO);

end.
