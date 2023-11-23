require_relative 'game'
require_relative 'genre'
require_relative 'author'
require_relative 'label'
require_relative 'book'
require_relative 'music_album'

require_relative '../modules/json_data_manager'

require_relative '../helpers/get_basic_inputs'

GAMES_JSON_FILE_PATH = 'db/data/games.json'.freeze
BOOKS_JSON_FILE_PATH = 'db/data/books.json'.freeze
MUSIC_ALBUMS_JSON_FILE_PATH = 'db/data/music_albums.json'.freeze
JSON_FILES = Dir.glob('db/data/*.json').freeze

class App
  include JSONDataManager

  def list_all_books
    if load_from_json(BOOKS_JSON_FILE_PATH).empty?
      p 'No books found!'
      return
    end

    p '--------------'
    p 'List of books:'
    p '--------------'
    load_from_json(BOOKS_JSON_FILE_PATH).each do |book|
      p "Title: #{book['title']} - Genre: #{book['genre']} - Author: #{book['author']}"
    end
  end

  def list_all_music_albums
    if load_from_json(MUSIC_ALBUMS_JSON_FILE_PATH).empty?
      p 'No music albums found!'
      return
    end

    p '-------------------'
    p 'List of music albums:'
    p '-------------------'
    load_from_json(MUSIC_ALBUMS_JSON_FILE_PATH).each do |music_album|
      p "Title: #{music_album['title']} - Genre: #{music_album['genre']} - Author: #{music_album['author']}"
    end
  end

  def list_of_games
    if load_from_json(GAMES_JSON_FILE_PATH).empty?
      p 'No games found!'
      return
    end

    p '--------------'
    p 'List of games:'
    p '--------------'
    load_from_json(GAMES_JSON_FILE_PATH).each do |game|
      p "Title: #{game['title']} - Genre: #{game['genre']} - Author: #{game['author']}"
    end
  end

  def list_all_genres
    p '--------------'
    p 'List of genres:'
    p '--------------'
    genres = get_data_by_attribute(JSON_FILES, 'genre')
    genres.each { |genre| puts genre }
  end

  def list_all_labels
    p '--------------'
    p 'List of labels:'
    p '--------------'
    labels = get_data_by_attribute(JSON_FILES, 'label')
    labels.each { |label| puts label }
  end

  def list_all_authors
    # TODO: LISTING
  end

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
    user_inputs = get_basic_inputs('Music Album')

    p 'Is the Album on Spotify? (true/false)'
    on_spotify = gets.chomp == 'true'

    genre = Genre.new(user_inputs['genre_name'])
    author = Author.new(user_inputs['author_name'])
    label = Label.new(user_inputs['label_title'], user_inputs['label_color'])

    music_album = MusicAlbum.new(title: user_inputs['title'], publish_date: user_inputs['publish_date'],
                                 on_spotify: on_spotify)

    music_album.add_genre(genre)
    music_album.add_author(author)
    music_album.add_label(label)

    save_to_json(MUSIC_ALBUMS_JSON_FILE_PATH, music_album.to_h)

    p
    p 'Music Album added successfully!'
    p
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
