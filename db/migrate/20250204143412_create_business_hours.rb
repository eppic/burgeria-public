class CreateBusinessHours < ActiveRecord::Migration[7.2]
  def change
    create_table :business_hours do |t|
      t.string :day_of_week, null: false
      t.boolean :is_closed, default: false
      t.time :open_time
      t.time :close_time
      t.timestamps
    end
  end
end
