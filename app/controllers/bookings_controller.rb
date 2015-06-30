class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by(id: params[:flight_id])
		@booking = Booking.new
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

	private

	def booking_params
		params.require(:booking).permit(:flight_id, :passenger)
	end
end
