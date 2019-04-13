{******************************************************************************}
{ Projeto: Componente ACBreSocial                                              }
{  Biblioteca multiplataforma de componentes Delphi para envio dos eventos do  }
{ eSocial - http://www.esocial.gov.br/                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       André Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doação do componente para o Projeto ACBr
******************************************************************************}
{$I ACBr.inc}

unit uExemploEsocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DateUtils, ACBreSocial, ACBrBase, ACBrDFe,
  EmpresaVO;

type
  TFExemploEsocial = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    btnGerar: TButton;
    cbS1000: TCheckBox;
    cbS1010: TCheckBox;
    cbS1020: TCheckBox;
    cbS1030: TCheckBox;
    cbS1040: TCheckBox;
    cbS1080: TCheckBox;
    cbS2100: TCheckBox;
    cbS1070: TCheckBox;
    cbS1060: TCheckBox;
    cbS1050: TCheckBox;
    cbS2200: TCheckBox;
    cbS2220: TCheckBox;
    cbS2240: TCheckBox;
    cbS1005: TCheckBox;
    cbS2210: TCheckBox;
    cbS2250: TCheckBox;
    cbS2298: TCheckBox;
    cbAviso: TComboBox;
    cbS3000: TCheckBox;
    cbS4000: TCheckBox;
    cbS4999: TCheckBox;
    cbS1200: TCheckBox;
    cbS1220: TCheckBox;
    cbS1298: TCheckBox;
    cbS1299: TCheckBox;
    cbS1300: TCheckBox;
    cbS1280: TCheckBox;
    cbS1270: TCheckBox;
    cbS1250: TCheckBox;
    cbS1260: TCheckBox;
    cbS2190: TCheckBox;
    cbS2205: TCheckBox;
    ACBreSocial1: TACBreSocial;
    cbS1210: TCheckBox;
    cbS2206: TCheckBox;
    cbS2230: TCheckBox;
    cbS2241: TCheckBox;
    cbS2299: TCheckBox;
    cbS2300: TCheckBox;
    cbS2305: TCheckBox;
    cbS2399: TCheckBox;
    cbS1202: TCheckBox;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    //procedures eventos de tabela
    procedure GerareSocial1000;
    procedure GerareSocial1005;
    procedure GerareSocial1010;
    procedure GerareSocial1020;
    procedure GerareSocial1030;
    procedure GerareSocial1040;
    procedure GerareSocial1050;
    procedure GerareSocial1060;
    procedure GerareSocial1070;
    procedure GerareSocial1080;
    procedure GerareSocial2100;

    //procedure eventos periodicos
    procedure GerareSocial1200;
    procedure GerareSocial1202;
    procedure GerareSocial1210;
    procedure GerareSocial1220;
    procedure GerareSocial1250;
    procedure GerareSocial1260;
    procedure GerareSocial1270;
    procedure GerareSocial1280;
    procedure GerareSocial1298;
    procedure GerareSocial1299;
    procedure GerareSocial1300;

    //procedures eventos não periódicos
    procedure GerareSocial2190;
    procedure GerareSocial2200;
    procedure GerareSocial2205;
    procedure GerareSocial2206;
    procedure GerareSocial2210;
    procedure GerareSocial2220;
    procedure GerareSocial2230;
    procedure GerareSocial2240;
    procedure GerareSocial2241;
    procedure GerareSocial2250;
    procedure GerareSocial2298;
    procedure GerareSocial2299;
    procedure GerareSocial2300;
    procedure GerareSocial2305;
    procedure GerareSocial2399;
    procedure GerareSocial3000;
    procedure GerareSocial4000;
    procedure GerareSocial4999;
  public
    { Public declarations }
  end;

var
  FExemploEsocial: TFExemploEsocial;
  Empresa: TEmpresaVO;

implementation

Uses
eSocial_Conversao, EmpresaController, PontoHorarioVO, Controller,
ViewPessoaColaboradorVO, FolhaPppFatorRiscoVO;

{$R *.dfm}

{ TFExemploEsocial }

/// EXERCICIO
/// Desenhe a janela de acordo com o padrão do ERP
/// Tome as janelas do Sped como base

/// EXERCICIO
/// Migure a lógica da geração do arquivo para o Controller
/// para que seja possível gerar o arquivo em 2 ou 3 camadas



{$Region 'Eventos de Tabela'}

// S-1000 - Informações do Empregador/Contribuinte
procedure TFExemploEsocial.GerareSocial1000;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Iniciais.S1000.Add do
    begin
  	  Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(1));

      evtInfoEmpregador.id     := '1';
