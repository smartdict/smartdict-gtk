class Smartdict::Gui::ExportDialog < ::Gtk::FileChooserDialog
  extend ActiveSupport::Autoload

  autoload :FormatComboBox

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
    @controller.export_translations(format, filename)
  end

  def options_table
    format_label = Gtk::Label.new("Format")
    @format_combo_box = FormatComboBox.new


    table = Gtk::Table.new(1, 2, false)
    table.row_spacings = 5
    table.column_spacings = 5
    table.border_width = 10

    table.attach_defaults(format_label, 0, 1, 0, 1)
    table.attach_defaults(@format_combo_box, 1, 2, 0, 1)

    table
  end

end
