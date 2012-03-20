class Smartdict::Gui::InterchangeButton < ::Gtk::Button
  include Smartdict::Gui

  def initialize(controller)
    super('')

    @controller = controller
    signal_connect('clicked') { @controller.interchange_langs }

    image = Gtk::Image.new(Icons.interchange)
    set_image image
    image.show

    set_size_request(60, LEFT_BOX_BUTTON_HEIGHT)
  end
end
