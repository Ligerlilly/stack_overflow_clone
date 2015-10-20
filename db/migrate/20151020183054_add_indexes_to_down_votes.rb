class AddIndexesToDownVotes < ActiveRecord::Migration
  def change
    add_index :down_votes, [:user_id, :downable_id, :downable_type], unique: true
  end
end
