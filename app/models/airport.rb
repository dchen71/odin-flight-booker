class Airport < ActiveRecord::Base
	has_many :departing_flights, class_name: "Flight", foreign_key: "depart_airport_id"
	has_many :arriving_flights, class_name: "Flight", foreign_key: "destin_airport_id"
end
