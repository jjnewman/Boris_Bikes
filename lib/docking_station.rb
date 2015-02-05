class DockingStation

DEFAULT_CAPACITY = 10

def initialize(options = {})
	@bikes = []
	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
end

#def capacity
#	@capacity ||= DEFAULT_CAPACITY 
#end

 #def capacity=(value)
#		@capacity = value
# end

#def capacity
#	@capacity
#end

def bike_count
	@bikes.count
end

def dock(bike)
	raise 'Station full' if full?
	@bikes << bike
end

def release(bike)
	@bikes.delete(bike)
end

def full?	
	bike_count == @capacity
	
end

def empty?
	bike_count == 0
end

def available_bikes
	@bikes.reject{|bike| bike.broken?}
end

def broken_bikes
	@bikes.select{|bike| bike.broken?}
end




end