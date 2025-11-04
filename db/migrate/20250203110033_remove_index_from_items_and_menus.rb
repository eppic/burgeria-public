class RemoveIndexFromItemsAndMenus < ActiveRecord::Migration[7.2]
  def change
    remove_column :items, :index
    remove_column :menus, :index
  end
end
