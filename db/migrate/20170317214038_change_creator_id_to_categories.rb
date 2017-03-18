class ChangeCreatorIdToCategories < ActiveRecord::Migration[5.0]
  def change
    change_column :categories, :creator_id, :string
  end
end
