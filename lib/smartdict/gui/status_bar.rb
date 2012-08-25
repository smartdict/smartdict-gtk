class Smartdict::Gui::StatusBar < ::Gtk::Statusbar
  DEFAULT_MESSAGE = "Enter a word to look for a translation"

  def initialize(controller)
    super()
    @controller = controller
    push_default_message
  end

  private

  def push_default_message
    context_id = get_context_id("default")
    push(context_id, DEFAULT_MESSAGE)
  end
end