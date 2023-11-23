require_relative '../helpers/generate_id'

class Label
  attr_reader :title, :color

  def initialize(title, color)
    @id = generate_id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end
end
