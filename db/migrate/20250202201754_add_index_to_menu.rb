class AddIndexToMenu < ActiveRecord::Migration[7.2]
  def change
    add_column :menus, :index, :integer
  end
end
