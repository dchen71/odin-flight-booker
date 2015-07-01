class FlightsController < ApplicationController
	def index
		@flight_options = Flight.all.map{|f| [f.start_date]}.to_set #map dates to array then to set to make unique values
		@airport_options = Airport.all.map{|a| [a.code, a.id]}
		@passengers = (1..4).map{|p| [p.to_s]}


		if params[:depart_code] == params[:arrive_code] && params[:search]
			flash.now[:error] = "Error, departing and arriving airports are the same"
			render 'index'
		else
			if params[:search]
				@flights = Flight.search(params)
			end
		end
	end
end
