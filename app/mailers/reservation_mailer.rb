class ReservationMailer < ApplicationMailer
    def reservation_confirmation
      @reservation = params[:reservation]
      mail(to: @reservation.email, subject: 'Reservation Confirmation')
    end
end