class Airport < ActiveRecord::Base
	belongs_to :to_airport, class_name: "Airport"
	belongs_to :from_airport, class_name: "Airport"
end