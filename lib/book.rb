require_relative 'item'
require_relative 'author'

class Book < Item
  attr_reader :publisher, :cover_state, :title

  def initialize(title: nil, publish_date: nil,
                 publisher: nil, cover_state: nil)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @title = title
  end

  def to_h
    {
      'id' => @id,
      'title' => @title,
      'genre' => @genre&.name,
      'author' => @author&.name,
      'label' => @label&.title,
      'published_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'archived' => @archived
    }
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
