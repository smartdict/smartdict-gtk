module Smartdict::Gui
  class MainWindow < ::Gtk::Window
    extend Forwardable

    def_delegators :@controller, :menu_bar, :word_entry, :translate_button, :text_view

    def initialize(controller)
      super("Smartdict")

      @controller = controller

      signal_connect("delete_event") { @controller.toggle_main_window }
      signal_connect("destroy") { @controller.quit }

      set_default_size(720, 450)
      set_icon(Smartdict::Gui.icons_dir + "/logo.png")
    end



    def draw_window

    main_box = Gtk::VBox.new.
      pack_start(menu_bar, false, false, 0)

    main_hpaned = Gtk::HPaned.new
      left_scrolled_win = Gtk::ScrolledWindow.new.
                           set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC)
      left_side_box = Gtk::VBox.new.
        pack_start(Gtk::VBox.new.
          pack_start(word_entry, false, false).
          pack_start(Gtk::HBox.new.
            pack_start(translate_button).
            set_border_width(10), false, false
          ).
          set_border_width(10), false, false
        ).
        pack_start(left_scrolled_win, true, true)

      right_scrolled_win = Gtk::ScrolledWindow.new.
                           add(text_view).
                           set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC)
      main_hpaned.
        add_child(Gtk::Builder.new, left_side_box).
        add_child(Gtk::Builder.new, right_scrolled_win)

    main_box.add(main_hpaned)
    #main_box.pack_start(@status_bar, false,false)

    add(main_box)



    end


  end
end