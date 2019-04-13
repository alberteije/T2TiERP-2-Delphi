{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_INSTRUCAO_OP]

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
unit PcpInstrucaoOpVO;

interface

uses
  Data.DB,
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, PcpInstrucaoVO;

type
  [TEntity]
  [TTable('PCP_INSTRUCAO_OP')]
  TPcpInstrucaoOpVO = class(TVO)
  private
    FID: Integer;
    FID_PCP_INSTRUCAO: Integer;
    FID_PCP_OP_CABECALHO: Integer;

    FInstrucaoCodigo: string;
    FInstrucaoDescricao: string;

    FInstrucao: TPcpInstrucaoVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PCP_INSTRUCAO', 'Id Instrucao', 80, [ldGrid, ldLookup, ldComboBox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPcpInstrucao: Integer  read FID_PCP_INSTRUCAO write FID_PCP_INSTRUCAO;
    [TColumnDisplay('PCP_INSTRUCAO.CODIGO', 'Id Instrucao', 80, [ldGrid, ldLookup, ldComboBox], ftString, 'PcpInstrucaoVO.TPcpInstrucaoVO', True)]
    property InstrucaoCodigo: string  read FInstrucaoCodigo write FInstrucaoCodigo ;
    [TColumnDisplay('PCP_INSTRUCAO.DESCRICAO', 'Id Instrucao', 80, [ldGrid, ldLookup, ldComboBox], ftString, 'PcpInstrucaoVO.TPcpInstrucaoVO', True)]
    property InstrucaoDescricao: string  read FInstrucaoDescricao write FInstrucaoDescricao;
    [TColumn('ID_PCP_OP_CABECALHO', 'Id Pcp Op Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPcpOpCabecalho: Integer  read FID_PCP_OP_CABECALHO write FID_PCP_OP_CABECALHO;

    [TAssociation('ID', 'ID_PCP_INSTRUCAO')]
    property Instrucao: TPcpInstrucaoVO read FInstrucao write FInstrucao;

  end;

implementation

{ TPcpInstrucaoOpVO }

constructor TPcpInstrucaoOpVO.Create;
begin
  inherited;
  FInstrucao := TPcpInstrucaoVO.Create;
end;

destructor TPcpInstrucaoOpVO.Destroy;
begin
  FreeAndNil(FInstrucao);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpInstrucaoOpVO);

finalization
  Classes.UnRegisterClass(TPcpInstrucaoOpVO);

end.

