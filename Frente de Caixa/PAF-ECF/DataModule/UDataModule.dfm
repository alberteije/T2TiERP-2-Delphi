object FDataModule: TFDataModule
  OldCreateOrder = False
  Height = 182
  Width = 381
  object ACBrECF: TACBrECF
    QuebraLinhaRodape = False
    Modelo = ecfSwedaSTX
    Porta = 'COM2'
    ReTentar = False
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    MaxLinhasBuffer = 3
    PaginaDeCodigo = 0
    OnMsgPoucoPapel = ACBrECFMsgPoucoPapel
    DecimaisPreco = 2
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO     DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    Device.HandShake = hsDTR_DSR
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 3
    ConfigBarras.Altura = 10
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 24
    Top = 32
  end
  object ACBrPAF: TACBrPAF
    LinesBuffer = 1000
    Path = '.\'
    EAD = ACBrEAD
    OnPAFGetKeyRSA = ACBrPAFPAFGetKeyRSA
    Left = 109
    Top = 32
  end
  object ACBrSintegra: TACBrSintegra
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 194
    Top = 32
  end
  object ACBrSPEDFiscal: TACBrSPEDFiscal
    Path = '.\'
    Arquivo = 'SpedFiscal.txt'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 280
    Top = 32
  end
  object ACBrEAD: TACBrEAD
    OnGetChavePublica = ACBrPAFPAFGetKeyRSA
    Left = 24
    Top = 104
  end
end
