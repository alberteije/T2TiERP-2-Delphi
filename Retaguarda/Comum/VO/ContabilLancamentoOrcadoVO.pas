{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_LANCAMENTO_ORCADO] 
                                                                                
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
unit ContabilLancamentoOrcadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  DB, ContabilContaVO;

type
  [TEntity]
  [TTable('CONTABIL_LANCAMENTO_ORCADO')]
  TContabilLancamentoOrcadoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_CONTABIL_CONTA: Integer;
    FANO: String;
    FJANEIRO: Extended;
    FFEVEREIRO: Extended;
    FMARCO: Extended;
    FABRIL: Extended;
    FMAIO: Extended;
    FJUNHO: Extended;
    FJULHO: Extended;
    FAGOSTO: Extended;
    FSETEMBRO: Extended;
    FOUTUBRO: Extended;
    FNOVEMBRO: Extended;
    FDEZEMBRO: Extended;

    //Transientes
    FContabilConta: String;

    FContabilContaVO: TContabilContaVO;


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

    [TColumn('ID_CONTABIL_CONTA', 'Id Contabil Conta', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContabilConta: Integer  read FID_CONTABIL_CONTA write FID_CONTABIL_CONTA;
    [TColumnDisplay('CONTABIL_CONTA.DESCRICAO', 'Descrição Conta', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'ContabilContaVO.TContabilContaVO', True)]
    property ContabilConta: String read FContabilConta write FContabilConta;

    [TColumn('ANO', 'Ano', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Ano: String  read FANO write FANO;
    [TColumn('JANEIRO', 'Janeiro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Janeiro: Extended  read FJANEIRO write FJANEIRO;
    [TColumn('FEVEREIRO', 'Fevereiro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Fevereiro: Extended  read FFEVEREIRO write FFEVEREIRO;
    [TColumn('MARCO', 'Marco', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Marco: Extended  read FMARCO write FMARCO;
    [TColumn('ABRIL', 'Abril', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Abril: Extended  read FABRIL write FABRIL;
    [TColumn('MAIO', 'Maio', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Maio: Extended  read FMAIO write FMAIO;
    [TColumn('JUNHO', 'Junho', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Junho: Extended  read FJUNHO write FJUNHO;
    [TColumn('JULHO', 'Julho', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Julho: Extended  read FJULHO write FJULHO;
    [TColumn('AGOSTO', 'Agosto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Agosto: Extended  read FAGOSTO write FAGOSTO;
    [TColumn('SETEMBRO', 'Setembro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Setembro: Extended  read FSETEMBRO write FSETEMBRO;
    [TColumn('OUTUBRO', 'Outubro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Outubro: Extended  read FOUTUBRO write FOUTUBRO;
    [TColumn('NOVEMBRO', 'Novembro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Novembro: Extended  read FNOVEMBRO write FNOVEMBRO;
    [TColumn('DEZEMBRO', 'Dezembro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Dezembro: Extended  read FDEZEMBRO write FDEZEMBRO;


    //Transientes
    [TAssociation('ID', 'ID_CONTABIL_CONTA')]
    property ContabilContaVO: TContabilContaVO read FContabilContaVO write FContabilContaVO;


  end;

implementation

constructor TContabilLancamentoOrcadoVO.Create;
begin
  inherited;

  FContabilContaVO := TContabilContaVO.Create;
end;

destructor TContabilLancamentoOrcadoVO.Destroy;
begin
  FreeAndNil(FContabilContaVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContabilLancamentoOrcadoVO);

finalization
  Classes.UnRegisterClass(TContabilLancamentoOrcadoVO);

end.
