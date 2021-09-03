require './lib/Oystercard'

describe Oystercard do
  it "should have a balance of 0" do
    expect(subject.balance).to eq(0)
  end
  describe '#top_up' do
    
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "should top up balance" do 
      expect{ subject.top_up 1 }.to change{ subject.balance }.by(1)
    end

    it "should throw an exception if balance exceeds limit" do
      expect { subject.top_up 95 }.to raise_error "Maximum balance exceeded"
    end

  end

  describe '#in_journey?' do
    it "should be false when not in journey" do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    let(:station){ double :station }

    it "should allow the user to touch in" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "should raise an error if a card with insufficient funds is touched in" do
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds for journey"
      expect(subject).not_to be_in_journey
    end

    it "It stores entry station after touch in" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end



  describe '#touch_out' do
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }

    it "should allow the user to touch out" do
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
    it "should reduce the card balance by minimum fair" do

      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FAIR)
    end
    it "It stores exit station after touch out" do
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
 
  

    it "has an empty list of journeys by default" do
      expect(subject.journeys).to be_empty
    end

    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
    it 'stores a journey' do
      subject.top_up(5) 
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end


end



# NameError:
#   uninitialized constant Oystercard
# ./spec/Oystercard_spec.rb.
# ./spec/Oystercard_spec.rb:1:in `<top (required)>'
# Name error: Raised when a given name is invalid or undefined.