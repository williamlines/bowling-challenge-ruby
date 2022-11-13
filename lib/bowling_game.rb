require_relative './frame'

class BowlingGame

  attr_accessor :frames, :bonus_rolls, :bonus_score, :frame_number

  def initialize
    @frames = []
    @bonus_rolls = 0
    @bonus_score = 0
    @frame_number = 1
  end

  def play(io = Kernel)
    while @frame_number < 11 do
      frame = Frame.new
      io.puts "Frame #{@frame_number}"
      frame.play_frame(io)
      
      @frames << frame

      @frame_number += 1
    end
  end
end
