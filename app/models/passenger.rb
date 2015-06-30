class Passenger < ActiveRecord::Base
	has_many :flights, :through => :bookings
	has_many :bookings
end
