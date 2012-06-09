class Smartdict::Gui::AboutWindow < Gtk::AboutDialog
  def initialize
    super

    set_info
    set_license

    self.run
    self.destroy
  end

  def set_info
    info = Smartdict.info
    self.name         = "smartdict-gtk"
    self.program_name = "Smartdict"
    self.version      = Smartdict::Gui::VERSION
    self.copyright    = info.author
    self.authors      = [info.author]
    self.comments     = "Core v#{info.version}\nSimple dictionary"
    self.website      = info.url
    self.logo         = Gdk::Pixbuf.new(Smartdict::Icons.logo, 128, 128)
  end

  def set_license
    self.license = 'Program is distributed under GNU General'\
                   'Public License version 2.'
  end
end
