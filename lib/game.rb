require 'date'
require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(title: 'Unknown Title',
                 publish_date: nil,
                 last_played_at: nil,
                 multiplayer: false)

    super(publish_date)

    @title = title
    @publish_date = publish_date
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def to_h
    {
      'id' => @id,
      'title' => @title,
      'genre' => @genre&.name,
      'author' => @author&.name,
      'label' => @label&.title,
      'published_date' => @publish_date,
      'last_played_at' => @last_played_at,
      'multiplayer' => @multiplayer,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    return false unless super # * true when publish_date is older than 10 years.

    return false if @last_played_at.nil? || @last_played_at !~ /\d{4}-\d{2}-\d{2}/

    two_years_in_days = 365 * 2 # ! 2 years in days - not counting leap years and/or 365.25 days per year (average)
    last_played_at_date_year = Date.parse(@last_played_at).year
    current_year = Date.today.year

    (current_year - last_played_at_date_year) > two_years_in_days
  end
end
