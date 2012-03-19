class Smartdict::Gui::LangComboBox < ::Gtk::ComboBox
  extend Forwardable
  include Smartdict::Gui

  def_delegator :@controller, :config

  def initialize(controller, active_lang_code, &on_change_block)
    super(true)
    @controller = controller
    @on_change_block = on_change_block

    config.lang_names.each {|name| append_text(name) }
    active_index = config.langs.index(active_lang_code)
    set_active(active_index)

    signal_connect("changed") do |comb_box|
      lang_code = config.langs[active]
      @on_change_block.call(lang_code)
    end

    set_size_request(100, LEFT_BOX_BUTTON_HEIGHT)
  end

end
