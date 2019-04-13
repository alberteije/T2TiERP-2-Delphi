{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PLANO_SAUDE] 
                                                                                
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
unit FolhaPlanoSaudeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, OperadoraPlanoSaudeVO;

type
  [TEntity]
  [TTable('FOLHA_PLANO_SAUDE')]
  TFolhaPlanoSaudeVO = class(TVO)
  private
    FID: Integer;
    FID_OPERADORA_PLANO_SAUDE: Integer;
    FID_COLABORADOR: Integer;
    FDATA_INICIO: TDateTime;
    FBENEFICIARIO: String;

    //Transientes
    FColaboradorNome: String;
    FOperadoraNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;
    FOperadoraPlanoSaudeVO: TOperadoraPlanoSaudeVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_OPERADORA_PLANO_SAUDE', 'Id Operadora Plano Saude', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOperadoraPlanoSaude: Integer  read FID_OPERADORA_PLANO_SAUDE write FID_OPERADORA_PLANO_SAUDE;
    [TColumnDisplay('OPERADORA_PLANO_SAUDE.NOME', 'Operadora', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'OperadoraPlanoSaudeVO.TOperadoraPlanoSaudeVO', True)]
    property OperadoraNome: String read FOperadoraNome write FOperadoraNome;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumnDisplay('COLABORADOR.NOME', 'Colaborador', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('DATA_INICIO', 'Data Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('BENEFICIARIO', 'Beneficiario', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Beneficiario: String  read FBENEFICIARIO write FBENEFICIARIO;


    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TAssociation('ID', 'ID_OPERADORA_PLANO_SAUDE')]
    property OperadoraPlanoSaudeVO: TOperadoraPlanoSaudeVO read FOperadoraPlanoSaudeVO write FOperadoraPlanoSaudeVO;


  end;

implementation

constructor TFolhaPlanoSaudeVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FOperadoraPlanoSaudeVO := TOperadoraPlanoSaudeVO.Create;
end;

destructor TFolhaPlanoSaudeVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FOperadoraPlanoSaudeVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaPlanoSaudeVO);

finalization
  Classes.UnRegisterClass(TFolhaPlanoSaudeVO);

end.
