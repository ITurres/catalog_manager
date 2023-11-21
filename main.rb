require_relative 'lib/app'

OPTIONS = {
  1 => { 'List all books' => :list_all_books },
  2 => { 'List all music albums' => :list_all_music_albums },
  3 => { 'List of games' => :list_of_games },
  4 => { 'List all genres' => :list_all_genres },
  5 => { 'List all labels' => :list_all_labels },
  6 => { 'List all authors' => :list_all_authors },
  7 => { 'Add a book' => :add_a_book },
  8 => { 'Add a music album' => :add_a_music_album },
  9 => { 'Add a game' => :add_a_game },
  10 => { 'Quit' => :quit }
}.freeze

class Main
  def initialize
    @mainmenu = self
    # TODO: Implement the App class
    @app = App.new
  end

  def display_menu
    puts "\nPlease choose an option:"
    OPTIONS.each { |key, value| puts "#{key} - #{value.to_s.tr('_', ' ')}" }
    print 'Option: '
    gets.chomp.to_i
  end

  def run
    loop do
      option = display_menu
      handle_option(option)
    end
  end

  def handle_option(option)
    action = OPTIONS[option]
    if action
      @app.send(action)
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

# ? Start the app
main = Main.new
main.run
# ? -------------
