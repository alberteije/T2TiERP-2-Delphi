{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_LIVRO] 
                                                                                
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
unit ContabilLivroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  ContabilTermoVO;

type
  [TEntity]
  [TTable('CONTABIL_LIVRO')]
  TContabilLivroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDESCRICAO: String;
    FCOMPETENCIA: String;
    FFORMA_ESCRITURACAO: String;

    //Transientes
    FListaContabilTermoVO: TObjectList<TContabilTermoVO>;


  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('DESCRICAO', 'Descricao', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('COMPETENCIA', 'Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    [TColumn('FORMA_ESCRITURACAO', 'Forma Escrituracao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaEscrituracao: String  read FFORMA_ESCRITURACAO write FFORMA_ESCRITURACAO;


    //Transientes
    [TManyValuedAssociation('ID_CONTABIL_LIVRO', 'ID')]
    property ListaContabilTermoVO: TObjectList<TContabilTermoVO> read FListaContabilTermoVO write FListaContabilTermoVO;



  end;

implementation

constructor TContabilLivroVO.Create;
begin
  inherited;

  FListaContabilTermoVO := TObjectList<TContabilTermoVO>.Create;
end;

destructor TContabilLivroVO.Destroy;
begin
  FreeAndNil(FListaContabilTermoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContabilLivroVO);

finalization
  Classes.UnRegisterClass(TContabilLivroVO);

end.
