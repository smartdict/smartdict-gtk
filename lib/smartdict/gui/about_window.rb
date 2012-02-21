class Smartdict::Gui::AboutWindow < Gtk::AboutDialog
  def initialize
    super

    set_info
    set_license

    self.run
    self.destroy
  end

  def set_info
    self.name         = "Smartdict"
    self.program_name = "Smartdict"
    self.version      = Smartdict::VERSION
    self.copyright    = "Potapov Sergey (greyblake)"
    self.authors      = ["Potapov Sergey"]
    self.comments     = "Simple dictionary"
  end

  def set_license
    self.license = 'Program "Smartdict" is distributed under GNU General'\
                   'Public License version 2.'
  end
end
