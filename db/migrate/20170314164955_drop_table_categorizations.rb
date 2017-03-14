class DropTableCategorizations < ActiveRecord::Migration[5.0]
  def change
    drop_table :categorizations
  end
end
