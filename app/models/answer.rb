class Answer < ActiveRecord::Base
  default_scope { order('created_at ASC')}
  validates :response, presence: true
  belongs_to :question
end
