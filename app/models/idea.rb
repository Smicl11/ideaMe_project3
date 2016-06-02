class Idea < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  acts_as_commentable
  validates :idea, presence: true, length: { minimum: 15, maximum: 2000 }
end
