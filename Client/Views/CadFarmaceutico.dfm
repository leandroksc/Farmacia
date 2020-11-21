object FrmCadFarmaceutico: TFrmCadFarmaceutico
  Left = 0
  Top = 0
  Caption = 'Cadastro de Farmac'#195#170'utico'
  ClientHeight = 288
  ClientWidth = 636
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
    Width = 636
    Height = 288
    Align = alClient
    TabOrder = 0
    object EdtNome: TcxTextEdit
      Left = 42
      Top = 68
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Width = 584
    end
    object EdtID: TcxTextEdit
      Left = 42
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
      Left = 250
      Top = 253
      Width = 120
      Height = 25
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = BtnSalvarClick
    end
    object BtnCancelar: TcxButton
      Left = 506
      Top = 253
      Width = 120
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = BtnCancelarClick
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Cadastro de Paciente'
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
    object BtnExcluir: TcxButton
      Left = 376
      Top = 253
      Width = 124
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
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
    object LiEdtNome: TdxLayoutItem
      Parent = GrupoContent
      CaptionOptions.Text = 'Nome'
      Control = EdtNome
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object LiEdtID: TdxLayoutItem
      Parent = GrupoContent
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
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = BtnExcluir
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 124
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
