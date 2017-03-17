class AddCreatedFromToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :created_from, :string
  end
end
