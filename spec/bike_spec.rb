require 'bike'

describe Bike do

let (:bike) {Bike.new}

it 'should not be broken on initialisation' do
	expect(bike).not_to be_broken
end

it 'should be able to break' do
	expect(bike.break!).to be_broken
end

it 'should expect the fix method to fix a broken bike' do
	bike.break!
	expect(bike.fix!).not_to be_broken 
end
end











