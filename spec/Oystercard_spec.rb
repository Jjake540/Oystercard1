require './lib/Oystercard'

describe Oystercard do
  it "should have a balance of 0" do
    expect(subject.balance).to eq(0)
  end
end

# NameError:
#   uninitialized constant Oystercard
# ./spec/Oystercard_spec.rb.
# ./spec/Oystercard_spec.rb:1:in `<top (required)>'
# Name error: Raised when a given name is invalid or undefined.