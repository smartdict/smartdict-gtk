module Smartdict::Gui
  class TextView < ::Gtk::TextView

    def initialize(controller)
      super(Gtk::TextBuffer.new)
      @controller = controller
      self.editable = false
    end

  end
end
