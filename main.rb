require_relative 'lib/app'

OPTIONS = {
  1 => { name: 'List all books', method: :list_all_books },
  2 => { name: 'List all music albums', method: :list_all_music_albums },
  3 => { name: 'List of games', method: :list_of_games },
  4 => { name: 'List all genres', method: :list_all_genres },
  5 => { name: 'List all labels', method: :list_all_labels },
  6 => { name: 'List all authors', method: :list_all_authors },
  7 => { name: 'Add a book', method: :add_a_book },
  8 => { name: 'Add a music album', method: :add_a_music_album },
  9 => { name: 'Add a game', method: :add_a_game },
  10 => { name: 'Quit', method: :quit }
}.freeze

class Main
  def initialize
    @mainmenu = self

    @app = App.new
  end

  def display_menu
    puts "\nPlease choose an option:"
    OPTIONS.each { |options_index, value| puts "#{options_index} - #{value[:name]}" }

    print 'Option: '

    while (option = gets.chomp.to_i) < 1 || option > OPTIONS.size
      puts 'Invalid option. Please try again.'
      print 'Option: '
    end

    option
  end

  def run
    loop do
      option = display_menu
      handle_option(option)
    end
  end

  def handle_option(option)
    action = OPTIONS[option][:method] # ? get the value (method/action).

    @app.send(action) if action
  end
end

# ? Start the app
main = Main.new
main.run
# ? -------------
