object Form1: TForm1
  Left = 655
  Top = 150
  Width = 660
  Height = 305
  Caption = 'libzip demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 464
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Add File'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 16
    Width = 75
    Height = 25
    Caption = 'List Files'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 464
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 464
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Delete File'
    TabOrder = 4
    OnClick = Button5Click
  end
  object ListView1: TListView
    Left = 16
    Top = 56
    Width = 441
    Height = 201
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end
      item
        Caption = 'Size'
        Width = 100
      end
      item
        Caption = 'Comp Size'
        Width = 100
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 5
    ViewStyle = vsReport
  end
  object Button6: TButton
    Left = 464
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Extract file'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 552
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Update File'
    TabOrder = 7
    OnClick = Button7Click
  end
  object OpenDialog1: TOpenDialog
    Left = 88
    Top = 88
  end
end
