{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Consulta do Espelho para o Ponto Eletrônico

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
t2ti.com@gmail.com</p>

@author Albert Eije
@version 2.0
******************************************************************************* }

unit UPontoEspelho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Atributos, Constantes,
  LabeledCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits, StrUtils, ToolWin,
  ActnMan, ActnCtrls, PlatformDefaultStyleActnCtrls, ActnList, DB, DBClient,
  Biblioteca, System.Actions, {RDPrint, VDOBasePrinter, VDOPrinter, VDODmPrinter,
  VDOCaPrinter, RSPrint, printfast} ComObj, ViewPessoaColaboradorVO,
  ViewPessoaColaboradorController, Controller;

type
  [TFormDescription(TConstantes.MODULO_PONTO_ELETRONICO, 'Ponto Espelho')]

  TFPontoEspelho = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditMesAno: TLabeledMaskEdit;
    PageControlItens: TPageControl;
    tsItens: TTabSheet;
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    GridFechamento: TJvDBUltimGrid;
    CDSPontoFechamentoJornada: TClientDataSet;
    CDSPontoFechamentoJornadaID: TIntegerField;
    CDSPontoFechamentoJornadaID_PONTO_CLASSIFICACAO_JORNADA: TIntegerField;
    CDSPontoFechamentoJornadaID_COLABORADOR: TIntegerField;
    CDSPontoFechamentoJornadaDATA_FECHAMENTO: TDateField;
    CDSPontoFechamentoJornadaDIA_SEMANA: TStringField;
    CDSPontoFechamentoJornadaCODIGO_HORARIO: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_DIURNA: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_NOTURNA: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL: TStringField;
    CDSPontoFechamentoJornadaENTRADA01: TStringField;
    CDSPontoFechamentoJornadaSAIDA01: TStringField;
    CDSPontoFechamentoJornadaENTRADA02: TStringField;
    CDSPontoFechamentoJornadaSAIDA02: TStringField;
    CDSPontoFechamentoJornadaENTRADA03: TStringField;
    CDSPontoFechamentoJornadaSAIDA03: TStringField;
    CDSPontoFechamentoJornadaENTRADA04: TStringField;
    CDSPontoFechamentoJornadaSAIDA04: TStringField;
    CDSPontoFechamentoJornadaENTRADA05: TStringField;
    CDSPontoFechamentoJornadaSAIDA05: TStringField;
    CDSPontoFechamentoJornadaHORA_INICIO_JORNADA: TStringField;
    CDSPontoFechamentoJornadaHORA_FIM_JORNADA: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA01: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA01: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA01: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA02: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA02: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA02: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA03: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA03: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA03: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA04: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA04: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA04: TStringField;
    CDSPontoFechamentoJornadaNOME_COLABORADOR: TStringField;
    CDSPontoFechamentoJornadaCOMPENSAR: TStringField;
    CDSPontoFechamentoJornadaBANCO_HORAS: TStringField;
    CDSPontoFechamentoJornadaOBSERVACAO: TStringField;
    CDSPontoFechamentoJornadaFALTA_ATRASO: TStringField;
    CDSPontoFechamentoJornadaPIS_NUMERO: TStringField;
    DSPontoFechamentoJornada: TDataSource;
    ActionConsultar: TAction;
    ActionClassificarDia: TAction;
    CDSPontoFechamentoJornadaCODIGO_CLASSIFICACAO: TStringField;
    CDSPontoFechamentoJornadaNOME_CLASSIFICACAO: TStringField;
    CDSPontoEscalaTurma: TClientDataSet;
    CDSPontoEscalaTurmaID: TIntegerField;
    CDSPontoEscalaTurmaID_EMPRESA: TIntegerField;
    CDSPontoEscalaTurmaNOME: TStringField;
    CDSPontoEscalaTurmaDESCONTO_HORA_DIA: TStringField;
    CDSPontoEscalaTurmaDESCONTO_DSR: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_DOMINGO: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_SEGUNDA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_TERCA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_QUARTA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_QUINTA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_SEXTA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_SABADO: TStringField;
    CDSPontoEscalaTurmaCODIGO_TURMA: TStringField;
    CDSPontoHorario: TClientDataSet;
    CDSPontoHorarioID: TIntegerField;
    CDSPontoHorarioID_EMPRESA: TIntegerField;
    CDSPontoHorarioTIPO: TStringField;
    CDSPontoHorarioCODIGO: TStringField;
    CDSPontoHorarioNOME: TStringField;
    CDSPontoHorarioTIPO_TRABALHO: TStringField;
    CDSPontoHorarioCARGA_HORARIA: TStringField;
    CDSPontoHorarioENTRADA01: TStringField;
    CDSPontoHorarioSAIDA01: TStringField;
    CDSPontoHorarioENTRADA02: TStringField;
    CDSPontoHorarioSAIDA02: TStringField;
    CDSPontoHorarioENTRADA03: TStringField;
    CDSPontoHorarioSAIDA03: TStringField;
    CDSPontoHorarioENTRADA04: TStringField;
    CDSPontoHorarioSAIDA04: TStringField;
    CDSPontoHorarioENTRADA05: TStringField;
    CDSPontoHorarioSAIDA05: TStringField;
    CDSPontoHorarioHORA_INICIO_JORNADA: TStringField;
    CDSPontoHorarioHORA_FIM_JORNADA: TStringField;
    Calendario: TMonthCalendar;
    //RDPrint: TRDPrint;
    ActionImprimirRDPrint: TAction;
    CDSPontoMarcacao: TClientDataSet;
    CDSPontoMarcacaoID: TIntegerField;
    CDSPontoMarcacaoID_COLABORADOR: TIntegerField;
    CDSPontoMarcacaoID_PONTO_RELOGIO: TIntegerField;
    CDSPontoMarcacaoNSR: TIntegerField;
    CDSPontoMarcacaoDATA_MARCACAO: TDateField;
    CDSPontoMarcacaoHORA_MARCACAO: TStringField;
    CDSPontoMarcacaoTIPO_MARCACAO: TStringField;
    CDSPontoMarcacaoTIPO_REGISTRO: TStringField;
    CDSPontoMarcacaoJUSTIFICATIVA: TStringField;
    CDSPontoMarcacaoPAR_ENTRADA_SAIDA: TStringField;
    //VDOPrinter: TVDOPrinter;
    ActionImprimirVDOPrint: TAction;
    ActionGerarParaWord: TAction;
    ActionImprimirRSPrint: TAction;
    //RSPrint: TRSPrinter;
    //PrintFast: TPrintFast;
    ActionImprimirPrintFast: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionConsultarExecute(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure ActionClassificarDiaExecute(Sender: TObject);
    procedure EditMesAnoChange(Sender: TObject);
    //procedure RDPrintNewPage(Sender: TObject; Pagina: Integer);
    //procedure RDPrintBeforeNewPage(Sender: TObject; Pagina: Integer);
    //procedure RDPrintAfterPrint(Sender: TObject);
    //procedure ActionImprimirRDPrintExecute(Sender: TObject);
    //procedure ActionImprimirVDOPrintExecute(Sender: TObject);
    //procedure VDOPrinterNewPage(Sender: TObject);
    //procedure ActionGerarParaWordExecute(Sender: TObject);
    //procedure ActionImprimirRSPrintExecute(Sender: TObject);
    //procedure ActionImprimirPrintFastExecute(Sender: TObject);
  private
    { Private declarations }
//    procedure NovaPagina;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;
  end;

var
  FPontoEspelho: TFPontoEspelho;
  Linha: Integer;

implementation

uses PontoFechamentoJornadaController, UDataModule, ULookup,
  PontoClassificacaoJornadaController, PontoClassificacaoJornadaVO,
  PontoFechamentoJornadaVO, ViewPontoEscalaTurmaController,
  PontoHorarioController, PontoMarcacaoController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFPontoEspelho.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TViewPessoaColaboradorVO;
  ObjetoController := TViewPessoaColaboradorController.Create;

  inherited;
end;

procedure TFPontoEspelho.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
  BotaoInserir.Visible := False;
  BotaoAlterar.Visible := False;
  BotaoExcluir.Visible := False;
  BotaoSalvar.Visible := False;
end;

procedure TFPontoEspelho.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
  MenuInserir.Visible := False;
  MenuAlterar.Visible := False;
  MenuExcluir.Visible := False;
  MenuSalvar.Visible := False;
end;

procedure TFPontoEspelho.EditMesAnoChange(Sender: TObject);
begin
  if Length(Trim(EditMesAno.Text)) = 7 then
  begin
    try
      Calendario.MinDate := StrToDate('01/' + EditMesAno.Text);
      Calendario.MaxDate := StrToDate(UltimoDiaMes(Calendario.MinDate) + '/' + EditMesAno.Text);
    except
      On E: Exception do
      begin
        Application.MessageBox(PChar('Ocorreu um erro ao tentar configurar a data do calendário. Mensagem de erro:' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
        EditMesAno.Clear;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFPontoEspelho.GridDblClick(Sender: TObject);
begin
  inherited;
  PanelEdits.Enabled := True;
  EditIdColaborador.ReadOnly := True;
  EditMesAno.SetFocus;
end;

procedure TFPontoEspelho.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TViewPessoaColaboradorVO(TController.BuscarObjeto('ViewPessoaColaboradorController.TViewPessoaColaboradorController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdColaborador.AsInteger := TViewPessoaColaboradorVO(ObjetoVO).Id;
    EditColaborador.Text := TViewPessoaColaboradorVO(ObjetoVO).Nome;
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFPontoEspelho.ActionConsultarExecute(Sender: TObject);
var
  DataInicial, DataFinal: String;
begin
  if Length(Trim(EditMesAno.Text)) <> 7 then
  begin
    Application.MessageBox('Informe o Mês/Ano.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
    EditMesAno.SetFocus;
  end
  else
  begin
    try
      DataInicial := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-01';
      DataFinal := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-' + UltimoDiaMes(Copy(EditMesAno.Text, 1, 2));
      TPontoFechamentoJornadaController.SetDataSet(CDSPontoFechamentoJornada);
      TPontoFechamentoJornadaController.Consulta('ID_COLABORADOR = ' + QuotedStr(EditIdColaborador.Text) + ' and (DATA_FECHAMENTO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')', '-1');
      CDSPontoFechamentoJornada.IndexFieldNames := 'DATA_FECHAMENTO';

      if CDSPontoFechamentoJornada.RecordCount = 0 then
        Application.MessageBox('Não existem dados para os critérios informados.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
    except
      on E: Exception do
        Application.MessageBox(PChar('Ocorreu um erro na consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TFPontoEspelho.ActionClassificarDiaExecute(Sender: TObject);
var
  PontoFechamentoJornada: TPontoFechamentoJornadaVO;
  RetornoConsulta: Boolean;
begin
  if Length(Trim(EditMesAno.Text)) <> 7 then
  begin
    Application.MessageBox('Informe o Mês/Ano.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
    EditMesAno.SetFocus;
  end
  else
  begin
    if Application.MessageBox(PChar('Deseja classificar o dia ' + DateToStr(Calendario.Date) + '?'), 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
    begin
      try
        try
          Application.CreateForm(TFLookup, FLookup);
          ULookup.FLookup.ObjetoVO := TPontoClassificacaoJornadaVO.Create;
          ULookup.FLookup.ObjetoController := TPontoClassificacaoJornadaController.Create;
          FLookup.ShowModal;
          if FLookup.CDSLookup.RecordCount > 0 then
          begin
            PontoFechamentoJornada := TPontoFechamentoJornadaVO.Create;
            PontoFechamentoJornada.IdColaborador := EditIdColaborador.AsInteger;
            PontoFechamentoJornada.IdPontoClassificacaoJornada := FLookup.CDSLookup.FieldByName('ID').AsInteger;
            PontoFechamentoJornada.DataFechamento := Calendario.Date;

            case DayOfWeek(Calendario.Date) of
              1:
                PontoFechamentoJornada.DiaSemana := 'DOMINGO';
              2:
                PontoFechamentoJornada.DiaSemana := 'SEGUNDA';
              3:
                PontoFechamentoJornada.DiaSemana := 'TERCA';
              4:
                PontoFechamentoJornada.DiaSemana := 'QUARTA';
              5:
                PontoFechamentoJornada.DiaSemana := 'QUINTA';
              6:
                PontoFechamentoJornada.DiaSemana := 'SEXTA';
              7:
                PontoFechamentoJornada.DiaSemana := 'SABADO';
            end;

            // Pega os dados da escala e turma do colaborador selecionado

            /// EXERCICIO: Porque o sistema não está trazendo o código da turma do colaborador? Descubra e corrija.
            TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
            TViewPontoEscalaTurmaController.Consulta('CODIGO_TURMA = ' + QuotedStr(TViewPessoaColaboradorVO(ObjetoVO).CodigoTurmaPonto), '0');

            // Pega os dados do horário do dia selecionado
            TPontoHorarioController.SetDataSet(CDSPontoHorario);
            case DayOfWeek(now) of
              1:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_DOMINGO.AsString), '0');
              2:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_SEGUNDA.AsString), '0');
              3:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_TERCA.AsString), '0');
              4:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_QUARTA.AsString), '0');
              5:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_QUINTA.AsString), '0');
              6:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_SEXTA.AsString), '0');
              7:
                TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_SABADO.AsString), '0');
            end;

            PontoFechamentoJornada.CodigoHorario := CDSPontoHorarioCODIGO.AsString;
            PontoFechamentoJornada.CargaHorariaEsperada := CDSPontoHorarioCARGA_HORARIA.AsString;

            if FLookup.CDSLookup.FieldByName('DESCONTAR_HORAS').AsString = 'S' then
              PontoFechamentoJornada.FaltaAtraso := CDSPontoHorarioCARGA_HORARIA.AsString;

            PontoFechamentoJornada.HoraInicioJornada := CDSPontoHorarioHORA_INICIO_JORNADA.AsString;
            PontoFechamentoJornada.HoraFimJornada := CDSPontoHorarioHORA_FIM_JORNADA.AsString;
            PontoFechamentoJornada.Observacao := 'Registro incluído via sistema pelo usuário ' + Sessao.Usuario.ColaboradorVO.PessoaVO.Nome;

            TController.ExecutarMetodo('PontoFechamentoJornadaController.TPontoFechamentoJornadaController', 'Insere', [PontoFechamentoJornada], 'PUT', 'Lista');
            ActionConsultar.Execute
          end;
        except
          on E: Exception do
            Application.MessageBox(PChar('Ocorreu um erro na inclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
        end;
      finally
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'RDPrint'}
(*
procedure TFPontoEspelho.ActionImprimirRDPrintExecute(Sender: TObject);
var
  i, ContadorMarcacao: Integer;
  CodigosHorario: TStringList;
  CampoAtual: String;
  DataInicial, DataFinal: String;
begin
  if not CDSPontoFechamentoJornada.IsEmpty then
  begin
    RDPrint.MostrarProgresso := True;
    RDPrint.TitulodoRelatorio := 'Relatório Espelho de Ponto Eletrônico';
    RDPrint.FonteTamanhoPadrao := s20cpp;
    RDPrint.TamanhoQteColunas := 180;
    RDPrint.TamanhoQteLinhas := 66;

    RDPrint.Abrir; // Inicia a montagem do relatório...

    RDPrint.Impf(Linha, 01, 'Horários contratuais do empregado', [NEGRITO]);
    Inc(Linha);

    RDPrint.Imp(Linha, 01, StringOfChar('-', 180));
    Inc(Linha);

    RDPrint.Imp(Linha, 01, 'Código de Horário (CH)');
    RDPrint.Imp(Linha, 25, 'Entrada');
    RDPrint.Imp(Linha, 35, 'Saída');
    RDPrint.Imp(Linha, 45, 'Entrada');
    RDPrint.Imp(Linha, 55, 'Saída');
    Inc(Linha);

    RDPrint.Imp(Linha, 01, StringOfChar('-', 180));
    Inc(Linha);

    // Pega os dados da escala e turma do colaborador selecionado
    TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
    TViewPontoEscalaTurmaController.Consulta('CODIGO_TURMA = ' + QuotedStr(TColaboradorVO(ObjetoVO).CodigoTurmaPonto), 0);

    CodigosHorario := TStringList.Create;
    for i := 0 to CDSPontoEscalaTurma.FieldList.Count - 1 do
    begin
      if Copy(CDSPontoEscalaTurma.FieldList.Fields[i].FieldName, 1, 14) = 'CODIGO_HORARIO' then
      begin
        CampoAtual := CDSPontoEscalaTurma.FieldList.Fields[i].FieldName;
        if CodigosHorario.IndexOf(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString) = -1 then
        begin
          CodigosHorario.Add(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString);

          // Pega os dados do horário
          TPontoHorarioController.SetDataSet(CDSPontoHorario);
          TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString), 0);

          RDPrint.Imp(Linha, 01, CDSPontoHorarioCODIGO.AsString);
          RDPrint.Imp(Linha, 25, CDSPontoHorarioENTRADA01.AsString);
          RDPrint.Imp(Linha, 35, CDSPontoHorarioSAIDA01.AsString);
          RDPrint.Imp(Linha, 45, CDSPontoHorarioENTRADA02.AsString);
          RDPrint.Imp(Linha, 55, CDSPontoHorarioSAIDA02.AsString);
          Inc(Linha);
        end;
      end;
    end;

    RDPrint.Imp(Linha, 01, StringOfChar('-', 180));
    Inc(Linha);

    RDPrint.Impf(Linha, 01, 'Período: ' + '01/' + EditMesAno.Text + ' a ' + UltimoDiaMes(Calendario.MinDate) + '/' + EditMesAno.Text, [NEGRITO]);
    Inc(Linha);

    RDPrint.Imp(Linha, 01, StringOfChar('-', 180));
    Inc(Linha);

    RDPrint.Imp(Linha, 01, 'Dia');
    RDPrint.Imp(Linha, 05, 'Marcações registradas no ponto eletrônico');
    RDPrint.Imp(Linha, 55, 'Jornada Realizada');
    RDPrint.Imp(Linha, 115, 'CH');
    RDPrint.Imp(Linha, 125, 'Tratamentos efetuados sobre os dados originais');
    Inc(Linha);

    RDPrint.Imp(Linha, 55, 'Entrada');
    RDPrint.Imp(Linha, 65, 'Saída');
    RDPrint.Imp(Linha, 75, 'Entrada');
    RDPrint.Imp(Linha, 85, 'Saída');
    RDPrint.Imp(Linha, 95, 'Entrada');
    RDPrint.Imp(Linha, 105, 'Saída');
    RDPrint.Imp(Linha, 125, 'Horário');
    RDPrint.Imp(Linha, 133, 'Ocor.');
    RDPrint.Imp(Linha, 140, 'Motivo');
    Inc(Linha);

    RDPrint.Imp(Linha, 01, StringOfChar('-', 180));
    Inc(Linha);

    // Pega todas as marcações do mês do colaborador selecionado
    DataInicial := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-01';
    DataFinal := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-' + UltimoDiaMes(Copy(EditMesAno.Text, 1, 2));
    TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
    TPontoMarcacaoController.Consulta('ID_COLABORADOR = ' + QuotedStr(EditIdColaborador.Text) + ' and (DATA_MARCACAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')', -1);

    CDSPontoFechamentoJornada.DisableControls;
    CDSPontoFechamentoJornada.First;
    while not CDSPontoFechamentoJornada.Eof do
    begin
      NovaPagina;

      // Filtra as marcações do dia selecionado
      CDSPontoMarcacao.Filtered := False;
      CDSPontoMarcacao.Filter := 'DATA_MARCACAO = ' + QuotedStr(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString);
      CDSPontoMarcacao.Filtered := True;
      CDSPontoMarcacao.IndexFieldNames := 'HORA_MARCACAO';

      if CDSPontoMarcacao.RecordCount > 0 then
      begin

        RDPrint.Imp(Linha, 01, Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 1, 2));

        CDSPontoMarcacao.First;
        ContadorMarcacao := 5;
        while not CDSPontoMarcacao.eof do
        begin
          RDPrint.Imp(Linha, ContadorMarcacao, Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5));
          Inc(ContadorMarcacao, 6);
          CDSPontoMarcacao.Next;
        end;

        RDPrint.Imp(Linha, 55, Copy(CDSPontoFechamentoJornadaENTRADA01.AsString, 1, 5));
        RDPrint.Imp(Linha, 65, Copy(CDSPontoFechamentoJornadaSAIDA01.AsString, 1, 5));
        RDPrint.Imp(Linha, 75, Copy(CDSPontoFechamentoJornadaENTRADA02.AsString, 1, 5));
        RDPrint.Imp(Linha, 85, Copy(CDSPontoFechamentoJornadaSAIDA02.AsString, 1, 5));
        RDPrint.Imp(Linha, 95, Copy(CDSPontoFechamentoJornadaENTRADA03.AsString, 1, 5));
        RDPrint.Imp(Linha, 105, Copy(CDSPontoFechamentoJornadaSAIDA03.AsString, 1, 5));
        RDPrint.Imp(Linha, 115, CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString);

        // Novo laço para imprimir os tratamentos efetuados no arquivo
        CDSPontoMarcacao.First;
        while not CDSPontoMarcacao.eof do
        begin
          if (CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'I') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'P') then
          begin
            RDPrint.Imp(Linha, 125, Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5));

            if CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D' then
              RDPrint.Imp(Linha, 133, 'D')
            else
              RDPrint.Imp(Linha, 133, CDSPontoMarcacaoTIPO_REGISTRO.AsString);

            RDPrint.Imp(Linha, 140, CDSPontoMarcacaoJUSTIFICATIVA.AsString);
            Inc(Linha);
          end;
          CDSPontoMarcacao.Next;
        end;

        Inc(Linha);
      end;
      CDSPontoFechamentoJornada.Next;
    end;
    CDSPontoFechamentoJornada.First;
    CDSPontoFechamentoJornada.EnableControls;

    RDPrint.Imp(Linha, 01, StringOfChar('=', 180));

    RDPrint.Fechar;
  end
  else
    Application.MessageBox('Não existem dados para serem impressos.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFPontoEspelho.RDPrintAfterPrint(Sender: TObject);
begin
  // Força o fechamento do form preview após a impressão...
  Keybd_Event(VK_Escape, 0, 0, 0); // Pressiona tecla Escape
end;

procedure TFPontoEspelho.RDPrintBeforeNewPage(Sender: TObject; Pagina: Integer);
begin
  // Rodapé...
  RDPrint.Imp(64, 01, StringOfChar('=', 180));
  RDPrint.Imp(65, 01, 'Página: ' + formatfloat('##', Pagina) + ' de &page&');
  RDPrint.impd(65, 136, 'Impresso em ' + DateTimeToStr(now), [italico]);}
