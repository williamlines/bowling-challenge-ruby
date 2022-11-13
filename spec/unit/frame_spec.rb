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
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('9')
      frame.roll_1(io)
      expect(frame.score1).to eq 9
    end
    it 'sets @bonus to true and @bonus_type to strike on a strike' do
      io = double(:io)
      expect(io).to receive(:puts).and_return('Enter score for first roll')
      expect(io).to receive(:gets).and_return('10')
      frame.roll_1(io)
      expect(frame.score1).to eq 10
      expect(frame.bonus).to be true
      expect(frame.bonus_type).to eq 'strike'
    end
  end
end