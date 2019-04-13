{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
unit VendaCondicoesPagamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  VendaCondicoesParcelasVO;

type
  [TEntity]
  [TTable('VENDA_CONDICOES_PAGAMENTO')]
  TVendaCondicoesPagamentoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FFATURAMENTO_MINIMO: Extended;
    FFATURAMENTO_MAXIMO: Extended;
    FINDICE_CORRECAO: Extended;
    FDIAS_TOLERANCIA: Integer;
    FVALOR_TOLERANCIA: Extended;
    FPRAZO_MEDIO: Integer;
    FVISTA_PRAZO: String;

    //Transientes
    FListaVendaCondicoesParcelasVO: TObjectList<TVendaCondicoesParcelasVO>;


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
    [TColumn('NOME', 'Nome', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('FATURAMENTO_MINIMO', 'Faturamento Minimo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property FaturamentoMinimo: Extended  read FFATURAMENTO_MINIMO write FFATURAMENTO_MINIMO;
    [TColumn('FATURAMENTO_MAXIMO', 'Faturamento Maximo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property FaturamentoMaximo: Extended  read FFATURAMENTO_MAXIMO write FFATURAMENTO_MAXIMO;
    [TColumn('INDICE_CORRECAO', 'Indice Correcao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property IndiceCorrecao: Extended  read FINDICE_CORRECAO write FINDICE_CORRECAO;
    [TColumn('DIAS_TOLERANCIA', 'Dias Tolerancia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasTolerancia: Integer  read FDIAS_TOLERANCIA write FDIAS_TOLERANCIA;
    [TColumn('VALOR_TOLERANCIA', 'Valor Tolerancia', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTolerancia: Extended  read FVALOR_TOLERANCIA write FVALOR_TOLERANCIA;
    [TColumn('PRAZO_MEDIO', 'Prazo Medio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property PrazoMedio: Integer  read FPRAZO_MEDIO write FPRAZO_MEDIO;
    [TColumn('VISTA_PRAZO', 'Vista Prazo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property VistaPrazo: String  read FVISTA_PRAZO write FVISTA_PRAZO;

    //Transientes
    [TManyValuedAssociation('ID_VENDA_CONDICOES_PAGAMENTO', 'ID')]
    property ListaVendaCondicoesParcelasVO: TObjectList<TVendaCondicoesParcelasVO> read FListaVendaCondicoesParcelasVO write FListaVendaCondicoesParcelasVO;


  end;

implementation

constructor TVendaCondicoesPagamentoVO.Create;
begin
  inherited;

  FListaVendaCondicoesParcelasVO := TObjectList<TVendaCondicoesParcelasVO>.Create;
end;

destructor TVendaCondicoesPagamentoVO.Destroy;
begin
  FreeAndNil(FListaVendaCondicoesParcelasVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TVendaCondicoesPagamentoVO);

finalization
  Classes.UnRegisterClass(TVendaCondicoesPagamentoVO);

end.