end;

procedure TFPontoEspelho.RDPrintNewPage(Sender: TObject; Pagina: Integer);
begin
  // Cabeçalho...
  RDPrint.Imp(02, 01, StringOfChar('=', 180));
  RDPrint.Impf(03, 01, 'Relatório Espelho de Ponto Eletrônico', [expandido, NEGRITO]);
  RDPrint.Imp(04, 01, StringOfChar('=', 180));
  RDPrint.Imp(05, 01, 'Empregador: ' + Sessao.Empresa.RazaoSocial);
  RDPrint.Imp(06, 01, 'Endereço: ' + Sessao.Empresa.ListaEnderecoVO.Items[0].Logradouro);
  RDPrint.Imp(07, 01, 'Empregado: ' + TColaboradorVO(ObjetoVO).PisNumero + ' - ' + TColaboradorVO(ObjetoVO).PessoaNome);
  RDPrint.Imp(08, 01, 'Admissão: ' + DateToStr(TColaboradorVO(ObjetoVO).DataAdmissao));
  RDPrint.Imp(09, 01, 'Relatório emitido em: ' + DateToStr(Date));
  RDPrint.Imp(10, 01, StringOfChar('=', 180));
  Linha := 11;
end;

procedure TFPontoEspelho.NovaPagina;
begin
  if Linha > 63 then
     RDprint.novapagina;
