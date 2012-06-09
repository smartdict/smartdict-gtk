# Handles options for smartdict-gtk command.
class Smartdict::Gui::Cli
  def self.run(args)
    case args.first
    when nil, /\s+/
      run_application
    when '-v', '--version', 'version'
      puts version_message
    when '-h', '--help', 'help', /\w+/
      puts help_message
    end
  end


  private

  def self.run_application
    Smartdict.env = :user
    Smartdict.run
    Smartdict::Gui.run
  end

  def self.version_message
    info = Smartdict.info
    "Smartdict GUI(gtk) v#{Smartdict::Gui::VERSION}\n" \
    "Smartdict core v#{info.version}\n" \
    "Author: #{info.author} (#{info.email})\n" \
    "URL: #{info.url}\n" \
  end

  def self.help_message
    "Smartdict GUI(gtk)\n\n" \
    "  Usage:\n" \
    "    smartdict-gtk              run the application\n" \
    "    smartdict-gtk --version    see version\n" \
    "    smartdict-gtk --help       see help message\n" \
  end
end
