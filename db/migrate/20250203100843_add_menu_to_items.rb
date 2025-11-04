class AddMenuToItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :menu, null: false, foreign_key: true
  end
end
