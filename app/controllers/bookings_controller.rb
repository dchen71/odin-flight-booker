class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by(id: params[:flight_id]) unless params[:flight_id].nil?
		@booking = @flight.bookings.build unless params[:flight_id].nil?
		params[:passengers].to_i.times {@booking.passengers.build} unless params[:flight_id].nil?
		if params[:flight_id].nil?
			flash[:error] = "Please select a flight"
			redirect_to root_path 
		end
	end

	def create
		@booking = Booking.new(booking_params)
		@flight = Flight.find_by(id: params[:flight_id])
		if @booking.save
			flash[:success] = "Booking successfully created"
			@booking.passengers.each do |p|
				PassengerMailer.thanks(p).deliver
			end
			redirect_to booking_path(@booking.id)
		else
			flash[:error] = "Error creating booking, please try again later"
			render 'new'
		end
	end

	def show
		@booking = Booking.find_by(id: params[:id])
		@flight = Flight.find_by(id: @booking.flight_id)
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, passengers_attributes:[:name, :email])
	end
end
