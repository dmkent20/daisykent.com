class RemoveSubjectFromVideos < ActiveRecord::Migration[5.0]
  def change
    remove_column :videos, :subject, :string
  end
end
