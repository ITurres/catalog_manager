require_relative '../helpers/generate_id'

class Genre
  attr_reader :name

  def initialize(name)
    @id = generate_id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
