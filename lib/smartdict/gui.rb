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
    if running?
      puts "smartdict-gtk is already running. PID=#{running_pid}"
      Process.kill("USR1", running_pid)
    else
      File.write(pid_file, Process.pid.to_s)
      controller = Smartdict::Gui::Controller.new
      Signal.trap("USR1") do
        controller.show_visibility
      end
      controller.run
    end
  end

  def root_dir
    File.join(File.dirname(__FILE__), '../..')
  end


  def running?
    !!running_pid
  end

  def pid_file
    File.join(Smartdict.user_dir, 'smartdict-gtk.pid')
  end

  def running_pid
    pid = File.read(pid_file).strip.to_i
    Process.getpgid(pid)
    pid
  rescue Errno::ENOENT, Errno::ESRCH
    nil
  end
end
