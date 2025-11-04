class AddIngredientsToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :ingredients, :string
  end
end
