{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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
unit FinConfiguracaoBoletoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ContaCaixaVO;

type
  [TEntity]
  [TTable('FIN_CONFIGURACAO_BOLETO')]
  TFinConfiguracaoBoletoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FINSTRUCAO01: String;
    FINSTRUCAO02: String;
    FCAMINHO_ARQUIVO_REMESSA: String;
    FCAMINHO_ARQUIVO_RETORNO: String;
    FCAMINHO_ARQUIVO_LOGOTIPO: String;
    FCAMINHO_ARQUIVO_PDF: String;
    FMENSAGEM: String;
    FLOCAL_PAGAMENTO: String;
    FLAYOUT_REMESSA: String;
    FACEITE: String;
    FESPECIE: String;
    FCARTEIRA: String;
    FCODIGO_CONVENIO: String;
    FCODIGO_CEDENTE: String;
    FTAXA_MULTA: Extended;

    //Transientes
    FContaCaixaNome: String;

    FContaCaixaVO: TContaCaixaVO;


  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumnDisplay('CONTA_CAIXA.NOME', 'Conta Caixa Nome', 100, [ldGrid, ldLookup], ftString, 'ContaCaixaVO.TContaCaixaVO', True)]
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('INSTRUCAO01', 'Instrucao01', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Instrucao01: String  read FINSTRUCAO01 write FINSTRUCAO01;
    [TColumn('INSTRUCAO02', 'Instrucao02', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Instrucao02: String  read FINSTRUCAO02 write FINSTRUCAO02;
    [TColumn('CAMINHO_ARQUIVO_REMESSA', 'Caminho Arquivo Remessa', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoArquivoRemessa: String  read FCAMINHO_ARQUIVO_REMESSA write FCAMINHO_ARQUIVO_REMESSA;
    [TColumn('CAMINHO_ARQUIVO_RETORNO', 'Caminho Arquivo Retorno', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoArquivoRetorno: String  read FCAMINHO_ARQUIVO_RETORNO write FCAMINHO_ARQUIVO_RETORNO;
    [TColumn('CAMINHO_ARQUIVO_LOGOTIPO', 'Caminho Arquivo Logotipo', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoArquivoLogotipo: String  read FCAMINHO_ARQUIVO_LOGOTIPO write FCAMINHO_ARQUIVO_LOGOTIPO;
    [TColumn('CAMINHO_ARQUIVO_PDF', 'Caminho Arquivo Pdf', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoArquivoPdf: String  read FCAMINHO_ARQUIVO_PDF write FCAMINHO_ARQUIVO_PDF;
    [TColumn('MENSAGEM', 'Mensagem', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Mensagem: String  read FMENSAGEM write FMENSAGEM;
    [TColumn('LOCAL_PAGAMENTO', 'Local Pagamento', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalPagamento: String  read FLOCAL_PAGAMENTO write FLOCAL_PAGAMENTO;
    [TColumn('LAYOUT_REMESSA', 'Layout Remessa', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property LayoutRemessa: String  read FLAYOUT_REMESSA write FLAYOUT_REMESSA;
    [TColumn('ACEITE', 'Aceite', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Aceite: String  read FACEITE write FACEITE;
    [TColumn('ESPECIE', 'Especie', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Especie: String  read FESPECIE write FESPECIE;
    [TColumn('CARTEIRA', 'Carteira', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Carteira: String  read FCARTEIRA write FCARTEIRA;
    [TColumn('CODIGO_CONVENIO', 'Codigo Convenio', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoConvenio: String  read FCODIGO_CONVENIO write FCODIGO_CONVENIO;
    [TColumn('CODIGO_CEDENTE', 'Codigo Cedente', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoCedente: String  read FCODIGO_CEDENTE write FCODIGO_CEDENTE;
    [TColumn('TAXA_MULTA', 'Taxa Multa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;


    //Transientes
    [TAssociation('ID', 'ID_CONTA_CAIXA')]
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;



  end;

implementation

constructor TFinConfiguracaoBoletoVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TFinConfiguracaoBoletoVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinConfiguracaoBoletoVO);

finalization
  Classes.UnRegisterClass(TFinConfiguracaoBoletoVO);

end.
