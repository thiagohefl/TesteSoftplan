object fMenuPrincipal: TfMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Prova Delphi App'
  ClientHeight = 461
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnPrincipal
  WindowState = wsMaximized
  TextHeight = 15
  object mnPrincipal: TMainMenu
    Left = 288
    Top = 96
    object mnTarefas: TMenuItem
      Caption = 'Tarefas'
      object mnTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = mnTarefa1Click
      end
      object mnTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = mnTarefa2Click
      end
      object mnTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = mnTarefa3Click
      end
    end
  end
end
