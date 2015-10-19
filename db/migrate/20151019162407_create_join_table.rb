class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
      t.belongs_to :question_id
      t.belongs_to :tag_id

      t.timestamps null: false
    end
  end
end
