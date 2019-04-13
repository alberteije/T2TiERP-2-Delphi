{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Livros Contábeis

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

  @author Albert Eije (alberteije@gmail.com)
  @version 1.0
  ******************************************************************************* }
unit UContabilLivrosContabeis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, rpgraphicex, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, ACBrPonto_AFD_Class, Mask, JvExMask,
  JvToolEdit, LabeledCtrls, ACBrPonto_AFDT_Class, ComCtrls, JvBaseEdits, SessaoUsuario;

type
  TFContabilLivrosContabeis = class(TForm)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionLivroDiario: TAction;
    PageControlItens: TPageControl;
    tsDados: TTabSheet;
    PanelDados: TPanel;
    ActionSair: TAction;
    PanelMestre: TPanel;
    EditPeriodo: TLabeledMaskEdit;
    ActionLivroRazao: TAction;
    ActionLivroBalancete: TAction;
    ActionLivroCaixa: TAction;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionLivroDiarioExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionLivroCaixaExecute(Sender: TObject);
    procedure ActionLivroBalanceteExecute(Sender: TObject);
    procedure ActionLivroRazaoExecute(Sender: TObject);

    class function Sessao: TSessaoUsuario;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilLivrosContabeis: TFContabilLivrosContabeis;

implementation

uses
  UDataModule;
{$R *.dfm}

class function TFContabilLivrosContabeis.Sessao: TSessaoUsuario;
begin
  Result := TSessaoUsuario.Instance;
end;

procedure TFContabilLivrosContabeis.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFContabilLivrosContabeis.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFContabilLivrosContabeis.FormShow(Sender: TObject);
begin
  EditPeriodo.Clear;
  EditPeriodo.SetFocus;
end;

procedure TFContabilLivrosContabeis.ActionLivroBalanceteExecute(Sender: TObject);
begin
  Application.MessageBox('Emitido no SPED Contábil.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFContabilLivrosContabeis.ActionLivroDiarioExecute(Sender: TObject);
begin
  Application.MessageBox('Emitido no SPED Contábil.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFContabilLivrosContabeis.ActionLivroRazaoExecute(Sender: TObject);
begin
  Application.MessageBox('Emitido no SPED Contábil.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFContabilLivrosContabeis.ActionLivroCaixaExecute(Sender: TObject);
var
  RemoteDataInfo: TStringList;
  ConsultaSQL, NomeArquivo: String;
  i: Integer;
begin
  try
    try
      NomeArquivo := 'LivroCaixa.rep';

      FDataModule.VCLReport.GetRemoteParams(Sessao.ServidorImpressao.Servidor, Sessao.ServidorImpressao.Porta, Sessao.ServidorImpressao.Usuario, Sessao.ServidorImpressao.Senha, Sessao.ServidorImpressao.Alias, NomeArquivo);
      FDataModule.VCLReport.Report.Params.ParamByName('PERIODO').Value := EditPeriodo.Text;
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
end;

end.
