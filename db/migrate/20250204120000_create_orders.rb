class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :zip_code

      t.timestamps
    end
  end
end
