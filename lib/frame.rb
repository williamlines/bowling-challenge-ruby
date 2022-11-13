class Frame

  attr_accessor :pins, :score1, :score2, :bonus, :bonus_type

  def initialize
    @pins = 10
    @score1 = 0
    @score2 = 0
    @bonus = false
    @bonus_type = ''
  end
end