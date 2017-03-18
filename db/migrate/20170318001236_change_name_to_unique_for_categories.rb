class ChangeNameToUniqueForCategories < ActiveRecord::Migration[5.0]
  def change
    change_column :categories, :creator_id, :string, null: false
    change_column :categories, :created_from, :string, null: false
    change_column :categories, :name, :string, unique: true, null: false
  end
end
