class User < ApplicationRecord
  include AlgoliaSearch

  has_secure_password
  has_many :events
  has_many :group_members
  has_many :groups
  has_one_attached :photo
  validates :username, uniqueness: true
  validates :email, uniqueness: true


  algoliasearch do
    attributes :first_name, :last_name, :email
  end

  
  # render all users but the current one
  def other_users
    User.where.not("id = ?", self.id)
  end

  
  
end
