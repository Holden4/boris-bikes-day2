require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_reader :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	private

	def full?
		@bikes.length >= DEFAULT_CAPACITY
	end

	def empty?
		@bikes.empty?
	end

	public

	def release_bike
		fail 'No bikes available!' if empty?
		@bikes.pop
	end

	def dock(bike)
		fail 'Station is full!' if full?
		@bikes << bike
	end

end
