require 'date'
require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(item, published_date: nil,
                 last_played_at: nil,
                 multiplayer: false)

    super(item.genre, item.author, item.label, published_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    return false unless super

    return false if @last_played_at.nil? || @last_played_at !~ /\d{4}-\d{2}-\d{2}/

    two_years_in_days = 365 * 2 # ! 2 years in days - not counting leap years and/or 365.25 days per year (average)
    last_played_at_date_year = Date.parse(@last_played_at).year
    current_year = Date.today.year

    (current_year - last_played_at_date_year) > two_years_in_days
  end
end
