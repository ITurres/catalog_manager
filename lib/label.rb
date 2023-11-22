require_relative '../helpers/generate_id'

class Label
    attr_reader :id, :title, :color
  
    def initialize(name, title, color)
      @id = generate_id
      @title = title
      @color = color
      @items = []
    end
  
    def add_item(item)  
      @items << item
      item.label = self
    end
  end
  