end;
*)
{$ENDREGION}

{$REGION 'VDOPrint'}
(*
procedure TFPontoEspelho.ActionImprimirVDOPrintExecute(Sender: TObject);
var
  i, ContadorMarcacao: Integer;
  CodigosHorario: TStringList;
  CampoAtual: String;
  DataInicial, DataFinal: String;
  HouveTratamento: Boolean;
begin
  if not CDSPontoFechamentoJornada.IsEmpty then
  begin
    { Inicia o Documento }
    VDOPrinter.BeginDoc;

    if VDOPrinter.PrinterType = ptCanvas then
      VDOPrinter.CanvasSets.Font.Size := 12
    else
      VDOPrinter.DotMatrixSets.Font.Size:= fsLargeCondensed;

    VDOPrinter.Print(00, 'Horários contratuais do empregado', True);

    if VDOPrinter.PrinterType = ptCanvas then
      VDOPrinter.CanvasSets.Font.Size := 8
    else
      VDOPrinter.DotMatrixSets.Font.Size:= fsCondensed;

    VDOPrinter.Replicate(00, 180);

    VDOPrinter.Print(00, 'Código de Horário (CH)', False);
    VDOPrinter.Print(25, 'Entrada', False);
    VDOPrinter.Print(35, 'Saída', False);
    VDOPrinter.Print(45, 'Entrada', False);
    VDOPrinter.Print(55, 'Saída', True);

    VDOPrinter.Replicate(00, 180);

    // Pega os dados da escala e turma do colaborador selecionado
    TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
    TViewPontoEscalaTurmaController.Consulta('CODIGO_TURMA = ' + QuotedStr(TColaboradorVO(ObjetoVO).CodigoTurmaPonto), 0);

    CodigosHorario := TStringList.Create;
    for i := 0 to CDSPontoEscalaTurma.FieldList.Count - 1 do
    begin
      if Copy(CDSPontoEscalaTurma.FieldList.Fields[i].FieldName, 1, 14) = 'CODIGO_HORARIO' then
      begin
        CampoAtual := CDSPontoEscalaTurma.FieldList.Fields[i].FieldName;
        if CodigosHorario.IndexOf(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString) = -1 then
        begin
          CodigosHorario.Add(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString);

          // Pega os dados do horário
          TPontoHorarioController.SetDataSet(CDSPontoHorario);
          TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString), 0);

          VDOPrinter.Print(00, CDSPontoHorarioCODIGO.AsString);
          VDOPrinter.Print(25, CDSPontoHorarioENTRADA01.AsString);
          VDOPrinter.Print(35, CDSPontoHorarioSAIDA01.AsString);
          VDOPrinter.Print(45, CDSPontoHorarioENTRADA02.AsString);
          VDOPrinter.Print(55, CDSPontoHorarioSAIDA02.AsString, True);
        end;
      end;
    end;

    VDOPrinter.Replicate(00, 180);

    if VDOPrinter.PrinterType = ptCanvas then
      VDOPrinter.CanvasSets.Font.Size := 12
    else
      VDOPrinter.DotMatrixSets.Font.Size:= fsLargeCondensed;

    VDOPrinter.Print(00, 'Período: ' + '01/' + EditMesAno.Text + ' a ' + UltimoDiaMes(Calendario.MinDate) + '/' + EditMesAno.Text, True);

    if VDOPrinter.PrinterType = ptCanvas then
      VDOPrinter.CanvasSets.Font.Size := 8
    else
      VDOPrinter.DotMatrixSets.Font.Size:= fsCondensed;

    VDOPrinter.Replicate(00, 180);

    VDOPrinter.Print(00, 'Dia', False);
    VDOPrinter.Print(05, 'Marcações registradas no ponto eletrônico', False);
    VDOPrinter.Print(55, 'Jornada Realizada', False);
    VDOPrinter.Print(115, 'CH', False);
    VDOPrinter.Print(125, 'Tratamentos efetuados sobre os dados originais', True);

    VDOPrinter.Print(55, 'Entrada', False);
    VDOPrinter.Print(65, 'Saída', False);
    VDOPrinter.Print(75, 'Entrada', False);
    VDOPrinter.Print(85, 'Saída', False);
    VDOPrinter.Print(95, 'Entrada', False);
    VDOPrinter.Print(105, 'Saída', False);
    VDOPrinter.Print(125, 'Horário', False);
    VDOPrinter.Print(133, 'Ocor.', False);
    VDOPrinter.Print(140, 'Motivo', True);

    VDOPrinter.Replicate(00, 180);

    // Pega todas as marcações do mês do colaborador selecionado
    DataInicial := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-01';
    DataFinal := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-' + UltimoDiaMes(Copy(EditMesAno.Text, 1, 2));
    TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
    TPontoMarcacaoController.Consulta('ID_COLABORADOR = ' + QuotedStr(EditIdColaborador.Text) + ' and (DATA_MARCACAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')', -1);

    CDSPontoFechamentoJornada.DisableControls;
    CDSPontoFechamentoJornada.First;
    while not CDSPontoFechamentoJornada.Eof do
    begin

      // Filtra as marcações do dia selecionado
      CDSPontoMarcacao.Filtered := False;
      CDSPontoMarcacao.Filter := 'DATA_MARCACAO = ' + QuotedStr(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString);
      CDSPontoMarcacao.Filtered := True;
      CDSPontoMarcacao.IndexFieldNames := 'HORA_MARCACAO';

      if CDSPontoMarcacao.RecordCount > 0 then
      begin

        VDOPrinter.Print(00, Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 1, 2), False);

        CDSPontoMarcacao.First;
        ContadorMarcacao := 5;
        while not CDSPontoMarcacao.eof do
        begin
          VDOPrinter.Print(ContadorMarcacao, Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5), False);
          Inc(ContadorMarcacao, 6);
          CDSPontoMarcacao.Next;
        end;

        VDOPrinter.Print(55, Copy(CDSPontoFechamentoJornadaENTRADA01.AsString, 1, 5), False);
        VDOPrinter.Print(65, Copy(CDSPontoFechamentoJornadaSAIDA01.AsString, 1, 5), False);
        VDOPrinter.Print(75, Copy(CDSPontoFechamentoJornadaENTRADA02.AsString, 1, 5), False);
        VDOPrinter.Print(85, Copy(CDSPontoFechamentoJornadaSAIDA02.AsString, 1, 5), False);
        VDOPrinter.Print(95, Copy(CDSPontoFechamentoJornadaENTRADA03.AsString, 1, 5), False);
        VDOPrinter.Print(105, Copy(CDSPontoFechamentoJornadaSAIDA03.AsString, 1, 5), False);
        VDOPrinter.Print(115, CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString, False);

        // Novo laço para imprimir os tratamentos efetuados no arquivo
        CDSPontoMarcacao.First;
        while not CDSPontoMarcacao.eof do
        begin
          if (CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'I') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'P') then
          begin
            HouveTratamento := True;

            VDOPrinter.Print(125, Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5), False);

            if CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D' then
              VDOPrinter.Print(133, 'D', False)
            else
              VDOPrinter.Print(133, CDSPontoMarcacaoTIPO_REGISTRO.AsString, False);

            VDOPrinter.Print(140, CDSPontoMarcacaoJUSTIFICATIVA.AsString, True);
          end;
          CDSPontoMarcacao.Next;
        end;

        if not HouveTratamento then
          VDOPrinter.NewLine(1);
      end;
      CDSPontoFechamentoJornada.Next;
    end;
    CDSPontoFechamentoJornada.First;
    CDSPontoFechamentoJornada.EnableControls;

    VDOPrinter.Replicate(00, 180);

    { Finalizo o Documento }
    VDOPrinter.EndDoc;
  end
  else
    Application.MessageBox('Não existem dados para serem impressos.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFPontoEspelho.VDOPrinterNewPage(Sender: TObject);
begin
  // Cabeçalho...

  if VDOPrinter.PrinterType = ptCanvas then
    VDOPrinter.CanvasSets.Font.Size := 8
  else
    VDOPrinter.DotMatrixSets.Font.Size:= fsCondensed;

  VDOPrinter.Replicate(00, 180);

  if VDOPrinter.PrinterType = ptCanvas then
    VDOPrinter.CanvasSets.Font.Size := 14
  else
    VDOPrinter.DotMatrixSets.Font.Size:= fsLargeCondensed;

  VDOPrinter.Print(00, 'Relatório Espelho de Ponto Eletrônico', True);

  if VDOPrinter.PrinterType = ptCanvas then
    VDOPrinter.CanvasSets.Font.Size := 8
  else
    VDOPrinter.DotMatrixSets.Font.Size:= fsCondensed;

  VDOPrinter.Replicate(00, 180);
  VDOPrinter.Print(00, 'Empregador: ' + Sessao.Empresa.RazaoSocial, True);
  VDOPrinter.Print(00, 'Endereço: ' + Sessao.Empresa.ListaEnderecoVO.Items[0].Logradouro, True);
  VDOPrinter.Print(00, 'Empregado: ' + TColaboradorVO(ObjetoVO).PisNumero + ' - ' + TColaboradorVO(ObjetoVO).PessoaNome, True);
  VDOPrinter.Print(00, 'Admissão: ' + DateToStr(TColaboradorVO(ObjetoVO).DataAdmissao), True);
  VDOPrinter.Print(00, 'Relatório emitido em: ' + DateToStr(Date), True);
  VDOPrinter.Replicate(00, 180);
end;
*)
{$ENDREGION}

