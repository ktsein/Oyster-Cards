require 'oystercard'

  describe Oystercard do

    oystercard = Oystercard.new
    it 'have balance' do
      expect(subject).to respond_to :balance
    end

    it 'tops up method exists' do
      expect(subject).to respond_to :top_up
    end

    it 'top_up adds money' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'limits top up value to £90' do
      expect{oystercard.top_up(91)}.to raise_error "Card limit is #{Oystercard::MONEY_MAX_LIMIT}."
    end

    it 'minimum required value is £1 to use the card' do
      expect{oystercard.touch_in}.to raise_error "£1 minimum required."
    end

    it 'deducts money' do
      expect(oystercard).to respond_to :deduct
    end

    it 'deducts £2 per journey' do
      oystercard.top_up(10)
      oystercard.deduct(2)
      expect(oystercard.balance).to eq 8
    end

    it 'touch in at the station' do
      expect(oystercard).to respond_to :touch_in
    end

    it 'touch in and be in the journey' do
      oystercard.touch_in
      expect(oystercard.in_journey).to be true
    end

    it 'touch out at the station' do
      expect(oystercard).to respond_to :touch_out
    end

    it 'touch out and not be in the journey' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey).to be false
    end


end
