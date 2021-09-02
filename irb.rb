require './lib/card'

oystercard = Oystercard.new
oystercard.top_up(20)
oystercard.touch_in
oystercard.touch_out

oystercard.in_journey?