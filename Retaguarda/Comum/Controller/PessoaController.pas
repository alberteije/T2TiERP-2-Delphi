{ *******************************************************************************
Title: T2Ti ERP
Description: Controller relacionado à tabela [PESSOA]

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
t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit PessoaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti, Atributos,
  VO, PessoaVO, Generics.Collections;

type
  TPessoaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TPessoaVO>;
    class function ConsultaObjeto(pFiltro: String): TPessoaVO;

    class procedure Insere(pObjeto: TPessoaVO);
    class function Altera(pObjeto: TPessoaVO): Boolean;

    class function Exclui(pId: Integer): Boolean;
    class function ExcluiContato(pId: Integer): Boolean;
    class function ExcluiEndereco(pId: Integer): Boolean;
    class function ExcluiTelefone(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM,
     PessoaFisicaVO, PessoaJuridicaVO, PessoaContatoVO, PessoaEnderecoVO,
     PessoaTelefoneVO, PessoaAlteracaoVO;

class procedure TPessoaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TPessoaVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TPessoaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TPessoaVO>(Retorno);
  finally
  end;
end;

class function TPessoaController.ConsultaLista(pFiltro: String): TObjectList<TPessoaVO>;
begin
  try
    Result := TT2TiORM.Consultar<TPessoaVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TPessoaController.ConsultaObjeto(pFiltro: String): TPessoaVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TPessoaVO>(pFiltro, True);
  finally
  end;
end;

class procedure TPessoaController.Insere(pObjeto: TPessoaVO);
var
  UltimoID: Integer;
  Contato: TPessoaContatoVO;
  Endereco: TPessoaEnderecoVO;
  Telefone: TPessoaTelefoneVO;
  ContatosEnumerator: TEnumerator<TPessoaContatoVO>;
  EnderecosEnumerator: TEnumerator<TPessoaEnderecoVO>;
  TelefonesEnumerator: TEnumerator<TPessoaTelefoneVO>;
  TipoPessoa: String;
begin
  try
    TipoPessoa := pObjeto.Tipo;
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Tipo de Pessoa
    if TipoPessoa = 'F' then
    begin
      pObjeto.PessoaFisicaVO.IdPessoa := UltimoID;
      TT2TiORM.Inserir(pObjeto.PessoaFisicaVO);
    end
    else if TipoPessoa = 'J' then
    begin
      pObjeto.PessoaJuridicaVO.IdPessoa := UltimoID;
      TT2TiORM.Inserir(pObjeto.PessoaJuridicaVO);
    end;

    // Contatos
    ContatosEnumerator := pObjeto.ListaPessoaContatoVO.GetEnumerator;
    try
      with ContatosEnumerator do
      begin
        while MoveNext do
        begin
          Contato := Current;
          Contato.IdPessoa := UltimoID;
          TT2TiORM.Inserir(Contato);
        end;
      end;
    finally
      FreeAndNil(ContatosEnumerator);
    end;

    // Endereços
    EnderecosEnumerator := pObjeto.ListaPessoaEnderecoVO.GetEnumerator;
    try
      with EnderecosEnumerator do
      begin
        while MoveNext do
        begin
          Endereco := Current;
          Endereco.IdPessoa := UltimoID;
          TT2TiORM.Inserir(Endereco);
        end;
      end;
    finally
      FreeAndNil(EnderecosEnumerator);
    end;

    // Telefones
    TelefonesEnumerator := pObjeto.ListaPessoaTelefoneVO.GetEnumerator;
    try
      with TelefonesEnumerator do
      begin
        while MoveNext do
        begin
          Telefone := Current;
          Telefone.IdPessoa := UltimoID;
          TT2TiORM.Inserir(Telefone);
        end;
      end;
    finally
      FreeAndNil(TelefonesEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TPessoaController.Altera(pObjeto: TPessoaVO): Boolean;
var
  ContatosEnumerator: TEnumerator<TPessoaContatoVO>;
  EnderecosEnumerator: TEnumerator<TPessoaEnderecoVO>;
  TelefonesEnumerator: TEnumerator<TPessoaTelefoneVO>;
  PessoaAlteracao: TPessoaAlteracaoVO;
  PessoaOld: TPessoaVO;
  TipoPessoa: String;
begin
  try
    PessoaOld := ConsultaObjeto('ID='+pObjeto.Id.ToString);
    Result := TT2TiORM.Alterar(pObjeto);

    TipoPessoa := pObjeto.Tipo;

    // Tipo de Pessoa
    try
      if TipoPessoa = 'F' then
      begin
        if pObjeto.PessoaFisicaVO.Id > 0 then
          Result := TT2TiORM.Alterar(pObjeto.PessoaFisicaVO)
        else
          Result := TT2TiORM.Inserir(pObjeto.PessoaFisicaVO) > 0;
      end
      else if TipoPessoa = 'J' then
      begin
        if pObjeto.PessoaJuridicaVO.Id > 0 then
          Result := TT2TiORM.Alterar(pObjeto.PessoaJuridicaVO)
        else
          Result := TT2TiORM.Inserir(pObjeto.PessoaJuridicaVO) > 0;
      end;
    finally
    end;

    // Contatos
    try
      ContatosEnumerator := pObjeto.ListaPessoaContatoVO.GetEnumerator;
      with ContatosEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPessoa := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ContatosEnumerator);
    end;

    // Endereços
    try
      EnderecosEnumerator := pObjeto.ListaPessoaEnderecoVO.GetEnumerator;
      with EnderecosEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPessoa := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(EnderecosEnumerator);
    end;

    // Telefones
    try
      TelefonesEnumerator := pObjeto.ListaPessoaTelefoneVO.GetEnumerator;
      with TelefonesEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPessoa := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(TelefonesEnumerator);
    end;

    // Alteração - Para Registro 0175 do Sped Fiscal.
    PessoaAlteracao := TPessoaAlteracaoVO.Create;
    PessoaAlteracao.IdPessoa := pObjeto.Id;
    PessoaAlteracao.DataAlteracao := Date;
    PessoaAlteracao.ObjetoAntigo := PessoaOld.ToJsonString;
    PessoaAlteracao.ObjetoNovo := pObjeto.ToJsonString;
    TT2TiORM.Inserir(PessoaAlteracao)

  finally
    FreeAndNil(PessoaAlteracao);
    FreeAndNil(PessoaOld);
  end;
end;

class function TPessoaController.Exclui(pId: Integer): Boolean;
begin
  try
    raise Exception.Create('Não é permitido excluir uma Pessoa.');
  finally
  end;
end;

class function TPessoaController.ExcluiContato(pId: Integer): Boolean;
var
  ObjetoLocal: TPessoaContatoVO;
begin
  try
    ObjetoLocal := TPessoaContatoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPessoaController.ExcluiEndereco(pId: Integer): Boolean;
var
  ObjetoLocal: TPessoaEnderecoVO;
begin
  try
    ObjetoLocal := TPessoaEnderecoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPessoaController.ExcluiTelefone(pId: Integer): Boolean;
var
  ObjetoLocal: TPessoaTelefoneVO;
begin
  try
    ObjetoLocal := TPessoaTelefoneVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPessoaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPessoaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TPessoaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TPessoaVO>(TObjectList<TPessoaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TPessoaController);

finalization
  Classes.UnRegisterClass(TPessoaController);

end.
