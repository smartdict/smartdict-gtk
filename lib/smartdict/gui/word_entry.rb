module Smartdict::Gui
  class WordEntry < ::Gtk::Entry

    def initialize(controller)
      super()
      @controller = controller
      signal_connect('activate') { @controller.translate }
    end

  end
end
