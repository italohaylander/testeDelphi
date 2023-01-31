object FrmCadastrarCliente: TFrmCadastrarCliente
  Left = 0
  Top = 0
  Caption = 'Cadastrar Cliente'
  ClientHeight = 477
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 436
    Width = 951
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnFechar: TBitBtn
      Left = 840
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 951
    Height = 436
    ActivePage = tbDados
    Align = alClient
    TabOrder = 1
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 943
        Height = 81
        Align = alTop
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object edtPesquisar: TLabeledEdit
          Left = 24
          Top = 40
          Width = 441
          Height = 21
          EditLabel.Width = 143
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite o nome para pesquisar:'
          TabOrder = 0
        end
        object btnPesquisar: TBitBtn
          Left = 836
          Top = 38
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBtnsPesq: TPanel
        Left = 0
        Top = 367
        Width = 943
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 656
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 747
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 836
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 84
        Width = 937
        Height = 280
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'idpessoa'
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmprimeiro'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmsegundo'
            Title.Caption = 'Sobrenome'
            Visible = True
          end>
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object pDados: TPanel
        Left = 0
        Top = 0
        Width = 943
        Height = 408
        Align = alClient
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object edtID: TLabeledEdit
          Left = 176
          Top = 80
          Width = 121
          Height = 21
          EditLabel.Width = 15
          EditLabel.Height = 13
          EditLabel.Caption = 'ID:'
          Enabled = False
          TabOrder = 0
        end
        object edtNome: TLabeledEdit
          Left = 176
          Top = 144
          Width = 281
          Height = 21
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 1
        end
        object edtSobrenome: TLabeledEdit
          Left = 472
          Top = 144
          Width = 297
          Height = 21
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'Sobrenome:'
          TabOrder = 2
        end
        object edtDocumento: TLabeledEdit
          Left = 176
          Top = 216
          Width = 281
          Height = 21
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'Documento:'
          TabOrder = 3
        end
        object edtCep: TLabeledEdit
          Left = 472
          Top = 216
          Width = 297
          Height = 21
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep:'
          TabOrder = 4
        end
        object pBotoes: TPanel
          Left = 1
          Top = 341
          Width = 941
          Height = 66
          Align = alBottom
          TabOrder = 5
          object btnAlterar: TButton
            Left = 673
            Top = 25
            Width = 75
            Height = 25
            Caption = 'Alterar'
            TabOrder = 1
            OnClick = btnAlterarClick
          end
          object btnGravar: TButton
            Left = 754
            Top = 25
            Width = 75
            Height = 25
            Caption = 'Gravar'
            TabOrder = 2
            OnClick = btnGravarClick
          end
          object btnListar: TButton
            Left = 592
            Top = 25
            Width = 75
            Height = 25
            Caption = 'Listar'
            TabOrder = 0
            OnClick = btnListarClick
          end
          object btnCancelar: TButton
            Left = 835
            Top = 25
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 3
            OnClick = btnCancelarClick
          end
        end
        object edtDtRegistro: TLabeledEdit
          Left = 472
          Top = 80
          Width = 297
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Data de Registro:'
          TabOrder = 6
        end
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = DmCliente.cdsPesquisar
    Left = 876
    Top = 344
  end
end
