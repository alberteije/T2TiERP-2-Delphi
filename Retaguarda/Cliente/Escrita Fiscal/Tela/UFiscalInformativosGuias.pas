{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Informativos e Guias para o módulo Escrita Fiscal

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

@author Albert Eije (T2Ti.COM)
@version 2.0
******************************************************************************* }
unit UFiscalInformativosGuias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, ACBrPonto_AFD_Class, Mask, JvExMask,
  JvToolEdit, LabeledCtrls, ACBrPonto_AFDT_Class, ComCtrls, JvBaseEdits, SessaoUsuario,
  System.Actions, Vcl.Imaging.pngimage, Controller, COMObj;

type
  TFFiscalInformativosGuias = class(TForm)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    PageControlItens: TPageControl;
    ActionSair: TAction;
    tsGuias: TTabSheet;
    Panel1: TPanel;
    GroupBox10: TGroupBox;
    EditValorMulta: TLabeledCalcEdit;
    EditValorJuros: TLabeledCalcEdit;
    ActionGerarDarf: TAction;
    EditDataVencimento: TLabeledDateEdit;
    EditPeriodoApuracao: TLabeledDateEdit;
    EditCodigoReceita: TLabeledMaskEdit;
    EditNumeroReferencia: TLabeledMaskEdit;
    EditValorPrincipal: TLabeledCalcEdit;
    EditValorTotal: TLabeledCalcEdit;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionGerarDarfExecute(Sender: TObject);

    class function Sessao: TSessaoUsuario;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiscalInformativosGuias: TFFiscalInformativosGuias;

implementation

uses
  UDataModule;
{$R *.dfm}

class function TFFiscalInformativosGuias.Sessao: TSessaoUsuario;
begin
  Result := TSessaoUsuario.Instance;
end;

procedure TFFiscalInformativosGuias.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFFiscalInformativosGuias.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFFiscalInformativosGuias.ActionGerarDarfExecute(Sender: TObject);
var
  (*
  RemoteDataInfo: TStringList;
  ConsultaSQL, NomeArquivo: String;
  i: Integer;
  *)
  ReportManager: Variant;
begin
  (*
  try
    try
      NomeArquivo := 'DARF.rep';

      FDataModule.VCLReport.GetRemoteParams(Sessao.ServidorImpressao.Servidor, Sessao.ServidorImpressao.Porta, Sessao.ServidorImpressao.Usuario, Sessao.ServidorImpressao.Senha, Sessao.ServidorImpressao.Alias, NomeArquivo);
      FDataModule.VCLReport.Report.Params.ParamByName('PERIODOAPURACAO').Value := EditPeriodoApuracao.Text;
      FDataModule.VCLReport.Report.Params.ParamByName('DATAVENCIMENTO').Value := EditDataVencimento.Text;
      FDataModule.VCLReport.Report.Params.ParamByName('CODIGORECEITA').Value := EditCodigoReceita.Text;
      FDataModule.VCLReport.Report.Params.ParamByName('NUMEROREFERENCIA').Value := EditNumeroReferencia.Text;
      FDataModule.VCLReport.Report.Params.ParamByName('VALORPRINCIPAL').Value := EditValorPrincipal.Value;
      FDataModule.VCLReport.Report.Params.ParamByName('VALORMULTA').Value := EditValorMulta.Value;
      FDataModule.VCLReport.Report.Params.ParamByName('VALORJURO').Value := EditValorJuros.Value;
      FDataModule.VCLReport.Report.Params.ParamByName('VALORTOTAL').Value := EditValorTotal.Value;
      //
      FDataModule.VCLReport.GetRemoteDataInfo(Sessao.ServidorImpressao.Servidor, Sessao.ServidorImpressao.Porta, Sessao.ServidorImpressao.Usuario, Sessao.ServidorImpressao.Senha, Sessao.ServidorImpressao.Alias, NomeArquivo);
      RemoteDataInfo := FDataModule.VCLReport.Report.RemoteDataInfo;
      //
      ConsultaSQL := '';

      FDataModule.VCLReport.ExecuteRemote(Sessao.ServidorImpressao.Servidor, Sessao.ServidorImpressao.Porta, Sessao.ServidorImpressao.Usuario, Sessao.ServidorImpressao.Senha, Sessao.ServidorImpressao.Alias, NomeArquivo, ConsultaSQL);
    except
      on E: Exception do
        Application.MessageBox(PChar('Ocorreu um erro na construção do relatório. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
    end;
  finally
  end;
  *)
  try
    ReportManager := CreateOleObject('ReportMan.ReportManX');
    ReportManager.Preview := True;
    ReportManager.ShowProgress := True;
    ReportManager.ShowPrintDialog := False;
    ReportManager.Filename := 'C:\T2Ti\Relatorios\DARF.rep';
    ReportManager.SetParamValue('PERIODOAPURACAO', EditPeriodoApuracao.Text);
    ReportManager.SetParamValue('DATAVENCIMENTO', EditDataVencimento.Text);
    ReportManager.SetParamValue('CODIGORECEITA', EditCodigoReceita.Text);
    ReportManager.SetParamValue('NUMEROREFERENCIA', EditNumeroReferencia.Text);
    ReportManager.SetParamValue('VALORPRINCIPAL', EditValorPrincipal.Text);
    ReportManager.SetParamValue('VALORMULTA', EditValorMulta.Text);
    ReportManager.SetParamValue('VALORJURO', EditValorJuros.Text);
    ReportManager.SetParamValue('VALORTOTAL', EditValorTotal.Text);
    ReportManager.execute;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a impressão. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

end.