{$Region 'RSPrint'}
(*
procedure TFPontoEspelho.ActionImprimirRSPrintExecute(Sender: TObject);
var
  i, ContadorMarcacao: Integer;
  CodigosHorario: TStringList;
  CampoAtual: String;
  DataInicial, DataFinal: String;
begin
  if not CDSPontoFechamentoJornada.IsEmpty then
  begin
    //inicio do documento
    RSPrint.BeginDoc;

    RSPrint.Title := 'EspelhoPonto_' + FormatDateTime('DDMMYYYYhhmmss', Now);

    // Cabeçalho...
    RSPrint.WriteFont(02, 01, StringOfChar('=', 180), [Compress]);
    RSPrint.WriteFont(03, 01, 'Relatório Espelho de Ponto Eletrônico', [Bold, DobleWide]);
    RSPrint.WriteFont(02, 01, StringOfChar('=', 180), [Compress]);
    RSPrint.WriteFont(05, 01, 'Empregador: ' + Sessao.Empresa.RazaoSocial, [Compress]);
    RSPrint.WriteFont(06, 01, 'Endereço: ' + Sessao.Empresa.ListaEnderecoVO.Items[0].Logradouro, [Compress]);
    RSPrint.WriteFont(07, 01, 'Empregado: ' + TColaboradorVO(ObjetoVO).PisNumero + ' - ' + TColaboradorVO(ObjetoVO).PessoaNome, [Compress]);
    RSPrint.WriteFont(08, 01, 'Admissão: ' + DateToStr(TColaboradorVO(ObjetoVO).DataAdmissao), [Compress]);
    RSPrint.WriteFont(09, 01, 'Relatório emitido em: ' + DateToStr(Date), [Compress]);
    RSPrint.WriteFont(10, 01, StringOfChar('=', 180), [Compress]);

    Linha := 11;

    RSPrint.WriteFont(Linha, 01, 'Horários contratuais do empregado', [Bold]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, StringOfChar('-', 180), [Compress]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, 'Código de Horário (CH)', [Compress]);
    RSPrint.WriteFont(Linha, 25, 'Entrada', [Compress]);
    RSPrint.WriteFont(Linha, 35, 'Saída', [Compress]);
    RSPrint.WriteFont(Linha, 45, 'Entrada', [Compress]);
    RSPrint.WriteFont(Linha, 55, 'Saída', [Compress]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, StringOfChar('-', 180), [Compress]);
    Inc(Linha);

    // Pega os dados da escala e turma do colaborador selecionado
    TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
    TViewPontoEscalaTurmaController.Consulta('CODIGO_TURMA = ' + QuotedStr(TColaboradorVO(ObjetoVO).CodigoTurmaPonto), 0);

    CodigosHorario := TStringList.Create;
    for i := 0 to CDSPontoEscalaTurma.FieldList.Count - 1 do
    begin
      if Copy(CDSPontoEscalaTurma.FieldList.Fields[i].FieldName, 1, 14) = 'CODIGO_HORARIO' then
      begin
        CampoAtual := CDSPontoEscalaTurma.FieldList.Fields[i].FieldName;
        if CodigosHorario.IndexOf(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString) = -1 then
        begin
          CodigosHorario.Add(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString);

          // Pega os dados do horário
          TPontoHorarioController.SetDataSet(CDSPontoHorario);
          TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString), 0);

          RSPrint.WriteFont(Linha, 01, CDSPontoHorarioCODIGO.AsString, [Compress]);
          RSPrint.WriteFont(Linha, 25, CDSPontoHorarioENTRADA01.AsString, [Compress]);
          RSPrint.WriteFont(Linha, 35, CDSPontoHorarioSAIDA01.AsString, [Compress]);
          RSPrint.WriteFont(Linha, 45, CDSPontoHorarioENTRADA02.AsString, [Compress]);
          RSPrint.WriteFont(Linha, 55, CDSPontoHorarioSAIDA02.AsString, [Compress]);
          Inc(Linha);
        end;
      end;
    end;

    RSPrint.WriteFont(Linha, 01, StringOfChar('-', 180), [Compress]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, 'Período: ' + '01/' + EditMesAno.Text + ' a ' + UltimoDiaMes(Calendario.MinDate) + '/' + EditMesAno.Text, [Bold]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, StringOfChar('-', 180), [Compress]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, 'Dia', [Compress]);
    RSPrint.WriteFont(Linha, 05, 'Marcações registradas no ponto eletrônico', [Compress]);
    RSPrint.WriteFont(Linha, 55, 'Jornada Realizada', [Compress]);
    RSPrint.WriteFont(Linha, 115, 'CH', [Compress]);
    RSPrint.WriteFont(Linha, 125, 'Tratamentos efetuados sobre os dados originais', [Compress]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 55, 'Entrada', [Compress]);
    RSPrint.WriteFont(Linha, 65, 'Saída', [Compress]);
    RSPrint.WriteFont(Linha, 75, 'Entrada', [Compress]);
    RSPrint.WriteFont(Linha, 85, 'Saída', [Compress]);
    RSPrint.WriteFont(Linha, 95, 'Entrada', [Compress]);
    RSPrint.WriteFont(Linha, 105, 'Saída', [Compress]);
    RSPrint.WriteFont(Linha, 125, 'Horário', [Compress]);
    RSPrint.WriteFont(Linha, 133, 'Ocor.', [Compress]);
    RSPrint.WriteFont(Linha, 140, 'Motivo', [Compress]);
    Inc(Linha);

    RSPrint.WriteFont(Linha, 01, StringOfChar('-', 180), [Compress]);
    Inc(Linha);

    // Pega todas as marcações do mês do colaborador selecionado
    DataInicial := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-01';
    DataFinal := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-' + UltimoDiaMes(Copy(EditMesAno.Text, 1, 2));
    TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
    TPontoMarcacaoController.Consulta('ID_COLABORADOR = ' + QuotedStr(EditIdColaborador.Text) + ' and (DATA_MARCACAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')', -1);

    CDSPontoFechamentoJornada.DisableControls;
    CDSPontoFechamentoJornada.First;
    while not CDSPontoFechamentoJornada.Eof do
    begin
      // Filtra as marcações do dia selecionado
      CDSPontoMarcacao.Filtered := False;
      CDSPontoMarcacao.Filter := 'DATA_MARCACAO = ' + QuotedStr(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString);
      CDSPontoMarcacao.Filtered := True;
      CDSPontoMarcacao.IndexFieldNames := 'HORA_MARCACAO';

      if CDSPontoMarcacao.RecordCount > 0 then
      begin

        RSPrint.WriteFont(Linha, 01, Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 1, 2), [Compress]);

        CDSPontoMarcacao.First;
        ContadorMarcacao := 5;
        while not CDSPontoMarcacao.eof do
        begin
          RSPrint.WriteFont(Linha, ContadorMarcacao, Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5), [Compress]);
          Inc(ContadorMarcacao, 6);
          CDSPontoMarcacao.Next;
        end;

        RSPrint.WriteFont(Linha, 55, Copy(CDSPontoFechamentoJornadaENTRADA01.AsString, 1, 5), [Compress]);
        RSPrint.WriteFont(Linha, 65, Copy(CDSPontoFechamentoJornadaSAIDA01.AsString, 1, 5), [Compress]);
        RSPrint.WriteFont(Linha, 75, Copy(CDSPontoFechamentoJornadaENTRADA02.AsString, 1, 5), [Compress]);
        RSPrint.WriteFont(Linha, 85, Copy(CDSPontoFechamentoJornadaSAIDA02.AsString, 1, 5), [Compress]);
        RSPrint.WriteFont(Linha, 95, Copy(CDSPontoFechamentoJornadaENTRADA03.AsString, 1, 5), [Compress]);
        RSPrint.WriteFont(Linha, 105, Copy(CDSPontoFechamentoJornadaSAIDA03.AsString, 1, 5), [Compress]);
        RSPrint.WriteFont(Linha, 115, CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString, [Compress]);

        // Novo laço para imprimir os tratamentos efetuados no arquivo
        CDSPontoMarcacao.First;
        while not CDSPontoMarcacao.eof do
        begin
          if (CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'I') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'P') then
          begin
            RSPrint.WriteFont(Linha, 125, Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5), [Compress]);

            if CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D' then
              RSPrint.WriteFont(Linha, 133, 'D', [Compress])
            else
              RSPrint.WriteFont(Linha, 133, CDSPontoMarcacaoTIPO_REGISTRO.AsString, [Compress]);

            RSPrint.WriteFont(Linha, 140, CDSPontoMarcacaoJUSTIFICATIVA.AsString, [Compress]);
            Inc(Linha);
          end;
          CDSPontoMarcacao.Next;
        end;

        Inc(Linha);
      end;
      CDSPontoFechamentoJornada.Next;
    end;
    CDSPontoFechamentoJornada.First;
    CDSPontoFechamentoJornada.EnableControls;

    RSPrint.WriteFont(Linha, 01, StringOfChar('=', 180), [Compress]);

    //impressão do relatorio
    RSPrint.PrintPage(1);
  end
  else
    Application.MessageBox('Não existem dados para serem impressos.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
end;
*)
{$EndRegion}

