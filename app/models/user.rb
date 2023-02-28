class User < ApplicationRecord
  has_many :blogs
  has_many :comments

  validates :username, presence: true, uniqueness: { case_insensitive: true }, length: { minimum: 5, maximum: 25 }
  validates :password, presence: true, length: { minimum: 5 }

  has_secure_password validations: false
end
