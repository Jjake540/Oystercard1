class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_FAIR = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
  end

  # def top_up(money)
  #   if balance + money < MAXIMUM_BALANCE
  #     @balance += money
  #   else
  #     raise "Maximum balance exceeded"
  #   end
  # end

  def top_up(money)
    @balance += money
    raise "Maximum balance exceeded" if exceeds_balance?
    monetize
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FAIR
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FAIR)
    @in_journey = false
    @exit_station = station
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
    @entry_station = nil
  end

  private

  def deduct(money)
    @balance -= money
  end

  def monetize
    "£#{@balance}"
  end

  def exceeds_balance?
    @balance > MAXIMUM_BALANCE
  end

end
