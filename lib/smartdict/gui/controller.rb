module Smartdict::Gui
  class Controller
    extend ActiveSupport::Autoload
    extend Forwardable

    autoload :Config

    HISTORY_SIZE_ON_START = 50

    attr_reader :main_window, :word_entry, :translate_button, :menu_bar, :text_view, :status_icon,
                :from_lang_combo_box, :to_lang_combo_box, :interchange_button, :word_list, :status_bar

    def_delegators :@main_window, :toggle_visibility, :hide_visibility, :show_visibility

    def initialize
      @translator = Smartdict::Translator.new(
        :from_lang => config.from_lang,
        :to_lang   => config.to_lang,
        :log       => true
      )

      @main_window      = MainWindow.new(self)
      @word_entry       = WordEntry.new(self)
      @translate_button = TranslateButton.new(self)
      @menu_bar         = MenuBar.new(self)
      @text_view        = TextView.new(self)
      @status_icon      = StatusIcon.new(self)
      @status_bar       = StatusBar.new(self)
      @from_lang_combo_box = LangComboBox.new(self, config.from_lang) do |lang|
        @translator.default_opts[:from_lang] = lang
      end
      @to_lang_combo_box = LangComboBox.new(self, config.to_lang) do |lang|
        @translator.default_opts[:to_lang] = lang
      end
      @interchange_button = InterchangeButton.new(self)
      @word_list          = WordList.new(self)

      @db_mutex = Mutex.new

      load_history
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
      word      = @word_entry.text.strip.downcase
      from_lang = @translator.default_opts[:from_lang]
      to_lang   = @translator.default_opts[:to_lang]
      status_message = "Looking for \"#{word}\" ..."

      safe_concurrent_run do
        do_with_status(status_message) do
          with_reported_exception do
            if add_to_history?(word, from_lang, to_lang)
              translation = @translator.translate(word)
              add_to_history(translation)
            else
              translation = @translator.translate(word, :log => false)
            end
            @text_view.show_translation(translation)
            @word_list.scroll_up
          end
        end
      end
    end

    # @param [String] word
    # @param [String] from_lang language code
    # @param [String] to_lang language code
    def translate_selected_word(word, from_lang, to_lang)
      translation = @translator.translate(word, :log => false)
      @text_view.show_translation(translation)
    end

    def open_about_window
      AboutWindow.new
    end

    def open_export_dialog
      ExportDialog.new(self)
    end

    def export_translations(format_name, file_path, options = {})
      format = Smartdict::Core::FormatManager.find(format_name)
      translations = Smartdict::Log.fetch(options)
      content = format.format_list(translations)
      File.open(file_path, 'w') { |file| file.write content }
    end

    def interchange_langs
      @to_lang_combo_box.active, @from_lang_combo_box.active = @from_lang_combo_box.active, @to_lang_combo_box.active
    end

    def focus_word_entry
      @word_entry.grab_focus
    end


    private

    def config
      @config ||= Config.new
    end

    def add_to_history?(word, from_lang, to_lang)
      !@word_list.first_item_matches?(word, from_lang, to_lang)
    end

    def add_to_history(translation)
      @word_list.prepend_word(translation)
    end

    def load_history
      translations = Smartdict::Log.fetch(:order_desc => true, :limit => HISTORY_SIZE_ON_START)
      translations.reverse.each do |tr|
        @word_list.prepend_word(tr)
      end
    end

    def safe_concurrent_run
      Thread.new do
        @db_mutex.synchronize do
          yield
        end
      end
    end

    def do_with_status(status_message)
      context_id = @status_bar.get_context_id(status_message)
      @status_bar.push(context_id, status_message)
      yield
    ensure
      @status_bar.pop(context_id)
    end

    def with_reported_exception
      yield
    rescue Smartdict::TranslationNotFound => error
      @text_view.buffer.text = error.message
    rescue SocketError => error
      @text_view.buffer.text = "Socket error occurred. Please verify your network connection."
    rescue Exception => error
      @text_view.show_error(error)
    end

  end
end
