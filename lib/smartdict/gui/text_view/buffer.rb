class Smartdict::Gui::TextView::Buffer < ::Gtk::TextBuffer
  INDENT = 4

  def initialize
    super
    create_tag("word"           , {"weight" => Pango::WEIGHT_BOLD , :scale => 1.3})
    create_tag("transcription"  , {"style"  => Pango::STYLE_ITALIC, :scale => 1.3})
    create_tag("word_class"     , {"weight" => Pango::WEIGHT_BOLD , :scale => 1.0})
    create_tag("translated_word", {:scale => 1.0})
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
end
