module Smartdict::Gui
  class TranslateButton < ::Gtk::Button

    def initialize(controller)
      super("Translate")
      @controller = controller
      signal_connect('clicked') { @controller.translate }
      set_size_request(100, LEFT_BOX_BUTTON_HEIGHT)
    end

  end
end
