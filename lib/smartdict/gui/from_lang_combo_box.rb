module Smartdict::Gui
  class FromLangComboBox < Gtk::ComboBox

    def initialize(controller)
      super(true)
      @controller = controller

      Smartdict::Models::Language.all.each do |lang|
        append_text lang.code
      end
    end

  end
end
