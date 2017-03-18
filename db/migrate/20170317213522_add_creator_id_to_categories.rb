class AddCreatorIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :creator_id, :integer
  end
end
