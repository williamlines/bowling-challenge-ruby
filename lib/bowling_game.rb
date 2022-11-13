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
      frame.roll_1(io)
    
      #if @bonus_rolls > 0
      #  @bonus_score +=
    
      frame.roll_2(io) if frame.pins != 0
      


      if frame.bonus_type == 'strike'
        @bonus_rolls += 2
      end

      @frames << frame
      @frame_number += 1
    end
  end
end
