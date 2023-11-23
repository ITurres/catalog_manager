# book_spec.rb
require_relative '../../lib/book'
require_relative '../../helpers/generate_id'

RSpec.describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:publish_date) { '1925-04-10' }
  let(:publisher) { 'Scribner' }
  let(:cover_state) { 'good' }

  before do
    allow_any_instance_of(Book).to receive(:generate_id).and_return('unique_id')
  end

  describe '#initialize' do
    it 'creates a Book instance with the specified attributes' do
      book = Book.new(
        title: title,
        publish_date: publish_date,
        publisher: publisher,
        cover_state: cover_state
      )

      expect(book.title).to eq(title)
      expect(book.publish_date).to eq(publish_date)
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the Book' do
      book = Book.new(
        title: title,
        publish_date: publish_date,
        publisher: publisher,
        cover_state: cover_state
      )

      expected_hash = {
        'id' => book.id,
        'title' => title,
        'genre' => nil,
        'author' => nil,
        'label' => nil,
        'published_date' => publish_date,
        'publisher' => publisher,
        'cover_state' => cover_state,
        'archived' => false
      }

      expect(book.to_h).to eq(expected_hash)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the cover state is bad' do
      book = Book.new(
        title: title,
        publish_date: publish_date,
        publisher: publisher,
        cover_state: 'bad'
      )

      allow(book).to receive(:super).and_return(false)

      expect(book.can_be_archived?).to be true
    end
  end
end
