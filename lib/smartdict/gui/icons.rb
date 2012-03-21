module Smartdict::Gui::Icons
  extend self

  def icons_root
    File.expand_path("../../../../icons", __FILE__)
  end

  def icon(name, filename)
    define_method(name) do
      "#{icons_root}/#{filename}"
    end
  end

  icon :interchange, "interchange.png"
  icon :logo       , "logo.png"
end
