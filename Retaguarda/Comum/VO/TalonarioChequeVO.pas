{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [TALONARIO_CHEQUE] 
                                                                                
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
unit TalonarioChequeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, DB, SysUtils, ContaCaixaVO;

type
  [TEntity]
  [TTable('TALONARIO_CHEQUE')]
  TTalonarioChequeVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FTALAO: String;
    FNUMERO: Integer;
    FSTATUS_TALAO: String;

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
    [TColumnDisplay('CONTA_CAIXA.NOME', 'Conta Caixa', 150, [ldGrid, ldLookup], ftString, 'ContaCaixaVO.TContaCaixaVO', True)]
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('TALAO', 'Talao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Talao: String  read FTALAO write FTALAO;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Numero: Integer  read FNUMERO write FNUMERO;
    [TColumn('STATUS_TALAO', 'Status Talao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property StatusTalao: String  read FSTATUS_TALAO write FSTATUS_TALAO;

    //Transientes
    [TAssociation('ID', 'ID_CONTA_CAIXA')]
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;

  end;

implementation

constructor TTalonarioChequeVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TTalonarioChequeVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TTalonarioChequeVO);

finalization
  Classes.UnRegisterClass(TTalonarioChequeVO);

end.
