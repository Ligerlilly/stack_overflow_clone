class EditQuestionsTags < ActiveRecord::Migration
  def change
    remove_column :questions_tags, :question_id_id, :integer
    remove_column :questions_tags, :tag_id_id, :integer
  end
end
