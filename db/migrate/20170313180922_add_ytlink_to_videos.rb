class AddYtlinkToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :ytlink, :text
  end
end
