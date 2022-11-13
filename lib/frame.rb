class Frame

  attr_accessor :pins, :score1, :score2, :bonus, :bonus_type

  def initialize
    @pins = 10
    @score1 = 0
    @score2 = 0
    @bonus = false
    @bonus_type = ''
  end

  def roll_1(io = Kernel)
    io.puts "#{@pins} pins remaining"
    io.puts "Enter score for first roll"
    user_input = io.gets.chomp.to_i
    
    raise 'error- score higher than remaining pins' if user_input > @pins

    @score1 = user_input
    @pins -= user_input
    
    if @score1 == 10
      @bonus = true
      @bonus_type = 'strike'
    end
  end

  def roll_2(io = Kernel)
    io.puts "#{@pins} pins remaining"
    io.puts "Enter score for second roll"
    user_input = io.gets.chomp.to_i

    raise 'error- score higher than remaining pins' if user_input > @pins
    
    @score2 = user_input
    @pins -= user_input

    if @score2 == 10
      @bonus = true
      @bonus_type = 'strike'
    
    elsif @pins == 0
      @bonus = true
      @bonus_type = 'spare'
    end
  end
  
  # def play_frame(io = Kernel)
  #   roll_1(io)
  #   roll_2(io) if @pins != 0
  # end
end
