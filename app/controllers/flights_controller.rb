class FlightsController < ApplicationController
	def index
		@flight_options = Flight.all.map{|f| [f.start_date]}.to_set #map dates to array then to set to make unique values
		@airport_options = Airport.all.map{|a| [a.code, a.city]} #code, value=city
		@passengers = (1..4).map{|p| [p.to_s]}
	end
end
