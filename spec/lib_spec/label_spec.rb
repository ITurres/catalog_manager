require_relative '../../lib/label'
require_relative '../../helpers/generate_id'

RSpec.describe Label do
  let(:title) { 'My Label' }
  let(:color) { 'My Color' }
  let(:item) { double('Item') }

  before do
    allow_any_instance_of(Label).to receive(:generate_id).and_return('unique_id')
  end

  describe '#initialize' do
    it 'creates a Label instance with a title and a generated id' do
      label = Label.new(title, color)
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
      expect(label.instance_variable_get(:@id)).to eq('unique_id')
    end
  end

  describe '#add_item' do
    it 'adds an item to the label and sets the label for the item' do
      label = Label.new('My Label', 'My Color')
      item = double('Item')

      # Allow the item to receive the label= method
      allow(item).to receive(:label=)

      label.add_item(item)

      # Expect the label= method to be called with the label instance
      expect(item).to have_received(:label=).with(label)
    end
  end
end
