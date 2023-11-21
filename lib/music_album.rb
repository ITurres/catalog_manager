require_relative 'item'
require_relative 'author'

class MusicAlbum < Item
  attr_reader :artist, :number_of_tracks

  def initialize(publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
