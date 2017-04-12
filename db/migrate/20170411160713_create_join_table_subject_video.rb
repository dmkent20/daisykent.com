class CreateJoinTableSubjectVideo < ActiveRecord::Migration[5.0]
  def change
    create_join_table :subjects, :videos do |t|
      # t.index [:subject_id, :video_id]
      # t.index [:video_id, :subject_id]
    end
  end
end
