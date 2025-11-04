class AddAllergiesToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :allergies, :string
  end
end
