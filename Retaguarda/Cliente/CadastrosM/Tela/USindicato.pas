{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Sindicato

The MIT License

Copyright: Copyright (C) 2015 T2Ti.COM

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

t2ti.com@gmail.com
@author Albert Eije (T2Ti.COM)
@version 2.0
  ******************************************************************************* }
unit USindicato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, SindicatoVO,
  SindicatoController, Tipos, Atributos, Constantes, LabeledCtrls, JvToolEdit,
  Mask, JvExMask, JvBaseEdits, Math, StrUtils, Controller;

type
  [TFormDescription(TConstantes.MODULO_CADASTROS, 'Sindicato')]

  TFSindicato = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditNome: TLabeledEdit;
    EditContaBanco: TLabeledEdit;
    EditCodigoCedente: TLabeledEdit;
    EditLogradouro: TLabeledEdit;
    EditNumero: TLabeledEdit;
    EditBairro: TLabeledEdit;
    EditUf: TLabeledEdit;
    EditFone1: TLabeledMaskEdit;
    EditEmail: TLabeledEdit;
    EditDataBase: TLabeledDateEdit;
    EditFone2: TLabeledMaskEdit;
    EditCodigoBanco: TLabeledCalcEdit;
    EditCodigoAgencia: TLabeledCalcEdit;
    EditMunicipioIbge: TLabeledCalcEdit;
    EditPisoSalarial: TLabeledCalcEdit;
    ComboboxTipo: TLabeledComboBox;
    EditCNPJ: TLabeledMaskEdit;
    EditClassificacaoContabilConta: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditClassificacaoContabilContaKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

  end;

var
  FSindicato: TFSindicato;

implementation

uses ULookup, Biblioteca, UDataModule, PessoaVO, PessoaController, ContabilContaVO, ContabilContaController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFSindicato.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TSindicatoVO;
  ObjetoController := TSindicatoController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFSindicato.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFSindicato.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFSindicato.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('SindicatoController.TSindicatoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      Result := TController.RetornoBoolean;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TController.ExecutarMetodo('SindicatoController.TSindicatoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFSindicato.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TSindicatoVO.Create;

      TSindicatoVO(ObjetoVO).Nome := EditNome.Text;
      TSindicatoVO(ObjetoVO).Cnpj := EditCnpj.Text;
      TSindicatoVO(ObjetoVO).ClassificacaoContabilConta := EditClassificacaoContabilConta.Text;
      TSindicatoVO(ObjetoVO).CodigoBanco := EditCodigoBanco.AsInteger;
      TSindicatoVO(ObjetoVO).CodigoAgencia := EditCodigoAgencia.AsInteger;
      TSindicatoVO(ObjetoVO).ContaBanco := EditContaBanco.Text;
      TSindicatoVO(ObjetoVO).CodigoCedente := EditCodigoCedente.Text;
      TSindicatoVO(ObjetoVO).Logradouro := EditLogradouro.Text;
      TSindicatoVO(ObjetoVO).Numero := EditNumero.Text;
      TSindicatoVO(ObjetoVO).Bairro := EditBairro.Text;
      TSindicatoVO(ObjetoVO).MunicipioIbge := EditMunicipioIbge.AsInteger;
      TSindicatoVO(ObjetoVO).Uf := EditUf.Text;
      TSindicatoVO(ObjetoVO).Fone1 := EditFone1.Text;
      TSindicatoVO(ObjetoVO).Fone2 := EditFone2.Text;
      TSindicatoVO(ObjetoVO).Email := EditEmail.Text;
      TSindicatoVO(ObjetoVO).PisoSalarial := EditPisoSalarial.Value;
      TSindicatoVO(ObjetoVO).TipoSindicato := Copy(ComboboxTipo.Text, 1, 1);
      TSindicatoVO(ObjetoVO).DataBase := EditDataBase.Date;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('SindicatoController.TSindicatoController', 'Insere', [TSindicatoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TSindicatoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('SindicatoController.TSindicatoController', 'Altera', [TSindicatoVO(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
    except
      Result := False;
    end;
  end;
end;
procedure TFSindicato.EditClassificacaoContabilContaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//exercício
end;

{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFSindicato.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TSindicatoVO(TController.BuscarObjeto('SindicatoController.TSindicatoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNome.Text := TSindicatoVO(ObjetoVO).Nome;
    EditCnpj.Text := TSindicatoVO(ObjetoVO).Cnpj;
    EditClassificacaoContabilConta.Text := TSindicatoVO(ObjetoVO).ClassificacaoContabilConta;
    EditCodigoBanco.AsInteger := TSindicatoVO(ObjetoVO).CodigoBanco;
    EditCodigoAgencia.AsInteger := TSindicatoVO(ObjetoVO).CodigoAgencia;
    EditContaBanco.Text := TSindicatoVO(ObjetoVO).ContaBanco;
    EditCodigoCedente.Text := TSindicatoVO(ObjetoVO).CodigoCedente;
    EditLogradouro.Text := TSindicatoVO(ObjetoVO).Logradouro;
    EditNumero.Text := TSindicatoVO(ObjetoVO).Numero;
    EditBairro.Text := TSindicatoVO(ObjetoVO).Bairro;
    EditMunicipioIbge.AsInteger := TSindicatoVO(ObjetoVO).MunicipioIbge;
    EditUf.Text := TSindicatoVO(ObjetoVO).Uf;
    EditFone1.Text := TSindicatoVO(ObjetoVO).Fone1;
    EditFone2.Text := TSindicatoVO(ObjetoVO).Fone2;
    EditEmail.Text := TSindicatoVO(ObjetoVO).Email;
    EditPisoSalarial.Value := TSindicatoVO(ObjetoVO).PisoSalarial;
    ComboboxTipo.ItemIndex := AnsiIndexStr(TSindicatoVO(ObjetoVO).TipoSindicato, ['P', 'E']);
    EditDataBase.Date := TSindicatoVO(ObjetoVO).DataBase;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
