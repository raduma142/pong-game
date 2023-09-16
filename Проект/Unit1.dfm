object MainForm: TMainForm
  Left = 365
  Top = 339
  Width = 915
  Height = 488
  Caption = #1048#1075#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object GameImage: TImage
    Left = 0
    Top = 0
    Width = 899
    Height = 450
    Align = alClient
  end
  object GameTimerGraphics: TTimer
    Interval = 30
    OnTimer = GameTimerGraphicsTimer
    Left = 208
    Top = 152
  end
end
