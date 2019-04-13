{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CONFIGURACAO] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit NfeConfiguracaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CONFIGURACAO')]
  TNfeConfiguracaoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCERTIFICADO_DIGITAL_SERIE: String;
    FCERTIFICADO_DIGITAL_CAMINHO: String;
    FCERTIFICADO_DIGITAL_SENHA: String;
    FTIPO_EMISSAO: Integer;
    FFORMATO_IMPRESSAO_DANFE: Integer;
    FPROCESSO_EMISSAO: Integer;
    FVERSAO_PROCESSO_EMISSAO: String;
    FCAMINHO_LOGOMARCA: String;
    FSALVAR_XML: String;
    FCAMINHO_SALVAR_XML: String;
    FCAMINHO_SCHEMAS: String;
    FCAMINHO_ARQUIVO_DANFE: String;
    FCAMINHO_SALVAR_PDF: String;
    FWEBSERVICE_UF: String;
    FWEBSERVICE_AMBIENTE: Integer;
    FWEBSERVICE_PROXY_HOST: String;
    FWEBSERVICE_PROXY_PORTA: Integer;
    FWEBSERVICE_PROXY_USUARIO: String;
    FWEBSERVICE_PROXY_SENHA: String;
    FWEBSERVICE_VISUALIZAR: String;
    FEMAIL_SERVIDOR_SMTP: String;
    FEMAIL_PORTA: Integer;
    FEMAIL_USUARIO: String;
    FEMAIL_SENHA: String;
    FEMAIL_ASSUNTO: String;
    FEMAIL_AUTENTICA_SSL: String;
    FEMAIL_TEXTO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('CERTIFICADO_DIGITAL_SERIE', 'Certificado Digital Serie', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CertificadoDigitalSerie: String  read FCERTIFICADO_DIGITAL_SERIE write FCERTIFICADO_DIGITAL_SERIE;
    [TColumn('CERTIFICADO_DIGITAL_CAMINHO', 'Certificado Digital Caminho', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CertificadoDigitalCaminho: String  read FCERTIFICADO_DIGITAL_CAMINHO write FCERTIFICADO_DIGITAL_CAMINHO;
    [TColumn('CERTIFICADO_DIGITAL_SENHA', 'Certificado Digital Senha', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CertificadoDigitalSenha: String  read FCERTIFICADO_DIGITAL_SENHA write FCERTIFICADO_DIGITAL_SENHA;
    [TColumn('TIPO_EMISSAO', 'Tipo Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoEmissao: Integer  read FTIPO_EMISSAO write FTIPO_EMISSAO;
    [TColumn('FORMATO_IMPRESSAO_DANFE', 'Formato Impressao Danfe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FormatoImpressaoDanfe: Integer  read FFORMATO_IMPRESSAO_DANFE write FFORMATO_IMPRESSAO_DANFE;
    [TColumn('PROCESSO_EMISSAO', 'Processo Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ProcessoEmissao: Integer  read FPROCESSO_EMISSAO write FPROCESSO_EMISSAO;
    [TColumn('VERSAO_PROCESSO_EMISSAO', 'Versao Processo Emissao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property VersaoProcessoEmissao: String  read FVERSAO_PROCESSO_EMISSAO write FVERSAO_PROCESSO_EMISSAO;
    [TColumn('CAMINHO_LOGOMARCA', 'Caminho Logomarca', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoLogomarca: String  read FCAMINHO_LOGOMARCA write FCAMINHO_LOGOMARCA;
    [TColumn('SALVAR_XML', 'Salvar Xml', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property SalvarXml: String  read FSALVAR_XML write FSALVAR_XML;
    [TColumn('CAMINHO_SALVAR_XML', 'Caminho Salvar Xml', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoSalvarXml: String  read FCAMINHO_SALVAR_XML write FCAMINHO_SALVAR_XML;
    [TColumn('CAMINHO_SCHEMAS', 'Caminho Schemas', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoSchemas: String  read FCAMINHO_SCHEMAS write FCAMINHO_SCHEMAS;
    [TColumn('CAMINHO_ARQUIVO_DANFE', 'Caminho Arquivo Danfe', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoArquivoDanfe: String  read FCAMINHO_ARQUIVO_DANFE write FCAMINHO_ARQUIVO_DANFE;
    [TColumn('CAMINHO_SALVAR_PDF', 'Caminho Salvar Pdf', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoSalvarPdf: String  read FCAMINHO_SALVAR_PDF write FCAMINHO_SALVAR_PDF;
    [TColumn('WEBSERVICE_UF', 'Webservice Uf', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property WebserviceUf: String  read FWEBSERVICE_UF write FWEBSERVICE_UF;
    [TColumn('WEBSERVICE_AMBIENTE', 'Webservice Ambiente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property WebserviceAmbiente: Integer  read FWEBSERVICE_AMBIENTE write FWEBSERVICE_AMBIENTE;
    [TColumn('WEBSERVICE_PROXY_HOST', 'Webservice Proxy Host', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property WebserviceProxyHost: String  read FWEBSERVICE_PROXY_HOST write FWEBSERVICE_PROXY_HOST;
    [TColumn('WEBSERVICE_PROXY_PORTA', 'Webservice Proxy Porta', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property WebserviceProxyPorta: Integer  read FWEBSERVICE_PROXY_PORTA write FWEBSERVICE_PROXY_PORTA;
    [TColumn('WEBSERVICE_PROXY_USUARIO', 'Webservice Proxy Usuario', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property WebserviceProxyUsuario: String  read FWEBSERVICE_PROXY_USUARIO write FWEBSERVICE_PROXY_USUARIO;
    [TColumn('WEBSERVICE_PROXY_SENHA', 'Webservice Proxy Senha', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property WebserviceProxySenha: String  read FWEBSERVICE_PROXY_SENHA write FWEBSERVICE_PROXY_SENHA;
    [TColumn('WEBSERVICE_VISUALIZAR', 'Webservice Visualizar', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property WebserviceVisualizar: String  read FWEBSERVICE_VISUALIZAR write FWEBSERVICE_VISUALIZAR;
    [TColumn('EMAIL_SERVIDOR_SMTP', 'Email Servidor Smtp', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property EmailServidorSmtp: String  read FEMAIL_SERVIDOR_SMTP write FEMAIL_SERVIDOR_SMTP;
    [TColumn('EMAIL_PORTA', 'Email Porta', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EmailPorta: Integer  read FEMAIL_PORTA write FEMAIL_PORTA;
    [TColumn('EMAIL_USUARIO', 'Email Usuario', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property EmailUsuario: String  read FEMAIL_USUARIO write FEMAIL_USUARIO;
    [TColumn('EMAIL_SENHA', 'Email Senha', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property EmailSenha: String  read FEMAIL_SENHA write FEMAIL_SENHA;
    [TColumn('EMAIL_ASSUNTO', 'Email Assunto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property EmailAssunto: String  read FEMAIL_ASSUNTO write FEMAIL_ASSUNTO;
    [TColumn('EMAIL_AUTENTICA_SSL', 'Email Autentica Ssl', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EmailAutenticaSsl: String  read FEMAIL_AUTENTICA_SSL write FEMAIL_AUTENTICA_SSL;
    [TColumn('EMAIL_TEXTO', 'Email Texto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property EmailTexto: String  read FEMAIL_TEXTO write FEMAIL_TEXTO;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeConfiguracaoVO);

finalization
  Classes.UnRegisterClass(TNfeConfiguracaoVO);

end.
