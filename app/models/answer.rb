class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :code_language
  has_many :comments
  has_many :votes
end
