class ChangeVideosYtlink < ActiveRecord::Migration[5.0]
  def change
    change_column :videos, :ytlink, :text, null: false
  end
end
