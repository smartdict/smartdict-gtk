module Smartdict::Gui
  class StatusIcon < ::Gtk::StatusIcon

    def initialize(controller)
      @controller = controller
      super()

      build_menu
      self.pixbuf = Gdk::Pixbuf.new(Smartdict::Icons.logo)

      signal_connect('activate'){@controller.toggle_visibility}

      ##Show menu on rigth click
      self.signal_connect('popup-menu'){|tray, button, time| @menu.popup(nil, nil, button, time)}
    end


    protected

    def build_menu
      info = Gtk::ImageMenuItem.new(Gtk::Stock::INFO)
      info.signal_connect('activate'){@controller.open_about_window}

      quit = Gtk::ImageMenuItem.new(Gtk::Stock::QUIT)
      quit.signal_connect('activate'){@controller.quit}

      menu = Gtk::Menu.new
      menu.append(info)
      menu.append(Gtk::SeparatorMenuItem.new)
      menu.append(quit)
      menu.show_all

      @menu = menu
    end

  end
end
