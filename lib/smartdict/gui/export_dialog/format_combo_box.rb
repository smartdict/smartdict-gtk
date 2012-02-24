class Smartdict::Gui::ExportDialog::FormatComboBox < ::Gtk::ComboBox
  def initialize
    super(true)

    format_names.each {|name| append_text(name) }

    set_active 0
  end

  def selected_format
    format_names[active]
  end

  def format_names
    Smartdict::Core::FormatManager.instance.formats.keys
  end
end
