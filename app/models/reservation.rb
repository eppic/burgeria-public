class Reservation < ApplicationRecord
  belongs_to :table

  validates :reservation_date, :reservation_time, :table_id, :name, :email, presence: true
  validate :date_is_open
  validate :no_overlapping_reservations

  def self.delete_old_reservations
    where('reservation_time < ?', 1.month.ago).delete_all
  end

  private
  
  def date_is_open
    if reservation_date.present? && reservation_date < Date.today
      errors.add(:reservation_date, "kann nicht in der Vergangenheit liegen.")
    end
  end

  def no_overlapping_reservations
    overlapping_reservations = Reservation.where(table_id: table_id)
                                          .where(reservation_date: reservation_date)
                                          .where.not(id: id)
                                          .where('reservation_time BETWEEN ? AND ?', reservation_time, reservation_time + 2.hour)
    if overlapping_reservations.exists?
      errors.add(:base, "Dieser Tisch ist zu jener Zeit bereits reserviert.")
    end
  end
end