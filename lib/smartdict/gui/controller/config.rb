class Smartdict::Gui::Controller::Config
  def lang_names
    @lang_names ||= langs.map{|code| Smartdict::Models::Language.first(:code => code).name }
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
