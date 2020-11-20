object FrmConServico: TFrmConServico
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os'
  ClientHeight = 489
  ClientWidth = 897
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 897
    Height = 489
    Align = alClient
    TabOrder = 0
    object GridPacientes: TcxGrid
      Left = 10
      Top = 41
      Width = 877
      Height = 438
      TabOrder = 2
      object GridPacientesDBTableView1: TcxGridDBTableView
        OnDblClick = GridPacientesDBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DSServicos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object GridPacientesDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPacientesDBTableView1Nome: TcxGridDBColumn
          Caption = 'Paciente'
          DataBinding.FieldName = 'Paciente.Nome'
          Width = 350
        end
        object GridPacientesDBTableView1FarmaceuticoNome: TcxGridDBColumn
          Caption = 'Farmac'#234'utico'
          DataBinding.FieldName = 'Farmaceutico.Nome'
          Width = 178
        end
      end
      object GridPacientesLevel1: TcxGridLevel
        GridView = GridPacientesDBTableView1
      end
    end
    object EdtConsulta: TcxTextEdit
      Left = 190
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      OnKeyDown = EdtConsultaKeyDown
      Width = 697
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 10
      Width = 127
      Height = 25
      Caption = 'Novo Servi'#231'o'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      Control = GridPacientes
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Consulta'
      Control = EdtConsulta
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 127
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 0
    end
  end
  object DSServicos: TDataSource
    DataSet = ADSServicos
    Left = 440
    Top = 184
  end
  object ADSServicos: TAureliusDataset
    FieldDefs = <>
    Left = 480
    Top = 264
    object ADSServicosPacienteNome: TStringField
      FieldName = 'Paciente.Nome'
      Size = 255
    end
    object ADSServicosID: TIntegerField
      FieldName = 'ID'
    end
    object ADSServicosFarmaceuticoNome: TStringField
      FieldName = 'Farmaceutico.Nome'
      Size = 255
    end
  end
end
