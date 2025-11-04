require "test_helper"

class DeletePastReservationsJobTest < ActiveJob::TestCase
  test "should delete past reservations" do
    past_reservation = reservations(:past)
    future_reservation = reservations(:future)

    assert_difference('Reservation.count', -1) do
      DeletePastReservationsJob.perform_now
    end

    assert_not Reservation.exists?(past_reservation.id)
    assert Reservation.exists?(future_reservation.id)
  end
end