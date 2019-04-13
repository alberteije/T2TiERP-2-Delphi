{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTA_CAIXA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
unit ContaCaixaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, DB, SysUtils,
  AgenciaBancoVO, FinExtratoContaBancoVO;

type
  [TEntity]
  [TTable('CONTA_CAIXA')]
  TContaCaixaVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_AGENCIA_BANCO: Integer;
    FCODIGO: String;
    FDIGITO: String;
    FNOME: String;
    FDESCRICAO: String;
    FTIPO: String;
    FLIMITE_CREDITO: Extended;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    //Transientes
    FAgenciaBancoNome: String;

    FAgenciaBancoVO: TAgenciaBancoVO;

    //Objetos utilizados apenas para persistência - Não serão utilizados nas consultas
    FListaFinExtratoContaBancoVO: TObjectList<TFinExtratoContaBancoVO>;

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

    [TColumn('ID_AGENCIA_BANCO', 'Id Agencia Banco', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdAgenciaBanco: Integer  read FID_AGENCIA_BANCO write FID_AGENCIA_BANCO;
    [TColumnDisplay('AGENCIA_BANCO.NOME', 'Agência Banco', 150, [ldGrid, ldLookup], ftString, 'AgenciaBancoVO.TAgenciaBancoVO', True)]
    property AgenciaBancoNome: String read FAgenciaBancoNome write FAgenciaBancoNome;

    [TColumn('CODIGO', 'Codigo', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('DIGITO', 'Digito', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Digito: String  read FDIGITO write FDIGITO;
    [TColumn('NOME', 'Nome', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('LIMITE_CREDITO', 'Limite Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property LimiteCredito: Extended  read FLIMITE_CREDITO write FLIMITE_CREDITO;
    [TColumn('CLASSIFICACAO_CONTABIL_CONTA', 'Classificacao Contabil Conta', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;

    //Transientes
    [TAssociation('ID', 'ID_AGENCIA_BANCO')]
    property AgenciaBancoVO: TAgenciaBancoVO read FAgenciaBancoVO write FAgenciaBancoVO;


    //Objetos utilizados apenas para persistência - Não serão utilizados nas consultas
    property ListaFinExtratoContaBancoVO: TObjectList<TFinExtratoContaBancoVO> read FListaFinExtratoContaBancoVO write FListaFinExtratoContaBancoVO;

  end;

implementation

constructor TContaCaixaVO.Create;
begin
  inherited;

  FAgenciaBancoVO := TAgenciaBancoVO.Create;
end;

destructor TContaCaixaVO.Destroy;
begin
  FreeAndNil(FAgenciaBancoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TContaCaixaVO);

finalization
  Classes.UnRegisterClass(TContaCaixaVO);

end.
