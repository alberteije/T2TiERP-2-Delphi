inherited FFiscalParametros: TFFiscalParametros
  Left = 335
  Top = 234
  Caption = 'Fiscal Par'#226'metros'
  ClientHeight = 323
  ClientWidth = 988
  ExplicitLeft = 335
  ExplicitTop = 234
  ExplicitWidth = 996
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    Height = 292
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 292
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      inherited PanelGrid: TPanel
        Width = 980
        Height = 264
        ExplicitWidth = 980
        ExplicitHeight = 264
        inherited Grid: TJvDBUltimGrid
          Width = 980
          Height = 212
        end
        inherited PanelFiltroRapido: TPanel
          Top = 212
          Width = 980
          ExplicitTop = 212
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 679
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 980
      inherited PanelEdits: TPanel
        Width = 980
        Height = 264
        ExplicitWidth = 980
        ExplicitHeight = 264
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 958
          Height = 61
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            958
            61)
          object EditVigencia: TLabeledMaskEdit
            Left = 9
            Top = 24
            Width = 86
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 43
            EditLabel.Height = 13
            EditLabel.Caption = 'Vig'#234'ncia:'
            MaxLength = 7
            TabOrder = 0
            Text = '  //////////////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object EditDescricaoVigencia: TLabeledEdit
            Left = 101
            Top = 24
            Width = 455
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 92
            EditLabel.Height = 13
            EditLabel.Caption = 'Descri'#231#227'o Vig'#234'ncia:'
            TabOrder = 1
          end
          object ComboBoxCriterioLancamento: TLabeledComboBox
            Left = 562
            Top = 24
            Width = 384
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemIndex = 0
            TabOrder = 2
            Text = 'L - Livre'
            Items.Strings = (
              'L - Livre'
              'A - Avisar'
              
                'N - N'#227'o permitir (para lan'#231'amentos efetuados fora do per'#237'odo inf' +
                'ormado)')
            ComboBoxLabel.Width = 100
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Crit'#233'rio Lan'#231'amento:'
          end
        end
        object PageControlItens: TPageControl
          Left = 10
          Top = 88
          Width = 958
          Height = 163
          ActivePage = tsFederal
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          ExplicitHeight = 289
          object tsFederal: TTabSheet
            Caption = 'Federal'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 946
            ExplicitHeight = 272
            object PanelFederal: TPanel
              Left = 0
              Top = 0
              Width = 950
              Height = 135
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 946
              ExplicitHeight = 272
              DesignSize = (
                950
                135)
              object ComboBoxApuracao: TLabeledComboBox
                Left = 9
                Top = 26
                Width = 160
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = '1 - Regime Competencia'
                Items.Strings = (
                  '1 - Regime Competencia'
                  '2 - Regime de Caixa')
                ComboBoxLabel.Width = 50
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Apura'#231#227'o:'
              end
              object ComboBoxMicroempreendedorIndividual: TLabeledComboBox
                Left = 175
                Top = 26
                Width = 160
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 1
                Text = 'Sim'
                Items.Strings = (
                  'Sim'
                  'N'#227'o')
                ComboBoxLabel.Width = 148
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Microempreendedor Individual:'
              end
              object ComboBoxCalcPisCofinsEfd: TLabeledComboBox
                Left = 341
                Top = 26
                Width = 228
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 2
                Text = 'AB - Al'#237'quota B'#225'sica'
                Items.Strings = (
                  'AB - Al'#237'quota B'#225'sica'
                  'AD - Al'#237'quota Diferenciada'
                  'UP - Unidade de Medida de Produto')
                ComboBoxLabel.Width = 218
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Forma C'#225'lculo Pis/Cofins - EFD Contribui'#231#245'es:'
              end
              object EditSimplesCodigoAcesso: TLabeledEdit
                Left = 575
                Top = 26
                Width = 363
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                EditLabel.Width = 112
                EditLabel.Height = 13
                EditLabel.Caption = 'C'#243'digo Acesso Simples:'
                MaxLength = 50
                TabOrder = 3
              end
              object ComboBoxSimplesTabela: TLabeledComboBox
                Left = 9
                Top = 74
                Width = 160
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 4
                Text = '1 - Federal'
                Items.Strings = (
                  '1 - Federal'
                  '2 - Estadual')
                ComboBoxLabel.Width = 74
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Tabela Simples:'
              end
              object ComboBoxSimplesAtividade: TLabeledComboBox
                Left = 175
                Top = 74
                Width = 160
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 5
                Text = 'CO - Comercio'
                Items.Strings = (
                  'CO - Comercio'
                  'IN - Ind'#250'stria'
                  'S1 - Servi'#231'os Anexo III'
                  'S2 - Servi'#231'os Anexo IV'
                  'S3 - Servi'#231'os Anexo V')
                ComboBoxLabel.Width = 87
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Atividade Simples:'
              end
            end
          end
          object tsEstadual: TTabSheet
            Caption = 'Estadual'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 946
            ExplicitHeight = 272
            object PanelEstadual: TPanel
              Left = 0
              Top = 0
              Width = 950
              Height = 135
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 946
              ExplicitHeight = 272
              object ComboBoxPerfilSped: TLabeledComboBox
                Left = 10
                Top = 26
                Width = 111
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = 'A - Perfil A'
                Items.Strings = (
                  'A - Perfil A'
                  'B - Perfil B'
                  'C - Perfil C')
                ComboBoxLabel.Width = 84
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Perfil Sped Fiscal:'
              end
              object ComboBoxApuracaoConsolidada: TLabeledComboBox
                Left = 127
                Top = 26
                Width = 120
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 1
                Text = 'Sim'
                Items.Strings = (
                  'Sim'
                  'N'#227'o')
                ComboBoxLabel.Width = 111
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Apura'#231#227'o Consolidada:'
              end
              object ComboBoxSubstituicaoTributaria: TLabeledComboBox
                Left = 253
                Top = 26
                Width = 124
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 2
                Text = 'Sim'
                Items.Strings = (
                  'Sim'
                  'N'#227'o')
                ComboBoxLabel.Width = 111
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Substitui'#231#227'o Tribut'#225'ria:'
              end
            end
          end
          object tsMunicipal: TTabSheet
            Caption = 'Municipal'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 946
            ExplicitHeight = 272
            object PanelMunicipal: TPanel
              Left = 0
              Top = 0
              Width = 950
              Height = 135
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 946
              ExplicitHeight = 272
              object ComboBoxFormaCalculoIss: TLabeledComboBox
                Left = 10
                Top = 26
                Width = 167
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = 'NO - Normal'
                Items.Strings = (
                  'NO - Normal'
                  'PH - Profissional Habilitado'
                  'VF - Valor Fixo')
                ComboBoxLabel.Width = 90
                ComboBoxLabel.Height = 13
                ComboBoxLabel.Caption = 'Forma C'#225'lculo ISS:'
              end
            end
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 988
    ExplicitWidth = 988
    inherited BotaoSair: TSpeedButton
      Left = 884
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 784
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 674
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 774
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 574
      ExplicitLeft = 639
    end
  end
end
