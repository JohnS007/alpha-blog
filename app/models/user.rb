class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  before_save {self.email = email.downcase} #before saving user email is converted to lowercase

  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: { minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: { maximum: 105},
            format: { with: VALID_EMAIL_REGEX}
  has_secure_password # this adds the secure password to the users in the database.

end
