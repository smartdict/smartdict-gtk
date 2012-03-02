class Smartdict::Gui::Controller::Config
  include Smartdict::Models

  def lang_names
    @lang_names ||= langs.map{|code| Language[code].name }
  end

  def langs
    @langs ||= (configatron.default.langs + [from_lang, to_lang]).uniq
  end

  def from_lang
    @from_lang ||= configatron.default.from_lang
  end

  def to_lang
    @to_lang ||= configatron.default.to_lang
  end
end
