module Smartdict::Gui
  class AboutWindow < Gtk::AboutDialog

    def initialize
      super

      set_info
      set_logo
      set_license

      self.run
      self.destroy
    end

    def set_info
      self.name = "Smartdict"
      self.program_name = "SmartDict"
      self.version = "0.0.0"
      self.copyright = "Potapov Sergey (greyblake)"
      self.authors = ["Potapov Sergey"]
      self.comments = "All About SmartDict"
    end

    def set_logo
      logo_book = Gdk::Pixbuf.new(Smartdict::Gui.icons_dir +"/logo.png")
    rescue GLib::FileError => err
      puts "I/O ERROR (%s): %s\n" % [err.class, err]
    rescue Gdk::PixbufError => err
      puts "IMAGE ERROR (%s): %s\n" % [err.class, err]
    rescue => err
      puts "Unexpected ERROR (%s): %s\n" % [err.class, err]
    else
      self.logo = logo_book
    end

    def set_license
      self.license = 'Program "Smartdict" is distributed under GNU General'\
                     'Public License version 2.'
    end

  end

end
