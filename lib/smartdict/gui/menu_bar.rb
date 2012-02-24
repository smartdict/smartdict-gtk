module Smartdict::Gui
  class MenuBar < ::Gtk::MenuBar


    def initialize(controller)
      @controller = controller
      super()

      file_menu_item = Gtk::MenuItem.new("_File")

	file_exit_item = Gtk::MenuItem.new("_Exit")
	  file_exit_item.signal_connect("activate") {@controller.quit}
        file_export_item = Gtk::MenuItem.new("_Export")
          file_export_item.signal_connect("activate") { @controller.open_export_dialog }

	file_menu = Gtk::Menu.new
	file_menu.add(file_export_item)
	file_menu.add(file_exit_item)
	file_menu_item.submenu = file_menu

	help_menu_item = Gtk::MenuItem.new("_Help")

	  help_about_item = Gtk::MenuItem.new("About")
	    help_about_item.signal_connect("activate"){ @controller.open_about_window }

	  help_menu = Gtk::Menu.new
	  help_menu.add(help_about_item)
	  help_menu_item.submenu = help_menu

      append(file_menu_item)
      append(help_menu_item)

    end


  end
end
