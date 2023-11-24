require_relative '../../lib/genre'
require_relative '../../helpers/generate_id'

RSpec.describe Genre do
  subject(:genre) { Genre }
  let(:name) { 'Apple Records' }
  let(:item) { double('Item') }

  before(:each) do
    allow_any_instance_of(genre).to receive(:generate_id).and_return('unique_id')
  end

  describe '#initialize' do
    context 'when the genre is initialized' do
      it 'Should create a genre instance with a title' do
        genre = subject.new(name)

        expect(genre.name).to eq(name)
      end

      it 'Should create a genre instance with a title and receives an unique generated id' do
        genre = subject.new(name)

        expect(genre.instance_variable_get(:@id)).to eq('unique_id')
      end
    end
  end

  describe '#add_item' do
    context 'when the item is not already in the genre' do
      it 'Should add an item to the genre and sets the genre for the item' do
        genre = subject.new('My genre')
        item = double('Item')

        allow(item).to receive(:genre=)

        genre.add_item(item)

        expect(item).to have_received(:genre=).with(genre)
      end
    end
  end
end
