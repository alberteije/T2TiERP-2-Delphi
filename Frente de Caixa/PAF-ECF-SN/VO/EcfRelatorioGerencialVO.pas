{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_RELATORIO_GERENCIAL] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0
*******************************************************************************}
unit EcfRelatorioGerencialVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ECF_RELATORIO_GERENCIAL')]
  TEcfRelatorioGerencialVO = class(TVO)
  private
    FID: Integer;
    FID_ECF_CONFIGURACAO: Integer;
    FX: Integer;
    FMEIOS_PAGAMENTO: Integer;
    FDAV_EMITIDOS: Integer;
    FIDENTIFICACAO_PAF: Integer;
    FPARAMETROS_CONFIGURACAO: Integer;
    FOUTROS: Integer;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_ECF_CONFIGURACAO', 'Id Ecf Configuracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfConfiguracao: Integer  read FID_ECF_CONFIGURACAO write FID_ECF_CONFIGURACAO;
    [TColumn('X', 'X', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property X: Integer  read FX write FX;
    [TColumn('MEIOS_PAGAMENTO', 'Meios Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MeiosPagamento: Integer  read FMEIOS_PAGAMENTO write FMEIOS_PAGAMENTO;
    [TColumn('DAV_EMITIDOS', 'Dav Emitidos', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DavEmitidos: Integer  read FDAV_EMITIDOS write FDAV_EMITIDOS;
    [TColumn('IDENTIFICACAO_PAF', 'Identificacao Paf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdentificacaoPaf: Integer  read FIDENTIFICACAO_PAF write FIDENTIFICACAO_PAF;
    [TColumn('PARAMETROS_CONFIGURACAO', 'Parametros Configuracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ParametrosConfiguracao: Integer  read FPARAMETROS_CONFIGURACAO write FPARAMETROS_CONFIGURACAO;
    [TColumn('OUTROS', 'Outros', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Outros: Integer  read FOUTROS write FOUTROS;

  end;

implementation

initialization
  Classes.RegisterClass(TEcfRelatorioGerencialVO);

finalization
  Classes.UnRegisterClass(TEcfRelatorioGerencialVO);


end.
