class AddVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote, :integer
  end
end
