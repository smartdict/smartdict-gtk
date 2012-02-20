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
  autoload :FromLangComboBox

  def run
    Smartdict::Gui::Controller.new.run
  end

  def icons_dir
    File.expand_path("../../../icons", __FILE__)
  end
end
