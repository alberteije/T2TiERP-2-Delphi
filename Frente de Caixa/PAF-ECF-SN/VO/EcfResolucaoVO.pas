{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_RESOLUCAO] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 1.0                                                                    
*******************************************************************************}
unit EcfResolucaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, EcfPosicaoComponentesVO;

type
  [TEntity]
  [TTable('ECF_RESOLUCAO')]
  TEcfResolucaoVO = class(TVO)
  private
    FID: Integer;
    FRESOLUCAO_TELA: String;
    FLARGURA: Integer;
    FALTURA: Integer;
    FIMAGEM_TELA: String;
    FIMAGEM_MENU: String;
    FIMAGEM_SUBMENU: String;
    FHOTTRACK_COLOR: String;
    FITEM_STYLE_FONT_NAME: String;
    FITEM_STYLE_FONT_COLOR: String;
    FITEM_SEL_STYLE_COLOR: String;
    FLABEL_TOTAL_GERAL_FONT_COLOR: String;
    FITEM_STYLE_FONT_STYLE: String;
    FEDITS_COLOR: String;
    FEDITS_FONT_COLOR: String;
    FEDITS_DISABLED_COLOR: String;
    FEDITS_FONT_NAME: String;
    FEDITS_FONT_STYLE: String;

    FListaEcfPosicaoComponentesVO: TObjectList<TEcfPosicaoComponentesVO>;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('RESOLUCAO_TELA', 'Resolucao Tela', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ResolucaoTela: String  read FRESOLUCAO_TELA write FRESOLUCAO_TELA;
    [TColumn('LARGURA', 'Largura', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Largura: Integer  read FLARGURA write FLARGURA;
    [TColumn('ALTURA', 'Altura', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Altura: Integer  read FALTURA write FALTURA;
    [TColumn('IMAGEM_TELA', 'Imagem Tela', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property ImagemTela: String  read FIMAGEM_TELA write FIMAGEM_TELA;
    [TColumn('IMAGEM_MENU', 'Imagem Menu', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property ImagemMenu: String  read FIMAGEM_MENU write FIMAGEM_MENU;
    [TColumn('IMAGEM_SUBMENU', 'Imagem Submenu', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property ImagemSubmenu: String  read FIMAGEM_SUBMENU write FIMAGEM_SUBMENU;
    [TColumn('HOTTRACK_COLOR', 'Hottrack Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property HottrackColor: String  read FHOTTRACK_COLOR write FHOTTRACK_COLOR;
    [TColumn('ITEM_STYLE_FONT_NAME', 'Item Style Font Name', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ItemStyleFontName: String  read FITEM_STYLE_FONT_NAME write FITEM_STYLE_FONT_NAME;
    [TColumn('ITEM_STYLE_FONT_COLOR', 'Item Style Font Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ItemStyleFontColor: String  read FITEM_STYLE_FONT_COLOR write FITEM_STYLE_FONT_COLOR;
    [TColumn('ITEM_SEL_STYLE_COLOR', 'Item Sel Style Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ItemSelStyleColor: String  read FITEM_SEL_STYLE_COLOR write FITEM_SEL_STYLE_COLOR;
    [TColumn('LABEL_TOTAL_GERAL_FONT_COLOR', 'Label Total Geral Font Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property LabelTotalGeralFontColor: String  read FLABEL_TOTAL_GERAL_FONT_COLOR write FLABEL_TOTAL_GERAL_FONT_COLOR;
    [TColumn('ITEM_STYLE_FONT_STYLE', 'Item Style Font Style', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ItemStyleFontStyle: String  read FITEM_STYLE_FONT_STYLE write FITEM_STYLE_FONT_STYLE;
    [TColumn('EDITS_COLOR', 'Edits Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property EditsColor: String  read FEDITS_COLOR write FEDITS_COLOR;
    [TColumn('EDITS_FONT_COLOR', 'Edits Font Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property EditsFontColor: String  read FEDITS_FONT_COLOR write FEDITS_FONT_COLOR;
    [TColumn('EDITS_DISABLED_COLOR', 'Edits Disabled Color', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property EditsDisabledColor: String  read FEDITS_DISABLED_COLOR write FEDITS_DISABLED_COLOR;
    [TColumn('EDITS_FONT_NAME', 'Edits Font Name', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property EditsFontName: String  read FEDITS_FONT_NAME write FEDITS_FONT_NAME;
    [TColumn('EDITS_FONT_STYLE', 'Edits Font Style', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property EditsFontStyle: String  read FEDITS_FONT_STYLE write FEDITS_FONT_STYLE;


    [TManyValuedAssociation('ID_ECF_RESOLUCAO', 'ID')]
    property ListaEcfPosicaoComponentesVO: TObjectList<TEcfPosicaoComponentesVO> read FListaEcfPosicaoComponentesVO write FListaEcfPosicaoComponentesVO;

  end;

implementation

constructor TEcfResolucaoVO.Create;
begin
  inherited;

  FListaEcfPosicaoComponentesVO := TObjectList<TEcfPosicaoComponentesVO>.Create;
end;

destructor TEcfResolucaoVO.Destroy;
begin
  FreeAndNil(FListaEcfPosicaoComponentesVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TEcfResolucaoVO);

finalization
  Classes.UnRegisterClass(TEcfResolucaoVO);

end.
