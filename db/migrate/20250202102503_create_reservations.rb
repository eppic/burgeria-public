class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.integer :guests
      t.string :reservation_name
      t.string :email
      t.string :table_id

      t.timestamps
    end
  end
end
