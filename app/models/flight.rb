class Flight < ActiveRecord::Base
	belongs_to :to_airport, class_name: "Airport"
	belongs_to :from_airport, class_name: "Airport"

	def self.search(params)
		if params[:search] #ensure params are from search
			Flight.where(from_airport_id: params[:depart_code], to_airport_id: params[:arrive_code], 
				start_date: params[:start_date])
		else
			Flight.none
		end
	end
end
