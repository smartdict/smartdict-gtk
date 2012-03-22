require 'gtk2'

module Smartdict::Gui
  extend ActiveSupport::Autoload
  extend self

  autoload :Controller
  autoload :MainWindow
  autoload :WordEntry
  autoload :TranslateButton
  autoload :MenuBar
  autoload :TextView
  autoload :StatusIcon
  autoload :AboutWindow
  autoload :LangComboBox
  autoload :InterchangeButton
  autoload :ExportDialog


  LEFT_BOX_BUTTON_HEIGHT = 36

  def run
    Smartdict::Gui::Controller.new.run
  end
end
