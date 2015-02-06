require 'garage'

describe Garage do

let(:garage){Garage.new(capacity: 1)}
let(:broken_bike){double :bike, broken?: true}

it 'should allow a capacity to be set on initiation' do
	expect(garage.capacity).to eq(1)
end

it "should fix bikes" do
	expect(broken_bike).to receive(:fix!)
	garage.dock(broken_bike)
end

end