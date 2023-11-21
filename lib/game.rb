require 'date'
require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(last_played_at, multiplayer)
    super(last_played_at)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    return false unless super
    # ! After super, we know that the parent's method returns true so 'date' its already older than 10 years,
    # ! so at this point it is implied that @last_played_at is older than 2 years...
    # ? do we need the below check?.

    return false if @last_played_at.nil? || @last_played_at !~ /\d{4}-\d{2}-\d{2}/

    two_years_in_days = 365 * 2 # ! 2 years in days - not counting leap years and/or 365.25 days per year (average)
    last_played_at_date_year = Date.parse(@last_played_at).year

    (Date.today - last_played_at_date_year) > two_years_in_days
  end
end
