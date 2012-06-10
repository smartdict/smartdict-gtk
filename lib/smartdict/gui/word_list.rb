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
      self.reorderable    = false
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
    selection.select_iter(item)
  end

  def first_item_matches?(word, from_lang, to_lang)
    iter = @list_model.iter_first
    return false unless iter
    word      == @list_model.get_value(iter, 0) &&
    from_lang == @list_model.get_value(iter, 1) &&
    to_lang   == @list_model.get_value(iter, 2)
  end

  def scroll_up
    # TODO: It's a dirty hack!
    # We need just resize WordList and set vadjustment.value = 0.
    # But WordList is resized after, so I do this hack to make sure
    # that it's already resized.
    Thread.new do
      # Expected to parent be Gtk::ScrolledWindow
      vad = self.parent.vadjustment
      vad.value = vad.lower
      vad.value_changed
    end
  end

end
