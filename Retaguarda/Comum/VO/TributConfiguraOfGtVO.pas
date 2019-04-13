{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
unit TributConfiguraOfGtVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  TributGrupoTributarioVO, TributOperacaoFiscalVO, TributPisCodApuracaoVO,
  TributCofinsCodApuracaoVO, TributIpiDipiVO, TributIcmsUfVO;

type
  [TEntity]
  [TTable('TRIBUT_CONFIGURA_OF_GT')]
  TTributConfiguraOfGtVO = class(TVO)
  private
    FID: Integer;
    FID_TRIBUT_GRUPO_TRIBUTARIO: Integer;
    FID_TRIBUT_OPERACAO_FISCAL: Integer;

    FTributGrupoTributarioDescricao: String;
    FTributOperacaoFiscalDescricao: String;

    FTributGrupoTributarioVO: TTributGrupoTributarioVO;
    FTributOperacaoFiscalVO: TTributOperacaoFiscalVO;

    FTributPisCodApuracaoVO: TTributPisCodApuracaoVO; //0:1
    FTributCofinsCodApuracaoVO: TTributCofinsCodApuracaoVO; //0:1
    FTributIpiDipiVO: TTributIpiDipiVO; //0:1

    FListaTributIcmsUfVO: TObjectList<TTributIcmsUfVO>; //0:N

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldCombobox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_TRIBUT_GRUPO_TRIBUTARIO', 'Id Grupo Tributario', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTributGrupoTributario: Integer  read FID_TRIBUT_GRUPO_TRIBUTARIO write FID_TRIBUT_GRUPO_TRIBUTARIO;
    [TColumnDisplay('TRIBUT_GRUPO_TRIBUTARIO.DESCRICAO', 'Descrição Grupo Tributário', 400, [ldGrid, ldLookup], ftString, 'TributGrupoTributarioVO.TTributGrupoTributarioVO', True)]
    property TributGrupoTributarioDescricao: String read FTributGrupoTributarioDescricao write FTributGrupoTributarioDescricao;

    [TColumn('ID_TRIBUT_OPERACAO_FISCAL', 'Id Operacao Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTributOperacaoFiscal: Integer  read FID_TRIBUT_OPERACAO_FISCAL write FID_TRIBUT_OPERACAO_FISCAL;
    [TColumnDisplay('TRIBUT_OPERACAO_FISCAL.DESCRICAO', 'Descrição Operação', 400, [ldGrid, ldLookup], ftString, 'TributOperacaoFiscalVO.TTributOperacaoFiscalVO', True)]
    property TributOperacaoFiscalDescricao: String read FTributOperacaoFiscalDescricao write FTributOperacaoFiscalDescricao;

    [TAssociation('ID', 'ID_TRIBUT_OPERACAO_FISCAL')]
    property TributOperacaoFiscalVO: TTributOperacaoFiscalVO read FTributOperacaoFiscalVO write FTributOperacaoFiscalVO;

    [TAssociation('ID', 'ID_TRIBUT_GRUPO_TRIBUTARIO')]
    property TributGrupoTributarioVO: TTributGrupoTributarioVO read FTributGrupoTributarioVO write FTributGrupoTributarioVO;

    [TAssociation('ID_TRIBUT_CONFIGURA_OF_GT', 'ID')]
    property TributPisCodApuracaoVO: TTributPisCodApuracaoVO read FTributPisCodApuracaoVO write FTributPisCodApuracaoVO;

    [TAssociation('ID_TRIBUT_CONFIGURA_OF_GT', 'ID')]
    property TributCofinsCodApuracaoVO: TTributCofinsCodApuracaoVO read FTributCofinsCodApuracaoVO write FTributCofinsCodApuracaoVO;

    [TAssociation('ID_TRIBUT_CONFIGURA_OF_GT', 'ID')]
    property TributIpiDipiVO: TTributIpiDipiVO read FTributIpiDipiVO write FTributIpiDipiVO;

    [TManyValuedAssociation('ID_TRIBUT_CONFIGURA_OF_GT', 'ID')]
    property ListaTributIcmsUfVO: TObjectList<TTributIcmsUfVO>read FListaTributIcmsUfVO write FListaTributIcmsUfVO;
  end;

implementation

constructor TTributConfiguraOfGtVO.Create;
begin
  inherited;
  FTributOperacaoFiscalVO := TTributOperacaoFiscalVO.Create;
  FTributGrupoTributarioVO := TTributGrupoTributarioVO.Create;

  FTributPisCodApuracaoVO := TTributPisCodApuracaoVO.Create;
  FTributCofinsCodApuracaoVO := TTributCofinsCodApuracaoVO.Create;
  FTributIpiDipiVO := TTributIpiDipiVO.Create;

  FListaTributIcmsUfVO := TObjectList<TTributIcmsUfVO>.Create;
end;

destructor TTributConfiguraOfGtVO.Destroy;
begin
  FreeAndNil(FTributOperacaoFiscalVO);
  FreeAndNil(FTributGrupoTributarioVO);

  FreeAndNil(FTributPisCodApuracaoVO);
  FreeAndNil(FTributCofinsCodApuracaoVO);
  FreeAndNil(FTributIpiDipiVO);

  FreeAndNil(FListaTributIcmsUfVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TTributConfiguraOfGtVO);

finalization
  Classes.UnRegisterClass(TTributConfiguraOfGtVO);

end.
