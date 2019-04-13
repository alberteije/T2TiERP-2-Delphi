{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
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
unit InventarioContagemDetVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ProdutoVO;

type
  [TEntity]
  [TTable('INVENTARIO_CONTAGEM_DET')]
  TInventarioContagemDetVO = class(TVO)
  private
    FID: Integer;
    FID_INVENTARIO_CONTAGEM_CAB: Integer;
    FID_PRODUTO: Integer;
    FCONTAGEM01: Extended;
    FCONTAGEM02: Extended;
    FCONTAGEM03: Extended;
    FFECHADO_CONTAGEM: String;
    FQUANTIDADE_SISTEMA: Extended;
    FACURACIDADE: Extended;
    FDIVERGENCIA: Extended;

    //Transientes
    FProdutoNome: String;

    FProdutoVO: TProdutoVO;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_INVENTARIO_CONTAGEM_CAB', 'Id Inventario Contagem Cab', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdInventarioContagemCab: Integer  read FID_INVENTARIO_CONTAGEM_CAB write FID_INVENTARIO_CONTAGEM_CAB;

    [TColumn('ID_PRODUTO', 'Id Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumnDisplay('PRODUTO.NOME', 'Produto Nome', 300, [ldGrid, ldLookup], ftString, 'ProdutoVO.TProdutoVO', True)]
    property ProdutoNome: String read FProdutoNome write FProdutoNome;

    [TColumn('CONTAGEM01', 'Contagem01', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Contagem01: Extended  read FCONTAGEM01 write FCONTAGEM01;
    [TColumn('CONTAGEM02', 'Contagem02', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Contagem02: Extended  read FCONTAGEM02 write FCONTAGEM02;
    [TColumn('CONTAGEM03', 'Contagem03', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Contagem03: Extended  read FCONTAGEM03 write FCONTAGEM03;
    [TColumn('FECHADO_CONTAGEM', 'Fechado Contagem', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property FechadoContagem: String  read FFECHADO_CONTAGEM write FFECHADO_CONTAGEM;
    [TColumn('QUANTIDADE_SISTEMA', 'Quantidade Sistema', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeSistema: Extended  read FQUANTIDADE_SISTEMA write FQUANTIDADE_SISTEMA;
    [TColumn('ACURACIDADE', 'Acuracidade', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Acuracidade: Extended  read FACURACIDADE write FACURACIDADE;
    [TColumn('DIVERGENCIA', 'Divergencia', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Divergencia: Extended  read FDIVERGENCIA write FDIVERGENCIA;


    //Transientes
    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

    [TAssociation('ID', 'ID_PRODUTO')]
    property ProdutoVO: TProdutoVO read FProdutoVO write FProdutoVO;



  end;

implementation

constructor TInventarioContagemDetVO.Create;
begin
  inherited;

  FProdutoVO := TProdutoVO.Create;
end;

destructor TInventarioContagemDetVO.Destroy;
begin
  FreeAndNil(FProdutoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TInventarioContagemDetVO);

finalization
  Classes.UnRegisterClass(TInventarioContagemDetVO);

end.
