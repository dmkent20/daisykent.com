class AddDeployDateToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :deploy_date, :datetime
  end
end
