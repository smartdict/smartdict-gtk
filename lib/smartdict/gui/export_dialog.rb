class Smartdict::Gui::ExportDialog < ::Gtk::Dialog
  extend ActiveSupport::Autoload

  autoload :FormatComboBox

  def initialize(controller)
    @controller = controller

    super(
      "Export translations",
      nil,
      Gtk::Dialog::MODAL,
      [ Gtk::Stock::OK, Gtk::Dialog::RESPONSE_OK ],
      [ Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL ]
    )

    self.default_response = Gtk::Dialog::RESPONSE_OK

    build_dialog

    show_all

    run do |response|
      if response == ::Gtk::Dialog::RESPONSE_OK
        export_translations
        destroy
      elsif response = Gtk::Dialog::RESPONSE_CANCEL
        destroy
      end
    end
  end


  def export_translations
    format = @format_combo_box.selected_format
    file_path = @file_entry.text
    @controller.export_translations(format, file_path)
  end

  def build_dialog
    format_label = Gtk::Label.new("Format")
    file_label   = Gtk::Label.new("Save to")

    #format_entry = Gtk::Entry.new
    @format_combo_box = FormatComboBox.new
    @file_entry = Gtk::Entry.new


    table = Gtk::Table.new(4, 2, false)
    table.row_spacings = 5
    table.column_spacings = 5
    table.border_width = 10

    table.attach_defaults(format_label, 0, 1, 0, 1)
    table.attach_defaults(@format_combo_box, 1, 2, 0, 1)

    table.attach_defaults(file_label, 0, 1, 1, 2)
    table.attach_defaults(@file_entry, 1, 2, 1, 2)

    self.vbox.add(table)
  end

end
