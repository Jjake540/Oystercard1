class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(n)
    if balance + n < MAXIMUM_BALANCE
      @balance += n
    else
      raise "Maximum balance exceeded"
    end
  end


end