//      evtInfoEmpregador.Versao := '2.0';

      evtInfoEmpregador.IdeEvento.TpAmb   := TpTpAmb(1);
      evtInfoEmpregador.IdeEvento.ProcEmi := TpProcEmi(1);
      evtInfoEmpregador.IdeEvento.VerProc := '1.0';

      evtInfoEmpregador.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtInfoEmpregador.IdeEmpregador.NrInsc := '0123456789';

      evtInfoEmpregador.ModoLancamento  := TModoLancamento( i );
      evtInfoEmpregador.InfoEmpregador.IdePeriodo.IniValid := '2015-05';
      evtInfoEmpregador.InfoEmpregador.IdePeriodo.FimValid := '2099-12';

      /// EXERCICIO: Analise a possibilidade de criar uma tabela de configurações exclusiva para o eSocial para armazenar alguns parâmetros

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.NmRazao          := Empresa.RazaoSocial;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.ClassTrib        := 1;                        /// EXERCICIO: Verifique a tabela 8 do eSocial. Necessário criar tabela no banco?
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.NatJurid         := 1;                        /// EXERCICIO: Verifique a tabela 25 do eSocial. Necessário criar tabela no banco?
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndCoop          := TpIndCoop(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndConstr        := TpIndConstr(2);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndDesFolha      := TpIndDesFolha(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndOptRegEletron := TpIndOptRegEletron(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.MultTabRubricas  := tpSimNao(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.NrSiafi          := '0123456';

      evtInfoEmpregador.InfoEmpregador.infoCadastro.InfoFap.fap                  := 0.500;
      evtInfoEmpregador.InfoEmpregador.infoCadastro.InfoFap.procAdmJudFap.tpProc := tpTpProc(1);
      evtInfoEmpregador.InfoEmpregador.infoCadastro.InfoFap.procAdmJudFap.nrProc := '999999';

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.SiglaMin     := tpSiglaMin(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.NrCertif     := '1111';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtEmisCertif := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtVencCertif := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.NrProtRenov  := '10';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtProtRenov  := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtDou        := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.PagDou       := '111';

      /// EXERCICIO: pegue os dados de contato da tabela filha
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.NmCtt    := Empresa.Contato;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.CpfCtt   := '022222';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.FoneFixo := '3333333';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.FoneCel  := '999999';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.email    := 'testecontato@testecontato.com';

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoOrgInternacional.IndAcordoIsenMulta := tpIndAcordoIsencaoMulta(1);


      with evtInfoEmpregador.InfoEmpregador.InfoCadastro.SoftwareHouse.Add do
      begin
        CnpjSoftHouse := '10793118000178';
        NmRazao       := 'T2Ti.COM';
        NmCont        := 'Albert';
        Telefone      := '6130425277';
        email         := 't2ti.com@gmail.com';
      end;

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoComplementares.SituacaoPJ.IndSitPJ := tpIndSitPJ(0);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoComplementares.SituacaoPF.IndSitPF := tpIndSitPF(0);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.infoRPPS.indRPPS                       := tpSimNao(0);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.infoRPPS.infEnteFed.ufEnteFed          := tpuf(ufPR);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.infoRPPS.infEnteFed.codMunic           := Empresa.CodigoIbgeCidade;

      with evtInfoEmpregador.InfoEmpregador.InfoCadastro.infoRPPS.infEnteFed.aliqEnteFed.Add do
      begin
        TpPublAlvo    := tpTpPublAlvo(1);
        DescSegDif    := 'teste';
        Perc.PercSeg  := 1.5;
        Perc.PercEnte := 2.5;
        perc.PercSeg  := 3.3;
      end;

      with evtInfoEmpregador.InfoEmpregador.InfoCadastro.infoRPPS.infEnteFed.limitesRem.Add do
      begin
        IdeSubteto := tpIdeSubteto(1);
        ValSubteto := 5000;
        IdMaior    := '65';
      end;

      evtInfoEmpregador.infoEmpregador.NovaValidade.IniValid := '2014-05';
      evtInfoEmpregador.infoEmpregador.novaValidade.FimValid := '2099-12';

    end;
  end;
end;

// S-1005 - Tabela de Estabelecimentos e Obras
procedure TFExemploEsocial.GerareSocial1005;
var
i : Integer;
begin
  /// EXERCICIO: fazer o laço para matriz e filiais
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Iniciais.S1005.Add do
    begin
      evtTabEstab.id     := '1';
//      evtTabEstab.Versao := '2.0';

      evtTabEstab.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabEstab.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabEstab.IdeEvento.VerProc := '1.0';

      evtTabEstab.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabEstab.IdeEmpregador.NrInsc := Copy(Empresa.Cnpj, 1, 8);

      evtTabEstab.ModoLancamento  := TModoLancamento( i );
      evtTabEstab.infoEstab.IdeEstab.tpInsc   := 1;
      evtTabEstab.infoEstab.IdeEstab.nrInsc   := Empresa.Cnpj;
      evtTabEstab.infoEstab.IdeEstab.iniValid := '2017-02';
      evtTabEstab.infoEstab.IdeEstab.fimValid := '2099-12';

      /// EXERCICIO: cadastre os CNAEs na tabela EMPRESA_CNAE e pegue o referente ao estabelecimento
//      evtTabEstab.infoEstab.DadosEstab.cnaePrep := Empresa.;

      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.AliqRat      := 1;
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.Fap          := 1.5;
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.AliqRatAjust := 2.5;

      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.tpProc := tpTpProc(1);
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.nrProc := '20150512';

      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.tpProc := tpTpProc(1);
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.nrProc := '20150512';

      evtTabEstab.infoEstab.DadosEstab.infoCaepf.tpCaepf := tcContrIndividual;

      evtTabEstab.infoEstab.DadosEstab.infoObra.indSubstPatrObra := tpIndSubstPatronalObra(1);

      evtTabEstab.infoEstab.NovaValidade.IniValid := '2014-05';
      evtTabEstab.infoEstab.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1010 - Tabela de Rubricas
/// EXERCICIO: Como fazer a correlação entre as rubricas do sistema e a do eSocial?
procedure TFExemploEsocial.GerareSocial1010;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1010.Add do
    begin
      evtTabRubrica.id     := '1';
//      evtTabRubrica.Versao := '2.0';

      evtTabRubrica.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabRubrica.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabRubrica.IdeEvento.VerProc := '1.0';

      evtTabRubrica.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabRubrica.IdeEmpregador.NrInsc := '0123456789';

      evtTabRubrica.ModoLancamento  := TModoLancamento( i );

      evtTabRubrica.infoRubrica.IdeRubrica.CodRubr    := '5445';
      evtTabRubrica.infoRubrica.IdeRubrica.ideTabRubr := '100000';
      evtTabRubrica.infoRubrica.IdeRubrica.iniValid   := '2015-05';
      evtTabRubrica.infoRubrica.IdeRubrica.fimValid   := '2015-05';

      evtTabRubrica.infoRubrica.DadosRubrica.dscRubr    := 'Teste de S-1010';
      evtTabRubrica.infoRubrica.DadosRubrica.natRubr    := 1022;
      evtTabRubrica.infoRubrica.DadosRubrica.tpRubr     := tpTpRubr(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncCP   := tpCodIncCP(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncIRRF := tpCodIncIRRF(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncFGTS := tpCodIncFGTS(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncSIND := tpCodIncSIND(1);
      evtTabRubrica.infoRubrica.DadosRubrica.RepDSR     := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.Rep13      := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.RepFerias  := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.repAviso   := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.fatorRubr  := 1.5;
      evtTabRubrica.infoRubrica.DadosRubrica.observacao := 'Rubrica Teste';


      evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.nrProc     := '1020';
      evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.ExtDecisao := tpExtDecisao(1);

      evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoIRRF.nrProc := '1020';
      evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoFGTS.nrProc := '50740';
      evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoSIND.nrProc := '50';

      evtTabRubrica.InfoRubrica.novaValidade.IniValid := '2015-05';
      evtTabRubrica.InfoRubrica.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1020 – Tabela de Lotações Tributárias
procedure TFExemploEsocial.GerareSocial1020;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1020.Add do
    begin
      evtTabLotacao.id     := '1';
//      evtTabLotacao.Versao := '2.0';

      evtTabLotacao.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabLotacao.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabLotacao.IdeEvento.VerProc := '1.0';

      evtTabLotacao.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabLotacao.IdeEmpregador.NrInsc := '0123456789';

      evtTabLotacao.ModoLancamento  := TModoLancamento( i );

      evtTabLotacao.infoLotacao.IdeLotacao.codLotacao := '300000';
      evtTabLotacao.infoLotacao.IdeLotacao.iniValid   := '2015-06';
      evtTabLotacao.infoLotacao.IdeLotacao.fimValid   := '2099-12';

      evtTabLotacao.infoLotacao.DadosLotacao.tpLotacao := '1';
      evtTabLotacao.infoLotacao.DadosLotacao.tpInsc    := tiCAEPF;
      evtTabLotacao.infoLotacao.DadosLotacao.nrInsc    := '6564646565';

      evtTabLotacao.infoLotacao.DadosLotacao.fPasLotacao.Fpas     := '515';
      evtTabLotacao.infoLotacao.DadosLotacao.fPasLotacao.codTercs := '15';

      with evtTabLotacao.infoLotacao.dadosLotacao.fPasLotacao.infoProcJudTerceiros.procJudTerceiro.Add do
      begin
        codTerc   := '111';
        nrProcJud := '1234567891239-1345'
      end;

      with evtTabLotacao.infoLotacao.dadosLotacao.fPasLotacao.infoProcJudTerceiros.procJudTerceiro.Add do
      begin
        codTerc   := '222';
        nrProcJud := '1234567891239-1345'
      end;

      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.tpInscContrat := tpTpInscContratante(1);
      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.NrInscContrat := '54564';
      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.tpInscProp    := TpTpInscProp(0);
      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.nrInscProp    := '654234523416';

      evtTabLotacao.infoLotacao.novaValidade.IniValid := '2015-06';
      evtTabLotacao.infoLotacao.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1030 – Tabela de Cargos/Empregos Públicos
procedure TFExemploEsocial.GerareSocial1030;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1030.Add do
    begin
      evtTabCargo.id     := '1';
 //     evtTabCargo.Versao := '2.0';

      evtTabCargo.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabCargo.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabCargo.IdeEvento.VerProc := '1.0';

      evtTabCargo.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabCargo.IdeEmpregador.NrInsc := '0123456789';

      evtTabCargo.ModoLancamento := TModoLancamento( i );

      evtTabCargo.infoCargo.IdeCargo.CodCargo := '37';
      evtTabCargo.infoCargo.ideCargo.iniValid := '2015-05';
      evtTabCargo.infoCargo.ideCargo.fimValid := '2099-12';

      evtTabCargo.infoCargo.DadosCargo.nmCargo := 'Programador';
      evtTabCargo.infoCargo.DadosCargo.codCBO  := '500000';

      evtTabCargo.infoCargo.DadosCargo.cargoPublico.acumCargo   := tpAcumCargo(0);
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.contagemEsp := tpContagemEsp(0);
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.dedicExcl   := tpSimNao(0);

      evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.nrLei    := '11111';
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.dtLei    := Now;
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.sitCargo := tpSitCargo(0);

      evtTabCargo.infoCargo.NovaValidade.IniValid := '2015-05';
      evtTabCargo.infoCargo.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1040 – Tabela de Funções e Cargos em Comissão
procedure TFExemploEsocial.GerareSocial1040;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1040.Add do
    begin
      evtTabFuncao.id     := '1';
//      evtTabFuncao.Versao := '2.0';

      evtTabFuncao.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabFuncao.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabFuncao.IdeEvento.VerProc := '1.0';

      evtTabFuncao.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabFuncao.IdeEmpregador.NrInsc := '0123456789';

      evtTabFuncao.ModoLancamento := TModoLancamento( i );

      evtTabFuncao.InfoFuncao.IdeFuncao.CodFuncao := '1';
      evtTabFuncao.InfoFuncao.IdeFuncao.iniValid  := '2015-05';
      evtTabFuncao.InfoFuncao.IdeFuncao.fimValid  := '2099-12';

      evtTabFuncao.InfoFuncao.DadosFuncao.dscFuncao := 'PROGRAMADOR';
      evtTabFuncao.InfoFuncao.DadosFuncao.codCBO    := '5000';

      evtTabFuncao.InfoFuncao.NovaValidade.IniValid := '2015-05';
      evtTabFuncao.InfoFuncao.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1050 – Tabela de Horários/Turnos de Trabalho
procedure TFExemploEsocial.GerareSocial1050;
var
  i : Integer;
  PontoHorario: TPontoHorarioVO;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1050.Add do
    begin
      evtTabHorContratual.id     := '1';
//      evtTabHorContratual.Versao := '2.0';

      evtTabHorContratual.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabHorContratual.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabHorContratual.IdeEvento.VerProc := '1.0';

      evtTabHorContratual.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabHorContratual.IdeEmpregador.NrInsc := Copy(Empresa.Cnpj, 1, 8);;

      evtTabHorContratual.ModoLancamento := TModoLancamento(i);

      PontoHorario := TPontoHorarioVO(TController.BuscarObjeto('PontoHorarioController.TPontoHorarioController', 'ConsultaObjeto', ['ID=1'], 'GET'));

      evtTabHorContratual.InfoHorContratual.ideHorContratual.codHorContrat := PontoHorario.Codigo;
      evtTabHorContratual.InfoHorContratual.ideHorContratual.iniValid      := '2015-05';
      evtTabHorContratual.InfoHorContratual.ideHorContratual.fimValid      := '2099-12';

      evtTabHorContratual.InfoHorContratual.dadosHorContratual.hrEntr         := PontoHorario.HoraInicioJornada;
      evtTabHorContratual.InfoHorContratual.dadosHorContratual.hrSaida        := PontoHorario.HoraFimJornada;
      evtTabHorContratual.InfoHorContratual.dadosHorContratual.durJornada     := StrToInt(PontoHorario.CargaHoraria);
      evtTabHorContratual.InfoHorContratual.dadosHorContratual.perHorFlexivel := tpSimNao(1);


      /// EXERCICIO: calcule o intervalo de acordo com as entradas e saídas cadastradas no registro
      with evtTabHorContratual.InfoHorContratual.dadosHorContratual.horarioIntervalo.Add do
      begin
        tpInterv   := tptpIntervalo(0);
        durInterv  := 90;
        iniInterv  := '1200';
        termInterv := '1330';
      end;

      /// EXERCICIO: calcule o intervalo de acordo com as entradas e saídas cadastradas no registro
      with evtTabHorContratual.InfoHorContratual.dadosHorContratual.horarioIntervalo.Add do
      begin
        tpInterv   := tptpIntervalo(1);
        durInterv  := 15;
        iniInterv  := '1645';
        termInterv := '1700';
      end;

      evtTabHorContratual.InfoHorContratual.novaValidade.IniValid := '2015-05';
      evtTabHorContratual.InfoHorContratual.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1060 – Tabela de Ambientes de Trabalho
procedure TFExemploEsocial.GerareSocial1060;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1060.Add do
    begin
      EvtTabAmbiente.id     := '1';
//      EvtTabAmbiente.Versao := '2.0';

      EvtTabAmbiente.IdeEvento.TpAmb   := TpTpAmb(1);
      EvtTabAmbiente.IdeEvento.ProcEmi := TpProcEmi(1);
      EvtTabAmbiente.IdeEvento.VerProc := '1.0';

      EvtTabAmbiente.IdeEmpregador.TpInsc := tpTpInsc(1);
      EvtTabAmbiente.IdeEmpregador.NrInsc := Copy(Empresa.Cnpj, 1, 8);;

      EvtTabAmbiente.ModoLancamento := TModoLancamento( i );

      EvtTabAmbiente.infoAmbiente.ideAmbiente.codAmb   := '123456';
      EvtTabAmbiente.infoAmbiente.ideAmbiente.iniValid := '2015-05';
      EvtTabAmbiente.infoAmbiente.ideAmbiente.fimValid := '2099-12';

      EvtTabAmbiente.infoAmbiente.dadosAmbiente.dscAmb   := 'DESCRICAO';
      EvtTabAmbiente.infoAmbiente.dadosAmbiente.localAmb := tpLocalAmb(0);
      EvtTabAmbiente.infoAmbiente.dadosAmbiente.tpInsc   := tpTpInscAmbTab(0);
      EvtTabAmbiente.infoAmbiente.dadosAmbiente.nrInsc   := '123456789';

      with EvtTabAmbiente.infoAmbiente.dadosAmbiente.fatorRisco.add do
      begin
        codFatRis := '1';
        utilizEPC := tpUtilizEPC(0);
      end;

      /// EXERCICIO: criar a tabela de fatores de riscos ambientais
      with EvtTabAmbiente.infoAmbiente.dadosAmbiente.fatorRisco.add do
      begin
        codFatRis := '2';
        utilizEPC := tpUtilizEPC(1);
      end;

      with EvtTabAmbiente.infoAmbiente.dadosAmbiente.fatorRisco.add do
      begin
        codFatRis := '3';
        utilizEPC := tpUtilizEPC(2);
      end;

      EvtTabAmbiente.infoAmbiente.novaValidade.IniValid := '2015-06';
      EvtTabAmbiente.infoAmbiente.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-1070 – Tabela de Processos Administrativos/Judiciais
procedure TFExemploEsocial.GerareSocial1070;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1070.Add do
    begin
      evtTabProcesso.id     := '1';
//      evtTabProcesso.Versao := '2.0';

      evtTabProcesso.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabProcesso.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabProcesso.IdeEvento.VerProc := '1.0';

      evtTabProcesso.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabProcesso.IdeEmpregador.NrInsc := '0123456789';

      evtTabProcesso.ModoLancamento := TModoLancamento( i );

      evtTabProcesso.InfoProcesso.IdeProcesso.tpProc   := tpTpProc(0);
      evtTabProcesso.InfoProcesso.IdeProcesso.nrProc   := '5000';
      evtTabProcesso.InfoProcesso.IdeProcesso.iniValid := '2014-05';
      evtTabProcesso.InfoProcesso.IdeProcesso.fimValid := '2015-06';


      evtTabProcesso.InfoProcesso.DadosProcesso.indSusp     := tpIndSusp(0);
      evtTabProcesso.InfoProcesso.DadosProcesso.dtDecisao   := Date;
      evtTabProcesso.InfoProcesso.DadosProcesso.indDeposito := tpSimNao(0);

      evtTabProcesso.InfoProcesso.DadosProcesso.DadosProcJud.UfVara     := 'PR';
      evtTabProcesso.InfoProcesso.DadosProcesso.DadosProcJud.codMunic   := 5075;
      evtTabProcesso.InfoProcesso.DadosProcesso.DadosProcJud.IdVara     := '20';
      evtTabProcesso.InfoProcesso.DadosProcesso.DadosProcJud.IndAutoria := 1;

      evtTabProcesso.InfoProcesso.NovaValidade.IniValid := '10-2015';
      evtTabProcesso.InfoProcesso.NovaValidade.FimValid := '10-2016';
    end;
  end;
end;

// S-1080 – Tabela de Operadores Portuários
procedure TFExemploEsocial.GerareSocial1080;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1080.Add do
    begin
      evtTabOperPortuario.id     := '1';
//      evtTabOperPortuario.Versao := '2.0';

      evtTabOperPortuario.IdeEvento.TpAmb   := TpTpAmb(1);
      evtTabOperPortuario.IdeEvento.ProcEmi := TpProcEmi(1);
      evtTabOperPortuario.IdeEvento.VerProc := '1.0';

      evtTabOperPortuario.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabOperPortuario.IdeEmpregador.NrInsc := '0123456789';

      evtTabOperPortuario.ModoLancamento := TModoLancamento( i );

      evtTabOperPortuario.InfoOperPortuario.IdeOperPortuario.cnpjOpPortuario := '29813268000156';
      evtTabOperPortuario.InfoOperPortuario.IdeOperPortuario.iniValid        := '2015-05';
      evtTabOperPortuario.InfoOperPortuario.IdeOperPortuario.fimValid        := '2099-12';

      evtTabOperPortuario.InfoOperPortuario.DadosOperPortuario.aliqRat      := 5;
      evtTabOperPortuario.InfoOperPortuario.DadosOperPortuario.fap          := 0.5;
      evtTabOperPortuario.InfoOperPortuario.DadosOperPortuario.aliqRatAjust := 5.5;

      evtTabOperPortuario.InfoOperPortuario.NovaValidade.IniValid := '2015-05';
      evtTabOperPortuario.InfoOperPortuario.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

// S-2100 - Cadastramento Inicial do Vínculo
procedure TFExemploEsocial.GerareSocial2100;
var
  Colaborador: TViewPessoaColaboradorVO;
begin
  with ACBreSocial1.Eventos.Iniciais.S2100.Add do
  begin
    EvtCadInicial.id     := '1';
//    EvtCadInicial.Versao := '2.0';

    /// EXERCICIO: fazer um laço para pegar todos os colaboradores

    Colaborador := TViewPessoaColaboradorVO(TController.BuscarObjeto('ViewPessoaColaboradorController.TViewPessoaColaboradorController', 'ConsultaObjeto', ['ID=1'], 'GET'));

    EvtCadInicial.IdeEvento.indRetif := tpIndRetificacao(1);
    EvtCadInicial.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtCadInicial.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtCadInicial.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtCadInicial.IdeEvento.VerProc  := '1.0';

    EvtCadInicial.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtCadInicial.IdeEmpregador.NrInsc := Copy(Empresa.Cnpj, 1, 8);

    /// EXERCICIO: Altere a view PessoaColaborador para incluir todos os campos necessários

    EvtCadInicial.Trabalhador.CpfTrab   := Colaborador.CpfCnpj;
    EvtCadInicial.Trabalhador.NisTrab   := '654646464';
    EvtCadInicial.Trabalhador.NmTrab    := Colaborador.Nome;
    EvtCadInicial.Trabalhador.Sexo      := 'M'; //Colaborador.Sexo;
    EvtCadInicial.Trabalhador.RacaCor   := 1;   //Colaborador.Raca;
    EvtCadInicial.Trabalhador.EstCiv    := 1;   //Colaborador.EstadoCivil;
    EvtCadInicial.Trabalhador.GrauInstr := 10;  //Colaborador.NivelFormacao;

    EvtCadInicial.Trabalhador.Nascimento.DtNascto   := date; //Colaborador.DataNascimento;
    EvtCadInicial.Trabalhador.Nascimento.codMunic   := Colaborador.MunicipioIbge;
    EvtCadInicial.Trabalhador.Nascimento.UF         := Colaborador.Uf;
    EvtCadInicial.Trabalhador.Nascimento.PaisNascto := '565';
    EvtCadInicial.Trabalhador.Nascimento.PaisNac    := '545';
    EvtCadInicial.Trabalhador.Nascimento.NmMae      := 'teste mae'; //Colaborador.NomeMae;
    EvtCadInicial.Trabalhador.Nascimento.NmPai      := 'teste pai'; //Colaborador.NomePai;

    EvtCadInicial.Trabalhador.Documentos.CTPS.NrCtps    := '56454'; //Colaborador.NumeroCtps;
    EvtCadInicial.Trabalhador.Documentos.CTPS.SerieCtps := '646';   //Colaborador.SerieCtps;
    EvtCadInicial.Trabalhador.Documentos.CTPS.UfCtps    := 'PR';    //Colaborador.UfCtps;

    EvtCadInicial.Trabalhador.Documentos.RIC.NrRic        := '123123';
    EvtCadInicial.Trabalhador.Documentos.RIC.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.RIC.DtExped      := date;

    EvtCadInicial.Trabalhador.Documentos.RG.NrRg         := Colaborador.RgIe;
    EvtCadInicial.Trabalhador.Documentos.RG.OrgaoEmissor := 'SSP';  //Colaborador.RgOrgao;
    EvtCadInicial.Trabalhador.Documentos.RG.DtExped      := date;   //Colaborador.RgData;

    EvtCadInicial.Trabalhador.Documentos.RNE.NrRne        := '123123';
    EvtCadInicial.Trabalhador.Documentos.RNE.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.RNE.DtExped      := date;

    EvtCadInicial.Trabalhador.Documentos.OC.NrOc         := '999';
    EvtCadInicial.Trabalhador.Documentos.OC.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.OC.DtExped      := Date;
    EvtCadInicial.Trabalhador.Documentos.OC.DtValid      := Date;

    EvtCadInicial.Trabalhador.Documentos.CNH.nrRegCnh     := '999';
    EvtCadInicial.Trabalhador.Documentos.CNH.DtExped      := Date;
    EvtCadInicial.Trabalhador.Documentos.CNH.ufCnh        := tpuf(ufPR);
    EvtCadInicial.Trabalhador.Documentos.CNH.DtValid      := Date;
    EvtCadInicial.Trabalhador.Documentos.CNH.dtPriHab     := Date;
    EvtCadInicial.Trabalhador.Documentos.CNH.categoriaCnh := tpCnh(cnA);

    EvtCadInicial.Trabalhador.Endereco.Brasil.TpLograd    := 'RUA';
    EvtCadInicial.Trabalhador.Endereco.Brasil.DscLograd   := Colaborador.Logradouro;
    EvtCadInicial.Trabalhador.Endereco.Brasil.NrLograd    := Colaborador.Numero;
    EvtCadInicial.Trabalhador.Endereco.Brasil.Complemento := Colaborador.Complemento;
    EvtCadInicial.Trabalhador.Endereco.Brasil.Bairro      := Colaborador.Bairro;
    EvtCadInicial.Trabalhador.Endereco.Brasil.Cep         := Colaborador.Cep;
    EvtCadInicial.Trabalhador.Endereco.Brasil.CodMunic    := Colaborador.MunicipioIbge;
    EvtCadInicial.Trabalhador.Endereco.Brasil.UF          := tpuf(ufPR);

    EvtCadInicial.Trabalhador.Endereco.Exterior.PaisResid   := '545';
    EvtCadInicial.Trabalhador.Endereco.Exterior.DscLograd   := 'TESTE';
    EvtCadInicial.Trabalhador.Endereco.Exterior.NrLograd    := '777';
    EvtCadInicial.Trabalhador.Endereco.Exterior.Complemento := 'AP 101';
    EvtCadInicial.Trabalhador.Endereco.Exterior.Bairro      := 'CENTRO';
    EvtCadInicial.Trabalhador.Endereco.Exterior.NmCid       := 'CIDADE EXTERIOR';
    EvtCadInicial.Trabalhador.Endereco.Exterior.CodPostal   := '50000';

    EvtCadInicial.Trabalhador.TrabEstrangeiro.DtChegada        := Date;
    EvtCadInicial.Trabalhador.TrabEstrangeiro.ClassTrabEstrang := tpClassTrabEstrang(ctVistoPermanente);
    EvtCadInicial.Trabalhador.TrabEstrangeiro.CasadoBr         := 'N';
    EvtCadInicial.Trabalhador.TrabEstrangeiro.FilhosBr         := 'N';

    EvtCadInicial.Trabalhador.InfoDeficiencia.DefFisica      := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefVisual      := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefAuditiva    := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefMental      := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefIntelectual := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.ReabReadap     := tpSimNao(tpSim);
    EvtCadInicial.Trabalhador.InfoDeficiencia.Observacao     := 'sem deficiencia';

    /// EXERCICIO: capture os dados dos dependentes para informar abaixo
    with EvtCadInicial.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdConjuge);
      nmDep    := 'Dependente 1';
      dtNascto := Date;
      cpfDep   := '575487587';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
      //depRPPS  := tpSimNao(tpNao);-- removido na versão 2.1
    end;

    with EvtCadInicial.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdFilhoOuEnteadoAte21Anos);
      nmDep    := 'Dependente 2';
      dtNascto := Date;
      cpfDep   := '575487587';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
      //depRPPS  := tpSimNao(tpNao);-- removido na versão 2.1
    end;

    EvtCadInicial.Trabalhador.Aposentadoria.TrabAposent := 'N';

    EvtCadInicial.Trabalhador.Contato.FonePrinc     := '91067240';
    EvtCadInicial.Trabalhador.Contato.FoneAlternat  := '91067240';
    EvtCadInicial.Trabalhador.Contato.EmailPrinc    := 'TESTE@email.com.br';
    EvtCadInicial.Trabalhador.Contato.EmailAlternat := 'teste@teste.com';

    EvtCadInicial.Vinculo.Matricula := Colaborador.Matricula;
    EvtCadInicial.Vinculo.TpRegTrab := tpTpRegTrab(1);
    EvtCadInicial.Vinculo.TpRegPrev := tpTpRegPrev(1);

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.DtAdm             := Colaborador.DataAdmissao;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.TpAdmissao        := tpTpAdmissao(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.IndAdmissao       := tpTpIndAdmissao(iaNormal);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.TpRegJor          := tpTpRegJor(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.NatAtividade      := tpNatAtividade(navUrbano);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.dtBase            := 03;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.cnpjSindCategProf := '65469879875454';

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.FGTS.OpcFGTS   := tpOpcFGTS(ofOptante);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.FGTS.DtOpcFGTS := Date;

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.MtvContrat := tpMtvContrat(2);

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.TpInsc := 1;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.NrInsc := '564564656';

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTrabSubstituido.CpfTrabSubst    := '8978765756';
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTrabSubstituido.MatricTrabSubst := '599867888888888';

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.IndProvim   := tpIndProvim(ipNormal);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.TpProv      := tpTpProv(tpNomeacaoCargoEfetivo);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.DtNomeacao  := Date;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.DtPosse     := Date;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.DtExercicio := Date;

    EvtCadInicial.Vinculo.InfoContrato.CodCargo  := '545';
    EvtCadInicial.Vinculo.InfoContrato.CodFuncao := '5456';
    EvtCadInicial.Vinculo.InfoContrato.CodCateg  := 1;

    EvtCadInicial.Vinculo.InfoContrato.Remuneracao.VrSalFx    := 5000;
    EvtCadInicial.Vinculo.InfoContrato.Remuneracao.UndSalFixo := tpUndSalFixo(5);
    EvtCadInicial.Vinculo.InfoContrato.Remuneracao.DscSalVar  := 'nada a declarar';

    EvtCadInicial.Vinculo.InfoContrato.Duracao.TpContr := tpTpContr(1);
    EvtCadInicial.Vinculo.InfoContrato.Duracao.dtTerm  := Date;

    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.TpInsc   := tiCNPJ;
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.NrInsc   := '213546';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.DescComp := 'Descricao logal geral teste';

    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.TpLograd    := 123;
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.DscLograd   := 'LOCAL DOMESTICO';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.NrLograd    := '111';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Complemento := 'Complemento';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Bairro      := 'Bairro';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Cep         := '85202630';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.CodMunic    := 123;
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Uf          := tpuf(ufPR);

    EvtCadInicial.Vinculo.InfoContrato.HorContratual.QtdHrsSem := 44;
    EvtCadInicial.Vinculo.InfoContrato.HorContratual.TpJornada := tpTpJornada(1);
    EvtCadInicial.Vinculo.InfoContrato.HorContratual.DscTpJorn := 'horario contratual';

    with EvtCadInicial.Vinculo.InfoContrato.HorContratual.horario.Add do
    begin
      Dia := tpTpDia(diSegundaFeira);
      CodHorContrat := '54';
    end;

    with EvtCadInicial.Vinculo.InfoContrato.HorContratual.horario.Add do
    begin
      Dia := tpTpDia(diTercaFeira);
      CodHorContrat := '10';
    end;

    EvtCadInicial.Vinculo.InfoContrato.FiliacaoSindical.CnpjSindTrab := '223456000152';
    EvtCadInicial.Vinculo.InfoContrato.AlvaraJudicial.NrProcJud      := '123';
    EvtCadInicial.Vinculo.SucessaoVinc.Cnpj := '54654000155';
    EvtCadInicial.Vinculo.SucessaoVinc.MatricAnt     := '123';
    EvtCadInicial.Vinculo.SucessaoVinc.DtIniVinculo  := Date;
    EvtCadInicial.Vinculo.SucessaoVinc.Observacao    := 'transferido';

    evtCadInicial.vinculo.Afastamento.DtIniAfast := Date;
    evtCadInicial.vinculo.Afastamento.codMotAfast := '15';
    evtCadInicial.vinculo.Desligamento.DtDeslig  := Date;
  end;
end;

{$EndRegion}


{$Region 'Eventos Períodicos'}
// S-1200 – Remuneração de trabalhador vinculado ao Regime Geral de Previdência Social
procedure TFExemploEsocial.GerareSocial1200;
var
  Colaborador: TViewPessoaColaboradorVO;
begin
  with ACBreSocial1.Eventos.Periodicos.S1200.Add do
    begin
      evtRemun.id     := '1';
//      evtRemun.versao := '2.0';

      evtRemun.ideEvento.indRetif    := ireOriginal;
      //evtRemun.ideEvento.NrRecibo  := '4564654'; Numero do recibo que será retificado.
      evtRemun.ideEvento.IndApuracao := tpIndApuracao(iapuMensal);
      evtRemun.ideEvento.perApur     := '022017';
      evtRemun.ideEvento.TpAmb       := taProducao;
      evtRemun.ideEvento.ProcEmi     := peAplicEmpregador;
      evtRemun.ideEvento.VerProc     := '1.0';

      evtRemun.ideEmpregador.TpInsc  := tiCNPJ;
      evtRemun.ideEmpregador.NrInsc  := Empresa.Cnpj;


      Colaborador := TViewPessoaColaboradorVO(TController.BuscarObjeto('ViewPessoaColaboradorController.TViewPessoaColaboradorController', 'ConsultaObjeto', ['ID=1'], 'GET'));

      evtRemun.ideTrabalhador.cpfTrab    := Colaborador.CpfCnpj;
      evtRemun.ideTrabalhador.nisTrab    := '09876543210';
      evtRemun.ideTrabalhador.qtdDepSF   := 0;
      evtRemun.ideTrabalhador.qtdDepIRRF := 0;

      evtRemun.ideTrabalhador.infoMV.indMV := imvDescontadaempregador;

      {Os Grupos abaixo são opcionais
      O grupo abaixocorresponde a funcionários que tenham dois empregos em empresas diferentes
      with evtRemun.ideTrabalhador.infoMV.remunOutrEmpr.add do
        begin
          tpInsc     := tiCNPJ;
          nrInsc     := '01234567890123';
          vlrRemunOE := 1230.10;
        end;

      //o grupo abaixo corresponde apenas a trabalhadores cuja categoria não está sujeita ao evento de admissão
        ou TSV-início
      evtRemun.ideTrabalhador.infoComplem.nmTrab       := 'João das Neves';
      evtRemun.ideTrabalhador.infoComplem.dtNascto     := Date;
      evtRemun.ideTrabalhador.infoComplem.codCBO       := '000001';
      evtRemun.ideTrabalhador.infoComplem.natAtividade := navUrbano;
      evtRemun.ideTrabalhador.infoComplem.qtdDiasTrab  := 10;

      //os dados abaixo só devem ser informados em caso do processo existir e houver decisão que incida sobre as
        contribuições
      with evtRemun.ideTrabalhador.procJudTrab.Add do
        begin
          tpTrib := tptrevidenciaria;
          nrProcJud := '9513570-33-2015-6-15-0258';
        end;}

      /// EXERCICIO: pegue os dados das tabelas folha_lancamento_cabecalho e folha_lancamento_detalhe
      with evtRemun.infoPerApur.recPgtos.Add do
        begin
          ideRecPgto := 123456;
          with ideEstabLot.Add do
            begin
              tpInsc     := tiCNPJ;
              nrInsc     := '01234567898765';
              codLotacao := 'SACI54321';
              with remunPerApur.Add do
                begin
                  matricula := 'A1234';
                  codCateg  := 101;
                  indSimples:= idsIntegralmente;
                  with itensRemun.Add do
                    begin
                      codRubr := '987654';
                      //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
                      qtdRubr := 100;
                      vrUnit  := 3296.35;
                      vrRubr  := 3330.30;
                    end;
                  with infoSaudeColet.detOper.Add do
                    begin
                      cnpjOper := '01234567898765';
                      regANS   := 'A1B2C3';
                      vrPgTit  := 1.50;
                      with detPlano.Add do
                        begin
                          cpfDep      := '01234567898';
                          dtNasctoDep := Date;
                          nmDep       := 'José das Areias';
                          relDep      := rdFilho;
                          vlrPgDep    := 0.75;
                        end;
                    end;

                  infoAgNocivo.grauExp := ge1;

                  with pensaoAlim.Add do
                    begin
                      cpfBenef      := '01478523698';
                      dtNasctoBenef := Date;
                      nmBenefic     := 'Pedro das Águas';
                      vlrPensao     := 330.30;
                    end;
                end;
            end;
        end;
      with evtRemun.infoPerAnt.ideADC.add do//Remuneração em períodos anteriores(resultantes de convenção coletiva por exemplo)
        begin
          dtAcConv := Date;
          tpAcConv := tacConvencaoColTrab;
          with recPgtos.Add do
            begin
              ideRecPgto := 000001;
              idePeriodo.Add.perRef := '042015';
              with idePeriodo.Add.ideEstabLot.Add do
                begin
                  tpInsc     := tiCNPJ;
                  nrInsc     := '01234567898765';
                  codLotacao := 'TESTE123';
                  with remunPerAnt.Add do
                    begin
                      matricula  := 'A1234';
                      codCateg   := 101;
                      indSimples := idsIntegralmente;
                      with itensRemun.Add do
                        begin
                          codRubr := '987654';
                          //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
                          qtdRubr := 100;
                          vrUnit  := 3296.35;
                          vrRubr  := 3330.30;
                        end;
                      with infoSaudeColet.detOper.Add do
                        begin
                          cnpjOper := '01234567898765';
                          regANS   := 'A1B2C3';
                          vrPgTit  := 1.50;
                          with detPlano.Add do
                            begin
                              cpfDep      := '01234567898';
                              dtNasctoDep := Date;
                              nmDep       := 'José das Areias';
                              relDep      := rdFilho;
                              vlrPgDep    := 0.75;
                            end;
                        end;

                      infoAgNocivo.grauExp := ge1;

                      with pensaoAlim.Add do
                        begin
                          cpfBenef      := '01478523698';
                          dtNasctoBenef := Date;
                          nmBenefic     := 'Pedro das Águas';
                          vlrPensao     := 253.30;
                        end;
                  end;
                end;
            end;
        end;
    end;
end;

// S-1202 – Remuneração do Servidor vinculado a Regime Próprio de Previdência Social - RPPS
procedure TFExemploEsocial.GerareSocial1202;
begin
  with ACBreSocial1.Eventos.Periodicos.S1202.Add do
  begin
    EvtRmnRPPS.id     := '1';
//      evtRemun.versao := '2.0';

    EvtRmnRPPS.ideEvento.indRetif    := ireOriginal;
    //evtRemun.ideEvento.NrRecibo  := '4564654'; Numero do recibo que será retificado.
    EvtRmnRPPS.ideEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtRmnRPPS.ideEvento.perApur     := '052015';
    EvtRmnRPPS.ideEvento.TpAmb       := taProducao;
    EvtRmnRPPS.ideEvento.ProcEmi     := peAplicEmpregador;
    EvtRmnRPPS.ideEvento.VerProc     := '1.0';

    EvtRmnRPPS.ideEmpregador.TpInsc  := tiCNPJ;
    EvtRmnRPPS.ideEmpregador.NrInsc  := '012345678987654';

    EvtRmnRPPS.ideTrabalhador.cpfTrab    := '01234567890';
    EvtRmnRPPS.ideTrabalhador.nisTrab    := '09876543210';
    EvtRmnRPPS.ideTrabalhador.qtdDepIRRF := 0;

    {Os Grupos abaixo são opcionais
    O grupo abaixocorresponde a funcionários que tenham dois empregos em empresas diferentes
    with evtRemun.ideTrabalhador.infoMV.remunOutrEmpr.add do
      begin
        tpInsc     := tiCNPJ;
        nrInsc     := '01234567890123';
        vlrRemunOE := 1230.10;
      end;

    //o grupo abaixo corresponde apenas a trabalhadores cuja categoria não está sujeita ao evento de admissão
      ou TSV-início
    evtRemun.ideTrabalhador.infoComplem.nmTrab       := 'João das Neves';
    evtRemun.ideTrabalhador.infoComplem.dtNascto     := Date;
    evtRemun.ideTrabalhador.infoComplem.codCBO       := '000001';
    evtRemun.ideTrabalhador.infoComplem.natAtividade := navUrbano;
    evtRemun.ideTrabalhador.infoComplem.qtdDiasTrab  := 10;
          }
    //os dados abaixo só devem ser informados em caso do processo existir e houver decisão que incida sobre as  contribuições
    with EvtRmnRPPS.ideTrabalhador.procJudTrab.Add do
    begin
      tpTrib := tptrevidenciaria;
      nrProcJud := '9513570-33-2015-6-15-0258';
    end;

    with EvtRmnRPPS.ideTrabalhador.infoPerApur.recPgtos.Add do
    begin
      ideRecPgto := 123456;
      vrRec := 500.55;

      with remunPerApur.Add do
      begin
        matricula := 'A1234';
        codCateg  := 101;
        with itensRemun.Add do
        begin
          codRubr := '987654';
          //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
          qtdRubr := 100;
          vrUnit  := 3296.35;
          vrRubr  := 3330.30;
        end;

        with infoSaudeColet.detOper.Add do
        begin
          cnpjOper := '01234567898765';
          regANS   := 'A1B2C3';
          vrPgTit  := 1.50;
          with detPlano.Add do
          begin
            cpfDep      := '01234567898';
            dtNasctoDep := Date;
            nmDep       := 'José das Areias';
            relDep      := rdFilho;
            vlrPgDep    := 0.75;
          end;
        end;

        with pensaoAlim.Add do
        begin
          cpfBenef      := '01478523698';
          dtNasctoBenef := Date;
          nmBenefic     := 'Pedro das Águas';
          vlrPensao     := 330.30;
        end;
      end;
    end;

    with EvtRmnRPPS.ideTrabalhador.infoPerAnt.recPgtos.Add do//Remuneração em períodos anteriores(resultantes de convenção coletiva por exemplo)
    begin
      ideRecPgto := 000001;
      vrRec := 300.89;

      with idePeriodo.Add do
      begin
        perRef := '2015-03';
        with remunPerAnt.Add do
        begin
          matricula  := 'A1234';
          codCateg   := 101;
          with itensRemun.Add do
          begin
            codRubr := '987654';
            //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
            qtdRubr := 100;
            vrUnit  := 3296.35;
            vrRubr  := 3330.30;
          end;

          with pensaoAlim.Add do
          begin
            cpfBenef      := '01478523698';
            dtNasctoBenef := Date;
            nmBenefic     := 'Pedro das Águas';
            vlrPensao     := 253.30;
          end;
        end;
      end;
    end;
  end;
end;

// S-1210 – Pagamentos de Rendimentos do Trabalho
procedure TFExemploEsocial.GerareSocial1210;
begin
  with AcbreSocial1.Eventos.Periodicos.S1210.Add do
    begin
      EvtPgtos.id := '1';
//      EvtPgtos.versao := '2.0';

      EvtPgtos.IdeEvento.indRetif := ireOriginal;
//    EvtPgtos.IdeEvento.NrRecibo := 'A.00.NNNNNNNNNNNNNNNNNNN'; - obrigatório se indRetif = ireRetificacao.
      EvtPgtos.IdeEvento.IndApuracao := iapuMensal;
      EvtPgtos.IdeEvento.perApur := '052015';
      EvtPgtos.IdeEvento.TpAmb := taProducao;
      EvtPgtos.IdeEvento.ProcEmi := peAplicEmpregador;
      EvtPgtos.IdeEvento.VerProc := '1.0';

      EvtPgtos.IdeEmpregador.TpInsc := tiCNPJ;
      EvtPgtos.IdeEmpregador.NrInsc := '9632587410123';

      EvtPgtos.IdeBenef.CpfBenef := '0147852369';
      with EvtPgtos.IdeBenef.InfoPgto.Add do
        begin
          DtPgto := StrToDate('10/06/2015');
          IndResBr := tpNao;
          tpPgto := tpPgtoResc2299;
          //-OS GRUPOS ABAIXO SÃO OPCIONAIS
          //grupo detPgtoFl
          //detPgtoFl.perRef  := '052015';
          //detPgtoFl.vlrPgto := 12365.43;
          //detPgtoFl.ideRecPgto := 1;
          //grupo detPgtoResc OBRIGATÓRIO se tpPgto=2
          //detPgtoResc.vlrPgto := 12365.43;
          //detPgtoResc.ideRecPgto := 1;
          //detPgtoResc.nrRecArq := 'A.00.NNNNNNNNNNNNNNNNNNN';
          //grupo idePgtoExt
          IdePgtoExt.idePais.codPais := '116';
          IdePgtoExt.idePais.indNIF := infBeneficiaNIF;
          IdePgtoExt.idePais.nifBenef := 'ABCDEFGH123456789';
          IdePgtoExt.endExt.dscLograd := 'Abbey Road St';
          IdePgtoExt.endExt.nrLograd := '93';
          IdePgtoExt.endExt.complem := 'apto 11';
          IdePgtoExt.endExt.bairro := 'Sgt Peppers';
          IdePgtoExt.endExt.nmCid := 'Liverpool';
          IdePgtoExt.endExt.codPostal := '9999999999';
        end;

    end;
end;

procedure TFExemploEsocial.GerareSocial1220;
begin
  with ACBreSocial1.Eventos.Periodicos.S1220.Add do
  begin
    EvtPgtosNI.id     := '1';
//    EvtPgtosNI.Versao := '2.0';

    EvtPgtosNI.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtPgtosNI.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtPgtosNI.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtPgtosNI.IdeEvento.perApur     := '2015-06';
    EvtPgtosNI.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtPgtosNI.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtPgtosNI.IdeEvento.VerProc     := '1.0';

    EvtPgtosNI.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtPgtosNI.IdeEmpregador.NrInsc := '0123456789';

    with EvtPgtosNI.InfoPgto.Add do
    begin
      dtPgto  := now;
      perRef  := '2015-06';
      vlrLiq  := 5000.00;
      vlrReaj := 5420.00;
      vlrIRRF := 420.00;
    end;

    with EvtPgtosNI.InfoPgto.Add do
    begin
      dtPgto  := now;
      perRef  := '2015-06';
      vlrLiq  := 4000.00;
      vlrReaj := 4320.00;
      vlrIRRF := 320.00;
    end;

    with EvtPgtosNI.InfoPgto.Add do
    begin
      dtPgto  := now;
      perRef  := '2015-06';
      vlrLiq  := 1000.00;
      vlrReaj := 1000.00;
      vlrIRRF := 0.00;
    end;
  end;
end;

// S-1250 – Aquisição de Produção Rural
procedure TFExemploEsocial.GerareSocial1250;
begin
  with ACBreSocial1.Eventos.Periodicos.S1250.Add do
  begin
    EvtAqProd.id     := '1';
//    EvtAqProd.Versao := '2.0';

    EvtAqProd.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtAqProd.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtAqProd.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtAqProd.IdeEvento.perApur     := '2015-06';
    EvtAqProd.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtAqProd.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtAqProd.IdeEvento.VerProc     := '1.0';

    EvtAqProd.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtAqProd.IdeEmpregador.NrInsc := '0123456789';

    EvtAqProd.InfoAquisProd.IdeEstabAdquir.tpInscAdq := tpTpInsc(0);
    EvtAqProd.InfoAquisProd.IdeEstabAdquir.nrInscAdq := '12345678910001';

    with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Add do
    begin
      indAquis := tpIdAquis(0);
      vlrTotAquis := 520000.80;

      with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Add do
      begin
        tpInscProd  := tpTpInsc(0);
        nrInscProd  := '987654321000156';
        vlrBruto    := 4000.54;
        vrCPDescPR  := 3850.32;
        vrRatDescPR := 500.30;
        vrSenarDesc := 2500.30;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].InfoProcJud.Add do
          begin
            nrProcJud   := '56464897';
            vrCPNRet    := 99999.99;
            vrRatNRet   := 88888.88;
            vrSenarNRet := 77777.77;
          end;
      end;


      with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Add do
      begin
        tpInscProd  := tpTpInsc(0);
        nrInscProd  := '987654321000156';
        vlrBruto    := 4000.54;
        vrCPDescPR  := 3850.32;
        vrRatDescPR := 500.30;
        vrSenarDesc := 2500.30;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].InfoProcJud.Add do
          begin
            nrProcJud   := '56464897';
            vrCPNRet    := 99999.99;
            vrRatNRet   := 88888.88;
            vrSenarNRet := 77777.77;
          end;
      end;

    end;
  end;
end;

// S-1260 – Comercialização da Produção Rural Pessoa Física
procedure TFExemploEsocial.GerareSocial1260;
begin
  with ACBreSocial1.Eventos.Periodicos.S1260.Add do
  begin
    EvtComProd.id     := '1';
//    EvtComProd.Versao := '2.0';

    EvtComProd.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtComProd.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtComProd.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtComProd.IdeEvento.perApur     := '2015-06';
    EvtComProd.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtComProd.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtComProd.IdeEvento.VerProc     := '1.0';

    EvtComProd.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtComProd.IdeEmpregador.NrInsc := '0123456789';

    EvtComProd.InfoComProd.IdeEstabel.nrInscEstabRural := '123456789';

    with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Add do
    begin
      indComerc := tpIndComerc(0);
      vrTotCom  := 5000.80;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;
    end;

    with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Add do
    begin
      indComerc := tpIndComerc(1);
      vrTotCom  := 5000.80;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        //vrRetPR  := 9999.99;--excluido na versão 2.1
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;
    end;
    with EvtComProd.InfoComProd.IdeEstabel.InfoProcJud.Add do
      begin
        tpProc := tpJudicial;
        nrProcJud := '11111111111111';
      end;

  end;
end;

// S-1270 – Contratação de Trabalhadores Avulsos Não Portuários
procedure TFExemploEsocial.GerareSocial1270;
begin
  with ACBreSocial1.Eventos.Periodicos.S1270.Add do
  begin
    EvtContratAvNP.id     := '1';
//    EvtContratAvNP.Versao := '2.0';

    EvtContratAvNP.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtContratAvNP.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtContratAvNP.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtContratAvNP.IdeEvento.perApur     := '2015-06';
    EvtContratAvNP.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtContratAvNP.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtContratAvNP.IdeEvento.VerProc     := '1.0';

    EvtContratAvNP.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtContratAvNP.IdeEmpregador.NrInsc := '0123456789';

    with EvtContratAvNP.InfoRemunAvNP.IdeSind.Add do
    begin
      cnpjSind := '123456789000117';
      fpasSind := 515;
      codTercs := '1356';

      with EvtContratAvNP.InfoRemunAvNP.IdeSind.Items[0].RemunAvNP.Add do
      begin
        tpInsc   := tpTpInscEstab(0);
        nrInsc   := '987654321000156';
        vlrRemun := 4000.54;
        vr13     := 3850.32;
        vrDescCP := 500.30;
      end;

      with EvtContratAvNP.InfoRemunAvNP.IdeSind.Items[0].RemunAvNP.Add do
      begin
        tpInsc   := tpTpInscEstab(1);
        nrInsc   := '654321987000152';
        vlrRemun := 6000.25;
        vr13     := 4856.32;
        vrDescCP := 200.30;
      end;
    end;

    with EvtContratAvNP.InfoRemunAvNP.IdeSind.Add do
    begin
      cnpjSind := '999999999000199';
      fpasSind := 500;
      codTercs := '999';

      with EvtContratAvNP.InfoRemunAvNP.IdeSind.Items[1].RemunAvNP.Add do
      begin
        tpInsc   := tpTpInscEstab(2);
        nrInsc   := '987654321000156';
        vlrRemun := 100.54;
        vr13     := 200.32;
        vrDescCP := 300.30;
      end;

      with EvtContratAvNP.InfoRemunAvNP.IdeSind.Items[1].RemunAvNP.Add do
      begin
        tpInsc   := tpTpInscEstab(1);
        nrInsc   := '11111111111111';
        vlrRemun := 400.25;
        vr13     := 500.32;
        vrDescCP := 600.30;
      end;
    end;
  end;
end;

// S-1280 – Informações Complementares aos Eventos Periódicos
procedure TFExemploEsocial.GerareSocial1280;
begin
  with ACBreSocial1.Eventos.Periodicos.S1280.Add do
  begin
    EvtInfoComplPer.id     := '1';
//    EvtInfoComplPer.Versao := '2.0';

    EvtInfoComplPer.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtInfoComplPer.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtInfoComplPer.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtInfoComplPer.IdeEvento.perApur     := '2015-06';
    EvtInfoComplPer.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtInfoComplPer.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtInfoComplPer.IdeEvento.VerProc     := '1.0';

    EvtInfoComplPer.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtInfoComplPer.IdeEmpregador.NrInsc := '0123456789';

   // EvtInfoComplPer.InfoDeson.percRed11774 := 123456.4001;--removido na versão 2.1

    EvtInfoComplPer.InfoSubstPatr.indSubstPatr   := tpIndSubstPatrOpPort(0);
    EvtInfoComplPer.InfoSubstPatr.percRedContrib := 500.20;

    with EvtInfoComplPer.InfoSubstPatr.InfoSubstPatrOpPort.Add do
    begin
      cnpjOpPortuario      := '12345678900112';
      indSubstPatrOpPort   := tpIndSubstPatrOpPort(0);
      percRedContribOpPort := 1000.20;
    end;

    with EvtInfoComplPer.InfoSubstPatr.InfoSubstPatrOpPort.Add do
    begin
      cnpjOpPortuario      := '987654321000145';
      indSubstPatrOpPort   := tpIndSubstPatrOpPort(1);
      percRedContribOpPort := 5000.20;
    end;

    EvtInfoComplPer.InfoAtivConcom.fatorMes := 99999.99;
    EvtInfoComplPer.InfoAtivConcom.fator13  := 1111.11;
  end;
end;

// S-1298 – Reabertura dos Eventos Periódicos
procedure TFExemploEsocial.GerareSocial1298;
begin
  with ACBreSocial1.Eventos.Periodicos.S1298.Add do
  begin
    EvtReabreEvPer.id     := '1';
//    EvtReabreEvPer.Versao := '2.0';

    EvtReabreEvPer.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtReabreEvPer.IdeEvento.perApur     := '2015-06';
    EvtReabreEvPer.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtReabreEvPer.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtReabreEvPer.IdeEvento.VerProc     := '1.0';

    EvtReabreEvPer.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtReabreEvPer.IdeEmpregador.NrInsc := '0123456789';
  end;
end;

// S-1299 – Fechamento dos Eventos Periódicos
procedure TFExemploEsocial.GerareSocial1299;
begin
  with ACBreSocial1.Eventos.Periodicos.S1299.Add do
  begin
    EvtFechaEvPer.id     := '1';
//    EvtFechaEvPer.Versao := '2.0';

    EvtFechaEvPer.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtFechaEvPer.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtFechaEvPer.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtFechaEvPer.IdeEvento.perApur     := '2015-06';
    EvtFechaEvPer.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtFechaEvPer.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtFechaEvPer.IdeEvento.VerProc     := '1.0';

    EvtFechaEvPer.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtFechaEvPer.IdeEmpregador.NrInsc := '0123456789';

    EvtFechaEvPer.IdeRespInf.nmResp   := 'Responsavel teste';
    EvtFechaEvPer.IdeRespInf.cpfResp  := '12345678950';
    EvtFechaEvPer.IdeRespInf.telefone := '46 - 22222222';
    EvtFechaEvPer.IdeRespInf.email    := 'Responsavelteste@email.com';

    EvtFechaEvPer.InfoApur.indApurAliqFap := tpIndApurAliqFap(1);

    EvtFechaEvPer.InfoFech.evtRemun        := tpSimNao(0);
    EvtFechaEvPer.InfoFech.evtPgtos        := tpSimNao(1);
    EvtFechaEvPer.InfoFech.evtPgtosNI      := tpSimNao(0);
    EvtFechaEvPer.InfoFech.evtAqProd       := tpSimNao(1);
    EvtFechaEvPer.InfoFech.evtComProd      := tpSimNao(0);
    EvtFechaEvPer.InfoFech.evtContratAvNP  := tpSimNao(1);
    EvtFechaEvPer.InfoFech.evtInfoComplPer := tpSimNao(0);
    EvtFechaEvPer.InfoFech.compSemMovto    := '07-2015';

    EvtFechaEvPer.InfoFech.InfoExercAnt.movFinancSocios := tpSimNao(0);
  end;
end;

// S-1300 – Contribuição Sindical Patronal
procedure TFExemploEsocial.GerareSocial1300;
begin
  with ACBreSocial1.Eventos.Periodicos.S1300.Add do
  begin
    EvtContrSindPatr.id     := '1';
//    EvtContrSindPatr.Versao := '2.0';

    EvtContrSindPatr.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtContrSindPatr.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtContrSindPatr.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtContrSindPatr.IdeEvento.perApur     := '2015-06';
    EvtContrSindPatr.IdeEvento.TpAmb       := TpTpAmb(1);
    EvtContrSindPatr.IdeEvento.ProcEmi     := TpProcEmi(1);
    EvtContrSindPatr.IdeEvento.VerProc     := '1.0';

    EvtContrSindPatr.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtContrSindPatr.IdeEmpregador.NrInsc := '0123456789';

    with EvtContrSindPatr.ContribSind.Add do
    begin
      cnpjSindic      := '01234567891111';
      tpContribSind   := tpTpContribSind(0);
      dtRecolhCS      := Now;
      vlrContribSind  := 1500.50;
      vlrEncContrSinc := 500.20;
    end;
  end;
end;

{$EndRegion}


{$Region 'Eventos Não Periódicos'}

// S-2190 - Admissão de Trabalhador - Registro Preliminar
procedure TFExemploEsocial.GerareSocial2190;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2190.Add do
  begin
    EvtAdmPrelim.id     := '1';
//    EvtAdmPrelim.Versao := '2.0';

//    EvtAdmPrelim.IdeEvento.indRetif := tpIndRetificacao(1);
    EvtAdmPrelim.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtAdmPrelim.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtAdmPrelim.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtAdmPrelim.IdeEvento.VerProc  := '1.0';

    EvtAdmPrelim.IdeEmpregador.TpInsc  := tpTpInsc(1);
    EvtAdmPrelim.IdeEmpregador.NrInsc  := '0123456789';

    EvtAdmPrelim.InfoRegPrelim.cpfTrab := '12345678911';
    EvtAdmPrelim.InfoRegPrelim.dtNascto := now-9125;
    EvtAdmPrelim.InfoRegPrelim.dtAdm := Now;
  end;
end;

// S-2200 - Admissão de Trabalhador
procedure TFExemploEsocial.GerareSocial2200;
var
  Colaborador: TViewPessoaColaboradorVO;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2200.Add do
  begin
    EvtAdmissao.id     := '1';
//    EvtAdmissao.Versao := '2.0';

 //   EvtAdmissao.IdeEvento.indRetif := tpIndRetificacao(1);
    EvtAdmissao.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtAdmissao.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtAdmissao.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtAdmissao.IdeEvento.VerProc  := '1.0';

    EvtAdmissao.IdeEmpregador.TpInsc  := tpTpInsc(1);
    EvtAdmissao.IdeEmpregador.NrInsc  := Copy(Empresa.Cnpj, 1, 8);

    EvtAdmissao.Trabalhador.CpfTrab   := Colaborador.CpfCnpj;
    EvtAdmissao.Trabalhador.NisTrab   := '654646464';
    EvtAdmissao.Trabalhador.NmTrab    := Colaborador.Nome;
    EvtAdmissao.Trabalhador.Sexo      := 'M';
    EvtAdmissao.Trabalhador.RacaCor   := 1;
    EvtAdmissao.Trabalhador.EstCiv    := 1;
    EvtAdmissao.Trabalhador.GrauInstr := 10;

    EvtAdmissao.Trabalhador.Nascimento.DtNascto   := date;
    EvtAdmissao.Trabalhador.Nascimento.codMunic   := 51268;
    EvtAdmissao.Trabalhador.Nascimento.UF         := 'PR';
    EvtAdmissao.Trabalhador.Nascimento.PaisNascto := '565';
    EvtAdmissao.Trabalhador.Nascimento.PaisNac    := '545';
    EvtAdmissao.Trabalhador.Nascimento.NmMae      := 'teste mae';
    EvtAdmissao.Trabalhador.Nascimento.NmPai      := 'teste pai';

    EvtAdmissao.Trabalhador.Documentos.CTPS.NrCtps    := '56454';
    EvtAdmissao.Trabalhador.Documentos.CTPS.SerieCtps := '646';
    EvtAdmissao.Trabalhador.Documentos.CTPS.UfCtps    := 'PR';

    EvtAdmissao.Trabalhador.Documentos.RIC.NrRic        := '123123';
    EvtAdmissao.Trabalhador.Documentos.RIC.OrgaoEmissor := 'SSP';
    EvtAdmissao.Trabalhador.Documentos.RIC.DtExped      := date;

    EvtAdmissao.Trabalhador.Documentos.RG.NrRg         := Colaborador.RgIe;
    EvtAdmissao.Trabalhador.Documentos.RG.OrgaoEmissor := 'SSP';
    EvtAdmissao.Trabalhador.Documentos.RG.DtExped      := date;

    EvtAdmissao.Trabalhador.Documentos.RNE.NrRne        := '123123';
    EvtAdmissao.Trabalhador.Documentos.RNE.OrgaoEmissor := 'SSP';
    EvtAdmissao.Trabalhador.Documentos.RNE.DtExped      := date;

    EvtAdmissao.Trabalhador.Documentos.OC.NrOc         := '999';
    EvtAdmissao.Trabalhador.Documentos.OC.OrgaoEmissor := 'SSP';
    EvtAdmissao.Trabalhador.Documentos.OC.DtExped      := Date;
    EvtAdmissao.Trabalhador.Documentos.OC.DtValid      := Date;

    EvtAdmissao.Trabalhador.Documentos.CNH.nrRegCnh     := '999';
    EvtAdmissao.Trabalhador.Documentos.CNH.DtExped      := Date;
    EvtAdmissao.Trabalhador.Documentos.CNH.ufCnh        := tpuf(ufPR);
    EvtAdmissao.Trabalhador.Documentos.CNH.DtValid      := Date;
    EvtAdmissao.Trabalhador.Documentos.CNH.dtPriHab     := Date;
    EvtAdmissao.Trabalhador.Documentos.CNH.categoriaCnh := tpCnh(cnA);

    EvtAdmissao.Trabalhador.Endereco.Brasil.TpLograd    := 'RUA';
    EvtAdmissao.Trabalhador.Endereco.Brasil.DscLograd   := Colaborador.Logradouro;
    EvtAdmissao.Trabalhador.Endereco.Brasil.NrLograd    := Colaborador.Numero;
    EvtAdmissao.Trabalhador.Endereco.Brasil.Complemento := Colaborador.Complemento;
    EvtAdmissao.Trabalhador.Endereco.Brasil.Bairro      := Colaborador.Bairro;
    EvtAdmissao.Trabalhador.Endereco.Brasil.Cep         := Colaborador.Cep;
    EvtAdmissao.Trabalhador.Endereco.Brasil.CodMunic    := Colaborador.MunicipioIbge;
    EvtAdmissao.Trabalhador.Endereco.Brasil.UF          := tpuf(ufPR);

    EvtAdmissao.Trabalhador.Endereco.Exterior.PaisResid   := '545';
    EvtAdmissao.Trabalhador.Endereco.Exterior.DscLograd   := 'TESTE';
    EvtAdmissao.Trabalhador.Endereco.Exterior.NrLograd    := '777';
    EvtAdmissao.Trabalhador.Endereco.Exterior.Complemento := 'AP 101';
    EvtAdmissao.Trabalhador.Endereco.Exterior.Bairro      := 'CENTRO';
    EvtAdmissao.Trabalhador.Endereco.Exterior.NmCid       := 'CIDADE EXTERIOR';
    EvtAdmissao.Trabalhador.Endereco.Exterior.CodPostal   := '50000';

    EvtAdmissao.Trabalhador.TrabEstrangeiro.DtChegada        := Date;
    EvtAdmissao.Trabalhador.TrabEstrangeiro.ClassTrabEstrang := tpClassTrabEstrang(ctVistoPermanente);
    EvtAdmissao.Trabalhador.TrabEstrangeiro.CasadoBr         := 'N';
    EvtAdmissao.Trabalhador.TrabEstrangeiro.FilhosBr         := 'N';

    EvtAdmissao.Trabalhador.InfoDeficiencia.DefFisica      := tpNao;
    EvtAdmissao.Trabalhador.InfoDeficiencia.DefVisual      := tpNao;
    EvtAdmissao.Trabalhador.InfoDeficiencia.DefAuditiva    := tpNao;
    EvtAdmissao.Trabalhador.InfoDeficiencia.DefMental      := tpNao;
    EvtAdmissao.Trabalhador.InfoDeficiencia.DefIntelectual := tpNao;
    EvtAdmissao.Trabalhador.InfoDeficiencia.ReabReadap     := tpSimNao(tpSim);
    EvtAdmissao.Trabalhador.InfoDeficiencia.Observacao     := 'sem deficiencia';

    with EvtAdmissao.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdConjuge);
      nmDep    := 'Dependente 1';
      dtNascto := Date;
      cpfDep   := '575487587';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
      //depRPPS  := tpSimNao(tpNao);Removido na versão 2.1
    end;

    with EvtAdmissao.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdFilhoOuEnteadoAte21Anos);
      nmDep    := 'Dependente 2';
      dtNascto := Date;
      cpfDep   := '575487587';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
     // depRPPS  := tpSimNao(tpNao);Removido na versão 2.1
    end;

    EvtAdmissao.Trabalhador.Aposentadoria.TrabAposent := 'N';

    EvtAdmissao.Trabalhador.Contato.FonePrinc     := '91067240';
    EvtAdmissao.Trabalhador.Contato.FoneAlternat  := '91067240';
    EvtAdmissao.Trabalhador.Contato.EmailPrinc    := 'TESTE@email.com.br';
    EvtAdmissao.Trabalhador.Contato.EmailAlternat := 'teste@teste.com';

    EvtAdmissao.Vinculo.Matricula      := Colaborador.Matricula;
    EvtAdmissao.Vinculo.TpRegTrab      := tpTpRegTrab(1);
    EvtAdmissao.Vinculo.TpRegPrev      := tpTpRegPrev(1);
    EvtAdmissao.Vinculo.NrRecInfPrelim := '9999999999';

    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.DtAdm             := Date;
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.TpAdmissao        := tpTpAdmissao(1);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.IndAdmissao       := tpTpIndAdmissao(iaNormal);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.TpRegJor          := tpTpRegJor(1);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.NatAtividade      := tpNatAtividade(navUrbano);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.dtBase            := 03;
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.cnpjSindCategProf := '65469879875454';

    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.FGTS.OpcFGTS   := tpOpcFGTS(ofOptante);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.FGTS.DtOpcFGTS := Date;

    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.MtvContrat := tpMtvContrat(2);

    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.TpInsc := 1;
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.NrInsc := '564564656';

    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTrabSubstituido.CpfTrabSubst    := '8978765756';
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTrabSubstituido.MatricTrabSubst := '599867888888888';

    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoEstatutario.IndProvim   := tpIndProvim(ipNormal);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoEstatutario.TpProv      := tpTpProv(tpNomeacaoCargoEfetivo);
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoEstatutario.DtNomeacao  := Date;
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoEstatutario.DtPosse     := Date;
    EvtAdmissao.Vinculo.InfoRegimeTrab.InfoEstatutario.DtExercicio := Date;

    EvtAdmissao.Vinculo.InfoContrato.CodCargo  := '545';
    EvtAdmissao.Vinculo.InfoContrato.CodFuncao := '5456';
    EvtAdmissao.Vinculo.InfoContrato.CodCateg  := 1;

    EvtAdmissao.Vinculo.InfoContrato.Remuneracao.VrSalFx    := 5000;
    EvtAdmissao.Vinculo.InfoContrato.Remuneracao.UndSalFixo := tpUndSalFixo(5);
    EvtAdmissao.Vinculo.InfoContrato.Remuneracao.DscSalVar  := 'nada a declarar';

    EvtAdmissao.Vinculo.InfoContrato.Duracao.TpContr := tpTpContr(1);
    EvtAdmissao.Vinculo.InfoContrato.Duracao.dtTerm  := Date;

    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.TpInsc   := tiCNPJ;
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.NrInsc   := '213546';
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.DescComp := 'Descricao local geral teste';

    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.TpLograd    := 123;
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.DscLograd   := 'LOCAL DOMESTICO';
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.NrLograd    := '111';
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Complemento := 'Complemento';
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Bairro      := 'Bairro';
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Cep         := '85202630';
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.CodMunic    := 123;
    EvtAdmissao.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Uf          := tpuf(ufPR);

    EvtAdmissao.Vinculo.InfoContrato.HorContratual.QtdHrsSem := 44;
    EvtAdmissao.Vinculo.InfoContrato.HorContratual.TpJornada := tpTpJornada(1);
    EvtAdmissao.Vinculo.InfoContrato.HorContratual.DscTpJorn := 'horario contratual';

    with EvtAdmissao.Vinculo.InfoContrato.HorContratual.horario.Add do
    begin
      Dia := tpTpDia(diSegundaFeira);
      CodHorContrat := '54';
    end;

    with EvtAdmissao.Vinculo.InfoContrato.HorContratual.horario.Add do
    begin
      Dia := tpTpDia(diTercaFeira);
      CodHorContrat := '10';
    end;

    EvtAdmissao.Vinculo.InfoContrato.FiliacaoSindical.CnpjSindTrab := '223456000152';
    EvtAdmissao.Vinculo.InfoContrato.AlvaraJudicial.NrProcJud      := '123';
    EvtAdmissao.Vinculo.SucessaoVinc.Cnpj                          := '54654000155';
    EvtAdmissao.Vinculo.SucessaoVinc.MatricAnt                     := '123';
    EvtAdmissao.Vinculo.SucessaoVinc.DtIniVinculo                  := Date;
    EvtAdmissao.Vinculo.SucessaoVinc.Observacao                    := 'transferido';

    EvtAdmissao.Vinculo.InfoASO.DtAso    := Now;
    EvtAdmissao.Vinculo.InfoASO.NrCRM    := '99999';
    EvtAdmissao.Vinculo.InfoASO.UfCRM    := tpuf(ufPR);
  end;
end;

// S-2205 - Alteração de Dados Cadastrais do Trabalhador
procedure TFExemploEsocial.GerareSocial2205;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2205.Add do
  begin
    EvtAltCadastral.id     := '1';
//    EvtAltCadastral.Versao := '2.0';

    EvtAltCadastral.IdeEvento.indRetif := tpIndRetificacao(1);
    EvtAltCadastral.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtAltCadastral.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtAltCadastral.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtAltCadastral.IdeEvento.VerProc  := '1.0';

    EvtAltCadastral.IdeEmpregador.TpInsc  := tpTpInsc(1);
    EvtAltCadastral.IdeEmpregador.NrInsc  := '0123456789';

    EvtAltCadastral.IdeTrabalhador.CpfTrab   := '54564654564';

    EvtAltCadastral.dtAlteracao := NOW;

    EvtAltCadastral.Trabalhador.NisTrab   := '654646464';
    EvtAltCadastral.Trabalhador.NmTrab    := 'Empregado teste';
    EvtAltCadastral.Trabalhador.Sexo      := 'M';
    EvtAltCadastral.Trabalhador.RacaCor   := 1;
    EvtAltCadastral.Trabalhador.EstCiv    := 1;
    EvtAltCadastral.Trabalhador.GrauInstr := 10;

    EvtAltCadastral.Trabalhador.Nascimento.DtNascto   := date;
    EvtAltCadastral.Trabalhador.Nascimento.codMunic   := 51268;
    EvtAltCadastral.Trabalhador.Nascimento.UF         := 'PR';
    EvtAltCadastral.Trabalhador.Nascimento.PaisNascto := '565';
    EvtAltCadastral.Trabalhador.Nascimento.PaisNac    := '545';
    EvtAltCadastral.Trabalhador.Nascimento.NmMae      := 'teste mae';
    EvtAltCadastral.Trabalhador.Nascimento.NmPai      := 'teste pai';

    EvtAltCadastral.Trabalhador.Documentos.CTPS.NrCtps    := '56454';
    EvtAltCadastral.Trabalhador.Documentos.CTPS.SerieCtps := '646';
    EvtAltCadastral.Trabalhador.Documentos.CTPS.UfCtps    := 'PR';

    EvtAltCadastral.Trabalhador.Documentos.RIC.NrRic        := '123123';
    EvtAltCadastral.Trabalhador.Documentos.RIC.OrgaoEmissor := 'SSP';
    EvtAltCadastral.Trabalhador.Documentos.RIC.DtExped      := date;

    EvtAltCadastral.Trabalhador.Documentos.RG.NrRg         := '123123';
    EvtAltCadastral.Trabalhador.Documentos.RG.OrgaoEmissor := 'SSP';
    EvtAltCadastral.Trabalhador.Documentos.RG.DtExped      := date;

    EvtAltCadastral.Trabalhador.Documentos.RNE.NrRne        := '123123';
    EvtAltCadastral.Trabalhador.Documentos.RNE.OrgaoEmissor := 'SSP';
    EvtAltCadastral.Trabalhador.Documentos.RNE.DtExped      := date;

    EvtAltCadastral.Trabalhador.Documentos.OC.NrOc         := '999';
    EvtAltCadastral.Trabalhador.Documentos.OC.OrgaoEmissor := 'SSP';
    EvtAltCadastral.Trabalhador.Documentos.OC.DtExped      := Date;
    EvtAltCadastral.Trabalhador.Documentos.OC.DtValid      := Date;

    EvtAltCadastral.Trabalhador.Documentos.CNH.nrRegCnh     := '999';
    EvtAltCadastral.Trabalhador.Documentos.CNH.DtExped      := Date;
    EvtAltCadastral.Trabalhador.Documentos.CNH.ufCnh        := tpuf(ufPR);
    EvtAltCadastral.Trabalhador.Documentos.CNH.DtValid      := Date;
    EvtAltCadastral.Trabalhador.Documentos.CNH.dtPriHab     := Date;
    EvtAltCadastral.Trabalhador.Documentos.CNH.categoriaCnh := tpCnh(cnA);

    EvtAltCadastral.Trabalhador.Endereco.Brasil.TpLograd    := 'RUA';
    EvtAltCadastral.Trabalhador.Endereco.Brasil.DscLograd   := 'TESTE';
    EvtAltCadastral.Trabalhador.Endereco.Brasil.NrLograd    := '777';
    EvtAltCadastral.Trabalhador.Endereco.Brasil.Complemento := 'AP 101';
    EvtAltCadastral.Trabalhador.Endereco.Brasil.Bairro      := 'CENTRO';
    EvtAltCadastral.Trabalhador.Endereco.Brasil.Cep         := '85500000';
    EvtAltCadastral.Trabalhador.Endereco.Brasil.CodMunic    := 11111;
    EvtAltCadastral.Trabalhador.Endereco.Brasil.UF          := tpuf(ufPR);

    EvtAltCadastral.Trabalhador.Endereco.Exterior.PaisResid   := '545';
    EvtAltCadastral.Trabalhador.Endereco.Exterior.DscLograd   := 'TESTE';
    EvtAltCadastral.Trabalhador.Endereco.Exterior.NrLograd    := '777';
    EvtAltCadastral.Trabalhador.Endereco.Exterior.Complemento := 'AP 101';
    EvtAltCadastral.Trabalhador.Endereco.Exterior.Bairro      := 'CENTRO';
    EvtAltCadastral.Trabalhador.Endereco.Exterior.NmCid       := 'CIDADE EXTERIOR';
    EvtAltCadastral.Trabalhador.Endereco.Exterior.CodPostal   := '50000';

    EvtAltCadastral.Trabalhador.TrabEstrangeiro.DtChegada        := Date;
    EvtAltCadastral.Trabalhador.TrabEstrangeiro.ClassTrabEstrang := tpClassTrabEstrang(ctVistoPermanente);
    EvtAltCadastral.Trabalhador.TrabEstrangeiro.CasadoBr         := 'N';
    EvtAltCadastral.Trabalhador.TrabEstrangeiro.FilhosBr         := 'N';

    EvtAltCadastral.Trabalhador.InfoDeficiencia.DefFisica      := tpNao;
    EvtAltCadastral.Trabalhador.InfoDeficiencia.DefVisual      := tpNao;
    EvtAltCadastral.Trabalhador.InfoDeficiencia.DefAuditiva    := tpNao;
    EvtAltCadastral.Trabalhador.InfoDeficiencia.DefMental      := tpNao;
    EvtAltCadastral.Trabalhador.InfoDeficiencia.DefIntelectual := tpNao;
    EvtAltCadastral.Trabalhador.InfoDeficiencia.ReabReadap     := tpSimNao(tpSim);
    EvtAltCadastral.Trabalhador.InfoDeficiencia.Observacao     := 'sem deficiencia';

    with EvtAltCadastral.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdConjuge);
      nmDep    := 'Dependente 1';
      dtNascto := Date;
      cpfDep   := '575487587';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
      //depRPPS  := tpSimNao(tpNao);Removido na versão 2.1
    end;

    with EvtAltCadastral.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdFilhoOuEnteadoAte21Anos);
      nmDep    := 'Dependente 2';
      dtNascto := Date;
      cpfDep   := '575487587';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
    //  depRPPS  := tpSimNao(tpNao);Removido na versão 2.1
    end;

    EvtAltCadastral.Trabalhador.Aposentadoria.TrabAposent := 'N';

    EvtAltCadastral.Trabalhador.Contato.FonePrinc     := '91067240';
    EvtAltCadastral.Trabalhador.Contato.FoneAlternat  := '91067240';
    EvtAltCadastral.Trabalhador.Contato.EmailPrinc    := 'TESTE@email.com.br';
    EvtAltCadastral.Trabalhador.Contato.EmailAlternat := 'teste@teste.com';
  end;
end;

// S-2206 - Alteração de Contrato de Trabalho
procedure TFExemploEsocial.GerareSocial2206;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2206.Add do
    begin
      EvtAltContratual.id     := '1';
//      EvtAltContratual.versao := '2.0';

      EvtAltContratual.IdeEvento.indRetif := ireOriginal;
//    EvtAltContratual.IdeEvento.NrRecibo := 'A.00.NNNNNNNNNNNNNNNNNNN'; Obrigatório se indRetif = ireRetificacao;
      EvtAltContratual.IdeEvento.TpAmb := taProducao;
      EvtAltContratual.IdeEvento.ProcEmi := peAplicEmpregador;
      EvtAltContratual.IdeEvento.VerProc := '1.0';

      EvtAltContratual.IdeEmpregador.TpInsc := tiCNPJ;
      EvtAltContratual.IdeEmpregador.NrInsc := '98745632145698';

      EvtAltContratual.IdeVinculo.cpfTrab := '32165478910';
      EvtAltContratual.IdeVinculo.nisTrab := '96325874103';
      EvtAltContratual.IdeVinculo.matricula := 'A1234';

      EvtAltContratual.AltContratual.dtALteracao := Date;
      EvtAltContratual.AltContratual.Vinculo.TpRegTrab := trCLT;
      EvtAltContratual.AltContratual.Vinculo.TpRegPrev := rpRGPS;

      EvtAltContratual.AltContratual.infoRegimeTrab.InfoCeletista.TpRegJor := rjSubmetidosHorarioTrabalho;
      EvtAltContratual.AltContratual.infoRegimeTrab.InfoCeletista.NatAtividade := navUrbano;
      EvtAltContratual.AltContratual.infoRegimeTrab.InfoCeletista.dtBase := 08;
      EvtAltContratual.AltContratual.infoRegimeTrab.InfoCeletista.cnpjSindCategProf := '15975395135700';

      EvtAltContratual.AltContratual.infoContrato.CodCargo := '123';
      EvtAltContratual.AltContratual.infoContrato.CodFuncao := '321';
      EvtAltContratual.AltContratual.infoContrato.CodCateg := 001;

      EvtAltContratual.AltContratual.infoContrato.Remuneracao.VrSalFx := 780.00;
      EvtAltContratual.AltContratual.infoContrato.Remuneracao.UndSalFixo := sfPorMes;
      EvtAltContratual.AltContratual.infoContrato.Remuneracao.DscSalVar := 'Descrição de salário variável, obrigatório caso UndSalFixo for sfNaoAplicavel';

      EvtAltContratual.AltContratual.infoContrato.Duracao.TpContr := PrazoIndeterminado;
//    EvtAltContratual.AltContratual.infoContrato.Duracao.dtTerm  := Date; Obrigatório se TpContr = PrazoDeterminado!

      //LocalTrabGeral não deve ser preenchido no caso de trabalhador doméstico.
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabGeral.TpInsc := tiCNPJ;
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabGeral.NrInsc := '36985214789632';
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabGeral.DescComp := 'Descrição complementar do local de trabalho.';

      //LocalTrabDom - exclusivo para trabalhador doméstico, indicando endereço onde exerce suas atividades
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.TpLograd    := 001;
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.DscLograd   := 'Rua das Hortencias';
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.NrLograd    := '12';
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.Complemento := 'Fundos';
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.Bairro      := 'Jardim das Flores';
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.Cep         := '11001001';
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.CodMunic    := 1234567;
      EvtAltContratual.AltContratual.infoContrato.LocalTrabalho.LocalTrabDom.Uf          := ufPr;

      EvtAltContratual.AltContratual.infoContrato.HorContratual.QtdHrsSem := 44;
      EvtAltContratual.AltContratual.infoContrato.HorContratual.TpJornada := tjJornadaSemanalHorPadPorDiaSemanaFolgaFixa;
//    EvtAltContratual.AltContratual.infoContrato.HorContratual.DscTpJorn := 'Descrição do tipo de jornada, obrigatório se tpJornada = tjDemaisTiposJornada';

      with EvtAltContratual.AltContratual.infoContrato.HorContratual.horario.Add do
        begin
          Dia := diSegundaFeira;
          CodHorContrat := '001';
        end;

      EvtAltContratual.AltContratual.infoContrato.FiliacaoSindical.CnpjSindTrab := '12345678910112';

      EvtAltContratual.AltContratual.infoContrato.AlvaraJudicial.NrProcJud := '543216';

    end;
end;

// S-2210 - Comunicação de Acidente de Trabalho
procedure TFExemploEsocial.GerareSocial2210;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2210.Add do
  begin
    EvtCAT.id     := '1';
//    EvtCAT.Versao := '2.0';

    EvtCAT.IdeEvento.indRetif := tpIndRetificacao(0);
    EvtCAT.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtCAT.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtCAT.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtCAT.IdeEvento.VerProc  := '1.0';

    EvtCAT.IdeRegistrador.tpRegistrador := tpTpRegistrador(0);
    EvtCAT.IdeRegistrador.TpInsc        := tpTpInsc(1);
    EvtCAT.IdeRegistrador.NrInsc        := '9876543231';

    EvtCAT.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtCAT.IdeEmpregador.NrInsc := '0123456789';

    EvtCAT.IdeTrabalhador.cpfTrab := '564646464654';
    EvtCAT.IdeTrabalhador.nisTrab := '00640071000159';

    EvtCAT.Cat.dtAcid := Now;
    EvtCAT.Cat.TpAcid := tpTpAcid(3);
    EvtCAT.Cat.hrAcid := '12:00';

    EvtCAT.Cat.hrsTrabAntesAcid := '04:00';
    EvtCAT.Cat.tpCat            := tpTpCat(0);
   // EvtCAT.Cat.indCatParcial    := tpSimNao(tpSim);
    EvtCAT.Cat.indCatObito      := tpSimNao(tpNao);
    EvtCAT.Cat.indComunPolicia  := tpSimNao(tpSim);
    EvtCAT.Cat.codSitGeradora   := 1;
    EvtCAT.Cat.iniciatCAT       := tpIniciatCAT(1);
    EvtCAT.Cat.observacao       := 'Teste';

    EvtCAT.Cat.LocalAcidente.tpLocal       := tpTpLocal(1);
    EvtCAT.Cat.LocalAcidente.dscLocal      := 'Local Teste';
    EvtCAT.Cat.LocalAcidente.dscLograd     := 'Logradouro Teste';
    EvtCAT.Cat.LocalAcidente.nrLograd      := '111';
    EvtCAT.Cat.LocalAcidente.codMunic      := 123;
    EvtCAT.Cat.LocalAcidente.uf            := tpuf(ufPR);
    EvtCAT.Cat.LocalAcidente.cnpjLocalAcid := '123456789';

    with EvtCAT.Cat.ParteAtingida.Add do
    begin
      codParteAting := 1;
      lateralidade  := tpLateralidade(1);
    end;

    with EvtCAT.Cat.ParteAtingida.Add do
    begin
      codParteAting := 2;
      lateralidade  := tpLateralidade(2);
    end;

    with EvtCAT.Cat.ParteAtingida.Add do
    begin
      codParteAting := 3;
      lateralidade  := tpLateralidade(3);
    end;

    with EvtCAT.Cat.AgenteCausador.Add do
    begin
      codAgntCausador := 1;
    end;

    with EvtCAT.Cat.AgenteCausador.Add do
    begin
      codAgntCausador := 2;
    end;

    with EvtCAT.Cat.AgenteCausador.Add do
    begin
      codAgntCausador := 3;
    end;

    EvtCAT.Cat.Atestado.codCNES       := 1;
    EvtCAT.Cat.Atestado.dtAtendimento := now;
    EvtCAT.Cat.Atestado.hrAtendimento := '13:30';
    EvtCAT.Cat.Atestado.indInternacao := tpSimNao(tpSim);
    EvtCAT.Cat.Atestado.durTrat       := 5;
    EvtCAT.Cat.Atestado.indAfast      := tpSimNao(tpSim);
    EvtCAT.Cat.Atestado.dscLesao      := 'Lesão Teste';
    EvtCAT.Cat.Atestado.dscCompLesao  := 'Descricao complementar';
    EvtCAT.Cat.Atestado.diagProvavel  := 'Diagnostico teste';
    EvtCAT.Cat.Atestado.codCID        := '123';
    EvtCAT.Cat.Atestado.observacao    := 'Observação teste';

    EvtCAT.Cat.Atestado.Emitente.nmEmit := 'Emitente Teste';
    EvtCAT.Cat.Atestado.Emitente.ideOC  := tpIdeOC(1);
    EvtCAT.Cat.Atestado.Emitente.nrOc   := '456123';
    EvtCAT.Cat.Atestado.Emitente.ufOC   := tpuf(ufPR);

    EvtCAT.Cat.CatOrigem.dtCatOrig := now;
    EvtCAT.Cat.CatOrigem.nrCatOrig := '123456';
  end;
end;

// S-2220 - Monitoramento da Saúde do Trabalhador
procedure TFExemploEsocial.GerareSocial2220;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2220.Add do
  begin
    EvtASO.id     := '1';
//    EvtASO.Versao := '2.0';

    EvtASO.IdeEvento.indRetif := tpIndRetificacao(0);
    EvtASO.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtASO.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtASO.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtASO.IdeEvento.VerProc  := '1.0';

    EvtASO.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtASO.IdeEmpregador.NrInsc := '0123456789';

    EvtASO.IdeVinculo.cpfTrab   := '564646464654';
    EvtASO.IdeVinculo.nisTrab   := '00640071000159';
    EvtASO.IdeVinculo.matricula := '5000';

    EvtASO.Aso.DtAso  := Date;
    EvtASO.Aso.tpAso  := tpTpAso(1);
    EvtASO.Aso.ResAso := tpResAso(1);

    with EvtASO.Aso.Exame.Add do
    begin
      DtExm := Date;
      procRealizado := 123;
    end;

    with EvtASO.Aso.Exame.Add do
    begin
      DtExm := Date + 1;
      procRealizado := 456;
    end;

    with EvtASO.Aso.MonitBiolog.ResultMonit.Add do
    begin
      CodAgntQuim := '20';
      MatBiolog   := TpMatBiolog(1);
      codAnalise  := '545';
      interprExm  := tpInterprExm(1);
      ordExame    := tpOrdExame(1);
      dtIniMonit  := Date;
      dtFimMonit  := Date + 30;
      indResult   := tpIndResult(1);
    end;

    with EvtASO.Aso.MonitBiolog.ResultMonit.Add do
    begin
      CodAgntQuim := '40';
      MatBiolog   := TpMatBiolog(1);
      codAnalise  := '545';
      interprExm  := tpInterprExm(1);
      ordExame    := tpOrdExame(1);
      dtIniMonit  := Date - 20;
      dtFimMonit  := Date + 80;
      indResult   := tpIndResult(1);
    end;

    EvtASO.Aso.MonitBiolog.RespMonit.NisResp      := '65465';
    EvtASO.Aso.MonitBiolog.RespMonit.NrConsClasse := '7893';
    EvtASO.Aso.MonitBiolog.RespMonit.UfConsClasse := tpuf(ufPR);

    EvtASO.Aso.IdeServSaude.CodCNES          := '987654';
//    EvtASO.Aso.IdeServSaude.FrmCtt           := 'Telefone: 32200000'; -- removido na versão 2.1
    EvtASO.Aso.IdeServSaude.Email            := 'teste@teste.com';
    EvtASO.Aso.IdeServSaude.Medico.NmMed     := 'MEDICO TESTE';
    EvtASO.Aso.IdeServSaude.Medico.FrmCtt    := 'TELEFONE 2222-2454';
    EvtASO.Aso.IdeServSaude.Medico.CRM.NrCRM := '56446';
    EvtASO.Aso.IdeServSaude.Medico.CRM.UfCRM := tpuf(ufPR);
  end;
end;

// S-2230 - Afastamento Temporário
procedure TFExemploEsocial.GerareSocial2230;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2230.Add do
    begin
      EvtAfastTemp.id := '1';
//      EvtAfastTemp.versao := '2.0';

      EvtAfastTemp.IdeEvento.indRetif := ireOriginal;
//    EvtAfastTemp.IdeEvento.NrRecibo := 'A.00.NNNNNNNNNNNNNNNNNNN'; Obrigatório se indRetif=ireRetificacao
      EvtAfastTemp.IdeEvento.TpAmb := taProducao;
      EvtAfastTemp.IdeEvento.ProcEmi := peAplicEmpregador;
      EvtAfastTemp.IdeEvento.VerProc := '1.0';

      EvtAfastTemp.IdeEmpregador.TpInsc := tiCNPJ;
      EvtAfastTemp.IdeEmpregador.NrInsc := '09876543212345';

      EvtAfastTemp.IdeVinculo.cpfTrab := '54789632147';
      EvtAfastTemp.IdeVinculo.nisTrab := '01236987456';
      EvtAfastTemp.IdeVinculo.matricula := 'A123';

      EvtAfastTemp.infoAfastamento.iniAfastamento.DtIniAfast := incDay(Date, -10);
      EvtAfastTemp.infoAfastamento.iniAfastamento.codMotAfast := '16';
//    EvtAfastTemp.infoAfastamento.iniAfastamento.tpAcidTransito := tpatOutros; Obrigatório apenas se codMotAfast for {01,02,03,04}
      EvtAfastTemp.infoAfastamento.iniAfastamento.Observacao := 'Campo opcional, salvo quando codMotAfast=21 aí é obrigatória';

      EvtAfastTemp.infoAfastamento.iniAfastamento.infoAtestado.codCID := 'A01';
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoAtestado.qtDiasAfast := 13;
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoAtestado.Emitente.nmEmit := 'João das Neves';
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoAtestado.Emitente.ideOC := idCRM;
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoAtestado.Emitente.nrOc := '3690';
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoAtestado.Emitente.ufOC := ufPR;

      //infoCessao opcional usado para afastamento por cessão de funcionário. Ex.: Orgão Público, Sindicatos, etc...
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoCessao.cnpjCess := '78945612303216';
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoCessao.infOnus := ocCessionario;

      //infoMandSind opcional para cessão de funcionario para mandato sindical
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoMandSind.cnpjSind := '01478523698745';
      EvtAfastTemp.infoAfastamento.iniAfastamento.infoMandSind.infOnusRemun := orEmpregador;

      //Apenas alteração do MOTIVO de afastamento
      EvtAfastTemp.infoAfastamento.altAfastamento.dtAltMot := Date;
      EvtAfastTemp.infoAfastamento.altAfastamento.codMotAnt := '16';
      EvtAfastTemp.infoAfastamento.altAfastamento.codMotAfast := '15';
      EvtAfastTemp.infoAfastamento.altAfastamento.indEfRetroativo := tpSim;

      //informações de término do Afastamento
      EvtAfastTemp.infoAfastamento.fimAfastamento.dtTermAfast := incday(Date, 3);
      EvtAfastTemp.infoAfastamento.fimAfastamento.codMotAfast := '15';
      EvtAfastTemp.infoAfastamento.fimAfastamento.Observacao := 'Detalhar informações do afastamento, obrigatório so o motivo for {21}';
    end;
end;

// S-2240 - Condições Ambientais do Trabalho - Fatores de Risco
procedure TFExemploEsocial.GerareSocial2240;
var
  FatorRisco: TFolhaPppFatorRiscoVO;
  Colaborador: TViewPessoaColaboradorVO;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2240.Add do
    begin
      EvtExpRisco.id     := 'Id123';
//      EvtExpRisco.Versao := '1.2';


      /// EXERCICIO: Pegue os dados do colaborador e do fator de risco nas
      ///  tabelas da folha de pagamento

      EvtExpRisco.ideEvento.indRetif := ireOriginal;
      EvtExpRisco.ideEvento.nrRecibo       := '654654865656';
      EvtExpRisco.ideEvento.TpAmb          := taProducao;
      EvtExpRisco.ideEvento.ProcEmi        := peAplicEmpregador;
      EvtExpRisco.ideEvento.VerProc        := '1.0';

      EvtExpRisco.ideEmpregador.TpInsc := tiCNPJ;
      EvtExpRisco.ideEmpregador.NrInsc := Empresa.Cnpj;

      EvtExpRisco.IdeVinculo.CpfTrab   := Colaborador.CpfCnpj;
      EvtExpRisco.IdeVinculo.NisTrab   := '654646464';
      EvtExpRisco.IdeVinculo.Matricula := Colaborador.Matricula;

      EvtExpRisco.infoExpRisco.iniExpRisco.dtCondicao := FatorRisco.DataInicio;

      EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.codAmb := '12121212';

      EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.InfoAtiv.dscAtivDes := FatorRisco.FatorRisco;

      EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.FatRisco.codFatRis := FatorRisco.Tipo;
      EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.FatRisco.intConc := 'N/A';
      EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.FatRisco.tecMedicao := FatorRisco.TecnicaUtilizada;
      EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.FatRisco.utilizEPI := StrToInt(FatorRisco.EpiEficaz);

      with EvtExpRisco.infoExpRisco.iniExpRisco.InfoAmb.EPI.Add do
        begin
          caEPI := 'cert123';
          eficaciaEpi := tpSim;
          medProtecao := tpSim;
          condFuncto := tpSim;
          przValid := tpSim;
          periodicTroca := tpSim;
          higienizacao := tpSim;
        end;

      //alteração das informações de condições de ambiente de trabalho, opcional
       EvtExpRisco.infoExpRisco.altExpRisco.dtCondicao := Date;

      EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.codAmb := '12121212';

      EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.InfoAtiv.dscAtivDes := 'Descrição das atividades desempenhadas';

      EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.FatRisco.codFatRis := '101010';
      EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.FatRisco.intConc := 'N/A';
      EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.FatRisco.tecMedicao := 'Técnica de medição';
      EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.FatRisco.utilizEPI := 0;

      with EvtExpRisco.infoExpRisco.altExpRisco.InfoAmb.EPI.Add do
        begin
          caEPI := 'cert123';
          medProtecao := tpSim;
          condFuncto := tpSim;
          przValid := tpSim;
          periodicTroca := tpSim;
          higienizacao := tpSim;
        end;

      //fimExpRisco - opcional, informar quando o trabalhador não se sujeitar mais as condições de ambiente informadas anteriormente
      EvtExpRisco.infoExpRisco.fimExpRisco.dtFimCondicao := Date;

      EvtExpRisco.infoExpRisco.fimExpRisco.infoAmb.codAmb := '12121212';
      EvtExpRisco.infoExpRisco.fimExpRisco.infoAmb.InfoAtiv.dscAtivDes := 'Descrição das atividades exercidas';

    end;
end;

// S-2241 - Insalubridade, Periculosidade e Aposentadoria Especial
procedure TFExemploEsocial.GerareSocial2241;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2241.Add do
    begin
      EvtInsApo.id     := '1';
//      EvtInsApo.Versao := '1.2';

      EvtInsApo.ideEvento.indRetif := ireOriginal;
      EvtInsApo.ideEvento.nrRecibo       := '654654865656';
      EvtInsApo.ideEvento.TpAmb          := taProducao;
      EvtInsApo.ideEvento.ProcEmi        := peAplicEmpregador;
      EvtInsApo.ideEvento.VerProc        := '1.0';

      EvtInsApo.ideEmpregador.TpInsc := tiCNPJ;
      EvtInsApo.ideEmpregador.NrInsc := '00640071000159';

      EvtInsApo.IdeVinculo.CpfTrab   := '54564654564';
      EvtInsApo.IdeVinculo.NisTrab   := '654646464';
      EvtInsApo.IdeVinculo.Matricula := '564545';

      //InsalPeric - Informações de insalubridade e periculosidade
      EvtInsApo.InsalPeric.iniInsalPeric.DtiniCondicao := Date;
      EvtInsApo.InsalPeric.iniInsalPeric.InfoAmb.codAmb := '123456';
      EvtInsApo.InsalPeric.iniInsalPeric.InfoAmb.FatRisco.codFatRis := '22';
      EvtInsApo.InsalPeric.iniInsalPeric.InfoAmb.FatRisco.intConc := 'N/A';
      EvtInsApo.InsalPeric.iniInsalPeric.InfoAmb.FatRisco.tecMedicao := 'Técnica de Medição';

      //Opcional - usado para alterações nas condições de trabalho previamente informadas
      EvtInsApo.InsalPeric.altInsalPeric.DtaltCondicao := Date;
      EvtInsApo.InsalPeric.altInsalPeric.InfoAmb.codAmb := '123456';
      EvtInsApo.InsalPeric.altInsalPeric.InfoAmb.FatRisco.codFatRis := '22';
      EvtInsApo.InsalPeric.altInsalPeric.InfoAmb.FatRisco.intConc := 'N/A';
      EvtInsApo.InsalPeric.altInsalPeric.InfoAmb.FatRisco.tecMedicao := 'Técnica de Medição';

      //Opcional - usado quando cessarem as condições de trabalho previamente informadas
//      EvtInsApo.InsalPeric.fimInsalPeric.DtfimCondicao := Date;
//      EvtInsApo.InsalPeric.fimInsalPeric.InfoAmb.codAmb := '123456';

      //AposentEsp - Infomações de condições que ensejam aposentadoria especial
      EvtInsApo.AposentEsp.iniAposentEsp.DtiniCondicao := Date;
      EvtInsApo.AposentEsp.iniAposentEsp.InfoAmb.codAmb := '654321';
      EvtInsApo.AposentEsp.iniAposentEsp.InfoAmb.FatRisco.codFatRis := '23';
      EvtInsApo.AposentEsp.iniAposentEsp.InfoAmb.FatRisco.intConc := 'N/A';
      EvtInsApo.AposentEsp.iniAposentEsp.InfoAmb.FatRisco.tecMedicao := 'Técnica de Medição';

      //Opcional - usado para alterações nas condições de trabalho previamente informadas
      EvtInsApo.AposentEsp.altAposentEsp.DtaltCondicao := Date;
      EvtInsApo.AposentEsp.altAposentEsp.InfoAmb.codAmb := '654321';
      EvtInsApo.AposentEsp.altAposentEsp.InfoAmb.FatRisco.codFatRis := '23';
      EvtInsApo.AposentEsp.altAposentEsp.InfoAmb.FatRisco.intConc := 'N/A';
      EvtInsApo.AposentEsp.altAposentEsp.InfoAmb.FatRisco.tecMedicao := 'Técnica de Medição';

      //Opcional - usado quando cessarem as condições de trabalho previamente informadas
//      EvtInsApo.AposentEsp.fimAposentEsp.DtfimCondicao := Date;
//      EvtInsApo.AposentEsp.fimAposentEsp.InfoAmb.codAmb := '654321';
    end;
end;

// S-2250 - Aviso Prévio
procedure TFExemploEsocial.GerareSocial2250;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2250.Add do
  begin
    EvtAvPrevio.id     := '1';
//    EvtAvPrevio.Versao := '2.0';

    /// EXERCICIO: verifique a tabela FOLHA_RESCICAO

    EvtAvPrevio.IdeEvento.indRetif := tpIndRetificacao(0);
    EvtAvPrevio.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtAvPrevio.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtAvPrevio.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtAvPrevio.IdeEvento.VerProc  := '1.0';

    EvtAvPrevio.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtAvPrevio.IdeEmpregador.NrInsc := '0123456789';

    EvtAvPrevio.IdeVinculo.cpfTrab   := '564646464654';
    EvtAvPrevio.IdeVinculo.nisTrab   := '00640071000159';
    EvtAvPrevio.IdeVinculo.matricula := '123456';

    //aviso
    if cbAviso.ItemIndex = 0 then
    begin
      EvtAvPrevio.InfoAvPrevio.DetAvPrevio.dtAvPrv      := Now;
      EvtAvPrevio.InfoAvPrevio.DetAvPrevio.dtPrevDeslig := Now + 30;
      EvtAvPrevio.InfoAvPrevio.DetAvPrevio.tpAvPrevio   := tpTpAvPrevio(0);
      EvtAvPrevio.InfoAvPrevio.DetAvPrevio.observacao   := 'Observacao aviso previo';
    end
    else //cancelamento aviso
    begin
      EvtAvPrevio.InfoAvPrevio.CancAvPrevio.dtCancAvPrv     := Now;
      EvtAvPrevio.InfoAvPrevio.CancAvPrevio.mtvCancAvPrevio := tpMtvCancAvPrevio(0);
      EvtAvPrevio.InfoAvPrevio.CancAvPrevio.observacao      := 'Observacao cancelamento aviso previo';
    end;
  end;
end;

// S-2298 - Reintegração
procedure TFExemploEsocial.GerareSocial2298;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2298.Add do
  begin
    EvtReintegr.id     := '1';
//    EvtReintegr.Versao := '2.0';

    EvtReintegr.IdeEvento.indRetif := tpIndRetificacao(0);
    EvtReintegr.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtReintegr.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtReintegr.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtReintegr.IdeEvento.VerProc  := '1.0';

    EvtReintegr.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtReintegr.IdeEmpregador.NrInsc := '0123456789';

    EvtReintegr.IdeVinculo.cpfTrab   := '564646464654';
    EvtReintegr.IdeVinculo.nisTrab   := '00640071000159';
    EvtReintegr.IdeVinculo.matricula := '123456';

    EvtReintegr.InfoReintegr.tpReint       := tpTpReint(0);
    EvtReintegr.InfoReintegr.nrProcJud     := '999999999';
    EvtReintegr.InfoReintegr.dtEfetRetorno := Now + 20;
    EvtReintegr.InfoReintegr.dtEfeito      := Now;
    EvtReintegr.InfoReintegr.indPagtoJuizo := tpSimNao(tpSim);
  end;
end;

// S-2299 - Desligamento
procedure TFExemploEsocial.GerareSocial2299;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2299.Add do
    begin
      EvtDeslig.id     := '1';
//      EvtDeslig.Versao := '2.0';

      /// EXERCICIO: verifique a tabela FOLHA_RESCICAO

      EvtDeslig.IdeEvento.indRetif := tpIndRetificacao(0);
      EvtDeslig.IdeEvento.NrRecibo := '65.5454.987798798798';
      EvtDeslig.IdeEvento.TpAmb    := TpTpAmb(1);
      EvtDeslig.IdeEvento.ProcEmi  := TpProcEmi(1);
      EvtDeslig.IdeEvento.VerProc  := '1.0';

      EvtDeslig.IdeEmpregador.TpInsc := tpTpInsc(1);
      EvtDeslig.IdeEmpregador.NrInsc := '0123456789';

      EvtDeslig.IdeVinculo.cpfTrab   := '564646464654';
      EvtDeslig.IdeVinculo.nisTrab   := '00640071000159';
      EvtDeslig.IdeVinculo.matricula := '123456';

      EvtDeslig.InfoDeslig.mtvDeslig := '02';
      EvtDeslig.InfoDeslig.dtDeslig  := Date;
      EvtDeslig.InfoDeslig.indPagtoAPI := tpSim;
      EvtDeslig.InfoDeslig.dtProjFimAPI := IncDay(Now, 30);

      //Certidão de óbito apenas em caso de morte quando o mtvDeslig for 09 ou 10
      EvtDeslig.InfoDeslig.nrCertObito := '0123456789';

      //numero do processo que decidiu o desligamento mtvdeslig = 17
      EvtDeslig.InfoDeslig.nrProcTrab := '9632587410';

      //Obsercação opcional
      EvtDeslig.InfoDeslig.Observacao := 'Anotações relevantes sobre o desligamento que não tenham campo próprio';

      EvtDeslig.InfoDeslig.SucessaoVinc.Cnpj := '12345678912345';//Corrigir nome do campo ou mudar classe.

      with EvtDeslig.InfoDeslig.VerbasResc.RecPgtos.Add do
        begin
          IdeRecPgto := 012345;
          vlrPgto := 1236.32;
          with ideEstabLot.Add do
            begin
              tpInsc := tiCNPJ;
              nrInsc := '12345678987654';
              codLotacao := 'A1234';
              with detVerbas.Add do
                begin
                  codRubr := 'Pg123';
                  ideTabRubr := 'A01';
                  qtdRubr := 2;
                  vrUnit := 152.35;
                  vrRubr := 304.70;
                end;
              infoAgNocivo.grauExp := ge1;
              infoSimples.indSimples := idsIntegralmente;
            end;
        end;

      with EvtDeslig.InfoDeslig.VerbasResc.ProcJudTrab.Add do
        begin
          tpTrib := tptIRRF;
          nrProcJud := '0123654789';
        end;

      EvtDeslig.InfoDeslig.Quarentena.dtFimQuar := IncDay(Date, 45);

      EvtDeslig.InfoDeslig.InfoASO.DtAso := Date;//corrigir campo ou mudar classe;
      EvtDeslig.InfoDeslig.InfoASO.NrCRM := '0321566';
      EvtDeslig.InfoDeslig.InfoASO.UfCRM := ufPR;

    end;
end;

// S-2300 - Trabalhador Sem Vínculo - Início
procedure TFExemploEsocial.GerareSocial2300;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2300.Add do
    begin
      EvtTSVInicio.id := '1';
//      EvtTSVInicio.versao := '2.0';

      EvtTSVInicio.IdeEvento.TpAmb := taProducao;
      EvtTSVInicio.IdeEvento.ProcEmi := peAplicEmpregador;
      EvtTSVInicio.IdeEvento.VerProc := '1.0';

      EvtTSVInicio.IdeEmpregador.TpInsc := tiCNPJ;
      EvtTSVInicio.IdeEmpregador.NrInsc := '12345678987654';

      EvtTSVInicio.Trabalhador.CpfTrab := '98765432123';
      EvtTSVInicio.Trabalhador.NisTrab := '54789632145';
      EvtTSVInicio.Trabalhador.NmTrab  := 'João das Neve';
      EvtTSVInicio.Trabalhador.Sexo    := 'M';
      EvtTSVInicio.Trabalhador.RacaCor := 1;
      EvtTSVInicio.Trabalhador.EstCiv  := 1;
      EvtTSVInicio.Trabalhador.GrauInstr := 7;

      EvtTSVInicio.Trabalhador.Nascimento.dtNascto := Date;
      EvtTSVInicio.Trabalhador.Nascimento.codMunic := 4153623;
      EvtTSVInicio.Trabalhador.Nascimento.UF       := 'PR';
      EvtTSVInicio.Trabalhador.Nascimento.PaisNascto := '063';
      EvtTSVInicio.Trabalhador.Nascimento.PaisNac   := '105';
      EvtTSVInicio.Trabalhador.Nascimento.NmMae := 'Joana das Neve';
      EvtTSVInicio.Trabalhador.Nascimento.NmPai := 'Jose das Neve';

      EvtTSVInicio.Trabalhador.Documentos.CTPS.NrCtps := '01234567897';
      EvtTSVInicio.Trabalhador.Documentos.CTPS.SerieCtps := '00001';
      EvtTSVInicio.Trabalhador.Documentos.CTPS.UfCtps := 'PR';

      EvtTSVInicio.Trabalhador.Documentos.RIC.NrRic := '10203040506070';
      EvtTSVInicio.Trabalhador.Documentos.RIC.OrgaoEmissor := 'Orgão Emissor';
      EvtTSVInicio.Trabalhador.Documentos.RIC.DtExped := Date;

      EvtTSVInicio.Trabalhador.Documentos.RG.NrRg := '73062584';
      EvtTSVInicio.Trabalhador.Documentos.RG.OrgaoEmissor := 'SSP';
      EvtTSVInicio.Trabalhador.Documentos.RG.DtExped := Date;

      EvtTSVInicio.Trabalhador.Documentos.RNE.NrRne := '01020304050607';
      EvtTSVInicio.Trabalhador.Documentos.RNE.OrgaoEmissor := 'Orgao Emissor';
      EvtTSVInicio.Trabalhador.Documentos.RNE.DtExped := Date;

      EvtTSVInicio.Trabalhador.Documentos.OC.NrOc := '74108520963012';
      EvtTSVInicio.Trabalhador.Documentos.OC.OrgaoEmissor := 'CRProfissao';
      EvtTSVInicio.Trabalhador.Documentos.OC.DtExped := Date;
      EvtTSVInicio.Trabalhador.Documentos.OC.DtValid := Date;

      EvtTSVInicio.Trabalhador.Documentos.CNH.nrRegCnh     := '123654789632';
      EvtTSVInicio.Trabalhador.Documentos.CNH.DtExped      := Date;
      EvtTSVInicio.Trabalhador.Documentos.CNH.ufCnh        := ufPR;
      EvtTSVInicio.Trabalhador.Documentos.CNH.DtValid      := Date;
      EvtTSVInicio.Trabalhador.Documentos.CNH.dtPriHab     := Date;
      EvtTSVInicio.Trabalhador.Documentos.CNH.categoriaCnh := cnAB;

      EvtTSVInicio.Trabalhador.Endereco.Brasil.TpLograd    := 'R';
      EvtTSVInicio.Trabalhador.Endereco.Brasil.DscLograd   := 'Rua Parmenides';
      EvtTSVInicio.Trabalhador.Endereco.Brasil.NrLograd    := '123456';
      EvtTSVInicio.Trabalhador.Endereco.Brasil.Complemento := 'fundos';
      EvtTSVInicio.Trabalhador.Endereco.Brasil.Bairro      := 'Jd Filosofia';
      EvtTSVInicio.Trabalhador.Endereco.Brasil.Cep         := '88888888';
      EvtTSVInicio.Trabalhador.Endereco.Brasil.CodMunic    := 4141414;
      EvtTSVInicio.Trabalhador.Endereco.Brasil.UF          := ufPR;

      //Dados de trabalhador estrangeiro
      EvtTSVInicio.Trabalhador.Endereco.Exterior.PaisResid   := '063';
      EvtTSVInicio.Trabalhador.Endereco.Exterior.DscLograd   := 'St. Abbey Road';
      EvtTSVInicio.Trabalhador.Endereco.Exterior.NrLograd    := '123456';
      EvtTSVInicio.Trabalhador.Endereco.Exterior.Complemento := 'apto 010';
      EvtTSVInicio.Trabalhador.Endereco.Exterior.Bairro      := 'RubberSoul';
      EvtTSVInicio.Trabalhador.Endereco.Exterior.NmCid       := 'Buenos Aires';
      EvtTSVInicio.Trabalhador.Endereco.Exterior.CodPostal   := '987654';

      EvtTSVInicio.Trabalhador.TrabEstrangeiro.DtChegada        := Date;
      EvtTSVInicio.Trabalhador.TrabEstrangeiro.ClassTrabEstrang := ctVistoPermanente;
      EvtTSVInicio.Trabalhador.TrabEstrangeiro.CasadoBr         := 'S';
      EvtTSVInicio.Trabalhador.TrabEstrangeiro.FilhosBr         := 'N';

      //Dados de trabalhador com deficiencia
      EvtTSVInicio.Trabalhador.InfoDeficiencia.DefFisica      := tpNao;
      EvtTSVInicio.Trabalhador.InfoDeficiencia.DefVisual      := tpNao;
      EvtTSVInicio.Trabalhador.InfoDeficiencia.DefAuditiva    := tpNao;
      EvtTSVInicio.Trabalhador.InfoDeficiencia.DefMental      := tpNao;
      EvtTSVInicio.Trabalhador.InfoDeficiencia.DefIntelectual := tpNao;
      EvtTSVInicio.Trabalhador.InfoDeficiencia.ReabReadap     := tpSimNao(tpSim);
      EvtTSVInicio.Trabalhador.InfoDeficiencia.Observacao     := 'sem deficiencia';

      with EvtTSVInicio.Trabalhador.Dependente.Add do
        begin
          tpDep    := tpTpDep(tdConjuge);
          nmDep    := 'Dependente 1';
          dtNascto := Date;
          cpfDep   := '575487587';
          depIRRF  := tpSimNao(tpSim);
          depSF    := tpSimNao(tpNao);
        //depRPPS  := tpSimNao(tpNao);Removido na versão 2.1
        end;

      with EvtTSVInicio.Trabalhador.Dependente.Add do
        begin
          tpDep    := tpTpDep(tdFilhoOuEnteadoAte21Anos);
          nmDep    := 'Dependente 2';
          dtNascto := Date;
          cpfDep   := '575487587';
          depIRRF  := tpSimNao(tpSim);
          depSF    := tpSimNao(tpNao);
          //depRPPS  := tpSimNao(tpNao);Removido na versão 2.1
        end;

      EvtTSVInicio.Trabalhador.Contato.FonePrinc     := '91067240';
      EvtTSVInicio.Trabalhador.Contato.FoneAlternat  := '91067240';
      EvtTSVInicio.Trabalhador.Contato.EmailPrinc    := 'TESTE@email.com.br';
      EvtTSVInicio.Trabalhador.Contato.EmailAlternat := 'teste@teste.com';

      EvtTSVInicio.infoTSVInicio.codCateg := 101;
      EvtTSVInicio.infoTSVInicio.dtInicio := Date;
      EvtTSVInicio.infoTSVInicio.natAtivididade := navUrbano;

      EvtTSVInicio.infoTSVInicio.infoComplementares.cargoFuncao.codCargo  := '001';
      EvtTSVInicio.infoTSVInicio.infoComplementares.cargoFuncao.codFuncao := '001';

      EvtTSVInicio.infoTSVInicio.infoComplementares.Remuneracao.VrSalFx    := 1200.00;
      EvtTSVInicio.infoTSVInicio.infoComplementares.Remuneracao.UndSalFixo := sfPorMes;
      EvtTSVInicio.infoTSVInicio.infoComplementares.Remuneracao.DscSalVar  := 'Comissão de 1,2% sobre a venda do mês';

      EvtTSVInicio.infoTSVInicio.infoComplementares.Fgts.OpcFGTS   := ofOptante;
      EvtTSVInicio.infoTSVInicio.infoComplementares.Fgts.DtOpcFGTS := Date;

      //dados da empresa de origem do dirigente sindical
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoDirSind.categOrig  := 001;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoDirSind.cnpjOrigem := '12345678987654';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoDirSind.dtAdmOrig  := Date;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoDirSind.matricOrig := 'A1234';

      //Informações de trabalhador cedido, devem ser preenchidas exclusivamente pelo cessionário
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoTrabCedido.categOrig := 001;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoTrabCedido.cnpjCednt := '12345678987654';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoTrabCedido.matricCed := 'B4321';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoTrabCedido.dtAdmCed  := Date;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoTrabCedido.infOnus   := ocCedente;

      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.natEstagio  := neObrigatiorio;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.nivEstagio  := nvSuperior;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.areaAtuacao := 'Direito';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.nrApol      := '123456';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.vlrBolsa    := 600.00;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.dtPrevTerm  := IncMonth(Date, 12);

      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.cnpjInstEnsino := '12345678998765';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.nmRazao        := 'Nome da Instituição de Ensino';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.dscLograd      := 'R Pitagoras';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.nrLograd       := '1618';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.bairro         := 'Bairro Educacional';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.Cep            := '86086086';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.codMunic       := 4141414;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.instEnsino.Uf             := ufPR;

      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.cnpjAgntInteg := '98765432145678';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.nmRazao       := 'Nome da empresa';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.dscLograd     := 'R Adam Smith';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.nrLograd      := '9999';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.bairro        := 'Bairro Empresarial';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.Cep           := '86086086';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.codMunic      := 4141414;
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.ageIntegracao.Uf            := ufPR;

      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.supervisorEstagio.cpfSupervisor := '623236326532';
      EvtTSVInicio.infoTSVInicio.infoComplementares.infoEstagiario.supervisorEstagio.nmSuperv      := 'Pedro das Pedras';
    end;
end;

// S-2305 - Trabalhador Sem Vínculo - Alteração Contratual
procedure TFExemploEsocial.GerareSocial2305;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2305.Add do
    begin
      EvtTSVAltContr.id := '1';
//      EvtTSVAltContr.versao := '2.0';

      EvtTSVAltContr.IdeEvento.TpAmb := taProducao;
      EvtTSVAltContr.IdeEvento.ProcEmi := peAplicEmpregador;
      EvtTSVAltContr.IdeEvento.VerProc := '1.0';

      EvtTSVAltContr.IdeEmpregador.TpInsc := tiCNPJ;
      EvtTSVAltContr.IdeEmpregador.NrInsc := '12345678987654';

      EvtTSVAltContr.infoTSVAlteracao.dtAlteracao    := Date;
      EvtTSVAltContr.infoTSVAlteracao.natAtivididade := navUrbano;

      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.cargoFuncao.codCargo  := '001';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.cargoFuncao.codFuncao := '001';

      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.Remuneracao.VrSalFx    := 1200.00;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.Remuneracao.UndSalFixo := sfPorMes;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.Remuneracao.DscSalVar  := 'Comissão de 1,2% sobre a venda do mês';

      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.natEstagio  := neObrigatiorio;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.nivEstagio  := nvSuperior;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.areaAtuacao := 'Direito';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.nrApol      := '123456';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.vlrBolsa    := 600.00;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.dtPrevTerm  := IncMonth(Date, 12);

      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.cnpjInstEnsino := '12345678998765';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.nmRazao        := 'Nome da Instituição de Ensino';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.dscLograd      := 'R Pitagoras';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.nrLograd       := '1618';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.bairro         := 'Bairro Educacional';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.Cep            := '86086086';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.codMunic       := 4141414;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.instEnsino.Uf             := ufPR;

      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.cnpjAgntInteg := '98765432145678';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.nmRazao       := 'Nome da empresa';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.dscLograd     := 'R Adam Smith';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.nrLograd      := '9999';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.bairro        := 'Bairro Empresarial';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.Cep           := '86086086';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.codMunic      := 4141414;
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.ageIntegracao.Uf            := ufPR;

      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.supervisorEstagio.cpfSupervisor := '623236326532';
      EvtTSVAltContr.infoTSVAlteracao.infoComplementares.infoEstagiario.supervisorEstagio.nmSuperv      := 'Pedro das Pedras';
    end;
end;

// S-2399 - Trabalhador Sem Vínculo - Término
procedure TFExemploEsocial.GerareSocial2399;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S2399.Add do
    begin
       EvtTSVTermino.id     := '1';
//      EvtTSVTermino.Versao := '2.0';

      EvtTSVTermino.IdeEvento.indRetif := tpIndRetificacao(0);
      EvtTSVTermino.IdeEvento.NrRecibo := '65.5454.987798798798';
      EvtTSVTermino.IdeEvento.TpAmb    := TpTpAmb(1);
      EvtTSVTermino.IdeEvento.ProcEmi  := TpProcEmi(1);
      EvtTSVTermino.IdeEvento.VerProc  := '1.0';

      EvtTSVTermino.IdeEmpregador.TpInsc := tpTpInsc(1);
      EvtTSVTermino.IdeEmpregador.NrInsc := '0123456789';

      EvtTSVTermino.IdeTrabSemVInc.cpfTrab  := '12345678987';
      EvtTSVTermino.IdeTrabSemVInc.nisTrab  := '98765432123';
      EvtTSVTermino.IdeTrabSemVInc.codCateg := 001;

      EvtTSVTermino.InfoTSVTermino.dtTerm := Date;

      EvtTSVTermino.InfoTSVTermino.infoComplementares.mtvDesligTSV := '02';

      with EvtTSVTermino.InfoTSVTermino.infoComplementares.verbasResc.RecPgtos.Add do
        begin
          IdeRecPgto := 012345;
          vlrPgto := 1236.32;
          with ideEstabLot.Add do
            begin
              tpInsc := tiCNPJ;
              nrInsc := '12345678987654';
              codLotacao := 'A1234';
              with detVerbas.Add do
                begin
                  codRubr := 'Pg123';
                  ideTabRubr := 'A01';
                  qtdRubr := 2;
                  vrUnit := 152.35;
                  vrRubr := 304.70;
                end;
              infoAgNocivo.grauExp := ge1;
              infoSimples.indSimples := idsIntegralmente;
            end;
        end;




      EvtTSVTermino.InfoTSVTermino.infoComplementares.quarentena.dtFimQuar := Date;
    end;
end;

// S-3000 - Exclusão de Eventos
procedure TFExemploEsocial.GerareSocial3000;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S3000.Add do
  begin
    EvtExclusao.id     := '1';
//    EvtExclusao.Versao := '2.0';

    EvtExclusao.IdeEvento.TpAmb   := TpTpAmb(1);
    EvtExclusao.IdeEvento.ProcEmi := TpProcEmi(1);
    EvtExclusao.IdeEvento.VerProc := '1.0';

    EvtExclusao.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtExclusao.IdeEmpregador.NrInsc := '0123456789';

    EvtExclusao.InfoExclusao.tpEvento := TTipoEvento(teS2100);
    EvtExclusao.InfoExclusao.nrRecEvt := '12345789987654321';

    EvtExclusao.InfoExclusao.IdeTrabalhador.cpfTrab := '12345678950';
    EvtExclusao.InfoExclusao.IdeTrabalhador.nisTrab := '12345678901';

    EvtExclusao.InfoExclusao.IdeFolhaPagto.indApuracao := tpIndApuracao(0);
    EvtExclusao.InfoExclusao.IdeFolhaPagto.perApur     := '2015-05';
  end;
end;

// S-4000 - Solicitação de Totalização de Bases e Contribuições
procedure TFExemploEsocial.GerareSocial4000;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S4000.Add do
  begin
    EvtSolicTotal.id     := '1';
//    EvtSolicTotal.Versao := '2.0';

    EvtSolicTotal.IdeEvento.TpAmb   := TpTpAmb(1);
    EvtSolicTotal.IdeEvento.ProcEmi := TpProcEmi(1);
    EvtSolicTotal.IdeEvento.VerProc := '1.0';

    EvtSolicTotal.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtSolicTotal.IdeEmpregador.NrInsc := '0123456789';

    EvtSolicTotal.InfoSolicitacao.opcConsult := tpOpcConsult(1);
    EvtSolicTotal.InfoSolicitacao.perSolicit := '05-2015';
    EvtSolicTotal.InfoSolicitacao.cpfTrab := '12345678911';
  end;
end;


procedure TFExemploEsocial.GerareSocial4999;
begin
  with ACBreSocial1.Eventos.NaoPeriodicos.S4999.Add do
  begin
    EvtAdesao.id     := '1';
//    EvtAdesao.Versao := '2.0';

    EvtAdesao.IdeEvento.indRetif := tpIndRetificacao(1);
    EvtAdesao.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtAdesao.IdeEvento.TpAmb    := TpTpAmb(1);
    EvtAdesao.IdeEvento.ProcEmi  := TpProcEmi(1);
    EvtAdesao.IdeEvento.VerProc  := '1.0';

    EvtAdesao.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtAdesao.IdeEmpregador.NrInsc := '0123456789';

    EvtAdesao.InfoAdesao.dtAdesao := '05-2015';
  end;
end;

{$EndRegion}


{$Region 'Infra'}

procedure TFExemploEsocial.btnGerarClick(Sender: TObject);
begin

  if (cbS1000.Checked) then
    GerareSocial1000;

  if (cbS1005.Checked) then
    GerareSocial1005;

  if (cbS1010.Checked) then
    GerareSocial1010;

  if (cbS1020.Checked) then
    GerareSocial1020;

  if (cbS1030.Checked) then
    GerareSocial1030;

  if (cbS1040.Checked) then
    GerareSocial1040;

  if (cbS1050.Checked) then
    GerareSocial1050;

  if (cbS1060.Checked) then
    GerareSocial1060;

  if (cbS1070.Checked) then
    GerareSocial1070;

  if (cbS1080.Checked) then
    GerareSocial1080;

  if (cbS1200.Checked) then
    GerareSocial1200;

  if (cbS1202.Checked) then
    GerareSocial1202;

  if (cbS1210.Checked) then
    GerareSocial1210;

  if (cbS1220.Checked) then
    GerareSocial1220;

  if (cbS1250.Checked) then
    GerareSocial1250;

  if (cbS1260.Checked) then
    GerareSocial1260;

  if (cbS1270.Checked) then
    GerareSocial1270;

  if (cbS1280.Checked) then
    GerareSocial1280;

  if (cbS1298.Checked) then
    GerareSocial1298;

  if (cbS1299.Checked) then
    GerareSocial1299;

  if (cbS1300.Checked) then
    GerareSocial1300;

  if (cbS2100.Checked) then
    GerareSocial2100;

  if (cbS2190.Checked) then
    GerareSocial2190;

  if (cbS2200.Checked) then
    GerareSocial2200;

  if (cbS2205.Checked) then
    GerareSocial2205;

  if (cbS2206.Checked) then
    GerareSocial2206;

  if (cbS2210.Checked) then
    GerareSocial2210;

  if (cbS2220.Checked) then
    GerareSocial2220;

  if (cbS2230.Checked) then
    GerareSocial2230;

  if (cbS2240.Checked) then
    GerareSocial2240;

  if (cbS2241.Checked) then
    GerareSocial2241;

  if (cbS2250.Checked) then
    GerareSocial2250;

  if (cbS2298.Checked) then
    GerareSocial2298;

  if (cbS2299.Checked) then
    GerareSocial2299;

  if (cbS2300.Checked) then
    GerareSocial2300;

  if (cbS2305.Checked) then
    GerareSocial2305;

  if (cbS2399.Checked) then
    GerareSocial2399;

  if (cbS3000.Checked) then
    GerareSocial3000;

  if (cbS4000.Checked) then
    GerareSocial4000;

  if (cbS4999.Checked) then
    GerareSocial4999;

  ACBreSocial1.Eventos.GerarXMLs;
  ACBreSocial1.Eventos.SaveToFiles;
  ACBreSocial1.Eventos.Clear;
end;

{$EndRegion}

end.

