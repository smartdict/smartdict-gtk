require 'gtk2'

module Smartdict::Gui
  extend ActiveSupport::Autoload
  extend self

  autoload :VERSION, 'smartdict/gui/version'

  autoload :Cli
  autoload :Controller

  # Widgets
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
  autoload :WordList



  LEFT_BOX_BUTTON_HEIGHT = 36

  def run
    Smartdict::Gui::Controller.new.run
  end

  def root_dir
    File.join(File.dirname(__FILE__), '../..')
  end
end
