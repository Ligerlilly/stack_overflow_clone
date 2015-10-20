class AddIndexToVotes < ActiveRecord::Migration
  def change
    remove_index :votes, :user_id
    add_index :votes, [:user_id, :votable_id, :votable_type], unique: true
  end
end
