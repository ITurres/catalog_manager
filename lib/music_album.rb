require_relative 'item'

class MusicAlbum < Item
  def initialize(title: nil, publish_date: nil, on_spotify: false)
    super(publish_date)

    @title = title
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def to_h
    {
      'id' => @id,
      'title' => @title,
      'genre' => @genre&.name,
      'author' => @author&.name,
      'label' => @label&.title,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'archived' => @archived
    }
  end

  def can_be_archived?
    super && @on_spotify
  end
end
