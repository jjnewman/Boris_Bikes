module BikeContainer

attr_writer :capacity

DEFAULT_CAPACITY = 10
BROKEN_BIKES = Proc.new {|bike| bike.broken?}

def bikes
	@bikes ||= []
end

def capacity
	@capacity ||= DEFAULT_CAPACITY 
end

def bike_count
	bikes.count
end

def dock(bike)
	raise 'Station full' if full?
	bikes << bike
end

def release(bike)
	bikes.delete(bike)
end

def full?	
	bike_count == capacity	
end

def empty?
	bike_count == 0
end

def available_bikes
	bikes.reject &BROKEN_BIKES
end

def broken_bikes
	bikes.select &BROKEN_BIKES
end

end