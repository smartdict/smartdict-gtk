class Smartdict::Gui::LangComboBox < ::Gtk::ComboBox

  def initialize(controller, active_lang, &block)
    super(true)
    @controller = controller
    @on_change_block = block

    @controller.langs.each do |lang_code|
      append_text Smartdict::Models::Language.first(:code => lang_code).name
    end

    self.active = @controller.langs.index(active_lang)

    signal_connect("changed") do |combo_box|
      @on_change_block.call(combo_box.active)
    end
  end

end
