{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_BANCO_HORAS] 
                                                                                
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
unit PontoBancoHorasVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, PontoBancoHorasUtilizacaoVO;

type
  [TEntity]
  [TTable('PONTO_BANCO_HORAS')]
  TPontoBancoHorasVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_TRABALHO: TDateTime;
    FQUANTIDADE: String;
    FSITUACAO: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;

    FListaPontoBancoHorasUtilizacaoVO: TObjectList<TPontoBancoHorasUtilizacaoVO>;


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

    [TColumn('DATA_TRABALHO', 'Data Trabalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataTrabalho: TDateTime  read FDATA_TRABALHO write FDATA_TRABALHO;
    [TColumn('QUANTIDADE', 'Quantidade', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Quantidade: String  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('SITUACAO', 'Situacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;

    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TManyValuedAssociation('ID_PONTO_BANCO_HORAS', 'ID')]
    property ListaPontoBancoHorasUtilizacaoVO: TObjectList<TPontoBancoHorasUtilizacaoVO> read FListaPontoBancoHorasUtilizacaoVO write FListaPontoBancoHorasUtilizacaoVO;


  end;

implementation

constructor TPontoBancoHorasVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FListaPontoBancoHorasUtilizacaoVO := TObjectList<TPontoBancoHorasUtilizacaoVO>.Create;
end;

destructor TPontoBancoHorasVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FListaPontoBancoHorasUtilizacaoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPontoBancoHorasVO);

finalization
  Classes.UnRegisterClass(TPontoBancoHorasVO);

end.
