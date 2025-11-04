class AddTableIdToReservations < ActiveRecord::Migration[7.2]
  def change
    remove_column :reservations, :table_id
    add_reference :reservations, :table, null: false, foreign_key: true
  end
end
