require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

let (:holder) {ContainerHolder.new} 
let (:bike) {double :bike}
let (:broken_bike) {double :bike, broken?: true}
let (:working_bike) {double :bike, broken?: false}

it 'should accept a bike' do
	expect(holder.bike_count).to eq(0)
	holder.dock(bike)
	expect(holder.bike_count).to eq(1)
end


it 'should release a bike' do
	holder.dock(bike)
	holder.release(bike)
	expect(holder.bike_count).to eq(0)
end


it 'should know when the station is full' do
	expect(holder).not_to be_full
	holder.capacity.times{holder.dock(bike)}
	expect(holder).to be_full

end

it 'should not allow bikes to be docked when full' do
	holder.capacity.times{holder.dock(bike)}
	expect{holder.dock(bike)}.to raise_error(RuntimeError, 'Station full')

end

it 'should list all available bikes' do
	holder.dock(working_bike)
	holder.dock(broken_bike)
	expect(holder.available_bikes).to eq([working_bike])
end
end
