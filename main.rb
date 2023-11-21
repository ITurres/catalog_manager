OPTIONS = {
  1 => { "List all books" => :list_all_books },
  2 => { "List all music albums" => :list_all_music_albums },
  3 => { "List of games" => :list_of_games },
  4 => { "List all genres" => :list_all_genres },
  5 => { "List all labels" => :list_all_labels },
  6 => { "List all authors" => :list_all_authors },
  7 => { "Add a book" => :add_a_book },
  8 => { "Add a music album" => :add_a_music_album },
  9 => { "Add a movie" => :add_a_movie },
  10 => { "Add a game" => :add_a_game },
  11 => { "Quit" => :quit },
}.freeze

def main
  # TODO: implement App class
  app = App.new

  # TODO: implement startup actions for user to chooese options
end

# ? Start the app
main
# ? -------------
