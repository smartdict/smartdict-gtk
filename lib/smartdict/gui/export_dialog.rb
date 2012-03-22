class Smartdict::Gui::ExportDialog < ::Gtk::FileChooserDialog
  extend ActiveSupport::Autoload

  autoload :FormatComboBox


  class Label < Gtk::Label
    def initialize(title)
      super
      set_markup("<b>#{title}</b>")
    end
  end


  DATE_RANGES =  {
    "Today" => lambda { Date.today  },
    "Week"  => lambda { 1.week.ago  },
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

  # @return [Gtk::Table]
  def options_table
    table_width = DATE_RANGES.size + 2

    # Create table itself
    table = Gtk::Table.new(table_width, 2, false)
    table.column_spacings = 5

    # Format
    format_label = Label.new("Format:")
    @format_combo_box = FormatComboBox.new
    table.attach(format_label, 0, 1, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    table.attach_defaults(@format_combo_box, 1, table_width, 0, 1)

    # Date range
    date_range_label = Label.new("Date range:")
    init_date_range_buttons
    table.attach(date_range_label, 0, 1, 1, 2, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    @date_range_buttons.keys.each_with_index do |button, index|
      table.attach(button, index+1, index+2, 1, 2, Gtk::SHRINK, Gtk::SHRINK, 0, 0)
    end

    # A trick to make radio buttons have left alignment
    table.attach_defaults(Label.new(''), table_width-1, table_width, 1, 2)
  end

  def since_date
    @date_range_buttons.each do |button, block|
      return block.call if button.active?
    end
  end
end
