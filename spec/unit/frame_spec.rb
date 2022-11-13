require 'frame'

RSpec.describe Frame do
  
  let(:frame) {Frame.new}

  it 'contstructs' do
    expect(frame.pins).to eq 10
    expect(frame.score1).to eq 0
    expect(frame.score2).to eq 0
    expect(frame.bonus).to be false
    expect(frame.bonus_type).to eq ''
  end
  context "roll_1 method" do
    it 'can take io input and score the roll when not a strike' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('9')
      frame.roll_1(io)
      expect(frame.score1).to eq 9
    end
    
    it 'sets @bonus to true and @bonus_type to strike on a strike' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('10')
      frame.roll_1(io)
      expect(frame.score1).to eq 10
      expect(frame.bonus).to be true

      expect(frame.bonus_type).to eq 'strike'
    end

    it 'updates remaining pins' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('7')
      frame.roll_1(io)
      expect(frame.pins).to eq 3
    end

    it 'raises exeption if given an impossible roll' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('12')

      expect{frame.roll_1(io)}.to raise_error('error- score higher than remaining pins')
    end
  end


  context 'method roll_2' do
    it 'can take io input and score the roll when not a strike' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('9')
      frame.roll_2(io)
      expect(frame.score2).to eq 9
    end

    it 'raises error if given impossible roll' do
      io = double(:io) 
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('13')
      expect{frame.roll_2(io)}.to raise_error('error- score higher than remaining pins')
      expect(frame.score2).to eq 0
    end

    it 'updates the remaining pins' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('9')
      frame.roll_2(io)
      expect(frame.pins).to eq 1
    end

    it 'sets @bonus to true and @bonus_type to strike if a strike is scored' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('10')
      frame.roll_2(io)
      expect(frame.bonus).to be true
      expect(frame.bonus_type).to eq 'strike'
    end

    it ' sets @bonus to true and @bonus_type to spare if a spare is scored' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('7')
      frame.roll_1(io)
      io2 = double(:io2)
      expect(io2).to receive(:puts).and_return('3 pins remaining')
      expect(io2).to receive(:puts).and_return('Enter score for second roll')
      expect(io2).to receive(:gets).and_return('3')
      frame.roll_2(io2)
      expect(frame.pins).to eq 0
      expect(frame.bonus).to be true
      expect(frame.bonus_type).to eq 'spare'
    end
  end

  context 'play_frame method' do
    it 'can play a frame with no strikes, spares, or errors' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:puts).and_return('7 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('5')
      
      frame.play_frame(io)
      
      expect(frame.score1).to eq 3
      expect(frame.score2).to eq 5
    end

    it 'can play a frame with an error' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('4')
      expect(io).to receive(:puts).and_return('6 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('7')
      
      expect{frame.play_frame(io)}.to raise_error('error- score higher than remaining pins')
      
    end
    it 'can play a frame with a strike' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('0')
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('10')
      
      frame.play_frame(io)
      
      expect(frame.score1).to eq 0
      expect(frame.score2).to eq 10
      expect(frame.bonus).to be true
      expect(frame.bonus_type).to eq 'strike'

    end

    it 'can play a frame with a spare' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('10 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('4')
      expect(io).to receive(:puts).and_return('6 pins remaining')
      expect(io).to receive(:puts).and_return('Enter score for second roll')
      expect(io).to receive(:gets).and_return('6')
      
      frame.play_frame(io)
      
      expect(frame.score1).to eq 4
      expect(frame.score2).to eq 6
      expect(frame.bonus).to be true
      expect(frame.bonus_type).to eq 'spare'

    end
  end
end