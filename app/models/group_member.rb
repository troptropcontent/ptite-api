class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :event_invitations
end