{$Region 'PrintFast'}
(*
procedure TFPontoEspelho.ActionImprimirPrintFastExecute(Sender: TObject);
var
  i, ContadorMarcacao: Integer;
  CodigosHorario: TStringList;
  CampoAtual: String;
  DataInicial, DataFinal: String;
  HouveTratamento: Boolean;
begin
  if not CDSPontoFechamentoJornada.IsEmpty then
  begin

    PrintFast.Preview.ShowPreview := True;
    PrintFast.PageHeader := False;
    PrintFast.PageWidth := 180;
    PrintFast.QtLines := 66;

    if PrintFast.IniciaImpr then
    begin

      // Cabeçalho...
      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.ImprComo(PExpand);
      PrintFast.ImprString('', 'Relatório Espelho de Ponto Eletrônico', 0, True);
      PrintFast.ImprComo(TExpand);

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.ImprString('', 'Empregador: ' + Sessao.Empresa.RazaoSocial, 0, True);
      PrintFast.ImprString('', 'Endereço: ' + Sessao.Empresa.ListaEnderecoVO.Items[0].Logradouro, 0, True);
      PrintFast.ImprString('', 'Empregado: ' + TColaboradorVO(ObjetoVO).PisNumero + ' - ' + TColaboradorVO(ObjetoVO).PessoaNome, 0, True);
      PrintFast.ImprString('', 'Admissão: ' + DateToStr(TColaboradorVO(ObjetoVO).DataAdmissao), 0, True);
      PrintFast.ImprString('', 'Relatório emitido em: ' + DateToStr(Date), 0, True);
      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.ImprComo(PNegrito);
      PrintFast.ImprString('', 'Horários contratuais do empregado', 0, True);
      PrintFast.ImprComo(TNegrito);

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.ImprString('', 'Código de Horário (CH)', 0, False);
      PrintFast.ImprString('', 'Entrada', 25, False);
      PrintFast.ImprString('', 'Saída', 35, False);
      PrintFast.ImprString('', 'Entrada', 45, False);
      PrintFast.ImprString('', 'Saída', 55, True);

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      // Pega os dados da escala e turma do colaborador selecionado
      TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
      TViewPontoEscalaTurmaController.Consulta('CODIGO_TURMA = ' + QuotedStr(TColaboradorVO(ObjetoVO).CodigoTurmaPonto), 0);

      CodigosHorario := TStringList.Create;
      for i := 0 to CDSPontoEscalaTurma.FieldList.Count - 1 do
      begin
        if Copy(CDSPontoEscalaTurma.FieldList.Fields[i].FieldName, 1, 14) = 'CODIGO_HORARIO' then
        begin
          CampoAtual := CDSPontoEscalaTurma.FieldList.Fields[i].FieldName;
          if CodigosHorario.IndexOf(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString) = -1 then
          begin
            CodigosHorario.Add(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString);

            // Pega os dados do horário
            TPontoHorarioController.SetDataSet(CDSPontoHorario);
            TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString), 0);

            PrintFast.ImprString('', CDSPontoHorarioCODIGO.AsString, 0, False);
            PrintFast.ImprString('', CDSPontoHorarioENTRADA01.AsString, 25, False);
            PrintFast.ImprString('', CDSPontoHorarioSAIDA01.AsString, 35, False);
            PrintFast.ImprString('', CDSPontoHorarioENTRADA02.AsString, 45, False);
            PrintFast.ImprString('', CDSPontoHorarioSAIDA02.AsString, 55, True);
          end;
        end;
      end;

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.ImprComo(PNegrito);
      PrintFast.ImprString('', 'Período: ' + '01/' + EditMesAno.Text + ' a ' + UltimoDiaMes(Calendario.MinDate) + '/' + EditMesAno.Text, 0, True);
      PrintFast.ImprComo(TNegrito);

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.ImprString('', 'Dia', 0, False);
      PrintFast.ImprString('', 'Marcações registradas no ponto eletrônico', 5, False);
      PrintFast.ImprString('', 'Jornada Realizada', 55, False);
      PrintFast.ImprString('', 'CH', 115, False);
      PrintFast.ImprString('', 'Tratamentos efetuados sobre os dados originais', 125, True);

      PrintFast.ImprString('', 'Entrada', 55, False);
      PrintFast.ImprString('', 'Saída', 65, False);
      PrintFast.ImprString('', 'Entrada', 75, False);
      PrintFast.ImprString('', 'Saída', 85, False);
      PrintFast.ImprString('', 'Entrada', 95, False);
      PrintFast.ImprString('', 'Saída', 105, False);
      PrintFast.ImprString('', 'Horário', 125, False);
      PrintFast.ImprString('', 'Ocor.', 133, False);
      PrintFast.ImprString('', 'Motivo', 140, True);

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      // Pega todas as marcações do mês do colaborador selecionado
      DataInicial := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-01';
      DataFinal := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-' + UltimoDiaMes(Copy(EditMesAno.Text, 1, 2));
      TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
      TPontoMarcacaoController.Consulta('ID_COLABORADOR = ' + QuotedStr(EditIdColaborador.Text) + ' and (DATA_MARCACAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')', -1);

      CDSPontoFechamentoJornada.DisableControls;
      CDSPontoFechamentoJornada.First;
      while not CDSPontoFechamentoJornada.Eof do
      begin

        // Filtra as marcações do dia selecionado
        CDSPontoMarcacao.Filtered := False;
        CDSPontoMarcacao.Filter := 'DATA_MARCACAO = ' + QuotedStr(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString);
        CDSPontoMarcacao.Filtered := True;
        CDSPontoMarcacao.IndexFieldNames := 'HORA_MARCACAO';

        if CDSPontoMarcacao.RecordCount > 0 then
        begin

          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 1, 2), 0, False);

          CDSPontoMarcacao.First;
          ContadorMarcacao := 5;
          while not CDSPontoMarcacao.eof do
          begin
            PrintFast.ImprString('', Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5), ContadorMarcacao, False);
            Inc(ContadorMarcacao, 6);
            CDSPontoMarcacao.Next;
          end;

          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaENTRADA01.AsString, 1, 5), 55, False);
          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaSAIDA01.AsString, 1, 5), 65, False);
          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaENTRADA02.AsString, 1, 5), 75, False);
          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaSAIDA02.AsString, 1, 5), 85, False);
          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaENTRADA03.AsString, 1, 5), 95, False);
          PrintFast.ImprString('', Copy(CDSPontoFechamentoJornadaSAIDA03.AsString, 1, 5), 105, False);
          PrintFast.ImprString('', CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString, 115, False);

          // Novo laço para imprimir os tratamentos efetuados no arquivo
          CDSPontoMarcacao.First;
          while not CDSPontoMarcacao.eof do
          begin
            if (CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'I') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'P') then
            begin
              HouveTratamento := True;

              PrintFast.ImprString('', Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5), 125, False);

              if CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D' then
                PrintFast.ImprString('', 'D', 133, False)
              else
                PrintFast.ImprString('', CDSPontoMarcacaoTIPO_REGISTRO.AsString, 133, False);

              PrintFast.ImprString('', CDSPontoMarcacaoJUSTIFICATIVA.AsString, 140, True);
            end;
            CDSPontoMarcacao.Next;
          end;

          if not HouveTratamento then
            PrintFast.ImprString('', '', 0, True);
        end;
        CDSPontoFechamentoJornada.Next;
      end;
      CDSPontoFechamentoJornada.First;
      CDSPontoFechamentoJornada.EnableControls;

      PrintFast.ImprString('', PrintFast.Repete('-', 180), 0, True);

      PrintFast.Ejeta;
      PrintFast.FimImpr;
    end;
  end
  else
    Application.MessageBox('Não existem dados para serem impressos.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
end;
*)
{$EndRegion}

