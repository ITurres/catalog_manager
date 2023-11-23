require_relative 'game'
require_relative 'genre'
require_relative 'author'
require_relative 'label'
require_relative 'book'

require_relative '../modules/json_data_manager'

require_relative '../helpers/get_basic_inputs'

GAMES_JSON_FILE_PATH = 'db/data/games.json'.freeze
BOOKS_JSON_FILE_PATH = 'db/data/books.json'.freeze

class App
  include JSONDataManager

  # ! REMOVE THIS COMMENTS ONCE ALL THE METHODS ARE IMPLEMENTED.
  # TODO: LISTING {
  # TODO: for all 'listing' methods, 1st implement the class to be intantiated.
  # TODO: then instantiate the class and invoke the method to list all instances
  # TODO: }

  def list_all_books
    # TODO: LISTING
  end

  def list_all_music_albums
    # TODO: LISTING
  end

  def list_of_games
    p 'No games found!' if load_from_json(GAMES_JSON_FILE_PATH).empty?

    p '--------------'
    p 'List of games:'
    p '--------------'
    load_from_json(GAMES_JSON_FILE_PATH).each do |game|
      p "Title: #{game['title']} - Genre: #{game['genre']} - Author: #{game['author']}"
    end
  end

  def list_all_genres
    # TODO: LISTING
  end

  def list_all_labels
    # TODO: LISTING
  end

  def list_all_authors
    # TODO: LISTING
  end

  # TODO: ADDING {
  # TODO: for all 'adding' methods, 1st implement the class to be intantiated.
  # TODO: then instantiate the class and invoke the method to add a new instance of that class
  # ! TODO: IMPORTANT: all the user inputs should be validated in the class itself, not here.
  # TODO: print the user input to confirm the new instance was added.
  # TODO: }

  def add_a_book
    user_inputs = get_basic_inputs('Book')
    p 'Enter the publisher name : '
    publisher = gets.chomp
    p 'Enter the cover status : good/bad '
    cover_state = gets.chomp
    genre = Genre.new(user_inputs['genre_name'])
    author = Author.new(user_inputs['author_name'])
    label = Label.new(user_inputs['label_title'], user_inputs['label_color'])
    book = Book.new(title: user_inputs['title'], publish_date: user_inputs['publish_date'],
                    publisher: publisher, cover_state: cover_state)
    book.add_genre(genre)
    book.add_author(author)
    book.add_label(label)
    save_to_json(BOOKS_JSON_FILE_PATH, book.to_h)
  end

  def add_a_music_album
    # TODO: ADDING
  end

  def add_a_game
    user_inputs = get_basic_inputs('Game')

    p 'Enter the Game last played date: (YYYY-MM-DD)'
    while (last_played_at = gets.chomp) !~ /^\d{4}-\d{2}-\d{2}$/
      p 'Invalid date format. Please try again.'
      p 'Enter the Game last played date: (YYYY-MM-DD)'
    end

    p 'Enter the Game multiplayer: (true/false)'
    multiplayer = gets.chomp == 'true'

    genre = Genre.new(user_inputs['genre_name'])
    author = Author.new(user_inputs['author_name'])
    label = Label.new(user_inputs['label_title'], user_inputs['label_color'])

    game = Game.new(title: user_inputs['title'], publish_date: user_inputs['publish_date'],
                    last_played_at: last_played_at, multiplayer: multiplayer)

    game.add_genre(genre)
    game.add_author(author)
    game.add_label(label)

    save_to_json(GAMES_JSON_FILE_PATH, game.to_h)

    p
    p 'Game added successfully!'
    p
  end

  def quit
    puts 'Thanks for using Catalog Manager!'
    exit
  end
end
