class Smartdict::Gui::InterchangeButton < ::Gtk::Button
  def initialize(controller)
    super('')

    @controller = controller
    signal_connect('clicked') { @controller.interchange_langs }

    image = Gtk::Image.new(Smartdict::Gui.icons_dir + "/interchange.png")
    set_image image
    image.show
  end
end
