{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_ABONO] 
                                                                                
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
unit PontoAbonoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  PontoAbonoUtilizacaoVO, ViewPessoaColaboradorVO;

type
  [TEntity]
  [TTable('PONTO_ABONO')]
  TPontoAbonoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FQUANTIDADE: Integer;
    FUTILIZADO: Integer;
    FSALDO: Integer;
    FDATA_CADASTRO: TDateTime;
    FINICIO_UTILIZACAO: TDateTime;
    FOBSERVACAO: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;

    FListaPontoAbonoUtilizacaoVO: TObjectList<TPontoAbonoUtilizacaoVO>;

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

    [TColumn('QUANTIDADE', 'Quantidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('UTILIZADO', 'Utilizado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Utilizado: Integer  read FUTILIZADO write FUTILIZADO;
    [TColumn('SALDO', 'Saldo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Saldo: Integer  read FSALDO write FSALDO;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('INICIO_UTILIZACAO', 'Inicio Utilizacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property InicioUtilizacao: TDateTime  read FINICIO_UTILIZACAO write FINICIO_UTILIZACAO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;

    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TManyValuedAssociation('ID_PONTO_ABONO', 'ID')]
    property ListaPontoAbonoUtilizacaoVO: TObjectList<TPontoAbonoUtilizacaoVO> read FListaPontoAbonoUtilizacaoVO write FListaPontoAbonoUtilizacaoVO;

  end;

implementation

constructor TPontoAbonoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FListaPontoAbonoUtilizacaoVO := TObjectList<TPontoAbonoUtilizacaoVO>.Create;
end;

destructor TPontoAbonoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FListaPontoAbonoUtilizacaoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPontoAbonoVO);

finalization
  Classes.UnRegisterClass(TPontoAbonoVO);

end.
