{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [TRIBUT_OPERACAO_FISCAL] 
                                                                                
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
unit TributOperacaoFiscalVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB, CfopVO;

type
  [TEntity]
  [TTable('TRIBUT_OPERACAO_FISCAL')]
  TTributOperacaoFiscalVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDESCRICAO: String;
    FDESCRICAO_NA_NF: String;
    FCFOP: Integer;
    FOBSERVACAO: String;

    FCfopDescricao: String;

    FCfopVO: TCfopVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldCombobox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA','Id Empresa',80,[], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('DESCRICAO_NA_NF','Descricao Na Nf',450,[ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoNaNf: String  read FDESCRICAO_NA_NF write FDESCRICAO_NA_NF;

    [TColumn('CFOP','Cfop',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;

    [TColumnDisplay('CFOP.DESCRICAO', 'Descrição CFOP', 200, [ldGrid, ldLookup], ftString, 'CfopVO.TCfopVO', True)]
    property CfopDescricao: String read FCfopDescricao write FCfopDescricao;

    [TColumn('OBSERVACAO','Observacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;

    [TAssociation('CFOP', 'CFOP')]
    property CfopVO: TCfopVO read FCfopVO write FCfopVO;
  end;

implementation

constructor TTributOperacaoFiscalVO.Create;
begin
  inherited;
  FCfopVO := TCfopVO.Create;
end;

destructor TTributOperacaoFiscalVO.Destroy;
begin
  FreeAndNil(FCfopVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TTributOperacaoFiscalVO);

finalization
  Classes.UnRegisterClass(TTributOperacaoFiscalVO);

end.
