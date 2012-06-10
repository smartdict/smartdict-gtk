class Smartdict::Gui::TextView < ::Gtk::TextView
  extend ActiveSupport::Autoload
  autoload :Buffer

  def initialize(controller)
    super(Buffer.new)
    @controller = controller
    self.editable = false
  end

  def show_translation(translation)
    buffer.set_translation(translation)
  end

  def show_error(error)
    buffer.set_error(error)
  end
end
