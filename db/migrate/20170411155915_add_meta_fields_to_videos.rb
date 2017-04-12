class AddMetaFieldsToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :meta_description, :string
    add_column :videos, :keywords, :text
    add_column :videos, :canonical, :string
    add_column :videos, :author, :string
    add_column :videos, :publisher, :string
  end
end
