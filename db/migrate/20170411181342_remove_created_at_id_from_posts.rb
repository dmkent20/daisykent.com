class RemoveCreatedAtIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :categories, :creator_id, true
    change_column_null :categories, :created_from, true
  end
end
