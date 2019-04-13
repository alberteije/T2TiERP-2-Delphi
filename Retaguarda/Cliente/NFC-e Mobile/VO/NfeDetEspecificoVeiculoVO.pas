{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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
unit NfeDetEspecificoVeiculoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DET_ESPECIFICO_VEICULO')]
  TNfeDetEspecificoVeiculoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FTIPO_OPERACAO: String;
    FCHASSI: String;
    FCOR: String;
    FDESCRICAO_COR: String;
    FPOTENCIA_MOTOR: String;
    FCILINDRADAS: String;
    FPESO_LIQUIDO: String;
    FPESO_BRUTO: String;
    FNUMERO_SERIE: String;
    FTIPO_COMBUSTIVEL: String;
    FNUMERO_MOTOR: String;
    FCAPACIDADE_MAXIMA_TRACAO: String;
    FDISTANCIA_EIXOS: String;
    FANO_MODELO: String;
    FANO_FABRICACAO: String;
    FTIPO_PINTURA: String;
    FTIPO_VEICULO: String;
    FESPECIE_VEICULO: String;
    FCONDICAO_VIN: String;
    FCONDICAO_VEICULO: String;
    FCODIGO_MARCA_MODELO: String;
    FCODIGO_COR: String;
    FLOTACAO: Integer;
    FRESTRICAO: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('TIPO_OPERACAO', 'Tipo Operacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoOperacao: String  read FTIPO_OPERACAO write FTIPO_OPERACAO;
    [TColumn('CHASSI', 'Chassi', 136, [ldGrid, ldLookup, ldCombobox], False)]
    property Chassi: String  read FCHASSI write FCHASSI;
    [TColumn('COR', 'Cor', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Cor: String  read FCOR write FCOR;
    [TColumn('DESCRICAO_COR', 'Descricao Cor', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoCor: String  read FDESCRICAO_COR write FDESCRICAO_COR;
    [TColumn('POTENCIA_MOTOR', 'Potencia Motor', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property PotenciaMotor: String  read FPOTENCIA_MOTOR write FPOTENCIA_MOTOR;
    [TColumn('CILINDRADAS', 'Cilindradas', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Cilindradas: String  read FCILINDRADAS write FCILINDRADAS;
    [TColumn('PESO_LIQUIDO', 'Peso Liquido', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property PesoLiquido: String  read FPESO_LIQUIDO write FPESO_LIQUIDO;
    [TColumn('PESO_BRUTO', 'Peso Bruto', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property PesoBruto: String  read FPESO_BRUTO write FPESO_BRUTO;
    [TColumn('NUMERO_SERIE', 'Numero Serie', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSerie: String  read FNUMERO_SERIE write FNUMERO_SERIE;
    [TColumn('TIPO_COMBUSTIVEL', 'Tipo Combustivel', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoCombustivel: String  read FTIPO_COMBUSTIVEL write FTIPO_COMBUSTIVEL;
    [TColumn('NUMERO_MOTOR', 'Numero Motor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroMotor: String  read FNUMERO_MOTOR write FNUMERO_MOTOR;
    [TColumn('CAPACIDADE_MAXIMA_TRACAO', 'Capacidade Maxima Tracao', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property CapacidadeMaximaTracao: String  read FCAPACIDADE_MAXIMA_TRACAO write FCAPACIDADE_MAXIMA_TRACAO;
    [TColumn('DISTANCIA_EIXOS', 'Distancia Eixos', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property DistanciaEixos: String  read FDISTANCIA_EIXOS write FDISTANCIA_EIXOS;
    [TColumn('ANO_MODELO', 'Ano Modelo', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property AnoModelo: String  read FANO_MODELO write FANO_MODELO;
    [TColumn('ANO_FABRICACAO', 'Ano Fabricacao', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property AnoFabricacao: String  read FANO_FABRICACAO write FANO_FABRICACAO;
    [TColumn('TIPO_PINTURA', 'Tipo Pintura', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoPintura: String  read FTIPO_PINTURA write FTIPO_PINTURA;
    [TColumn('TIPO_VEICULO', 'Tipo Veiculo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoVeiculo: String  read FTIPO_VEICULO write FTIPO_VEICULO;
    [TColumn('ESPECIE_VEICULO', 'Especie Veiculo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EspecieVeiculo: String  read FESPECIE_VEICULO write FESPECIE_VEICULO;
    [TColumn('CONDICAO_VIN', 'Condicao Vin', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property CondicaoVin: String  read FCONDICAO_VIN write FCONDICAO_VIN;
    [TColumn('CONDICAO_VEICULO', 'Condicao Veiculo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property CondicaoVeiculo: String  read FCONDICAO_VEICULO write FCONDICAO_VEICULO;
    [TColumn('CODIGO_MARCA_MODELO', 'Codigo Marca Modelo', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoMarcaModelo: String  read FCODIGO_MARCA_MODELO write FCODIGO_MARCA_MODELO;
    [TColumn('CODIGO_COR', 'Codigo Cor', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoCor: String  read FCODIGO_COR write FCODIGO_COR;
    [TColumn('LOTACAO', 'Lotacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Lotacao: Integer  read FLOTACAO write FLOTACAO;
    [TColumn('RESTRICAO', 'Restricao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Restricao: String  read FRESTRICAO write FRESTRICAO;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoVeiculoVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoVeiculoVO);

end.
