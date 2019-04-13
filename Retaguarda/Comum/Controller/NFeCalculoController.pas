{*******************************************************************************
Title: T2Ti ERP
Description: Unit de calculo da NFE - Lado Cliente

The MIT License

Copyright: Copyright (C) 2010 T2Ti.COM

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
           t2ti.com@gmail.com</p>

@author Albert Eije (T2Ti.COM)
        Claudio Roberto de Souza (desenvcrs@hotmail.com)
@version 1.0
*******************************************************************************}
unit NFeCalculoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, pcnConversao, Biblioteca;

type
TCalculoNFE = class
private
  //emissor
  FCrtEmissor             : Integer;
  FUFemissor              : Integer;
  //cliente ou fornecedor
  FTipoCliente            : String;
  FUFCliente              : String;
  FUFClienteCod           : Integer;
  //icms
  FValorBrutoProdutos     : Extended;
  FValorFrete             : Extended;
  FValorSeguro            : Extended;
  FValorOutrasDespesas    : Extended;
  FValorDesconto          : Extended;
  FCstIcms                : String;
  FCsosn                  : String;
  FModalidadeBcIcms       : String;
  FBaseCalculoIcms        : Extended;
  FTaxaReducaoBcIcms      : Extended;
  FValorReducaoBcIcms     : Extended;
  FAliquotaIcms           : Extended;
  FAliquotaIcmsInter      : Extended;
  FValorIcms              : Extended;
  //icms ST
  FModalidadeBcIcmsSt     : String;
  FPercentualMvaIcmsSt    : Extended;
  FBaseCalculoIcmsSt      : Extended;
  FReducaoBcIcmsSt        : Extended;
  FValorReducaoBcIcmsSt   : Extended;
  FAliquotaIcmsSt         : Extended;
  FValorIcmsSt            : Extended;
  //icms credito simples
  FAliquotaCreditoIcmsSn  : Extended;
  FValorCreditoIcmsSn     : Extended;
  //ipi
  FCstIpi                 : String;
  FBaseCalculoIpi         : Extended;
  FAliquotaIpi            : Extended;
  FValorIpi               : Extended;
  //pis
  FCstPis                 : String;
  FBaseCalculoPis         : Extended;
  FAliquotaPis            : Extended;
  FAliquotaPisReais       : Extended;
  FValorPis               : Extended;
  //cofins
  FCstCofins              : String;
  FBaseCalculoCofins      : Extended;
  FAliquotaCofins         : Extended;
  FAliquotaCofinsReais    : Extended;
  FValorCofins            : Extended;
