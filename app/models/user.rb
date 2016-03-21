class User < ActiveRecord::Base
  belongs_to :classroom
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_and_belongs_to_many :roles

  #adds a password field to model validates this field with password_digest in db
  has_secure_password

  #must provide email
  validates :email, presence: true, uniqueness: true
end

