class Smartdict::Gui::ExportDialog < ::Gtk::FileChooserDialog
  extend ActiveSupport::Autoload

  autoload :FormatComboBox

  DATE_RANGES =  {
    "Today" => lambda { Date.today },
    "Week"  => lambda { 1.week.ago },
    "Month" => lambda { 1.month.ago }
  }

  def initialize(controller)
    @controller = controller
    super(
      "Export translations",
      nil,
      Gtk::FileChooser::ACTION_SAVE,
      nil,
      [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL],
      [Gtk::Stock::SAVE, Gtk::Dialog::RESPONSE_ACCEPT]
    )

    self.vbox.pack_start(options_table, false, false)
    show_all

    if run == Gtk::Dialog::RESPONSE_ACCEPT
      export_translations
    end
    destroy
  end


  def export_translations
    format = @format_combo_box.selected_format
    options = {:since => since_date}
    @controller.export_translations(format, filename, options)
  end

  def init_date_range_buttons
    @date_range_buttons = {}
    button = nil
    DATE_RANGES.each do |name, block|
      args = button ? [button, name] : [name]
      button = Gtk::RadioButton.new(*args)
      @date_range_buttons[button] = block
    end
  end

  def options_table
    format_label = Label.new("Format:")
    @format_combo_box = FormatComboBox.new

    date_range_label = Label.new("Date range:")
    init_date_range_buttons

    from_lang_label = Label.new("From language:")
    from_lang_combo_box = LangComboBox.new(@controller)

    to_lang_label = Label.new("To language:")
    to_lang_combo_box = LangComboBox.new(@controller)

    table = Gtk::Table.new(4, 4, false)
    table.row_spacings = 5
    table.column_spacings = 5
    table.border_width = 10

    # Format
    table.attach(format_label, 0, 1, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    table.attach_defaults(@format_combo_box, 1, 4, 0, 1)


    # From lang
    table.attach(from_lang_label, 0, 1, 1, 2, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    table.attach_defaults(from_lang_combo_box, 1, 4, 1, 2)

    # To lang
    table.attach(to_lang_label, 0, 1, 2, 3, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    table.attach_defaults(to_lang_combo_box, 1, 4, 2, 3)

    # Date range
    table.attach(date_range_label, 0, 1, 3, 4, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    @date_range_buttons.keys.each_with_index do |button, index|
      table.attach(button, index+1, index+2, 3, 4, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    end

    table
  end

  def since_date
    @date_range_buttons.each do |button, block|
      return block.call if button.active?
    end
  end

  class Label < Gtk::Label
    def initialize(title)
      super
      set_markup("<b>#{title}</b>")
    end
  end


  class LangComboBox < ::Gtk::ComboBox
    extend Forwardable

    def_delegator :@controller, :config

    def initialize(controller)

      @controller = controller
      super(true)

      config.lang_names.each {|name| append_text(name) }
    end
  end

end
