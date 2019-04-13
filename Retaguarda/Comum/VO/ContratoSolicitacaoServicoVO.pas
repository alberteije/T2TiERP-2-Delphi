{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTRATO_SOLICITACAO_SERVICO] 
                                                                                
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
unit ContratoSolicitacaoServicoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, ViewPessoaFornecedorVO, ViewPessoaClienteVO,
  SetorVO, ContratoTipoServicoVO;

type
  [TEntity]
  [TTable('CONTRATO_SOLICITACAO_SERVICO')]
  TContratoSolicitacaoServicoVO = class(TVO)
  private
    FID: Integer;
    FID_FORNECEDOR: Integer;
    FID_CLIENTE: Integer;
    FID_SETOR: Integer;
    FID_COLABORADOR: Integer;
    FID_CONTRATO_TIPO_SERVICO: Integer;
    FDATA_SOLICITACAO: TDateTime;
    FDATA_DESEJADA_INICIO: TDateTime;
    FURGENTE: String;
    FSTATUS_SOLICITACAO: String;
    FDESCRICAO: String;

    //Transientes
    FFornecedorPessoaNome: String;
    FClientePessoaNome: String;
    FSetorNome: String;
    FColaboradorPessoaNome: String;
    FContratoTipoServicoNome: String;

    FFornecedorVO: TViewPessoaFornecedorVO;
    FClienteVO: TViewPessoaClienteVO;
    FSetorVO: TSetorVO;
    FColaboradorVO: TViewPessoaColaboradorVO;
    FContratoTipoServicoVO: TContratoTipoServicoVO;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_FORNECEDOR', 'Id Fornecedor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    [TColumnDisplay('FORNECEDOR.NOME', 'Fornecedor', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaFornecedorVO.TViewPessoaFornecedorVO', True)]
    property FornecedorPessoaNome: String read FFornecedorPessoaNome write FFornecedorPessoaNome;

    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumnDisplay('CLIENTE.NOME', 'Cliente', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaClienteVO.TViewPessoaClienteVO', True)]
    property ClientePessoaNome: String read FClientePessoaNome write FClientePessoaNome;

    [TColumn('ID_SETOR', 'Id Setor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSetor: Integer  read FID_SETOR write FID_SETOR;
    [TColumnDisplay('SETOR.NOME', 'Setor', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'SetorVO.TSetorVO', True)]
    property SetorNome: String read FSetorNome write FSetorNome;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumnDisplay('COLABORADOR.NOME', 'Solicitante', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    [TColumn('ID_CONTRATO_TIPO_SERVICO', 'Id Contrato Tipo Servico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContratoTipoServico: Integer  read FID_CONTRATO_TIPO_SERVICO write FID_CONTRATO_TIPO_SERVICO;
    [TColumnDisplay('CONTRATO_TIPO_SERVICO.NOME', 'Tipo Serviço', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'ContratoTipoServicoVO.TContratoTipoServicoVO', True)]
    property ContratoTipoServicoNome: String read FContratoTipoServicoNome write FContratoTipoServicoNome;

    [TColumn('DATA_SOLICITACAO', 'Data Solicitacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataSolicitacao: TDateTime  read FDATA_SOLICITACAO write FDATA_SOLICITACAO;
    [TColumn('DATA_DESEJADA_INICIO', 'Data Desejada Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataDesejadaInicio: TDateTime  read FDATA_DESEJADA_INICIO write FDATA_DESEJADA_INICIO;
    [TColumn('URGENTE', 'Urgente', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Urgente: String  read FURGENTE write FURGENTE;
    [TColumn('STATUS_SOLICITACAO', 'Status Solicitacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property StatusSolicitacao: String  read FSTATUS_SOLICITACAO write FSTATUS_SOLICITACAO;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;


    //Transientes
    [TAssociation('ID', 'ID_FORNECEDOR')]
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    [TAssociation('ID', 'ID_CLIENTE')]
    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    [TAssociation('ID', 'ID_SETOR')]
    property SetorVO: TSetorVO read FSetorVO write FSetorVO;

    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TAssociation('ID', 'ID_CONTRATO_TIPO_SERVICO')]
    property ContratoTipoServicoVO: TContratoTipoServicoVO read FContratoTipoServicoVO write FContratoTipoServicoVO;


  end;

implementation

constructor TContratoSolicitacaoServicoVO.Create;
begin
  inherited;

  FFornecedorVO := TViewPessoaFornecedorVO.Create;
  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FSetorVO := TSetorVO.Create;
  FContratoTipoServicoVO := TContratoTipoServicoVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;
end;

destructor TContratoSolicitacaoServicoVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FSetorVO);
  FreeAndNil(FContratoTipoServicoVO);
  FreeAndNil(FClienteVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContratoSolicitacaoServicoVO);

finalization
  Classes.UnRegisterClass(TContratoSolicitacaoServicoVO);

end.
