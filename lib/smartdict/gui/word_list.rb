class Smartdict::Gui::WordList < ::Gtk::TreeView

  class ListColumn < Gtk::TreeViewColumn
    class << self
      attr_accessor :column_counter
    end
    self.column_counter = 0

    def initialize(title)
      column_id = self.class.column_counter
      self.class.column_counter += 1

      super(title, Gtk::CellRendererText.new, :text => column_id)       # call to base class

      # set options of column
      self.resizable      = true
      self.clickable      = true
      self.sort_indicator = false
      self.sort_column_id = column_id
    end
  end



  def initialize(controller)
    @controller = controller

    @list_model = Gtk::ListStore.new(String, String, String)
    super(@list_model)

    self.append_column(ListColumn.new("History"))

    self.selection.signal_connect("changed"){
      item = self.selection.selected
      word, from_lang, to_lang = item[0], item[1], item[2]
      @controller.translate_selected_word(word, from_lang, to_lang)
    }
  end

  def prepend_word(translation)
    item = @list_model.prepend
    item[0] = translation.word
    item[1] = translation.from_lang
    item[2] = translation.to_lang
  end

end
