{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_ROMANEIO_ENTREGA] 
                                                                                
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
unit VendaRomaneioEntregaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO;

type
  [TEntity]
  [TTable('VENDA_ROMANEIO_ENTREGA')]
  TVendaRomaneioEntregaVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDESCRICAO: String;
    FDATA_EMISSAO: TDateTime;
    FDATA_PREVISTA: TDateTime;
    FDATA_SAIDA: TDateTime;
    FSITUACAO: String;
    FDATA_ENCERRAMENTO: TDateTime;
    FOBSERVACAO: String;

    //Transientes
    FVendasVinculadas: String; //Vai subir apenas os IDs separados por pipes "|"

    FColaboradorPessoaNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;


  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumnDisplay('COLABORADOR.NOME', 'Requisitante', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('DATA_PREVISTA', 'Data Prevista', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrevista: TDateTime  read FDATA_PREVISTA write FDATA_PREVISTA;
    [TColumn('DATA_SAIDA', 'Data Saida', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataSaida: TDateTime  read FDATA_SAIDA write FDATA_SAIDA;
    [TColumn('SITUACAO', 'Situacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;
    [TColumn('DATA_ENCERRAMENTO', 'Data Encerramento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEncerramento: TDateTime  read FDATA_ENCERRAMENTO write FDATA_ENCERRAMENTO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    [TColumn('FVendasVinculadas', 'Vendas Vinculadas', 100, [], True)]
    property VendasVinculadas: String  read FVendasVinculadas write FVendasVinculadas;

    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;


  end;

implementation

constructor TVendaRomaneioEntregaVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
end;

destructor TVendaRomaneioEntregaVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaRomaneioEntregaVO);

finalization
  Classes.UnRegisterClass(TVendaRomaneioEntregaVO);

end.
