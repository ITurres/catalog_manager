require_relative '../../lib/game'

RSpec.describe Game do
  subject(:solver) { Game }

  describe '#to_h' do
    it 'returns a hash with the game attributes' do
      game = subject.new(title: 'Super Mario Bros.',
                         publish_date: '1985-09-13',
                         last_played_at: '2019-10-10',
                         multiplayer: true)

      expected_hash = {
        'id' => game.id,
        'title' => 'Super Mario Bros.',
        'genre' => nil,
        'author' => nil,
        'label' => nil,
        'published_date' => '1985-09-13',
        'last_played_at' => '2019-10-10',
        'multiplayer' => true,
        'archived' => false
      }

      expect(game.to_h).to eq(expected_hash)
    end
  end

  describe '#move_to_archive' do
    context 'When the game has been played less than 2 years ago' do
      it 'Should returns false' do
        game = subject.new(publish_date: '1985-09-13', last_played_at: '2022-10-10')

        expect(game.move_to_archive).to eq(false)
      end
    end

    context 'When the game has been played more than 2 years ago' do
      it 'Should returns true' do
        game = subject.new(publish_date: '2000-11-10', last_played_at: '2017-10-10')

        expect(game.move_to_archive).to eq(true)
      end
    end
    context 'When the game has never been played' do
      it 'Should returns false' do
        game = subject.new(publish_date: '2000-11-10', last_played_at: nil)

        expect(game.move_to_archive).to eq(false)
      end
    end
  end
end
