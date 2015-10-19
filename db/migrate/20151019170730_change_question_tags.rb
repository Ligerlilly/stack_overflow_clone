class ChangeQuestionTags < ActiveRecord::Migration
  def change
    add_column :questions_tags, :question_id, :integer
    add_column :questions_tags, :tag_id, :integer
  end
end
