def get_basic_inputs(type)
  p "Enter the #{type} title:"
  title = gets.chomp
  p "Enter the #{type} genre:"
  genre_name = gets.chomp
  p "Enter the #{type} author:"
  author_name = gets.chomp
  p "Enter the #{type} label:"
  label_title = gets.chomp
  p "Enter the #{type} label color:"
  label_color = gets.chomp

  publish_date = gets_publish_date

  {
    'title' => title,
    'genre_name' => genre_name,
    'author_name' => author_name,
    'label_title' => label_title,
    'label_color' => label_color,
    'publish_date' => publish_date
  }
end

# ! Separate method due to rubocop's method length rule
def gets_publish_date
  p 'Enter the publish date: (YYYY-MM-DD)'
  while (publish_date = gets.chomp) !~ /^\d{4}-\d{2}-\d{2}$/
    p 'Invalid date format. Please try again.'
    p 'Enter the publish date: (YYYY-MM-DD)'
  end

  publish_date
end
