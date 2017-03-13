class AddBlogheaderToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :blogheader, :string
  end
end
