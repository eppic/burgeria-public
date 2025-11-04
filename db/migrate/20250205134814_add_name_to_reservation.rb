class AddNameToReservation < ActiveRecord::Migration[7.2]
  def change
    add_column :reservations, :name, :string
  end
end
