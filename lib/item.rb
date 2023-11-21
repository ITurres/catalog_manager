require 'date'
require 'securerandom'

class Item
  attr_reader :id, :genre, :author, :label, :archived
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = SecureRandom.uuid
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end
end
