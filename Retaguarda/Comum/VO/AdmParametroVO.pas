{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ADM_PARAMETRO] 
                                                                                
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
unit AdmParametroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ADM_PARAMETRO')]
  TAdmParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FFIN_PARCELA_ABERTO: Integer;
    FFIN_PARCELA_QUITADO: Integer;
    FFIN_PARCELA_QUITADO_PARCIAL: Integer;
    FFIN_TIPO_RECEBIMENTO_EDI: Integer;
    FCOMPRA_FIN_DOC_ORIGEM: Integer;
    FCOMPRA_CONTA_CAIXA: Integer;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('FIN_PARCELA_ABERTO', 'Fin Parcela Aberto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FinParcelaAberto: Integer  read FFIN_PARCELA_ABERTO write FFIN_PARCELA_ABERTO;
    [TColumn('FIN_PARCELA_QUITADO', 'Fin Parcela Quitado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FinParcelaQuitado: Integer  read FFIN_PARCELA_QUITADO write FFIN_PARCELA_QUITADO;
    [TColumn('FIN_PARCELA_QUITADO_PARCIAL', 'Fin Parcela Quitado Parcial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FinParcelaQuitadoParcial: Integer  read FFIN_PARCELA_QUITADO_PARCIAL write FFIN_PARCELA_QUITADO_PARCIAL;
    [TColumn('FIN_TIPO_RECEBIMENTO_EDI', 'Fin Tipo Recebimento Edi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FinTipoRecebimentoEdi: Integer  read FFIN_TIPO_RECEBIMENTO_EDI write FFIN_TIPO_RECEBIMENTO_EDI;
    [TColumn('COMPRA_FIN_DOC_ORIGEM', 'Compra Fin Doc Origem', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CompraFinDocOrigem: Integer  read FCOMPRA_FIN_DOC_ORIGEM write FCOMPRA_FIN_DOC_ORIGEM;
    [TColumn('COMPRA_CONTA_CAIXA', 'Compra Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CompraContaCaixa: Integer  read FCOMPRA_CONTA_CAIXA write FCOMPRA_CONTA_CAIXA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TAdmParametroVO);

finalization
  Classes.UnRegisterClass(TAdmParametroVO);

end.
