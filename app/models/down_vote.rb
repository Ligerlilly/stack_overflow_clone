class DownVote < ActiveRecord::Base
  belongs_to :downtable, polymorphic: true
  belongs_to :user
end
