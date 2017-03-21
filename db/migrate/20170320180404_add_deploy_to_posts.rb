class AddDeployToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :deploy, :boolean
  end
end
