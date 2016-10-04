class Oystercard

  attr_accessor :balance, :in_journey

  MONEY_MAX_LIMIT = 90
  MONEY_MIN_LIMIT = 1



  def initialize
    @balance = 0
    @in_journey
  end

  def top_up(money)
    fail "Card limit is #{Oystercard::MONEY_MAX_LIMIT}." if money + @balance > Oystercard::MONEY_MAX_LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail "£1 minimum required." if @balance <= Oystercard::MONEY_MIN_LIMIT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(2)
  end
end
