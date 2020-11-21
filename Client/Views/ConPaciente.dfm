object FrmConPaciente: TFrmConPaciente
  Left = 0
  Top = 0
  Caption = 'Pacientes'
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
  OnDestroy = FormDestroy
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
      TabOrder = 3
      object GridPacientesDBTableView1: TcxGridDBTableView
        OnDblClick = GridPacientesDBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DSMemPacientes
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
          DataBinding.FieldName = 'Nome'
          Width = 350
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
      Width = 616
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 10
      Width = 127
      Height = 25
      Caption = 'Novo Paciente'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object BtnBuscar: TcxButton
      Left = 812
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = BtnBuscarClick
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
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Visible = False
      Control = BtnBuscar
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object DSMemPacientes: TDataSource
    DataSet = ADSPacientes
    Left = 440
    Top = 184
  end
  object ADSPacientes: TAureliusDataset
    FieldDefs = <>
    Left = 480
    Top = 264
  end
end
