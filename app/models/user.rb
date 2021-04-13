class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_one_attached :photo
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  
end
