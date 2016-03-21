class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  #Ensures that every user_id and answer_id pair is unique
  # eg: every user can only vote on one answer once
  validates_uniqueness_of :user_id, scope: :answer_id
end
