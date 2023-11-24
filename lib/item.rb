require 'date'
require_relative '../helpers/generate_id'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date)
    @id = generate_id
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

  def move_to_archive
    return false unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    archive_years_constraint = 10
    published_date = Date.parse(@publish_date).year
    current_year = Date.today.year

    (current_year - published_date) > archive_years_constraint
  end
end
