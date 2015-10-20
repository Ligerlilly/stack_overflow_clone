class DownVote < ActiveRecord::Base
  belongs_to :downtable, polymorphic: true
end
