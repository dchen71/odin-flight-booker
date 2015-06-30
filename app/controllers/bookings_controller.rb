class BookingsController < ApplicationController
	def new
		if params[:flight_id].nil?
			flash[:error] = "Please select an entry"
			redirect_to root_url
		end

		@flight = Flight.find_by(id: params[:flight_id])
		@booking = @flight.bookings.build
		params[:passengers].to_i.times {@booking.passengers.build}

	end

	def create
		@booking = Booking.new(booking_params)

		if @booking.save
			flash[:success] = "Booking successfully created"
			redirect_to root_url
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
