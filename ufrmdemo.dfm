object Form1: TForm1
  Left = 314
  Height = 603
  Top = 137
  Width = 1008
  Caption = 'Form1'
  ClientHeight = 603
  ClientWidth = 1008
  Color = clBtnFace
  DesignTimePPI = 144
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'MS Sans Serif'
  LCLVersion = '2.0.0.4'
  object Button1: TButton
    Left = 840
    Height = 38
    Top = 108
    Width = 112
    Caption = 'Add File'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button1Click
    ParentFont = False
    TabOrder = 0
  end
  object Button2: TButton
    Left = 264
    Height = 38
    Top = 24
    Width = 112
    Caption = 'List Files'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button2Click
    ParentFont = False
    TabOrder = 1
  end
  object Button3: TButton
    Left = 12
    Height = 38
    Top = 24
    Width = 112
    Caption = 'Open'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button3Click
    ParentFont = False
    TabOrder = 2
  end
  object Button4: TButton
    Left = 840
    Height = 38
    Top = 24
    Width = 112
    Caption = 'Close'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button4Click
    ParentFont = False
    TabOrder = 3
  end
  object ListView1: TListView
    Left = 16
    Height = 353
    Top = 88
    Width = 768
    Columns = <    
      item
        Caption = 'Name'
        Width = 300
      end    
      item
        Caption = 'Size'
        Width = 150
      end    
      item
        Caption = 'Comp Size'
        Width = 150
      end    
      item
        Caption = 'DateTime'
        Width = 150
      end>
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    ParentFont = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object Button5: TButton
    Left = 852
    Height = 38
    Top = 252
    Width = 112
    Caption = 'Delete File'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button5Click
    ParentFont = False
    TabOrder = 5
  end
  object Button6: TButton
    Left = 852
    Height = 38
    Top = 336
    Width = 112
    Caption = 'Extract File'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button6Click
    ParentFont = False
    TabOrder = 6
  end
  object Button7: TButton
    Left = 852
    Height = 38
    Top = 384
    Width = 112
    Caption = 'Edit File'
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    OnClick = Button7Click
    ParentFont = False
    TabOrder = 7
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 36
    Top = 567
    Width = 1008
    Panels = <>
  end
  object OpenDialog1: TOpenDialog
    left = 852
    top = 180
  end
end
