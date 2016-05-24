class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :code_language
  has_many :comments

  # Currently not req as provided by votable gem
  # has_many :votes

  # Used by Acts_as_votable gem
  acts_as_votable
end
