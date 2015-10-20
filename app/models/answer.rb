class Answer < ActiveRecord::Base
  default_scope { order('created_at ASC')}
  validates :response, presence: true
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
  has_many :down_votes, as: :downable, dependent: :destroy


end