public
  //emissor
  property CrtEmissor             : Integer  read FCrtEmissor             write FCrtEmissor;
  property UFemissor              : Integer  read FUFemissor              write FUFemissor;
  //cliente ou fornecedor
  property TipoCliente            : String   read FTipoCliente            write FTipoCliente;
  property UFCliente              : String   read FUFCliente              write FUFCliente;
  property UFClienteCod           : Integer  read FUFClienteCod           write FUFClienteCod;
  //icms
  property ValorBrutoProdutos     : Extended read FValorBrutoProdutos     write FValorBrutoProdutos;
  property ValorFrete             : Extended read FValorFrete             write FValorFrete;
  property ValorSeguro            : Extended read FValorSeguro            write FValorSeguro;
  property ValorOutrasDespesas    : Extended read FValorOutrasDespesas    write FValorOutrasDespesas;
  property ValorDesconto          : Extended read FValorDesconto          write FValorDesconto;
  property CstIcms                : String   read FCstIcms                write FCstIcms;
  property Csosn                  : String   read FCsosn                  write FCsosn;
  property ModalidadeBcIcms       : String   read FModalidadeBcIcms       write FModalidadeBcIcms;
  property BaseCalculoIcms        : Extended read FBaseCalculoIcms        write FBaseCalculoIcms;
  property TaxaReducaoBcIcms      : Extended read FTaxaReducaoBcIcms      write FTaxaReducaoBcIcms;
  property ValorReducaoBcIcms     : Extended read FValorReducaoBcIcms     write FValorReducaoBcIcms;
  property AliquotaIcms           : Extended read FAliquotaIcms           write FAliquotaIcms;
  property AliquotaIcmsInter      : Extended read FAliquotaIcmsInter      write FAliquotaIcmsInter;
  property ValorIcms              : Extended read FValorIcms              write FValorIcms;
  //icms ST
  property ModalidadeBcIcmsSt     : String   read FModalidadeBcIcmsSt     write FModalidadeBcIcmsSt;
  property PercentualMvaIcmsSt    : Extended read FPercentualMvaIcmsSt    write FPercentualMvaIcmsSt;
  property BaseCalculoIcmsSt      : Extended read FBaseCalculoIcmsSt      write FBaseCalculoIcmsSt;
  property ReducaoBcIcmsSt        : Extended read FReducaoBcIcmsSt        write FReducaoBcIcmsSt;
  property ValorReducaoBcIcmsSt   : Extended read FValorReducaoBcIcmsSt   write FValorReducaoBcIcmsSt;
  property AliquotaIcmsSt         : Extended read FAliquotaIcmsSt         write FAliquotaIcmsSt;
  property ValorIcmsSt            : Extended read FValorIcmsSt            write FValorIcmsSt;
  //icms credito simples nacional
  property AliquotaCreditoIcmsSn  : Extended read FAliquotaCreditoIcmsSn  write FAliquotaCreditoIcmsSn;
  property ValorCreditoIcmsSn     : Extended read FValorCreditoIcmsSn     write FValorCreditoIcmsSn;
  //ipi
  property CstIpi                 : String   read FCstIpi                 write FCstIpi;
  property BaseCalculoIpi         : Extended read FBaseCalculoIpi         write FBaseCalculoIpi;
  property AliquotaIpi            : Extended read FAliquotaIpi            write FAliquotaIpi;
  property ValorIpi               : Extended read FValorIpi               write FValorIpi;
  //pis
  property CstPis                 : String   read FCstPis                 write FCstPis;
  property BaseCalculoPis         : Extended read FBaseCalculoPis         write FBaseCalculoPis;
  property AliquotaPis            : Extended read FAliquotaPis            write FAliquotaPis;
  property AliquotaPisReais       : Extended read FAliquotaPisReais       write FAliquotaPisReais;
  property ValorPis               : Extended read FValorPis               write FValorPis;
  //cofins
  property CstCofins              : String   read FCstCofins              write FCstCofins;
  property BaseCalculoCofins      : Extended read FBaseCalculoCofins      write FBaseCalculoCofins;
  property AliquotaCofins         : Extended read FAliquotaCofins         write FAliquotaCofins;
  property AliquotaCofinsReais    : Extended read FAliquotaCofinsReais    write FAliquotaCofinsReais;
  property ValorCofins            : Extended read FValorCofins            write FValorCofins;
end;

type

TNFeCalculoController = class
private
protected
public
  //calculo de todos os tributos com cst ou csosn em uma so rotina
  class function Calculo(pCalculoNFE:TCalculoNFE):TCalculoNFE;
end;

implementation

//calculo unico para todos os tributos
class function TNFeCalculoController.Calculo(pCalculoNFE:TCalculoNFE):TCalculoNFE;
var
  Calculo: TCalculoNFE;
  OK: Boolean;
