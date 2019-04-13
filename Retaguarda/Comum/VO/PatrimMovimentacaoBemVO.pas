{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PATRIM_MOVIMENTACAO_BEM] 
                                                                                
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
unit PatrimMovimentacaoBemVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  PatrimTipoMovimentacaoVO;

type
  [TEntity]
  [TTable('PATRIM_MOVIMENTACAO_BEM')]
  TPatrimMovimentacaoBemVO = class(TVO)
  private
    FID: Integer;
    FID_PATRIM_BEM: Integer;
    FID_PATRIM_TIPO_MOVIMENTACAO: Integer;
    FDATA_MOVIMENTACAO: TDateTime;
    FRESPONSAVEL: String;

    //Transientes
    FPatrimTipoMovimentacaoNome: String;

    FPatrimTipoMovimentacaoVO: TPatrimTipoMovimentacaoVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PATRIM_BEM', 'Id Patrim Bem', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPatrimBem: Integer  read FID_PATRIM_BEM write FID_PATRIM_BEM;

    [TColumn('ID_PATRIM_TIPO_MOVIMENTACAO', 'Id Patrim Tipo Movimentacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPatrimTipoMovimentacao: Integer  read FID_PATRIM_TIPO_MOVIMENTACAO write FID_PATRIM_TIPO_MOVIMENTACAO;
    [TColumnDisplay('PATRIM_TIPO_MOVIMENTACAO.NOME', 'Nome Tipo Movimentação', 200, [ldGrid, ldLookup, ldComboBox], ftString, 'PatrimTipoMovimentacaoVO.TPatrimTipoMovimentacaoVO', True)]
    property PatrimTipoMovimentacaoNome: String read FPatrimTipoMovimentacaoNome write FPatrimTipoMovimentacaoNome;

    [TColumn('DATA_MOVIMENTACAO', 'Data Movimentacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataMovimentacao: TDateTime  read FDATA_MOVIMENTACAO write FDATA_MOVIMENTACAO;
    [TColumn('RESPONSAVEL', 'Responsavel', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Responsavel: String  read FRESPONSAVEL write FRESPONSAVEL;


    //Transientes
    [TAssociation('ID', 'ID_PATRIM_TIPO_MOVIMENTACAO')]
    property PatrimTipoMovimentacaoVO: TPatrimTipoMovimentacaoVO read FPatrimTipoMovimentacaoVO write FPatrimTipoMovimentacaoVO;


  end;

implementation

constructor TPatrimMovimentacaoBemVO.Create;
begin
  inherited;

  FPatrimTipoMovimentacaoVO := TPatrimTipoMovimentacaoVO.Create;
end;

destructor TPatrimMovimentacaoBemVO.Destroy;
begin
  FreeAndNil(FPatrimTipoMovimentacaoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TPatrimMovimentacaoBemVO);

finalization
  Classes.UnRegisterClass(TPatrimMovimentacaoBemVO);

end.
