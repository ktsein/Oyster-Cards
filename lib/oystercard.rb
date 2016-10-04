class Oystercard

  attr_accessor :balance, :in_journey

  MONEY_LIMIT = 90


  def initialize
    @balance = 0
    @in_journey
  end

  def top_up(money)
    fail "Card limit is #{Oystercard::MONEY_LIMIT}." if money + @balance > Oystercard::MONEY_LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
