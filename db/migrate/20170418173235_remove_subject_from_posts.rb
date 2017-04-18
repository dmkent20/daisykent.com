class RemoveSubjectFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :subject, :string
  end
end