begin
  try
    Calculo := pCalculoNFE;

    //empresa emissora do simples
    {$REGION 'Empresa do Simples'}
    if StrToCRT(OK, IntToStr(Calculo.CrtEmissor)) = crtSimplesNacional  then
    begin
    //calculos do simples nacional
      {$REGION 'CSOSN 101'}
      if Calculo.Csosn = '101' then //101 Tributada pelo Simples Nacional com permissão de crédito
      begin
        Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas)- Calculo.ValorDesconto);
        Calculo.ValorCreditoIcmsSn := ((Calculo.BaseCalculoIcms * Calculo.AliquotaCreditoIcmsSn) / 100);
        Calculo.ValorCreditoIcmsSn := ArredondaTruncaValor('A', Calculo.ValorCreditoIcmsSn, 2);
      end
      {$ENDREGION}
      {$REGION 'CSOSN 102'}
      else if Calculo.Csosn = '102' then //102 Tributada pelo Simples Nacional sem permissão de crédito
      begin
        //não tem calculo
      end
      {$ENDREGION}
      {$REGION 'CSOSN 103'}
      else if Calculo.Csosn = '103' then //103 Isenção do ICMS no Simples Nacional para faixa de receita bruta
      begin
        //não tem calculo
      end
      {$ENDREGION}
      {$REGION 'CSOSN 201'}
      else if Calculo.Csosn = '201' then //201 Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária
      begin
        //calculo icms proprio
        Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
        if Calculo.UFClienteCod = Calculo.FUFemissor then//se for uf diferente entre emissor e destinatario usar aliquota de transferencia
          Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100)
        else
          Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter)/100);

        Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);

        Calculo.ValorCreditoIcmsSn := ((Calculo.BaseCalculoIcms * Calculo.AliquotaCreditoIcmsSn) / 100);
        Calculo.ValorCreditoIcmsSn := ArredondaTruncaValor('A', Calculo.ValorCreditoIcmsSn, 2);

        //calculo icms proprio
        //calculo icms ST
        if Calculo.ModalidadeBcIcmsSt = '0' then//Preço Tabelado ou Máximo Sugerido
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '1' then//lista Negativa(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '2' then//Lista Positiva(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '3' then//Lista Neutra(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '4' then//Margem valor Agregado(%)
        begin
          Calculo.BaseCalculoIcmsSt := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                       Calculo.ValorOutrasDespesas)- Calculo.ValorDesconto);
          Calculo.BaseCalculoIcmsSt := (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) /100));
          Calculo.BaseCalculoIcmsSt := ArredondaTruncaValor('A', Calculo.BaseCalculoIcmsSt, 2);
          Calculo.ValorReducaoBcIcmsSt := ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) /100);
          Calculo.ValorReducaoBcIcmsSt := ArredondaTruncaValor('A', Calculo.ValorReducaoBcIcmsSt, 2);
          Calculo.ValorIcmsSt := Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
        end
        else if Calculo.ModalidadeBcIcmsSt = '5' then//Pauta(valor)
        begin
        //
        end;//calculo icms ST
      end
      {$ENDREGION}
      {$REGION 'CSOSN 202'}
      else if Calculo.Csosn = '202' then //202 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
      begin
        //calculo icms proprio
        Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
        if Calculo.UFClienteCod = Calculo.FUFemissor then//se for uf diferente entre emissor e destinatario usar aliquota de transferencia
          Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100)
        else
          Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter)/100);

        Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);

        //calculo icms proprio
        //calculo icms ST
        if Calculo.ModalidadeBcIcmsSt = '0' then//Preço Tabelado ou Máximo Sugerido
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '1' then//lista Negativa(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '2' then//Lista Positiva(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '3' then//Lista Neutra(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '4' then//Margem valor Agregado(%)
        begin
          Calculo.BaseCalculoIcmsSt := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                            Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
          Calculo.BaseCalculoIcmsSt := (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) /100));
          Calculo.BaseCalculoIcmsSt := ArredondaTruncaValor('A', Calculo.BaseCalculoIcmsSt, 2);
          Calculo.ValorReducaoBcIcmsSt := ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) /100);
          Calculo.ValorReducaoBcIcmsSt := ArredondaTruncaValor('A', Calculo.ValorReducaoBcIcmsSt, 2);
          Calculo.ValorIcmsSt := Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
        end
        else if Calculo.ModalidadeBcIcmsSt = '5' then//Pauta(valor)
        begin
        //
        end;//calculo icms ST
      end
      {$ENDREGION}
      {$REGION 'CSOSN 203'}
      else if Calculo.Csosn = '203' then //203 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
      begin
        //calculo icms proprio
        Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas)- Calculo.ValorDesconto);
        if Calculo.UFClienteCod = Calculo.FUFemissor then//se for uf diferente entre emissor e destinatario usar aliquota de transferencia
          Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100)
        else
          Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter)/100);

        Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);

        //calculo icms proprio
        //calculo icms ST
        if Calculo.ModalidadeBcIcmsSt = '0' then//Preço Tabelado ou Máximo Sugerido
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '1' then//lista Negativa(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '2' then//Lista Positiva(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '3' then//Lista Neutra(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '4' then//Margem valor Agregado(%)
        begin
          Calculo.BaseCalculoIcmsSt := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                       Calculo.ValorOutrasDespesas)- Calculo.ValorDesconto);
          Calculo.BaseCalculoIcmsSt := (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) /100));
          Calculo.BaseCalculoIcmsSt := ArredondaTruncaValor('A', Calculo.BaseCalculoIcmsSt, 2);
          Calculo.ValorReducaoBcIcmsSt := ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) /100);
          Calculo.ValorReducaoBcIcmsSt := ArredondaTruncaValor('A', Calculo.ValorReducaoBcIcmsSt, 2);
          Calculo.ValorIcmsSt  := Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
        end
        else if Calculo.ModalidadeBcIcmsSt = '5' then//Pauta(valor)
        begin
        //
        end;//calculo icms ST
      end
      {$ENDREGION}
      {$REGION 'CSOSN 300'}
      else if Calculo.Csosn = '300' then //300 Imune - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional contempladas com imunidade do ICMS
      begin
        //não tem calculo
      end
      {$ENDREGION}
      {$REGION 'CSOSN 400'}
      else if Calculo.Csosn = '400' then //400 Não tributada pelo Simples Nacional - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional não sujeitas à tributação pelo ICMS dentro do Simples Nacional
      begin
        //não tem calculo
      end
      {$ENDREGION}
      {$REGION 'CSOSN 500'}
      else if Calculo.Csosn = '500' then //500 ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação - Classificam-se neste código as operações sujeitas exclusivamente ao regime de substituição tributária na condição de substituído tributário ou no caso de antecipações
      begin
        //não tem calculo
      end
      {$ENDREGION}
      {$REGION 'CSOSN 900'}
      else if Calculo.Csosn = '900' then //900 Outros - Classificam-se neste código as demais operações que não se enquadrem nos códigos 101, 102, 103, 201, 202, 203, 300, 400 e 500
      begin
        //
      end;
      {$ENDREGION}
    end;//if StrToCRT(OK, Empresa.Crt) = crtSimplesNacional  then
    {$ENDREGION}

    //empresas do regime normal e excesso de receita
    {$REGION 'Empresa do Regime normal e execesso de receita'}
    if (StrToCRT(OK, IntToStr(Calculo.CrtEmissor)) = crtRegimeNormal) or (StrToCRT(OK, IntToStr(Calculo.CrtEmissor)) = crtSimplesExcessoReceita )  then
    begin
      //convert UF do cliente para codigo para comparar com cod uf emitente
      Calculo.UFClienteCod := UFtoInt(Calculo.UFCliente);
      //aqui definir a aliquota do icms proprio ou inter estatual

      //calcula ipi
      {$REGION 'IPI'}
      if (Calculo.CstIpi = '00') or
         (Calculo.CstIpi = '49') or
         (Calculo.CstIpi = '50') or
         (Calculo.CstIpi = '99') then
      begin
        Calculo.BaseCalculoIpi := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro + Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
        Calculo.ValorIpi := ((Calculo.BaseCalculoIpi * Calculo.AliquotaIpi)/100);
        Calculo.ValorIpi := ArredondaTruncaValor('A', Calculo.ValorIpi, 2);
      end
      else
      begin
        Calculo.BaseCalculoIpi := 0;
        Calculo.ValorIpi := 0;
      end;
      {$ENDREGION}

      //calcula icms
      {$REGION 'CST 00'}
      if Calculo.CstIcms = '00' then //00 Tributada integralmente
      begin
        //calcula icms
        if Calculo.ModalidadeBcIcms = '0' then//Margem valor Agregado
        begin
          //
        end//0
        else if Calculo.ModalidadeBcIcms = '1' then//Pauta(Valor)
        begin
          //
        end//1
        else if Calculo.ModalidadeBcIcms = '2' then//Preço Tabelado Máx.(Valor)
        begin
          //
        end//2
        else if Calculo.ModalidadeBcIcms = '3' then//Valor da Operação
        begin
          if Calculo.TipoCliente = 'F' then //pessoa fisica inclui ipi na base de calculo do icms
          begin
            Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                           Calculo.ValorOutrasDespesas + Calculo.ValorIpi) - Calculo.ValorDesconto);
            Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100);//pessoa fisica sempre usa a aliquota normal da UF emissao
          end;
          if Calculo.TipoCliente = 'J' then //pessoa juridica não inclui ipi na base de calculo do icms
          begin
            Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                           Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);//pessoa juridica nao inclui ipi na base de calculo
            if Calculo.UFClienteCod = Calculo.FUFemissor then//se for uf diferente entre emissor e destinatario usar aliquota de transferencia
              Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100)
            else
              Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter)/100);
          end;
          Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);
        end;//3
      end
      {$ENDREGION}
      {$REGION 'CST 10'}
      else if Calculo.CstIcms = '10' then //10 Tributada e com cobrança do ICMS por substituição tributária
      begin
        //calculo icms proprio
        if Calculo.ModalidadeBcIcms = '0' then//Margem valor Agregado
        begin
          //
        end//0
        else if Calculo.ModalidadeBcIcms = '1' then//Pauta(Valor)
        begin
          //
        end//1
        else if Calculo.ModalidadeBcIcms = '2' then//Preço Tabelado Máx.(Valor)
        begin
          //
        end//2
        else if Calculo.ModalidadeBcIcms = '3' then//Valor da Operação
        begin
          if Calculo.TipoCliente = 'F' then //pessoa fisica inclui ipi na base de calculo do icms
          begin
            Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                           Calculo.ValorOutrasDespesas + Calculo.ValorIpi)- Calculo.ValorDesconto);
            Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100);//pessoa fisica sempre usa a aliquota normal da UF emissao
          end;
          if Calculo.TipoCliente = 'J' then //pessoa juridica não inclui ipi na base de calculo do icms
          begin
            Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                           Calculo.ValorOutrasDespesas)- Calculo.ValorDesconto);//pessoa juridica nao inclui ipi na base de calculo
            if Calculo.UFClienteCod = Calculo.FUFemissor then//se for uf diferente entre emissor e destinatario usar aliquota de transferencia
              Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100)
            else
              Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter)/100);
          end;
          Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);
        end;//3 - calculo icms proprio

        //calculo icms ST
        if Calculo.ModalidadeBcIcmsSt = '0' then//Preço Tabelado ou Máximo Sugerido
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '1' then//lista Negativa(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '2' then//Lista Positiva(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '3' then//Lista Neutra(valor)
        begin
        //
        end
        else if Calculo.ModalidadeBcIcmsSt = '4' then//Margem valor Agregado(%)
        begin
          Calculo.BaseCalculoIcmsSt := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                            Calculo.ValorOutrasDespesas + Calculo.ValorIpi)- Calculo.ValorDesconto);
          Calculo.BaseCalculoIcmsSt := (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) /100));
          Calculo.BaseCalculoIcmsSt := ArredondaTruncaValor('A', Calculo.BaseCalculoIcmsSt, 2);
          Calculo.ValorReducaoBcIcmsSt := ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) /100);
          Calculo.ValorReducaoBcIcmsSt := ArredondaTruncaValor('A', Calculo.ValorReducaoBcIcmsSt, 2);
          Calculo.ValorIcmsSt := Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
        end
        else if Calculo.ModalidadeBcIcmsSt = '5' then//Pauta(valor)
        begin
        //
        end;//calculo icms ST
      end
      {$ENDREGION}
      {$REGION 'CST 20'}
      else if Calculo.CstIcms = '20' then //20 Com redução de base de cálculo do ICMS
      begin
        //calcula icms
        if Calculo.ModalidadeBcIcms = '0' then//Margem valor Agregado
        begin
          //
        end//0
        else if Calculo.ModalidadeBcIcms = '1' then//Pauta(Valor)
        begin
          //
        end//1
        else if Calculo.ModalidadeBcIcms = '2' then//Preço Tabelado Máx.(Valor)
        begin
          //
        end//2
        else if Calculo.ModalidadeBcIcms = '3' then//Valor da Operação
        begin
          if Calculo.TipoCliente = 'F' then //pessoa fisica inclui ipi na base de calculo do icms
          begin
            Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas + Calculo.ValorIpi) - Calculo.ValorDesconto);
            Calculo.ValorReducaoBcIcms := (Calculo.BaseCalculoIcms - ((Calculo.BaseCalculoIcms * Calculo.TaxaReducaoBcIcms) / 100));
            Calculo.ValorReducaoBcIcms := ArredondaTruncaValor('A', Calculo.ValorReducaoBcIcmsSt, 2);
            Calculo.BaseCalculoIcms := Calculo.BaseCalculoIcms - Calculo.ValorReducaoBcIcms;
            Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100);//pessoa fisica sempre usa a aliquota normal da UF emissao
            Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);
          end;
          if Calculo.TipoCliente = 'J' then //pessoa juridica não inclui ipi na base de calculo do icms
          begin
            Calculo.BaseCalculoIcms := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas)- Calculo.ValorDesconto);//pessoa juridica nao inclui ipi na base de calculo
            Calculo.ValorReducaoBcIcms := (Calculo.BaseCalculoIcms - ((Calculo.BaseCalculoIcms * Calculo.TaxaReducaoBcIcms) / 100));
            Calculo.ValorReducaoBcIcms := ArredondaTruncaValor('A', Calculo.ValorReducaoBcIcmsSt, 2);
            Calculo.BaseCalculoIcms := Calculo.BaseCalculoIcms - Calculo.ValorReducaoBcIcms;
            if Calculo.UFClienteCod = Calculo.FUFemissor then//se for uf diferente entre emissor e destinatario usar aliquota de transferencia
              Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms)/100)
            else
              Calculo.ValorIcms := ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter)/100);
            Calculo.ValorIcms := ArredondaTruncaValor('A', Calculo.ValorIcms, 2);
          end;
        end;//3
      end
      {$ENDREGION}
      {$REGION 'CST 30'}
      else if Calculo.CstIcms = '30' then //30 Isenta ou não tributada e com cobrança do ICMS por substituição tributária
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 40'}
      else if Calculo.CstIcms = '40' then //40 Isenta do ICMS
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 41'}
      else if Calculo.CstIcms = '41' then //41 Nao tributada no ICMS
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 50'}
      else if Calculo.CstIcms = '50' then //50 Suspensao do ICMS
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 51'}
      else if Calculo.CstIcms = '51' then //51 Diferimento do ICMS
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 60'}
      else if Calculo.CstIcms = '60' then //60 ICMS cobrado anteriormente por substituição tributária
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 70'}
      else if Calculo.CstIcms = '70' then //70 Com redução da base de cálculo e cobrança do ICMS por substituição tributária
      begin
      //
      end
      {$ENDREGION}
      {$REGION 'CST 90'}
      else if Calculo.CstIcms = '90' then //90 Outras
      begin
      //
      end;
      {$ENDREGION}

      //calcula pis/cofins
      {$REGION 'PIS/COFINS'}
      //calcula Pis 01
      if Calculo.CstPis = '01' then //Tributável por Alíquota Normal
      begin
        Calculo.BaseCalculoPis := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                  Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
        Calculo.ValorPis := ((Calculo.BaseCalculoPis * Calculo.AliquotaPis)/100);
        Calculo.ValorPis := ArredondaTruncaValor('A', Calculo.ValorPis, 2);
      end;
      //calcula Pis 02
      if Calculo.CstPis = '02' then //Tributável por Alíquota diferenciada
      begin
        Calculo.BaseCalculoPis := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                        Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
        Calculo.ValorPis := (Calculo.BaseCalculoPis * Calculo.AliquotaPisReais);//ver formula 02
        Calculo.ValorPis := ArredondaTruncaValor('A', Calculo.ValorPis, 2);
      end;
      //calcula Cofins 01
      if Calculo.CstCofins = '01' then //Tributável por Alíquota Normal
      begin
        Calculo.BaseCalculoCofins := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                     Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
        Calculo.ValorCofins := ((Calculo.BaseCalculoCofins * Calculo.AliquotaCofins) / 100);
        Calculo.ValorCofins := ArredondaTruncaValor('A', Calculo.ValorCofins, 2);
      end;
      //calcula Cofins 02
      if Calculo.CstCofins = '02' then //Tributável por Alíquota diferenciada
      begin
        Calculo.BaseCalculoCofins := ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
                                     Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
        Calculo.ValorCofins := (Calculo.BaseCalculoCofins * Calculo.AliquotaCofinsReais);//ver formula 02
        Calculo.ValorCofins := ArredondaTruncaValor('A', Calculo.ValorCofins, 2);
      end;
      {$ENDREGION}
    end;//if (StrToCRT(OK, Empresa.Crt) = crtRegimeNormal) or (StrToCRT(OK, Empresa.Crt) = crtSimplesExcessoReceita )  then
    {$ENDREGION}

  finally
    Result := Calculo;
  end;
end;

end.
