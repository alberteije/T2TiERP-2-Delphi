{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_SERVICO]

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
unit PcpServicoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, PcpServicoColaboradorVO, PcpServicoEquipamentoVO;

type
  [TEntity]
  [TTable('PCP_SERVICO')]
  TPcpServicoVO = class(TVO)
  private
    FID: Integer;
    FID_PCP_OP_DETALHE: Integer;
    FINICIO_REALIZADO: TDateTime;
    FTERMINO_REALIZADO: TDateTime;
    FHORAS_REALIZADO: Integer;
    FMINUTOS_REALIZADO: Integer;
    FSEGUNDOS_REALIZADO: Integer;
    FCUSTO_REALIZADO: Extended;
    FINICIO_PREVISTO: TDateTime;
    FTERMINO_PREVISTO: TDateTime;
    FHORAS_PREVISTO: Integer;
    FMINUTOS_PREVISTO: Integer;
    FSEGUNDOS_PREVISTO: Integer;
    FCUSTO_PREVISTO: Extended;

    FListaPcpServicoColaboradorVO: TObjectList<TPcpServicoColaboradorVO>;
    FListaPcpServicoEquipamentoVO: TObjectList<TPcpServicoEquipamentoVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PCP_OP_DETALHE', 'Id Pcp Op Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPcpOpDetalhe: Integer  read FID_PCP_OP_DETALHE write FID_PCP_OP_DETALHE;
    [TColumn('INICIO_REALIZADO', 'Inicio Realizado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property InicioRealizado: TDateTime  read FINICIO_REALIZADO write FINICIO_REALIZADO;
    [TColumn('TERMINO_REALIZADO', 'Termino Realizado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property TerminoRealizado: TDateTime  read FTERMINO_REALIZADO write FTERMINO_REALIZADO;
    [TColumn('HORAS_REALIZADO', 'Horas Realizado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property HorasRealizado: Integer  read FHORAS_REALIZADO write FHORAS_REALIZADO;
    [TColumn('MINUTOS_REALIZADO', 'Minutos Realizado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MinutosRealizado: Integer  read FMINUTOS_REALIZADO write FMINUTOS_REALIZADO;
    [TColumn('SEGUNDOS_REALIZADO', 'Segundos Realizado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property SegundosRealizado: Integer  read FSEGUNDOS_REALIZADO write FSEGUNDOS_REALIZADO;
    [TColumn('CUSTO_REALIZADO', 'Custo Realizado', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoRealizado: Extended  read FCUSTO_REALIZADO write FCUSTO_REALIZADO;
    [TColumn('INICIO_PREVISTO', 'Inicio Previsto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property InicioPrevisto: TDateTime  read FINICIO_PREVISTO write FINICIO_PREVISTO;
    [TColumn('TERMINO_PREVISTO', 'Termino Previsto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property TerminoPrevisto: TDateTime  read FTERMINO_PREVISTO write FTERMINO_PREVISTO;
    [TColumn('HORAS_PREVISTO', 'Horas Previsto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property HorasPrevisto: Integer  read FHORAS_PREVISTO write FHORAS_PREVISTO;
    [TColumn('MINUTOS_PREVISTO', 'Minutos Previsto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MinutosPrevisto: Integer  read FMINUTOS_PREVISTO write FMINUTOS_PREVISTO;
    [TColumn('SEGUNDOS_PREVISTO', 'Segundos Previsto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property SegundosPrevisto: Integer  read FSEGUNDOS_PREVISTO write FSEGUNDOS_PREVISTO;
    [TColumn('CUSTO_PREVISTO', 'Custo Previsto', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoPrevisto: Extended  read FCUSTO_PREVISTO write FCUSTO_PREVISTO;

    [TManyValuedAssociation('ID_PCP_SERVICO', 'ID')]
    property ListaPcpColabradorVO: TObjectList<TPcpServicoColaboradorVO> read FListaPcpServicoColaboradorVO write FListaPcpServicoColaboradorVO;
    [TManyValuedAssociation('ID_PCP_SERVICO', 'ID')]
    property ListaPcpServicoEquipamentoVO: TObjectList<TPcpServicoEquipamentoVO> read FListaPcpServicoEquipamentoVO write FListaPcpServicoEquipamentoVO;


  end;

implementation


{ TPcpServicoVO }

constructor TPcpServicoVO.Create;
begin
  inherited;
  FListaPcpServicoColaboradorVO := TObjectList<TPcpServicoColaboradorVO>.Create;
  FListaPcpServicoEquipamentoVO := TObjectList<TPcpServicoEquipamentoVO>.Create;
end;

destructor TPcpServicoVO.Destroy;
begin
  FreeAndNil(FListaPcpServicoColaboradorVO);
  FreeAndNil(FListaPcpServicoEquipamentoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpServicoVO);

finalization
  Classes.UnRegisterClass(TPcpServicoVO);

end.
