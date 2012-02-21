require 'benchmark'

module Smartdict::Gui
  class Controller
    attr_reader :main_window, :word_entry, :translate_button, :menu_bar, :text_view, :status_icon,
                :from_lang_combo_box, :to_lang_combo_box

    def initialize
      @main_window      = MainWindow.new(self)
      @word_entry       = WordEntry.new(self)
      @translate_button = TranslateButton.new(self)
      @menu_bar         = MenuBar.new(self)
      @text_view        = TextView.new(self)
      @status_icon      = StatusIcon.new(self)
      @from_lang_combo_box = LangComboBox.new(self, 'en') {|i| Smartdict::Translator.from_lang_code = langs[i] }
      @to_lang_combo_box   = LangComboBox.new(self, 'ru') {|i| Smartdict::Translator.to_lang_code = langs[i] }
    end

    def run
      @main_window.draw_window
      @main_window.show_all
      Gtk.main
    end

    def quit
      ::Gtk.main_quit
    end

    def translate
      word = @word_entry.text.strip.downcase
      translation = Smartdict::Translator.translate(word)
      @text_view.show_translation(translation)
    rescue Smartdict::TranslationNotFound => err
      @text_view.buffer.text = err.message
    end

    def toggle_main_window
      @main_window.visible? ? @main_window.hide_all : @main_window.show_all
    end

    def open_about_window
      AboutWindow.new
    end

    # TODO: should be removed to configurations
    # TODO: refactor LangComboBox as well.
    def langs
      %w(en ru de es fr zh)
    end

  end
end
