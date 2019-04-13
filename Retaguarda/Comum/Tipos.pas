unit Tipos;

interface

type
  TImagem = (iIncluir, iAlterar, iExcluir, iConsultar, iImprimir, iSalvar,
    iCancelar, iLocalizar, iSair, iExportar, iExcel, iHTML, iCSV, iWord, iXML,
    iAnterior, iPrimeiro, iUltimo, iProximo, iProximaPagina, iPaginaAnterior,
    iAbrir, iVisualizar, iDigitalizar, iCarregarDados);

  TStatusImagem = (siDesabilitada, siHabilitada);

  TTamanhoImagem = (ti16);

  TPanelExibir = (peGrid, peEdits);

implementation

end.
