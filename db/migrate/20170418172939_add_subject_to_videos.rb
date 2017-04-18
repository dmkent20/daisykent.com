class AddSubjectToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :subject, :string
  end
end
