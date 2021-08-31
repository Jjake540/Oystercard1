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

end



# NameError:
#   uninitialized constant Oystercard
# ./spec/Oystercard_spec.rb.
# ./spec/Oystercard_spec.rb:1:in `<top (required)>'
# Name error: Raised when a given name is invalid or undefined.