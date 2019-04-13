object UniNavigationUnit1Form: TUniNavigationUnit1Form
  Left = 0
  Top = 0
  ClientHeight = 410
  ClientWidth = 635
  Caption = 'UniNavigationUnit1Form'
  OldCreateOrder = False
  NavigateKeys.Enabled = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniLabel2: TUniLabel
    Left = 152
    Top = 415
    Width = 321
    Height = 25
    Hint = ''
    Caption = 'Use Tab/Shift Tab to navigate '
    ParentFont = False
    Font.Height = -21
    Font.Style = [fsBold]
    TabOrder = 0
  end
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 635
    Height = 410
    Hint = ''
    HTML.Strings = (
      '<html>'
      '<head>'
      '</style> '
      
        '    <style type="text/css">.recentcomments a{display:inline !imp' +
        'ortant;padding:0 !important;margin:0 !important;}</style> '
      '</head>'
      '<body>'
      '  <object width="640" height="390">'
      
        '  <param name="movie" value="http://www.youtube.com/v/9xaU0QHPKK' +
        'Y&hl=en_US&feature=player_embedded&version=3">'
      '  </param><param name="allowFullScreen" value="true">'
      '  </param><param name="allowScriptAccess" value="always">'
      
        '  </param><embed src="http://www.youtube.com/v/9xaU0QHPKKY&hl=en' +
        '_US&feature=player_embedded&version=3" type="application/x-shock' +
        'wave-flash" allowfullscreen="true" allowScriptAccess="always" wi' +
        'dth="640" height="390">'
      '  </embed></object>'
      '</body>'
      '</html>')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitWidth = 640
    ExplicitHeight = 451
  end
end
