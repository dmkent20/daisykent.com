class AddDeployDateToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :deploy_date, :datetime
  end
end
