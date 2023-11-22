require_relative 'item'
require_relative 'author'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(title, author, publish_date, publisher, cover_state)
    super(title, author, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || @cover_state == "bad"

    false
  end
end