{$REGION 'Word'}
(*
procedure TFPontoEspelho.ActionGerarParaWordExecute(Sender: TObject);
var
  i: Integer;
  CodigosHorario: TStringList;
  CampoAtual: String;
  DataInicial, DataFinal: String;
  HouveTratamento: Boolean;
  WinWord, Docs, Doc, tabs, tab: Variant;
begin
  if not CDSPontoFechamentoJornada.IsEmpty then
  begin
    WinWord := CreateOleObject('Word.Application');
    WinWord.Visible := True;
    Docs := WinWord.Documents;
    Doc := Docs.Open(ExtractFilePath(Application.ExeName)+'LayoutPonto.doc');
    tabs := WinWord.Selection;

    // Cabeçalhos
    Doc.Content.Find.Execute(FindText := '<EMPREGADOR>', ReplaceWith := Sessao.Empresa.RazaoSocial);
    Doc.Content.Find.Execute(FindText := '<ENDERECO>', ReplaceWith := Sessao.Empresa.ListaEnderecoVO.Items[0].Logradouro);
    Doc.Content.Find.Execute(FindText := '<EMPREGADO>', ReplaceWith := TColaboradorVO(ObjetoVO).PisNumero + ' - ' + TColaboradorVO(ObjetoVO).PessoaNome);
    Doc.Content.Find.Execute(FindText := '<ADMISSAO>', ReplaceWith := DateToStr(TColaboradorVO(ObjetoVO).DataAdmissao));
    Doc.Content.Find.Execute(FindText := '<EMITIDO_EM>', ReplaceWith := DateToStr(Date));
    Doc.Content.Find.Execute(FindText := '<PERIODO>', ReplaceWith := '01/' + EditMesAno.Text + ' a ' + UltimoDiaMes(Calendario.MinDate) + '/' + EditMesAno.Text);

    // Pega os dados da escala e turma do colaborador selecionado
    TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
    TViewPontoEscalaTurmaController.Consulta('CODIGO_TURMA = ' + QuotedStr(TColaboradorVO(ObjetoVO).CodigoTurmaPonto), 0);

    // posiciona o cursor dentro da tabela de horários
    for i := 1 to 12 do
      tab := tabs.movedown;

    WinWord.Selection.HomeKey;

    tab := tabs.movedown;
    tab := tabs.movedown;

    CodigosHorario := TStringList.Create;
    for i := 0 to CDSPontoEscalaTurma.FieldList.Count - 1 do
    begin
      if Copy(CDSPontoEscalaTurma.FieldList.Fields[i].FieldName, 1, 14) = 'CODIGO_HORARIO' then
      begin
        CampoAtual := CDSPontoEscalaTurma.FieldList.Fields[i].FieldName;
        if CodigosHorario.IndexOf(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString) = -1 then
        begin
          CodigosHorario.Add(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString);

          // Pega os dados do horário
          TPontoHorarioController.SetDataSet(CDSPontoHorario);
          TPontoHorarioController.Consulta('CODIGO = ' + QuotedStr(CDSPontoEscalaTurma.FieldByName(CampoAtual).AsString), 0);

          tab := tabs.InsertBefore('<CH>');
          tab := tabs.move;
          tab := tabs.move;
          tab := tabs.InsertBefore('<ENTRADA01>');
          tab := tabs.move;
          tab := tabs.move;
          tab := tabs.InsertBefore('<SAIDA01>');
          tab := tabs.move;
          tab := tabs.move;
          tab := tabs.InsertBefore('<ENTRADA02>');
          tab := tabs.move;
          tab := tabs.move;
          tab := tabs.InsertBefore('<SAIDA02>');
          tab := tabs.move;
          tab := tabs.move;
          tab := tabs.move;

          Doc.Content.Find.Execute(FindText := '<CH>', ReplaceWith := CDSPontoHorarioCODIGO.AsString);
          Doc.Content.Find.Execute(FindText := '<ENTRADA01>', ReplaceWith := CDSPontoHorarioENTRADA01.AsString);
          Doc.Content.Find.Execute(FindText := '<SAIDA01>', ReplaceWith := CDSPontoHorarioSAIDA01.AsString);
          Doc.Content.Find.Execute(FindText := '<ENTRADA02>', ReplaceWith := CDSPontoHorarioENTRADA02.AsString);
          Doc.Content.Find.Execute(FindText := '<SAIDA02>', ReplaceWith := CDSPontoHorarioSAIDA02.AsString);
        end;
      end;
    end;

    // posiciona o cursor dentro da tabela da jornada
    for i := 1 to 3 do
      tab := tabs.movedown;

    // Pega todas as marcações do mês do colaborador selecionado
    DataInicial := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-01';
    DataFinal := Copy(EditMesAno.Text, 4, 4) + '-' + Copy(EditMesAno.Text, 1, 2) + '-' + UltimoDiaMes(Copy(EditMesAno.Text, 1, 2));
    TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
    TPontoMarcacaoController.Consulta('ID_COLABORADOR = ' + QuotedStr(EditIdColaborador.Text) + ' and (DATA_MARCACAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')', -1);

    CDSPontoFechamentoJornada.DisableControls;
    CDSPontoFechamentoJornada.First;
    while not CDSPontoFechamentoJornada.Eof do
    begin

      // Filtra as marcações do dia selecionado
      CDSPontoMarcacao.Filtered := False;
      CDSPontoMarcacao.Filter := 'DATA_MARCACAO = ' + QuotedStr(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString);
      CDSPontoMarcacao.Filtered := True;
      CDSPontoMarcacao.IndexFieldNames := 'HORA_MARCACAO';

      if CDSPontoMarcacao.RecordCount > 0 then
      begin

        tab := tabs.InsertBefore('<DATA_FECHAMENTO>');
        tab := tabs.move;
        tab := tabs.move;
        Doc.Content.Find.Execute(FindText := '<DATA_FECHAMENTO>', ReplaceWith := Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 1, 2));

        CDSPontoMarcacao.First;
        while not CDSPontoMarcacao.eof do
        begin
          tab := tabs.InsertBefore('<HORA_MARCACAO>');
          tab := tabs.move;
          Doc.Content.Find.Execute(FindText := '<HORA_MARCACAO>', ReplaceWith := Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5) + ' ');
          CDSPontoMarcacao.Next;
        end;

        tab := tabs.move;
        tab := tabs.InsertBefore('<ENTRADA01>');
        tab := tabs.move;
        tab := tabs.move;
        tab := tabs.InsertBefore('<SAIDA01>');
        tab := tabs.move;
        tab := tabs.move;
        tab := tabs.InsertBefore('<ENTRADA02>');
        tab := tabs.move;
        tab := tabs.move;
        tab := tabs.InsertBefore('<SAIDA02>');
        tab := tabs.move;
        tab := tabs.move;
        tab := tabs.InsertBefore('<ENTRADA03>');
        tab := tabs.move;
        tab := tabs.move;
        tab := tabs.InsertBefore('<SAIDA03>');
        tab := tabs.move;
        tab := tabs.move;
        tab := tabs.InsertBefore('<CH>');
        tab := tabs.move;
        tab := tabs.move;

        Doc.Content.Find.Execute(FindText := '<ENTRADA01>', ReplaceWith := Copy(CDSPontoFechamentoJornadaENTRADA01.AsString, 1, 5));
        Doc.Content.Find.Execute(FindText := '<SAIDA01>', ReplaceWith := Copy(CDSPontoFechamentoJornadaSAIDA01.AsString, 1, 5));
        Doc.Content.Find.Execute(FindText := '<ENTRADA02>', ReplaceWith := Copy(CDSPontoFechamentoJornadaENTRADA02.AsString, 1, 5));
        Doc.Content.Find.Execute(FindText := '<SAIDA02>', ReplaceWith := Copy(CDSPontoFechamentoJornadaSAIDA02.AsString, 1, 5));
        Doc.Content.Find.Execute(FindText := '<ENTRADA03>', ReplaceWith := Copy(CDSPontoFechamentoJornadaENTRADA03.AsString, 1, 5));
        Doc.Content.Find.Execute(FindText := '<SAIDA03>', ReplaceWith := Copy(CDSPontoFechamentoJornadaSAIDA03.AsString, 1, 5));
        Doc.Content.Find.Execute(FindText := '<CH>', ReplaceWith := CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString);

        // Novo laço para imprimir os tratamentos efetuados no arquivo
        tab := tabs.moveup;
        CDSPontoMarcacao.First;
        while not CDSPontoMarcacao.eof do
        begin
          if (CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'I') or (CDSPontoMarcacaoTIPO_REGISTRO.AsString = 'P') then
          begin
            tab := tabs.movedown;

            HouveTratamento := True;

            tab := tabs.InsertBefore('<HORARIO>');
            tab := tabs.move;
            tab := tabs.move;
            tab := tabs.InsertBefore('<OCOR>');
            tab := tabs.move;
            tab := tabs.move;
            tab := tabs.InsertBefore('<MOTIVO>');

            Doc.Content.Find.Execute(FindText := '<HORARIO>', ReplaceWith := Copy(CDSPontoMarcacaoHORA_MARCACAO.AsString, 1, 5));

            if CDSPontoMarcacaoTIPO_MARCACAO.AsString = 'D' then
              Doc.Content.Find.Execute(FindText := '<OCOR>', ReplaceWith := 'D')
            else
              Doc.Content.Find.Execute(FindText := '<OCOR>', ReplaceWith := CDSPontoMarcacaoTIPO_REGISTRO.AsString);

            Doc.Content.Find.Execute(FindText := '<MOTIVO>', ReplaceWith := CDSPontoMarcacaoJUSTIFICATIVA.AsString);
          end;
          CDSPontoMarcacao.Next;
        end;

        if not HouveTratamento then
          tab := tabs.movedown;

        for i := 1 to 4 do
          tab := tabs.move;

      end;
      CDSPontoFechamentoJornada.Next;
    end;
    CDSPontoFechamentoJornada.First;
    CDSPontoFechamentoJornada.EnableControls;

    Doc.SaveAs(ExtractFilePath(Application.ExeName) + 'EspelhoPonto_' + FormatDateTime('DDMMYYYYhhmmss', Now));

    //Doc.PrintOut(false);
    //WinWord.Quit;
  end
  else
    Application.MessageBox('Não existem dados para serem impressos.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
end;
*)
{$ENDREGION}

end.
