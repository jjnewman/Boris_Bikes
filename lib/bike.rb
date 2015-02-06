class Bike

def initialize
	fix!()
end

def broken?
	@broken
end

def fix!
	@broken = false
	self
end

def break!
	@broken = true
	self
end
end