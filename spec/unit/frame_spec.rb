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
end