class User < ApplicationRecord
  has_secure_password
  has_many :events
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
