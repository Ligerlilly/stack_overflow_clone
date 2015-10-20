class RenameColumnsInDownVotable < ActiveRecord::Migration
  def change
    rename_column :down_votes, :votable_id, :downable_id
    rename_column :down_votes, :votable_type, :downable_type

  end
end
