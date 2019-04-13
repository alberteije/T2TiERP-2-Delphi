{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
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
unit FiscalApuracaoIcmsController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FiscalApuracaoIcmsVO, Biblioteca;

type
  TFiscalApuracaoIcmsController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFiscalApuracaoIcmsVO>;
    class function ConsultaObjeto(pFiltro: String): TFiscalApuracaoIcmsVO;

    class procedure FiscalApuracaoIcms(pFiltro: String);

    class procedure Insere(pObjeto: TFiscalApuracaoIcmsVO);
    class function Altera(pObjeto: TFiscalApuracaoIcmsVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, ViewSpedC190VO, ViewSpedC390VO, ViewSpedC490VO;

class procedure TFiscalApuracaoIcmsController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFiscalApuracaoIcmsVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFiscalApuracaoIcmsVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFiscalApuracaoIcmsVO>(Retorno);
  finally
  end;
end;

class function TFiscalApuracaoIcmsController.ConsultaLista(pFiltro: String): TObjectList<TFiscalApuracaoIcmsVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFiscalApuracaoIcmsVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFiscalApuracaoIcmsController.ConsultaObjeto(pFiltro: String): TFiscalApuracaoIcmsVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFiscalApuracaoIcmsVO>(pFiltro, True);
  finally
  end;
end;

class procedure TFiscalApuracaoIcmsController.FiscalApuracaoIcms(pFiltro: String);
var
  objFiscalApuracaoIcms, ApuracaoIcmsAnterior: TFiscalApuracaoIcmsVO;
  ListaNFeAnalitico: TObjectList<TViewSpedC190VO>;
  ListaC390: TObjectList<TViewSpedC390VO>;
  ListaC490: TObjectList<TViewSpedC490VO>;
  //
  i: Integer;
  FiltroLocal: String;
  UltimoID: Integer;
  //
  VL_TOT_DEBITOS, VL_TOT_CREDITOS, VL_SLD_APURADO: Extended;
begin
  try
    VL_TOT_DEBITOS := 0;
    VL_TOT_CREDITOS := 0;
    VL_SLD_APURADO := 0;

    ApuracaoIcmsAnterior := TT2TiORM.ConsultarUmObjeto<TFiscalApuracaoIcmsVO>('COMPETENCIA=' + QuotedStr(PeriodoAnterior(pFiltro)), False);
    objFiscalApuracaoIcms := TT2TiORM.ConsultarUmObjeto<TFiscalApuracaoIcmsVO>('COMPETENCIA=' + QuotedStr(pFiltro), False);

    // Se não existe registro para o período atual, cria objeto
    if not Assigned(objFiscalApuracaoIcms) then
    begin
      objFiscalApuracaoIcms := TFiscalApuracaoIcmsVO.Create;
      objFiscalApuracaoIcms.IdEmpresa := Sessao.Empresa.Id;
      objFiscalApuracaoIcms.Competencia := pFiltro;
    end;

    {$REGION 'REGISTRO E110 - Campo 10 - VL_SLD_CREDOR_ANT'}
    // Se existir o período anterior, pega o saldo credor
    if Assigned(ApuracaoIcmsAnterior) then
      objFiscalApuracaoIcms.ValorSaldoCredorAnterior := ApuracaoIcmsAnterior.ValorSaldoCredorTransp;
    {$ENDREGION}

    {$REGION 'REGISTRO E110 - Campo 02 - VL_TOT_DEBITOS'}
    {
      Campo 02 - Validação: o valor informado deve corresponder ao somatório de todos os documentos fiscais de saída que
      geram débito de ICMS. Deste somatório, estão excluídos os documentos extemporâneos (COD_SIT com valor igual ‘01’),
      os documentos complementares extemporâneos (COD_SIT com valor igual ‘07’) e os documentos fiscais com CFOP 5605.
      Devem ser incluídos os documentos fiscais com CFOP igual a 1605.
      O valor neste campo deve ser igual à soma dos VL_ICMS de todos os registros C190, C320, C390, C490, C590, C690,
      C790, D190, D300, D390, D410, D590, D690, D696, com as datas dos campos DT_DOC (C300, C405, C600, D300,
      D355, D400, D600) ou DT_E_S (C100, C500) ou DT_DOC_FIN (C700, D695) ou DT_A_P (D100, D500) dentro do
      período informado no registro E100.
    }

    // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01, 1B, 04 ,55 e 65).
    FiltroLocal := 'extract(month from(DATA_HORA_EMISSAO))=' + Copy(pFiltro, 1, 2) + ' and extract(year from(DATA_HORA_EMISSAO))=' + Copy(pFiltro, 4, 4);
    ListaNFeAnalitico := TT2TiORM.Consultar<TViewSpedC190VO>(FiltroLocal, '-1', False);
    if assigned(ListaNFeAnalitico) then
    begin
      for i := 0 to ListaNFeAnalitico.Count - 1 do
      begin
        VL_TOT_DEBITOS := VL_TOT_DEBITOS + TViewSpedC190VO(ListaNFeAnalitico.Items[i]).SomaValorIcms;
      end; // for i := 0 to ListaNFeAnalitico.Count - 1 do
    end; // if Assigned(ListaNFeAnalitico) then

    // REGISTRO C390: REGISTRO ANALÍTICO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02)
    FiltroLocal := 'extract(month from(DATA_EMISSAO))=' + Copy(pFiltro, 1, 2) + ' and extract(year from(DATA_EMISSAO))=' + Copy(pFiltro, 4, 4);
    ListaC390 := TT2TiORM.Consultar<TViewSpedC390VO>(FiltroLocal, '-1', False);
    if assigned(ListaC390) then
    begin
      for i := 0 to ListaC390.Count - 1 do
      begin
        VL_TOT_DEBITOS := VL_TOT_DEBITOS + TViewSpedC390VO(ListaC390.Items[i]).SomaICMS;
      end; // for i := 0 to ListaC390.Count - 1 do
    end; // if Assigned(ListaC390) then

    // REGISTRO C490: REGISTRO ANALÍTICO DO MOVIMENTO DIÁRIO (CÓDIGO 02, 2D e 60).
    FiltroLocal := 'extract(month from(DATA_VENDA))=' + Copy(pFiltro, 1, 2) + ' and extract(year from(DATA_VENDA))=' + Copy(pFiltro, 4, 4);
    ListaC490 := TT2TiORM.Consultar<TViewSpedC490VO>(FiltroLocal, '-1', False);
    if assigned(ListaC490) then
    begin
      for i := 0 to ListaC490.Count - 1 do
      begin
        VL_TOT_DEBITOS := VL_TOT_DEBITOS + TViewSpedC490VO(ListaC490.Items[i]).SomaICMS;
      end; // for i := 0 to ListaC490.Count - 1 do
    end; // if Assigned(ListaC490) then

    objFiscalApuracaoIcms.ValorTotalDebito := VL_TOT_DEBITOS;
    {$ENDREGION}

    {$REGION 'REGISTRO E110 - Campo 06 - VL_TOT_CREDITOS'}
    {
      Campo 06 - Validação: o valor informado deve corresponder ao somatório de todos os documentos fiscais de entrada que
      geram crédito de ICMS. O valor neste campo deve ser igual à soma dos VL_ICMS de todos os registros C190, C590, D190
      e D590. Deste somatório, estão excluídos os documentos fiscais com CFOP 1605 e incluídos os documentos fiscais com
      CFOP 5605. Os documentos fiscais devem ser somados conforme o período informado no registro E100 e a data informada
      no campo DT_E_S (C100, C500) ou campo DT_A_P (D100, D500), exceto se COD_SIT do documento for igual a “01”
      (extemporâneo) ou igual a 07 (NF Complementar extemporânea), cujo valor será somado no primeiro período de apuração
      informado no registro E100.
    }
    // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01, 1B, 04 ,55 e 65).
    FiltroLocal := 'extract(month from(DATA_HORA_EMISSAO))=' + Copy(pFiltro, 1, 2) + ' and extract(year from(DATA_HORA_EMISSAO))=' + Copy(pFiltro, 4, 4);
    ListaNFeAnalitico := TT2TiORM.Consultar<TViewSpedC190VO>(FiltroLocal, '-1', False);
    if assigned(ListaNFeAnalitico) then
    begin
      for i := 0 to ListaNFeAnalitico.Count - 1 do
      begin
        VL_TOT_CREDITOS := VL_TOT_CREDITOS + TViewSpedC190VO(ListaNFeAnalitico.Items[i]).SomaValorIcms;
      end; // for i := 0 to ListaNFeAnalitico.Count - 1 do
    end; // if Assigned(ListaNFeAnalitico) then

    // REGISTRO C390: REGISTRO ANALÍTICO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02)
    FiltroLocal := 'extract(month from(DATA_EMISSAO))=' + Copy(pFiltro, 1, 2) + ' and extract(year from(DATA_EMISSAO))=' + Copy(pFiltro, 4, 4);
    ListaC390 := TT2TiORM.Consultar<TViewSpedC390VO>(FiltroLocal, '-1', False);
    if assigned(ListaC390) then
    begin
      for i := 0 to ListaC390.Count - 1 do
      begin
        VL_TOT_CREDITOS := VL_TOT_CREDITOS + TViewSpedC390VO(ListaC390.Items[i]).SomaICMS;
      end; // for i := 0 to ListaC390.Count - 1 do
    end; // if Assigned(ListaC390) then

    // REGISTRO C490: REGISTRO ANALÍTICO DO MOVIMENTO DIÁRIO (CÓDIGO 02, 2D e 60).
    FiltroLocal := 'extract(month from(DATA_VENDA))=' + Copy(pFiltro, 1, 2) + ' and extract(year from(DATA_VENDA))=' + Copy(pFiltro, 4, 4);
    ListaC490 := TT2TiORM.Consultar<TViewSpedC490VO>(FiltroLocal, '-1', False);
    if assigned(ListaC490) then
    begin
      for i := 0 to ListaC490.Count - 1 do
      begin
        VL_TOT_CREDITOS := VL_TOT_CREDITOS + TViewSpedC490VO(ListaC490.Items[i]).SomaICMS;
      end; // for i := 0 to ListaC490.Count - 1 do
    end; // if Assigned(ListaC490) then

    objFiscalApuracaoIcms.ValorTotalCredito := VL_TOT_CREDITOS;
    {$ENDREGION}

    {$REGION 'REGISTRO E110 - Campos 11 e 14 - VL_SLD_APURADO e VL_SLD_CREDOR_TRANSPORTAR'}
    {
      Campo 11 - Validação: o valor informado deve ser preenchido com base na expressão: soma do total de débitos
      (VL_TOT_DEBITOS) com total de ajustes (VL_AJ_DEBITOS +VL_TOT_AJ_DEBITOS) com total de estorno de crédito
      (VL_ESTORNOS_CRED) menos a soma do total de créditos (VL_TOT_CREDITOS) com total de ajuste de créditos
      (VL_,AJ_CREDITOS + VL_TOT_AJ_CREDITOS) com total de estorno de débito (VL_ESTORNOS_DEB) com saldo
      credor do período anterior (VL_SLD_CREDOR_ANT). Se o valor da expressão for maior ou igual a “0” (zero), então este
      valor deve ser informado neste campo e o campo 14 (VL_SLD_CREDOR_TRANSPORTAR) deve ser igual a “0” (zero).
      Se o valor da expressão for menor que “0” (zero), então este campo deve ser preenchido com “0” (zero) e o valor absoluto
      da expressão deve ser informado no campo VL_SLD_CREDOR_TRANSPORTAR.
    }
    VL_SLD_APURADO := VL_TOT_DEBITOS - VL_TOT_CREDITOS + objFiscalApuracaoIcms.ValorSaldoCredorAnterior;
    if VL_SLD_APURADO >= 0 then
    begin
      objFiscalApuracaoIcms.ValorSaldoApurado := VL_SLD_APURADO;
      objFiscalApuracaoIcms.ValorSaldoCredorTransp := 0;
    end
    else
    begin
      objFiscalApuracaoIcms.ValorSaldoApurado := 0;
      objFiscalApuracaoIcms.ValorSaldoCredorTransp := VL_SLD_APURADO * -1;
    end;
    {$ENDREGION}

    {$REGION 'REGISTRO E110 - Campo 13 - VL_ICMS_RECOLHER'}
    {
      Campo 13 – Validação: o valor informado deve corresponder à diferença entre o campo VL_SLD_APURADO e o campo
      VL_TOT_DED. Se o resultado dessa operação for negativo, informe o valor zero neste campo, e o valor absoluto
      correspondente no campo VL_SLD_CREDOR_TRANSPORTAR. Verificar se a legislação da UF permite que dedução
      seja maior que o saldo devedor.
    }
    if VL_SLD_APURADO >= 0 then
      objFiscalApuracaoIcms.ValorIcmsRecolher := VL_SLD_APURADO
    else
      objFiscalApuracaoIcms.ValorIcmsRecolher := 0;
    {$ENDREGION}

    if objFiscalApuracaoIcms.Id > 0 then
      TT2TiORM.Alterar(objFiscalApuracaoIcms)
    else
      UltimoID := TT2TiORM.Inserir(objFiscalApuracaoIcms);

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class procedure TFiscalApuracaoIcmsController.Insere(pObjeto: TFiscalApuracaoIcmsVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFiscalApuracaoIcmsController.Altera(pObjeto: TFiscalApuracaoIcmsVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TFiscalApuracaoIcmsController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFiscalApuracaoIcmsVO;
begin
  try
    ObjetoLocal := TFiscalApuracaoIcmsVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFiscalApuracaoIcmsController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFiscalApuracaoIcmsController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFiscalApuracaoIcmsController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFiscalApuracaoIcmsVO>(TObjectList<TFiscalApuracaoIcmsVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFiscalApuracaoIcmsController);

finalization
  Classes.UnRegisterClass(TFiscalApuracaoIcmsController);

end.
