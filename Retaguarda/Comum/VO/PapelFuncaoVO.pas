{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: VO relacionado à tabela [PAPEL_FUNCAO]
                                                                                
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
           t2ti.com@gmail.com</p>                                               
                                                                                
@author Albert Eije (T2Ti.COM)                                                  
@version 1.0                                                                    
*******************************************************************************}
unit PapelFuncaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, PapelVO;

type
  [TEntity]
  [TTable('PAPEL_FUNCAO')]
  TPapelFuncaoVO = class(TVO)
  private
    FID: Integer;
    FID_PAPEL: Integer;
    FID_FUNCAO: Integer;
    FHABILITADO: String;
    FFuncao: String;
    FFormulario: String;
    FNodeAlterado: Boolean;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PAPEL', 'Id Papel', 80, [], False)]
    property IdPapel: Integer  read FID_PAPEL write FID_PAPEL;
    [TColumn('ID_FUNCAO', 'Id Função', 80, [], False)]
    property IdFuncao: Integer  read FID_FUNCAO write FID_FUNCAO;
    [TColumn('HABILITADO', 'Habilitado', 80, [], False)]
    property Habilitado: String  read FHABILITADO write FHABILITADO;

    [TColumn('FUNCAO','Função',[],True)]
    property Funcao: String read FFuncao write FFuncao;
    [TColumn('FORMULARIO','Formulário',[],True)]
    property Formulario: String read FFormulario write FFormulario;
    [TColumn('NODE_ALTERADO','Node Alterado',[],True)]
    property NodeAlterado: Boolean read FNodeAlterado write FNodeAlterado;
  end;

implementation

initialization
  Classes.RegisterClass(TPapelFuncaoVO);

finalization
  Classes.UnRegisterClass(TPapelFuncaoVO);

end.
