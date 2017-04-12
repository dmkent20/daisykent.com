class CreateJoinTableSubjectPost < ActiveRecord::Migration[5.0]
  def change
    create_join_table :subjects, :posts do |t|
      # t.index [:subject_id, :post_id]
      # t.index [:post_id, :subject_id]
    end
  end
end
