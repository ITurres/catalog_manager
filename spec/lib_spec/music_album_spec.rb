require_relative '../../lib/music_album'
require_relative '../../helpers/generate_id'

RSpec.describe MusicAlbum do
  subject(:solver) { MusicAlbum }
  let(:title) { 'Abbey Road' }
  let(:publish_date) { '1969-09-26' }
  let(:on_spotify) { true }
  let(:album) { subject.new(title: title, publish_date: publish_date, on_spotify: on_spotify) }

  before(:each) do
    allow_any_instance_of(MusicAlbum).to receive(:generate_id).and_return('unique_id')
  end

  describe '#initialize' do
    context 'When the album is initialized' do
      it 'Should equal the title attribute' do
        expect(album.title).to eq(title)
      end

      it 'Should equal the publish_date attribute' do
        expect(album.publish_date).to eq(publish_date)
      end

      it 'Should equal the on_spotify attribute' do
        expect(album.on_spotify).to eq(on_spotify)
      end
    end
  end

  describe '#to_h' do
    it 'Should return a hash representation of the MusicAlbum' do
      expected_hash = {
        'id' => album.id,
        'title' => title,
        'genre' => nil,
        'author' => nil,
        'label' => nil,
        'publish_date' => publish_date,
        'on_spotify' => on_spotify,
        'archived' => false
      }

      expect(album.to_h).to eq(expected_hash)
    end
  end

  describe '#move_to_archive' do
    it 'Should return >>true<< if the album is on Spotify' do
      expect(album.move_to_archive).to be true
    end
  end
end
