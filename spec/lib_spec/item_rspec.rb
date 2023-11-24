require 'date'
require_relative '../../helpers/generate_id'
require_relative '../../lib/item'

RSpec.describe Item do
  let(:publish_date) { '2010-01-01' }
  let(:item) { Item.new(publish_date) }

  describe '#initialize' do
    it 'should initialize an item with the provided publish_date' do
      expect(item.publish_date).to eq(publish_date)
      expect(item.archived).to be_falsey
    end
  end

  describe '#add_genre' do
    it 'should set the genre and add the item to the genre' do
      genre = double('Genre')
      allow(genre).to receive(:add_item)

      item.add_genre(genre)

      expect(item.genre).to eq(genre)
      expect(genre).to have_received(:add_item).with(item)
    end
  end

  describe '#add_author' do
    it 'should set the author and add the item to the author' do
      author = double('Author')
      allow(author).to receive(:add_item)

      item.add_author(author)

      expect(item.author).to eq(author)
      expect(author).to have_received(:add_item).with(item)
    end
  end

  describe '#add_label' do
    it 'should set the label and add the item to the label' do
      label = double('Label')
      allow(label).to receive(:add_item)

      item.add_label(label)

      expect(item.label).to eq(label)
      expect(label).to have_received(:add_item).with(item)
    end
  end

  describe '#move_to_archive' do
    context 'when the item can be archived' do
      it 'should set archived to true' do
        allow(item).to receive(:can_be_archived?).and_return(true)

        result = item.move_to_archive

        expect(result).to be_truthy
        expect(item.archived).to be_truthy
      end
    end

    context 'when the item cannot be archived' do
      it 'should not set archived to true' do
        allow(item).to receive(:can_be_archived?).and_return(false)

        result = item.move_to_archive

        expect(result).to be_falsey
        expect(item.archived).to be_falsey
      end
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the item is older than 10 years' do
      allow(Date).to receive(:today).and_return(Date.new(2023, 1, 1))

      result = item.send(:can_be_archived?)

      expect(result).to be_truthy
    end

    it 'should return false if the item is not older than 10 years' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 1, 1))

      result = item.send(:can_be_archived?)

      expect(result).to be_falsey
    end
  end
end
