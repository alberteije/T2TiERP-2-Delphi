{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PATRIM_GRUPO_BEM] 
                                                                                
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
unit PatrimGrupoBemVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ContabilContaVO, ContabilHistoricoVO;

type
  [TEntity]
  [TTable('PATRIM_GRUPO_BEM')]
  TPatrimGrupoBemVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCODIGO: String;
    FNOME: String;
    FDESCRICAO: String;
    FCONTA_ATIVO_IMOBILIZADO: String;
    FCONTA_DEPRECIACAO_ACUMULADA: String;
    FCONTA_DESPESA_DEPRECIACAO: String;
    FCODIGO_HISTORICO: Integer;

    //Transientes
    FDescricaoContaAtivoImobilizado: String;
    FDescricaoContaDepreciacaoAcumulada: String;
    FDescricaoContaDespesaDepreciacao: String;
    FDescricaoHistorico: String;

    FDescricaoContaAtivoImobilizadoVO: TContabilContaVO;
    FDescricaoContaDepreciacaoAcumuladaVO: TContabilContaVO;
    FDescricaoContaDespesaDepreciacaoVO: TContabilContaVO;
    FDescricaoHistoricoVO: TContabilHistoricoVO;


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
    [TColumn('CODIGO', 'Codigo', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('NOME', 'Nome', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

    [TColumn('CONTA_ATIVO_IMOBILIZADO', 'Conta Ativo Imobilizado', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaAtivoImobilizado: String  read FCONTA_ATIVO_IMOBILIZADO write FCONTA_ATIVO_IMOBILIZADO;
    [TColumnDisplay('CONTABIL_CONTA.DESCRICAO.ATIVO_IMOBILIZADO', 'Descrição Conta Ativo Imobilizado', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'ContabilContaVO.TContabilContaVO', True)]
    property DescricaoContaAtivoImobilizado: String read FDescricaoContaAtivoImobilizado write FDescricaoContaAtivoImobilizado;

    [TColumn('CONTA_DEPRECIACAO_ACUMULADA', 'Conta Depreciacao Acumulada', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaDepreciacaoAcumulada: String  read FCONTA_DEPRECIACAO_ACUMULADA write FCONTA_DEPRECIACAO_ACUMULADA;
    [TColumnDisplay('CONTABIL_CONTA.DESCRICAO.DEPRECIACAO_ACUMULADA', 'Descrição Conta Depreciação Acumulada', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'ContabilContaVO.TContabilContaVO', True)]
    property DescricaoContaDepreciacaoAcumulada: String read FDescricaoContaDepreciacaoAcumulada write FDescricaoContaDepreciacaoAcumulada;

    [TColumn('CONTA_DESPESA_DEPRECIACAO', 'Conta Despesa Depreciacao', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaDespesaDepreciacao: String  read FCONTA_DESPESA_DEPRECIACAO write FCONTA_DESPESA_DEPRECIACAO;
    [TColumnDisplay('CONTABIL_CONTA.DESCRICAO.DESPESA_DEPRECIACAO', 'Descrição Conta Despesa Depreciação', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'ContabilContaVO.TContabilContaVO', True)]
    property DescricaoContaDespesaDepreciacao: String read FDescricaoContaDespesaDepreciacao write FDescricaoContaDespesaDepreciacao;

    [TColumn('CODIGO_HISTORICO', 'Codigo Historico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoHistorico: Integer  read FCODIGO_HISTORICO write FCODIGO_HISTORICO;
    [TColumnDisplay('CONTABIL_HISTORICO.DESCRICAO', 'Descrição Histórico', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'ContabilHistoricoVO.TContabilHistoricoVO', True)]
    property DescricaoHistorico: String read FDescricaoHistorico write FDescricaoHistorico;


    //Transientes
    [TAssociation('CLASSIFICACAO', 'CONTA_ATIVO_IMOBILIZADO')]
    property DescricaoContaAtivoImobilizadoVO: TContabilContaVO read FDescricaoContaAtivoImobilizadoVO write FDescricaoContaAtivoImobilizadoVO;

    [TAssociation('CLASSIFICACAO', 'CONTA_DEPRECIACAO_ACUMULADA')]
    property DescricaoContaDepreciacaoAcumuladaVO: TContabilContaVO read FDescricaoContaDepreciacaoAcumuladaVO write FDescricaoContaDepreciacaoAcumuladaVO;

    [TAssociation('CLASSIFICACAO', 'CONTA_DESPESA_DEPRECIACAO')]
    property DescricaoContaDespesaDepreciacaoVO: TContabilContaVO read FDescricaoContaDespesaDepreciacaoVO write FDescricaoContaDespesaDepreciacaoVO;

    [TAssociation('ID', 'CODIGO_HISTORICO')]
    property DescricaoHistoricoVO: TContabilHistoricoVO read FDescricaoHistoricoVO write FDescricaoHistoricoVO;


  end;

implementation

constructor TPatrimGrupoBemVO.Create;
begin
  inherited;

  FDescricaoContaAtivoImobilizadoVO := TContabilContaVO.Create;
  FDescricaoContaDepreciacaoAcumuladaVO := TContabilContaVO.Create;
  FDescricaoContaDespesaDepreciacaoVO := TContabilContaVO.Create;
  FDescricaoHistoricoVO := TContabilHistoricoVO.Create;
end;

destructor TPatrimGrupoBemVO.Destroy;
begin
  FreeAndNil(FDescricaoContaAtivoImobilizadoVO);
  FreeAndNil(FDescricaoContaDepreciacaoAcumuladaVO);
  FreeAndNil(FDescricaoContaDespesaDepreciacaoVO);
  FreeAndNil(FDescricaoHistoricoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPatrimGrupoBemVO);

finalization
  Classes.UnRegisterClass(TPatrimGrupoBemVO);

end.
