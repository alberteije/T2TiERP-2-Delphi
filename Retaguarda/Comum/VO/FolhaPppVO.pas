{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PPP] 
                                                                                
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
unit FolhaPppVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, FolhaPppCatVO, FolhaPppAtividadeVO, FolhaPppFatorRiscoVO,
  FolhaPppExameMedicoVO;

type
  [TEntity]
  [TTable('FOLHA_PPP')]
  TFolhaPppVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FOBSERVACAO: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;

    FListaFolhaPppCatVO: TObjectList<TFolhaPppCatVO>;
    FListaFolhaPppAtividadeVO: TObjectList<TFolhaPppAtividadeVO>;
    FListaFolhaPppFatorRiscoVO: TObjectList<TFolhaPppFatorRiscoVO>;
    FListaFolhaPppExameMedicoVO: TObjectList<TFolhaPppExameMedicoVO>;

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
    [TColumnDisplay('COLABORADOR.NOME', 'Colaborador', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TManyValuedAssociation('ID_FOLHA_PPP', 'ID')]
    property ListaFolhaPppCatVO: TObjectList<TFolhaPppCatVO> read FListaFolhaPppCatVO write FListaFolhaPppCatVO;
    [TManyValuedAssociation('ID_FOLHA_PPP', 'ID')]
    property ListaFolhaPppAtividadeVO: TObjectList<TFolhaPppAtividadeVO> read FListaFolhaPppAtividadeVO write FListaFolhaPppAtividadeVO;
    [TManyValuedAssociation('ID_FOLHA_PPP', 'ID')]
    property ListaFolhaPppFatorRiscoVO: TObjectList<TFolhaPppFatorRiscoVO> read FListaFolhaPppFatorRiscoVO write FListaFolhaPppFatorRiscoVO;
    [TManyValuedAssociation('ID_FOLHA_PPP', 'ID')]
    property ListaFolhaPppExameMedicoVO: TObjectList<TFolhaPppExameMedicoVO> read FListaFolhaPppExameMedicoVO write FListaFolhaPppExameMedicoVO;


  end;

implementation

constructor TFolhaPppVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;

  FListaFolhaPppCatVO := TObjectList<TFolhaPppCatVO>.Create;
  FListaFolhaPppAtividadeVO := TObjectList<TFolhaPppAtividadeVO>.Create;
  FListaFolhaPppFatorRiscoVO := TObjectList<TFolhaPppFatorRiscoVO>.Create;
  FListaFolhaPppExameMedicoVO := TObjectList<TFolhaPppExameMedicoVO>.Create;
end;

destructor TFolhaPppVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  FreeAndNil(FListaFolhaPppCatVO);
  FreeAndNil(FListaFolhaPppAtividadeVO);
  FreeAndNil(FListaFolhaPppFatorRiscoVO);
  FreeAndNil(FListaFolhaPppExameMedicoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaPppVO);

finalization
  Classes.UnRegisterClass(TFolhaPppVO);

end.
