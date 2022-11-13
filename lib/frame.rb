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
    
    io.puts "Enter score for first roll"
    @score1 = io.gets.chomp.to_i
    
    if @score1 == 10
      @bonus = true
      @bonus_type = 'strike'
    end
  end
end