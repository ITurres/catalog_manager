require_relative '../../lib/author'
require_relative '../../helpers/generate_id'

RSpec.describe Author do
  let(:author_name) { 'John Doe' }
  let(:item) { double('Item') }

  before do
    allow_any_instance_of(Author).to receive(:generate_id).and_return('unique_id')
  end

  describe '#initialize' do
    it 'creates an Author instance with a name and a generated id' do
      author = Author.new(author_name)
      expect(author.name).to eq(author_name)
      expect(author.instance_variable_get(:@id)).to eq('unique_id')
    end
  end

  describe '#add_item' do
    it 'adds an item to the author and sets the author for the item' do
      author = Author.new('John Doe')
      item = double('Item')

      # Allow the item to receive the author= method
      allow(item).to receive(:author=)

      author.add_item(item)

      # Expect the author= method to be called with the author instance
      expect(item).to have_received(:author=).with(author)
    end
  end
end
