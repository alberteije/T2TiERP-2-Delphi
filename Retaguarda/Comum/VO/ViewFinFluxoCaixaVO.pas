{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_FIN_FLUXO_CAIXA] 
                                                                                
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
unit ViewFinFluxoCaixaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_FIN_FLUXO_CAIXA')]
  TViewFinFluxoCaixaVO = class(TVO)
  private
    FID_CONTA_CAIXA: Integer;
    FNOME_CONTA_CAIXA: String;
    FNOME_PESSOA: String;
    FDATA_LANCAMENTO: TDateTime;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR: Extended;
    FCODIGO_SITUACAO: String;
    FDESCRICAO_SITUACAO: String;
    FOPERACAO: String;

    //Transientes



  public 
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('NOME_CONTA_CAIXA', 'Nome Conta Caixa', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeContaCaixa: String  read FNOME_CONTA_CAIXA write FNOME_CONTA_CAIXA;
    [TColumn('NOME_PESSOA', 'Nome Pessoa', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomePessoa: String  read FNOME_PESSOA write FNOME_PESSOA;
    [TColumn('DATA_LANCAMENTO', 'Data Lancamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    [TColumn('DATA_VENCIMENTO', 'Data Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('CODIGO_SITUACAO', 'Codigo Situacao', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoSituacao: String  read FCODIGO_SITUACAO write FCODIGO_SITUACAO;
    [TColumn('DESCRICAO_SITUACAO', 'Descricao Situacao', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoSituacao: String  read FDESCRICAO_SITUACAO write FDESCRICAO_SITUACAO;
    [TColumn('OPERACAO', 'Operacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Operacao: String  read FOPERACAO write FOPERACAO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TViewFinFluxoCaixaVO);

finalization
  Classes.UnRegisterClass(TViewFinFluxoCaixaVO);

end.
