


class Bike

def initialize
	@broken = false

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