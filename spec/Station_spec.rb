require './lib/Station'

describe Station do

    subject { described_class.new(name: "Old Street", zone: 1) }
    
    it 'displays station name' do
        expect(subject.name).to eq("Old Street")
    end

    it 'shows station zone' do
        expect(subject.zone).to eq(1)
    end
end