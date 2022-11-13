require 'bowling_game'

RSpec.describe BowlingGame do
  
  let(:game) {BowlingGame.new}

  it 'constructs' do
    expect(game.frames).to eq []
    expect(game.bonus_rolls).to eq 0
    expect(game.bonus_score).to eq 0
    expect(game.frame_number).to eq 1
  end

  context 'play' do
    it 'can play first nine frames of a game with no bonus rolls' do
      
      io = double(:io)

      expect(io).to receive(:puts).with('Frame 1')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 2')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 3')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 4')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 5')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 6')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 7')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 8')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      expect(io).to receive(:puts).with('Frame 9')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('4')
      expect(io).to receive(:puts).with('6 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('3')

      expect(io).to receive(:puts).with('Frame 10')
      expect(io).to receive(:puts).with('10 pins remaining')
      expect(io).to receive(:puts).with('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).with('7 pins remaining')
      expect(io).to receive(:puts).with('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')

      game.play(io)

      expect(game.frames[0].score2).to eq 5
      expect(game.frames[8].score1).to eq 4
      
    end
  end
end