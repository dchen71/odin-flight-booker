class PassengerMailer < ApplicationMailer
	def thanks(passenger)
		@passenger = passenger
		@booking = Booking.find_by(id: @passenger.booking_id)
		@flight = Booking.last.flight

		mail(to: @passenger.email, subject: "Thanks, your flight #{@passenger.booking_id} details are enclosed")
	end

end
