object Form1: TForm1
  Left = 233
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Make Sound'
  ClientHeight = 129
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 136
    Top = 48
    Width = 97
    Height = 25
    Caption = 'Play Sound'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RDBSinusoide: TRadioButton
    Left = 16
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Sinusoide'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RDBCarre: TRadioButton
    Left = 16
    Top = 40
    Width = 113
    Height = 17
    Caption = 'Carre'
    TabOrder = 2
  end
  object RDBTriangle: TRadioButton
    Left = 16
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Triangle'
    TabOrder = 3
  end
  object RDBDentScie: TRadioButton
    Left = 16
    Top = 104
    Width = 113
    Height = 17
    Caption = 'DentScie'
    TabOrder = 4
  end
end
