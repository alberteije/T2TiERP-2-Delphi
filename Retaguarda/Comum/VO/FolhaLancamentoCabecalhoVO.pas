{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_LANCAMENTO_CABECALHO] 
                                                                                
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
unit FolhaLancamentoCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, FolhaLancamentoDetalheVO;

type
  [TEntity]
  [TTable('FOLHA_LANCAMENTO_CABECALHO')]
  TFolhaLancamentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FCOMPETENCIA: String;
    FTIPO: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;

    FListaFolhaLancamentoDetalheVO: TObjectList<TFolhaLancamentoDetalheVO>;


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
    [TColumnDisplay('COLABORADOR.NOME', 'Requisitante', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('COMPETENCIA', 'Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;


    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TManyValuedAssociation('ID_FOLHA_LANCAMENTO_CABECALHO' ,'ID')]
    property ListaFolhaLancamentoDetalheVO: TObjectList<TFolhaLancamentoDetalheVO> read FListaFolhaLancamentoDetalheVO write FListaFolhaLancamentoDetalheVO;


  end;

implementation

constructor TFolhaLancamentoCabecalhoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;

  ListaFolhaLancamentoDetalheVO := TObjectList<TFolhaLancamentoDetalheVO>.Create;
end;

destructor TFolhaLancamentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  FreeAndNil(FListaFolhaLancamentoDetalheVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaLancamentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TFolhaLancamentoCabecalhoVO);

end.
