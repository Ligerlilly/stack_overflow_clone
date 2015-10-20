class Question < ActiveRecord::Base
  default_scope { order('created_at DESC')}

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :answers, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
end
