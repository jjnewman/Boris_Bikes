require 'docking_station'
require 'bike'


describe DockingStation do


let (:station) {DockingStation.new(capacity: 20)} 
let (:bike) {Bike.new}


it 'should accept a bike' do
	expect(station.bike_count).to eq(0)
	station.dock(bike)
	expect(station.bike_count).to eq(1)
end


it 'should release a bike' do
	station.dock(bike)
	station.release(bike)
	expect(station.bike_count).to eq(0)
end


it 'should know when the station is full' do
	expect(station).not_to be_full
	20.times{station.dock(bike)}
	expect(station).to be_full

end

it 'should not allow bikes to be docked when full' do
	20.times{station.dock(bike)}
	expect{station.dock(bike)}.to raise_error(RuntimeError, 'Station full')

end

it 'should list all available bikes' do
	working_bike, broken_bike = Bike.new, Bike.new
	broken_bike.break!
	station.dock(working_bike)
	station.dock(broken_bike)
	expect(station.available_bikes).to eq([working_bike])
end


end
