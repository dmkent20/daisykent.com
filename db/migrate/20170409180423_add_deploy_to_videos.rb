class AddDeployToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :deploy, :boolean, default: false
  end
end
