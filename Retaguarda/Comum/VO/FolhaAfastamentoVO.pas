{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_AFASTAMENTO] 
                                                                                
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
unit FolhaAfastamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, FolhaTipoAfastamentoVO;

type
  [TEntity]
  [TTable('FOLHA_AFASTAMENTO')]
  TFolhaAfastamentoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_FOLHA_TIPO_AFASTAMENTO: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FDIAS_AFASTADO: Integer;

    //Transientes
    FColaboradorNome: String;
    FTipoAfastamentoNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;
    FFolhaTipoAfastamentoVO: TFolhaTipoAfastamentoVO;


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
    [TColumnDisplay('COLABORADOR.NOME', 'Colaborador', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('ID_FOLHA_TIPO_AFASTAMENTO', 'Id Folha Tipo Afastamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFolhaTipoAfastamento: Integer  read FID_FOLHA_TIPO_AFASTAMENTO write FID_FOLHA_TIPO_AFASTAMENTO;
    [TColumnDisplay('FOLHA_TIPO_AFASTAMENTO.NOME', 'Tipo Afastamento', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'FolhaTipoAfastamentoVO.TFolhaTipoAfastamentoVO', True)]
    property TipoAfastamentoNome: String read FTipoAfastamentoNome write FTipoAfastamentoNome;

    [TColumn('DATA_INICIO', 'Data Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('DATA_FIM', 'Data Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    [TColumn('DIAS_AFASTADO', 'Dias Afastado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasAfastado: Integer  read FDIAS_AFASTADO write FDIAS_AFASTADO;


    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TAssociation('ID', 'ID_FOLHA_TIPO_AFASTAMENTO')]
    property FolhaTipoAfastamentoVO: TFolhaTipoAfastamentoVO read FFolhaTipoAfastamentoVO write FFolhaTipoAfastamentoVO;


  end;

implementation

constructor TFolhaAfastamentoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FFolhaTipoAfastamentoVO := TFolhaTipoAfastamentoVO.Create;
end;

destructor TFolhaAfastamentoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FFolhaTipoAfastamentoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaAfastamentoVO);

finalization
  Classes.UnRegisterClass(TFolhaAfastamentoVO);

end.
