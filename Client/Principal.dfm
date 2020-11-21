object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os Farmac'#234'uticos'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 264
    Top = 80
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Action11: TMenuItem
        Action = ActPaciente
      end
      object Farmacutico1: TMenuItem
        Action = ActFarmaceutico
      end
      object Servio1: TMenuItem
        Action = ActServico
      end
    end
  end
  object ActionList1: TActionList
    Left = 384
    Top = 80
    object ActPaciente: TAction
      Caption = 'Paciente'
      OnExecute = ActPacienteExecute
    end
    object ActServico: TAction
      Caption = 'Servi'#231'o'
      OnExecute = ActServicoExecute
    end
    object ActFarmaceutico: TAction
      Caption = 'Farmac'#234'utico'
      OnExecute = ActFarmaceuticoExecute
    end
  end
end
