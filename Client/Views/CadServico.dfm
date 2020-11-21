object FrmCadServico: TFrmCadServico
  Left = 0
  Top = 0
  Caption = 'Cadastro de Servi'#231'o'
  ClientHeight = 535
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 840
    Height = 535
    Align = alClient
    TabOrder = 0
    object EdtID: TcxTextEdit
      Left = 56
      Top = 41
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.Color = clSilver
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 121
    end
    object BtnSalvar: TcxButton
      Left = 442
      Top = 500
      Width = 120
      Height = 25
      Caption = 'Salvar'
      TabOrder = 10
      OnClick = BtnSalvarClick
    end
    object BtnCancelar: TcxButton
      Left = 710
      Top = 500
      Width = 120
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 12
      OnClick = BtnCancelarClick
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Cadastro de Servi'#231'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TextColor = 16735067
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object EdtData: TcxDateEdit
      Left = 211
      Top = 41
      AutoSize = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Height = 21
      Width = 121
    end
    object LcbPaciente: TcxLookupComboBox
      Left = 56
      Top = 68
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Nome'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = DSPacientes
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 346
    end
    object LcbFarmaceutico: TcxLookupComboBox
      Left = 477
      Top = 68
      AutoSize = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Nome'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = DSFarmaceuticos
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Height = 21
      Width = 353
    end
    object cxGrid1: TcxGrid
      Left = 10
      Top = 257
      Width = 820
      Height = 194
      TabOrder = 8
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = True
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DSProcedimentos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Descricao'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DSMemProcedimentoTipos
          Width = 273
        end
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'Descricao'
          Width = 295
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 92
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object MemoObservacao: TcxMemo
      Left = 10
      Top = 113
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Height = 89
      Width = 820
    end
    object LblTotal: TcxLabel
      Left = 688
      Top = 457
      AutoSize = False
      Caption = 'LblTotal'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Transparent = True
      Height = 25
      Width = 142
    end
    object BtnNovoProcedimento: TcxButton
      Left = 10
      Top = 208
      Width = 135
      Height = 25
      Caption = 'Inserir Procedimento'
      TabOrder = 6
      OnClick = BtnNovoProcedimentoClick
    end
    object BtnExcluirProcedimento: TcxButton
      Left = 151
      Top = 208
      Width = 130
      Height = 25
      Caption = 'Excluir Procedimento'
      TabOrder = 7
      OnClick = BtnExcluirProcedimentoClick
    end
    object BtnExcluir: TcxButton
      Left = 568
      Top = 500
      Width = 136
      Height = 25
      Caption = 'Excluir'
      TabOrder = 11
      OnClick = BtnExcluirClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 3
      ShowBorder = False
      Index = -1
    end
    object LiEdtID: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = 'ID'
      Control = EdtID
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object LiBtnSalvar: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSalvar
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object LiBtnCancelar: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = BtnCancelar
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'Separator'
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 42
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object GrupoContent: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ItemIndex = 3
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'Data'
      Control = EdtData
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'Paciente'
      Control = LcbPaciente
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 262
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Farmac'#234'utico'
      Control = LcbFarmaceutico
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 262
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = GrupoContent
      AlignVert = avClient
      CaptionOptions.Text = 'Procedimentos'
      CaptionOptions.Layout = clTop
      Control = cxGrid1
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = GrupoContent
      CaptionOptions.Text = 'Observa'#231#227'o'
      CaptionOptions.Layout = clTop
      Control = MemoObservacao
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = GrupoContent
      AlignHorz = ahRight
      CaptionOptions.Text = 'Total:'
      Control = LblTotal
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 142
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = GrupoContent
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = GrupoContent
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahLeft
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnNovoProcedimento
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 135
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignVert = avBottom
      CaptionOptions.Visible = False
      Control = BtnExcluirProcedimento
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 130
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = GrupoContent
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = BtnExcluir
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 136
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object ADSPacientes: TAureliusDataset
    FieldDefs = <>
    ReadOnly = True
    Left = 448
    Top = 160
  end
  object ADSFarmaceuticos: TAureliusDataset
    FieldDefs = <>
    ReadOnly = True
    Left = 528
    Top = 160
  end
  object DSPacientes: TDataSource
    DataSet = ADSPacientes
    Left = 440
    Top = 224
  end
  object DSFarmaceuticos: TDataSource
    DataSet = ADSFarmaceuticos
    Left = 528
    Top = 224
  end
  object DSProcedimentos: TDataSource
    DataSet = ADSProcedimentos
    Left = 184
    Top = 360
  end
  object MemProcedimentoTipos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 728
    Top = 120
    object MemProcedimentoTiposID: TIntegerField
      FieldName = 'ID'
    end
    object MemProcedimentoTiposDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object DSMemProcedimentoTipos: TDataSource
    DataSet = MemProcedimentoTipos
    Left = 728
    Top = 176
  end
  object ADSProcedimentos: TAureliusDataset
    FieldDefs = <>
    AfterPost = ADSProcedimentosAfterPost
    AfterDelete = ADSProcedimentosAfterDelete
    Left = 184
    Top = 304
  end
end
