{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ORCAMENTO_FLUXO_CAIXA_PERIODO] 
                                                                                
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
unit OrcamentoFluxoCaixaPeriodoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ContaCaixaVO;

type
  [TEntity]
  [TTable('ORCAMENTO_FLUXO_CAIXA_PERIODO')]
  TOrcamentoFluxoCaixaPeriodoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FPERIODO: String;
    FNOME: String;

    //Transientes
    FContaCaixaNome: String;

    FContaCaixaVO: TContaCaixaVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumnDisplay('CONTA_CAIXA.NOME', 'Conta Caixa Nome', 100, [ldGrid, ldLookup], ftString, 'ContaCaixaVO.TContaCaixaVO', True)]
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    [TColumn('PERIODO', 'Periodo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Periodo: String  read FPERIODO write FPERIODO;
    [TColumn('NOME', 'Nome', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;


    //Transientes
    [TAssociation('ID', 'ID_CONTA_CAIXA')]
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;


  end;

implementation

constructor TOrcamentoFluxoCaixaPeriodoVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TOrcamentoFluxoCaixaPeriodoVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TOrcamentoFluxoCaixaPeriodoVO);

finalization
  Classes.UnRegisterClass(TOrcamentoFluxoCaixaPeriodoVO);

end.
