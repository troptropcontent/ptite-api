class Group < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :group_members

  def serialized
    {id: id,name: name}
  end



end
