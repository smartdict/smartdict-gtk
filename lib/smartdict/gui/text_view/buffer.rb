class Smartdict::Gui::TextView::Buffer < ::Gtk::TextBuffer
  INDENT = 4

  def initialize
    super
    create_tag("word"           , {"weight" => Pango::WEIGHT_BOLD , :scale => 1.3})
    create_tag("transcription"  , {"style"  => Pango::STYLE_ITALIC, :scale => 1.3})
    create_tag("word_class"     , {"weight" => Pango::WEIGHT_BOLD , :scale => 1.0})
    create_tag("translated_word", {:scale => 1.0})
    create_tag("text", {})
  end

  def set_translation(translation)
    self.text = ''

    insert(end_iter, translation.word, "word")
    insert(end_iter, " [#{translation.transcription}]", "transcription") if translation.transcription
    insert(end_iter, "\n")

    translation.translated.each do |word_class, words|
      add_word_class(word_class, words)
    end
  end

  def set_error(error)
    self.text = ''
    insert_text "An error occured. Please report it: \n"
    insert_url "https://github.com/smartdict/smartdict-gtk/issues/new"
    insert_text "\n\nError information:\n" \
                "    #{error.class}:  #{error.message}\n\n" \
                "Backtrace:\n"
    insert_text "    " + error.backtrace.join("\n    ")
  end


  private

  def add_word_class(word_class, words)
    text = (" " * INDENT) + "#{word_class}\n"
    insert(end_iter, text, "word_class")
    words.each do |word|
      add_translated_word(word)
    end
  end

  def add_translated_word(word)
    word_text = (" " * INDENT * 2) + "#{word}\n"
    insert(end_iter, word_text, "translated_word")
  end

  # TODO: implement
  # There is no legal way to display link with Ruby.
  # See Python solution for _insert_url(): http://download.gna.org/nfoview/doc/api/nfoview.view_source.html
  def insert_url(url)
    tag = create_tag(nil, {"underline" => Pango::UNDERLINE_SINGLE, "foreground" => "blue"})
    #tag.signal_connect("event") do |tag, text_view, event, itr|
    #  if event.event_type == Gdk::Event::BUTTON_RELEASE
    #    puts url
    #  end
    #end
    insert(end_iter, url, tag)
  end

  def insert_text(text)
    insert(end_iter, text, "text")
  end
end
