class AddIndexToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :index, :integer
  end
end
