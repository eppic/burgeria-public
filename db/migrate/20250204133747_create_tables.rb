class CreateTables < ActiveRecord::Migration[7.2]
  def change
    create_table "tables", force: :cascade do |t|
      t.string "table_id", null: false
      t.integer "max_capacity"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "table_id" ], unique: true
    end
  end
end
