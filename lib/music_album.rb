require_relative 'item'

class MusicAlbum < Item
  attr_reader :artist, :number_of_tracks

  def initialize(item, publish_date: nil, on_spotify: false)
    super(item.genre, item.author, item.label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
