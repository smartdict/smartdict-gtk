require 'benchmark'

module Smartdict::Gui
  class Controller
    attr_reader :main_window, :word_entry, :translate_button, :menu_bar, :text_view, :status_icon

    def initialize
      @main_window      = MainWindow.new(self)
      @word_entry       = WordEntry.new(self)
      @translate_button = TranslateButton.new(self)
      @menu_bar         = MenuBar.new(self)
      @text_view        = TextView.new(self)
      @status_icon      = StatusIcon.new(self)
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
      output = format.format_translation(translation)
    rescue Smartdict::TranslationNotFound => err
      output = err.message
    ensure
      @text_view.buffer.text = output
    end

    def toggle_main_window
      @main_window.visible? ? @main_window.hide_all : @main_window.show_all
    end

    def open_about_window
      AboutWindow.new
    end




    private

    def format
      Smartdict::Formats::TextFormat
    end

  end
end
