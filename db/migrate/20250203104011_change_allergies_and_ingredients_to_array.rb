class ChangeAllergiesAndIngredientsToArray < ActiveRecord::Migration[7.2]
  def change
    change_column :items, :allergies, :json, default: [], using: 'allergies::json'
    change_column :items, :ingredients, :json, default: [], using: 'ingredients::json'
  end
end
