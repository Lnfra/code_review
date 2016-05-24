class User < ActiveRecord::Base


  #Required for using paperclip photo upload
  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "50x50>" },
                    default_url: ":style/default-avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  belongs_to :classroom
  has_many :questions
  has_many :answers
  has_many :comments
  has_and_belongs_to_many :roles

  # Currently not req as provided by votable gem
  # has_many :votes

  #adds a password field to model validates this field with password_digest in db
  has_secure_password

  # Used by acts_as_votable gem
  acts_as_voter

  #must provide email
  validates :email, presence: true, uniqueness: true
end

