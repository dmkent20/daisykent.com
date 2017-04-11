class AddMetaFieldsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :meta_description, :string
    add_column :posts, :keywords, :text
    add_column :posts, :canonical, :string
    add_column :posts, :author, :string
    add_column :posts, :publisher, :string
  end
end
