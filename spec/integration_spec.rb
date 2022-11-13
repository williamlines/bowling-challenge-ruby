require 'bowling_game'

RSpec.describe BowlingGame do
  
  let(:game) {BowlingGame.new}

  it 'constructs' do
    expect(game.frames).to eq []
    expect(game.bonus_rolls).to eq 0
    expect(game.bonus_score).to eq 0
    expect(game.frame_number).to eq 1
  end
end