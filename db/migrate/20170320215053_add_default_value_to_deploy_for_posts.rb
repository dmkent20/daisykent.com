class AddDefaultValueToDeployForPosts < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :deploy, :boolean, default: false
  end
end
