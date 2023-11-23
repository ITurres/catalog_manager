require 'json'

module JSONDataManager
  def save_to_json(file_path, new_data)
    parsed_data = []

    # ? Read existing JSON data from the file if it exists.
    if File.exist?(file_path)
      current_data = File.read(file_path)

      parsed_data = JSON.parse(current_data) unless current_data.empty?
    end

    # * Append new data to the parsed data array.
    # * new_data could be either an object of type: Book, MusicAlbum, or Game.
    # ? Or it could also serve for the array of: Genres, Authors, or Labels.??
    parsed_data << new_data

    # ? Write the updated data back to the JSON file.
    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

  def load_from_json(file_path)
    # ? Read existing JSON data from the file if it exists.
    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?

      return [] if parsed_data.nil? # ! important in case json file is new and empty.
    end

    # * return to be iterated over for the UI.
    parsed_data
  end
  
  def read_json_file(file_path)
    load_from_json(file_path)
  end

  def get_labels_and_titles(files)
    labels = Set.new
    titles_by_label = Hash.new { |hash, key| hash[key] = [] }
  
    files.each do |file|
      data = read_json_file(file)
  
      data.each do |item|
        labels << item['label']
        titles_by_label[item['label']] << item['title']
      end
    end
    [labels.to_a, titles_by_label]
  end
  
  def display_labels_and_titles(labels, titles_by_label)
    puts "Diplaying Labels..."
    puts labels
    puts titles_by_label
    labels.each do |label|
      titles = titles_by_label[label]
      puts "Label: #{label}"
      puts "Titles: #{titles.join(', ')}" unless titles.empty?
      puts "\n"
    end
  end
end
