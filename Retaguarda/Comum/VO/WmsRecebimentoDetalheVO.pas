{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_RECEBIMENTO_DETALHE] 
                                                                                
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
unit WmsRecebimentoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  ProdutoVO;

type
  [TEntity]
  [TTable('WMS_RECEBIMENTO_DETALHE')]
  TWmsRecebimentoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_WMS_RECEBIMENTO_CABECALHO: Integer;
    FQUANTIDADE_VOLUME: Integer;
    FQUANTIDADE_ITEM_POR_VOLUME: Integer;
    FQUANTIDADE_RECEBIDA: Integer;
    FDESTINO: String;

    //Transientes
    FPersiste: String;
    FProdutoNome: String;

    FProdutoVO: TProdutoVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PRODUTO', 'Id Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_WMS_RECEBIMENTO_CABECALHO', 'Id Wms Recebimento Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdWmsRecebimentoCabecalho: Integer  read FID_WMS_RECEBIMENTO_CABECALHO write FID_WMS_RECEBIMENTO_CABECALHO;
    [TColumn('QUANTIDADE_VOLUME', 'Quantidade Volume', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeVolume: Integer  read FQUANTIDADE_VOLUME write FQUANTIDADE_VOLUME;
    [TColumn('QUANTIDADE_ITEM_POR_VOLUME', 'Quantidade Item Por Volume', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeItemPorVolume: Integer  read FQUANTIDADE_ITEM_POR_VOLUME write FQUANTIDADE_ITEM_POR_VOLUME;
    [TColumn('QUANTIDADE_RECEBIDA', 'Quantidade Recebida', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeRecebida: Integer  read FQUANTIDADE_RECEBIDA write FQUANTIDADE_RECEBIDA;
    [TColumn('DESTINO', 'Destino', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Destino: String  read FDESTINO write FDESTINO;


    //Transientes
    //Transientes
    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;


    [TAssociation('ID', 'ID_PRODUTO')]
    property ProdutoVO: TProdutoVO read FProdutoVO write FProdutoVO;

  end;

implementation

constructor TWmsRecebimentoDetalheVO.Create;
begin
  inherited;

  FProdutoVO := TProdutoVO.Create;
end;

destructor TWmsRecebimentoDetalheVO.Destroy;
begin
  FreeAndNil(FProdutoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TWmsRecebimentoDetalheVO);

finalization
  Classes.UnRegisterClass(TWmsRecebimentoDetalheVO);

end.
