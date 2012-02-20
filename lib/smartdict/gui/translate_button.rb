module Smartdict::Gui
  class TranslateButton < ::Gtk::Button

    def initialize(controller)
      super("Translate")
      @controller = controller
      signal_connect('clicked') { @controller.translate }
    end

  end
end
