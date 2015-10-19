class Question < ActiveRecord::Base
  default_scope { order('created_at ASC')}

  validates :title, presence: true
  validates :content, presence: true

  has_and_belongs_to_many :tags
  has_many :answers
end
