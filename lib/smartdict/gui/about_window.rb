class Smartdict::Gui::AboutWindow < Gtk::AboutDialog
  def initialize
    super

    set_info
    set_license

    self.run
    self.destroy
  end

  def set_info
    self.name         = "Smartdict 2"
    self.program_name = "Smartdict"
    self.version      = Smartdict::VERSION
    self.copyright    = "Potapov Sergey (greyblake)"
    self.authors      = ["Potapov Sergey"]
    self.comments     = "Simple dictionary"
    self.website      = "https://github.com/smartdict/smartdict"
  end

  def set_license
    self.license = 'Program is distributed under GNU General'\
                   'Public License version 2.'
  end
end
