require 'date'
require 'securerandom'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :label, :publish_date

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

  def add_label(label)
    @label = label
    label.add_item(self)
  end

  def can_be_archived?
    archive_year_days = 3650 # 10 years in days
    published_date = Date.parse(@publish_date)
    (Date.today - published_date).to_i > archive_year_days
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
